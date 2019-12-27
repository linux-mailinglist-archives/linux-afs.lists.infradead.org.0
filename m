Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BFE12B37A
	for <lists+linux-afs@lfdr.de>; Fri, 27 Dec 2019 10:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zU+ZOy2vHl9eaKmoFjucPgtFVh6wqil083uNw5FiZ6Y=; b=cAEUZ0qUWY4POX
	j2Zo82NrN41HMsms81B52iVUVrrqMflAhOWlrF3elPUCqBLM4ADdPr9pPBQDmWRB/qJpJK2RBm22X
	a1Vu1NzrDT6ciD3XytGOGvVF5bVth8xjNw8iqZw6LU5RNYJLF1tPsNAWBn36TUn2Y/N8MwnSVVpGG
	bCuchhZpWIeZ3LUz0oKBDvnhtAiHOJnno3246v7WpC/1DAX0rSQASkwQazlLsslszjnvCAMWRfUym
	ByxIm62kT8ZpUA17KvbwMcMQmwKFW43D+opG06viGHZFtUH04Iaw/Xp4w65NJlWb9V/979WxFf9XD
	/rCCc61waMmvIsv87OPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikldb-0008Qt-PY; Fri, 27 Dec 2019 09:10:27 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikldY-0008Q3-9K
 for linux-afs@lists.infradead.org; Fri, 27 Dec 2019 09:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577437821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ASFV5pJzvuuWxY4tU7Iy4ntnhG1vqYANWCT9adP97F8=;
 b=NteyQmZYriRhanVSsWW6lxJijupAxQQ/D7fE46L3tGyl/SjVjp6OkeQOa51fzPA1cY06MY
 Y1gdBIITVNCsc+rYH6KXwe8ZUZPt5oYpweKQacQGM7rBmCLV9r0kpjxpbyte8ecYgc1xCv
 +7RpqMIihGUOv9od3ZHbEj+3/kD0vb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-t5Hx4NQGNWSKpHAOIKDE5A-1; Fri, 27 Dec 2019 04:10:17 -0500
X-MC-Unique: t5Hx4NQGNWSKpHAOIKDE5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35352185432C;
 Fri, 27 Dec 2019 09:10:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89DFE271A8;
 Fri, 27 Dec 2019 09:10:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20191227000634.GS4203@ZenIV.linux.org.uk>
References: <20191227000634.GS4203@ZenIV.linux.org.uk>
 <1576761291-30121-1-git-send-email-yangtiezhu@loongson.cn>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] afs: Fix compile warning in afs_dynroot_lookup()
MIME-Version: 1.0
Content-ID: <12482.1577437812.1@warthog.procyon.org.uk>
Date: Fri, 27 Dec 2019 09:10:12 +0000
Message-ID: <12483.1577437812@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_011024_404571_E19D5C58 
X-CRM114-Status: GOOD (  15.27  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: dhowells@redhat.com, Tiezhu Yang <yangtiezhu@loongson.cn>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Al Viro <viro@zeniv.linux.org.uk> wrote:

> > -	int len;
> > +	int len = 0;
> >  
> >  	if (!net->ws_cell)
> >  		return ERR_PTR(-ENOENT);
> 
> NAK.  This is really, really wrong - passing zero to lookup_one_len() is
> always a bug.

You can't create a cell with a name of "" as afs_alloc_cell() will object with
EINVAL, so if net->ws_cell points to an afs_cell struct, that should never
have a zero-length name.

> BTW, what guarantees that cell->name won't be "@cell"?

afs_alloc_cell() won't allow that a cell with that that name either.

> The same for net->sysnames in afs_lookup_atsys() - what makes sure we won't
> see "@sys" among those?

afs_proc_sysname_write() checks for it.  Note that @sys substitutions are set
locally and are not obtained remotely.

> While we are at it,
>         d = d_splice_alias(inode, dentry);
>         if (!IS_ERR_OR_NULL(d)) {
>                 d->d_fsdata = dentry->d_fsdata;
>                 trace_afs_lookup(dvnode, &d->d_name,
>                                  inode ? AFS_FS_I(inode) : NULL);
>         } else {
>                 trace_afs_lookup(dvnode, &dentry->d_name,
>                                  IS_ERR_OR_NULL(inode) ? NULL
>                                  : AFS_FS_I(inode));
>         }
> is _very_ suspicious-looking - d_splice_alias() consumes
> an inode reference, and if it ends up failing on non-ERR_PTR()
> inode, the inode will be dropped by the time it returns.
> IOW, that AFS_FS_I(inode) in the second branch can bloody
> well point to already freed memory.

Yeah, fair point.  I need to save the fid before calling d_splice_alias().

> Tracepoints: Just Say No...

You can go and argue that one with David Miller if you like.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
