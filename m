Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A03125B
	for <lists+linux-afs@lfdr.de>; Fri, 31 May 2019 18:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Flo32D2bGOnYSgJaipvFR4Gp698A4H2u46AUZT5+fuU=; b=GTrE7Fr58Vyry7
	PvB1nzxpPmWs8egE64JPz8xTCsl06XxiVafg8RLVCeyWu6wleXouCzsuKF8BM+xpjIFJBhycc/TnQ
	hx71PtXnic4tNh5SUryck8t0t74PIUq5dvYMp9fx6vJRx7R+O+i0Z3vAvYl+UO6eoFFxEWMpfqYAd
	MBuRYgKiEgpmpqk0A0Be2b0GY9yO4Ag772NvNL1/+893v84IrcbM595pAG+wqYvHtMyURhx5+1xuc
	g5hjDS+n5u1zxnq1w/Z//+2HNNBUwD1XZxKj6LrdXqh/0LDxeyqm2d1xMCJrJgUGj6E7v9j3H08VD
	7+Rm4jDTervqzuOSjozA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWkOG-0002CD-5y; Fri, 31 May 2019 16:28:24 +0000
Received: from chamillionaire.breakpoint.cc ([2a01:7a0:2:106d:670::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWkOD-0002Bq-8P
 for linux-afs@lists.infradead.org; Fri, 31 May 2019 16:28:22 +0000
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.89)
 (envelope-from <fw@strlen.de>)
 id 1hWkO8-0005hn-4N; Fri, 31 May 2019 18:28:16 +0200
Date: Fri, 31 May 2019 18:28:16 +0200
From: Florian Westphal <fw@strlen.de>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net-next v2 1/7] afs: do not send list of client addresses
Message-ID: <20190531162816.7u7qslht5v7tkntm@breakpoint.cc>
References: <20190531122214.18616-2-fw@strlen.de>
 <20190531122214.18616-1-fw@strlen.de>
 <10847.1559317119@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10847.1559317119@warthog.procyon.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_092821_437282_CDA76108 
X-CRM114-Status: UNSURE (   6.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [2a01:7a0:2:106d:670:0:0:1 listed in]
 [list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, Florian Westphal <fw@strlen.de>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Howells <dhowells@redhat.com> wrote:
> Florian Westphal <fw@strlen.de> wrote:
> 
> > David Howell says:
> 
> "Howells"

My bad.

> Apart from that:
> 
> Tested-by: David Howells <dhowells@redhat.com>

Thanks, a lot, I've re-submitted this as v3 retaining your tested-by.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
