Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAAE1651CF
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 22:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfDvYkNoiZcz+CigT1oxTN8govDLgPHNdxxUfCv567s=; b=DPZUPzSaaBBoAC
	gxZYOyQ0EasWwDF3JP+qViD6mb46IQ+Z+e4AVgwUFU3VpHbTYRBODd4Yme19JeVkHKxIkz5dnrFxX
	wK0GuddbwqC6EtzrNhHwEusQfgQEPwr72zkS/2dNoCXUeR68Zyk65FuJJAob/1eYXVxS3TOfZkGVd
	uFoXm/KQtxRiwgTl6h4bi7QVjyOnWQ+SSdkobgbNUF1YUcjx7irkM0T35bsiaDjg6Hw0IeJFapJf8
	eGxHU1H/mMVAgKFp2KzwcyUMYk79CGVcfARjTal+NcvvlHbRUGjUnd/tEBSeeRMp3h2mAprFIhKtB
	Py0uv1TVCDVzqR3YtWcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4X5K-0007T9-0u; Wed, 19 Feb 2020 21:40:46 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4VU6-0000tq-Kr
 for linux-afs@lists.infradead.org; Wed, 19 Feb 2020 19:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582142292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t0EjaOj44ktsI0o8dM8MlcrbPgSXHBFyya3QCm27HcQ=;
 b=hrG9+jQfZjSnMaz2iFOP87UP8GLsVCLTSxxe5u2NE2kpJ8TF1sMqf9XjY8ZYxY4AEXrTnF
 un9XKMDOUoD0+vQRVpF6WaOhjMvkhL50UZm3z2rfWszzhHeUvfzzQ+oJ61rl/wbg9Muymj
 Q7XIjT06Cye7IgY3HBG6G8nxzlIzWpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-rGSX7ZLMP8eOL5O_lYVaJA-1; Wed, 19 Feb 2020 14:58:08 -0500
X-MC-Unique: rGSX7ZLMP8eOL5O_lYVaJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81DC71800D42;
 Wed, 19 Feb 2020 19:58:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-122-163.rdu2.redhat.com
 [10.10.122.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EDC75DA82;
 Wed, 19 Feb 2020 19:58:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=whfoWHvL29PPXncxV6iprC4e_m6CQWQJ1G4-JtR+uGVUA@mail.gmail.com>
References: <CAHk-=whfoWHvL29PPXncxV6iprC4e_m6CQWQJ1G4-JtR+uGVUA@mail.gmail.com>
 <158212290024.224464.862376690360037918.stgit@warthog.procyon.org.uk>
 <CAMuHMdV+H0p3qFV=gDz0dssXVhzd+L_eEn6s0jzrU5M79_50HQ@mail.gmail.com>
 <227117.1582124888@warthog.procyon.org.uk>
 <CAHk-=wjFwT-fRw0kH-dYS9M5eBz3Jg0FeUfhf6VnGrPMVDDCBg@mail.gmail.com>
 <241568.1582134931@warthog.procyon.org.uk>
 <CAHk-=wi=UbOwm8PMQUB1xaXRWEhhoVFdsKDSz=bX++rMQOUj0w@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH] vfs: syscalls: Add create_automount() and
 remove_automount()
MIME-Version: 1.0
Content-ID: <252464.1582142281.1@warthog.procyon.org.uk>
Date: Wed, 19 Feb 2020 19:58:01 +0000
Message-ID: <252465.1582142281@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_115814_760711_8CFBD43F 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Wed, 19 Feb 2020 13:40:43 -0800
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
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
 AND..." <linux-nfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 coda@cs.cmu.edu, Geert Uytterhoeven <geert@linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux-afs@lists.infradead.org,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > Why don't you just use mkdir with S_ISVTX set, or something like that?
> 
> Actually, since this is apparently a different filetype, the _logical_
> thing to do is to use "mknod()".

Actually, in many ways, they're more akin to symlinks (and are implemented as
symlinks with funny attributes).  It's a shame that symlinkat() doesn't have
an at_flags parameter.

mknod() isn't otherwise supported on AFS as there aren't any UNIX special
files.

> You presumably need a new type _anyway_ for stat() and/or the filldir
> d_type field. Or do you always want to make it look exactly like a
> directory to all user space?

That's already dealt with.  They're presented as directories with
STATX_ATTR_AUTOMOUNT showing when you call statx() on them.  You can also use
readlink() to extract the target if they haven't been mounted over yet.

Inside the kernel, they have no ->lookup() op, so DCACHE_AUTODIR_TYPE is set
on the dentry and there's a ->d_automount() op.  The inode has S_AUTOMOUNT
set.  That's all taken care of when the inode is created and the dentry is
instantiated.

Davod


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
