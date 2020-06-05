Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DEF1EF9E0
	for <lists+linux-afs@lfdr.de>; Fri,  5 Jun 2020 16:02:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzZqHgU+UVQRil+FxAPmjd2HSmCLGAUmA0Ex/KrC43I=; b=OB6Lc5PnkMvP9U
	LEQGmS4UMMbl9bGPjQvM964EWHYCQrjFPf61vxV/BfRmZtmN5e9rU07iPrl4qjR3m+CqDhmAmBD2F
	DKAT6zITm3ayL7hVzaBQO/xVS7JJY6mNGNRcJ4s+oHR2uNv9vriLT5EUAOwDdV8kLv4F5jvcVDcUR
	BHQ8e8w+k/bC8tpQKM6y+qwFtBzz5wkBcIJV/oiJ/3v/LLnlUTr7ZVtNaWAe7C3WppBn9VMMdlqHI
	zG+rNZ0wut5iQ6LASRJd4QTl6Dn5snB2JyWNBEUDiWAuQPneQBMD361wHOvV3P+GnTkElkzl3FgdV
	kvNdJCU0CgiALYD2Fo+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhCvf-0002Rz-8K; Fri, 05 Jun 2020 14:02:39 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhCvd-0002Pw-3K
 for linux-afs@lists.infradead.org; Fri, 05 Jun 2020 14:02:38 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1jhCvV-003aum-2W; Fri, 05 Jun 2020 14:02:29 +0000
Date: Fri, 5 Jun 2020 15:02:29 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: David Howells <dhowells@redhat.com>
Subject: Re: [GIT PULL] afs: Improvements for v5.8
Message-ID: <20200605140229.GI23230@ZenIV.linux.org.uk>
References: <2240660.1591289899@warthog.procyon.org.uk>
 <20200605135003.GH23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605135003.GH23230@ZenIV.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_070237_142275_D7C8ED62 
X-CRM114-Status: GOOD (  11.78  )
X-Spam-Score: 1.3 (+)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (1.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [2002:c35c:fd02:0:0:0:0:1 listed in] [wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
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
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, Jun 05, 2020 at 02:50:03PM +0100, Al Viro wrote:
> On Thu, Jun 04, 2020 at 05:58:19PM +0100, David Howells wrote:
> > Hi Linus,
> > 
> > Is it too late to put in a pull request for AFS changes?  Apologies - I was
> > holding off and hoping that I could get Al to review the changes I made to
> > the core VFS change commit (first in the series) in response to his earlier
> > review comments.  I have an ack for the Ext4 changes made, though.  If you
> > would prefer it to be held off at this point, fair enough.
> > 
> > Note that the series also got rebased to -rc7 to remove the dependency on
> > fix patches that got merged through the net tree.
> 
> FWIW, I can live with fs/inode.c part in its current form

Which is to say,
ACKed-by: Al Viro <viro@zeniv.linux.org.uk> (fs/inode.c part)
I have not checked the AFS part of the series and AFAICS
ext4 one at least doesn't make things any worse there.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
