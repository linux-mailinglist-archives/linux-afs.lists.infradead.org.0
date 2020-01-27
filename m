Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B491414A151
	for <lists+linux-afs@lfdr.de>; Mon, 27 Jan 2020 10:57:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACZAD7FDj/0iMkhFHDvqHX8EKXcayxi6G2ID6zwsmtc=; b=uMhHyCvyo1wusN
	1EfU6PKRn4SeE7O5MsEHsLV66ATcePCBqmnppSvarZUfwKBLK2qM+lxxyAw1z5k0mhJH7P6oI/2xW
	aQ6Id7dCQWmZh6+FcutR/3BuJCNmtkk050Nyug91JePtmY9yTZXH3Vo/DknrOoddYWD2DQLLcNUuF
	KQh5Vsl8eb4GyAKoqRQS3puzALVosA4uD6PhxkasF2BafAh7LpDCRPln5nTdY1t+Lb/UvhPAfHmfx
	hveHRLVoyI2N+XJbM8S6wuaeUzI51V1Yg5Nb4WZTxPEbv1yqDhCRXIvRxTFlGN4LVgSNnwn8w18Sk
	3+6ohLdF8z1WEQpxnDsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw193-0005ac-9G; Mon, 27 Jan 2020 09:57:25 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw190-0005a1-PK
 for linux-afs@lists.infradead.org; Mon, 27 Jan 2020 09:57:24 +0000
Received: from localhost (unknown [213.175.37.12])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 762F21504FE7C;
 Mon, 27 Jan 2020 01:57:19 -0800 (PST)
Date: Mon, 27 Jan 2020 10:57:17 +0100 (CET)
Message-Id: <20200127.105717.1488016004887769192.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix use-after-free in rxrpc_receive_data()
From: David Miller <davem@davemloft.net>
In-Reply-To: <157990728440.1173687.14473656600696398776.stgit@warthog.procyon.org.uk>
References: <157990728440.1173687.14473656600696398776.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 27 Jan 2020 01:57:20 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_015722_822438_4831CC3E 
X-CRM114-Status: GOOD (  11.06  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Fri, 24 Jan 2020 23:08:04 +0000

> The subpacket scanning loop in rxrpc_receive_data() references the
> subpacket count in the private data part of the sk_buff in the loop
> termination condition.  However, when the final subpacket is pasted into
> the ring buffer, the function is no longer has a ref on the sk_buff and
> should not be looking at sp->* any more.  This point is actually marked in
> the code when skb is cleared (but sp is not - which is an error).
> 
> Fix this by caching sp->nr_subpackets in a local variable and using that
> instead.
> 
> Also clear 'sp' to catch accesses after that point.
> 
> This can show up as an oops in rxrpc_get_skb() if sp->nr_subpackets gets
> trashed by the sk_buff getting freed and reused in the meantime.
> 
> Fixes: e2de6c404898 ("rxrpc: Use info in skbuff instead of reparsing a jumbo packet")
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied and queued up for -stable, thanks.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
