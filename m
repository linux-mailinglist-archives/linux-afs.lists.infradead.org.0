Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 344FB1B188E
	for <lists+linux-afs@lfdr.de>; Mon, 20 Apr 2020 23:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJE0qqN7Xi6Wc9sc6v9lTm54TlhCWz4ZMvjKhbcmjiU=; b=Q6+PyKSRwMIeGo
	dO0DTwhIOl04u9dlqTqjJirVQntx8KpT4yqL2K+ihY/9hP14o8EavRAkwo47/IxA7/CPlh69Nfm6x
	hWRSRX2bZ9vM6QHDfljsPh9+L3o3pFAlQf1dgb060YsVzvflVlAAsFZ4yLSYHG5zzeldebaAaIV7s
	RcBv9qV2HV/eUsjzU+WBHP7eBgU5pktsRNVvHp5gZqyKazPewXvr3RSHZw9CXS9j8+8vfzZcdeERN
	Ke7uE/ZUL1PIFMhTFmub+X04Jivzf03TvJVHm6QuDNg3ZaatCsPapgBiFqzU/hMzid9Z6d3l3qH4a
	mIQY+kfzE6BLvdJK1qvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQeAx-00087m-0D; Mon, 20 Apr 2020 21:41:59 +0000
Received: from mx.cjr.nz ([51.158.111.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQb2z-0005dv-Ek
 for linux-afs@lists.infradead.org; Mon, 20 Apr 2020 18:21:34 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 701BB7FCFC;
 Mon, 20 Apr 2020 18:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1587406891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XLtiuMGzfer0pae2SDTC3iJPxGcLgbM+htJ0fXQblHE=;
 b=JeY6U99PmBoc7K2kOj51HYcjWJeX3//jnLGabU3mmTwXpybaIMRJQSxLX8x/+7gxTOCSTr
 Hv9mwFQRIWgFkU0lT98JLFFXxsnrL4qfqJunWNNOnIL/KrXOyC5lZOjKcC3YlFTbGDQtU6
 xiDiGgZdH4R3VvQD3aMCGUX/PVZDmGHawAflJgUTW+n36YLIYoSEEDxOfqo/4tk0toZJoJ
 QvV5XbHnd5OBz63WIKMLqBxjEsMaOct1YcZv5TRbzGMxha3OUejx3dbWx7r5NQRWS/QhUO
 DPFmdQUzLUwfD0GPDW+5vaZskSiTqXTNvqVn7Ckm/7Bq1RKQO5JmzPsQb+bzrA==
From: Paulo Alcantara <pc@cjr.nz>
To: David Howells <dhowells@redhat.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
In-Reply-To: <1136024.1587388420@warthog.procyon.org.uk>
References: <87imhvj7m6.fsf@cjr.nz>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <927453.1587285472@warthog.procyon.org.uk>
 <1136024.1587388420@warthog.procyon.org.uk>
Date: Mon, 20 Apr 2020 15:21:23 -0300
Message-ID: <878siq587w.fsf@cjr.nz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_112133_632922_D271DCA4 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [51.158.111.142 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Mailman-Approved-At: Mon, 20 Apr 2020 14:41:57 -0700
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 Steve French <smfrench@gmail.com>, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Howells <dhowells@redhat.com> writes:

> Paulo Alcantara <pc@cjr.nz> wrote:
>
>> >> For SMB3/CIFS mounts, Paulo added support last year for automatic
>> >> reconnect if the IP address of the server changes.  It also is helpful
>> >> when DFS (global name space) addresses change.
>> >
>> > What happens if the IP address the superblock is going to changes, then
>> > another mount is made back to the original IP address?  Does the second mount
>> > just pick the original superblock?
>> 
>> It is going to transparently reconnect to the new ip address, SMB share,
>> and cifs superblock is kept unchanged.  We, however, update internal
>> TCP_Server_Info structure to reflect new destination ip address.
>> 
>> For the second mount, since the hostname (extracted out of the UNC path
>> at mount time) resolves to a new ip address and that address was saved earlier
>> in TCP_Server_Info structure during reconnect, we will end up
>> reusing same cifs superblock as per fs/cifs/connect.c:cifs_match_super().
>
> Would that be a bug?

Probably.

I'm not sure how that code is supposed to work, TBH.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
