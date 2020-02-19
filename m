Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C6164D40
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 19:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+HPl7nqal/PuT17Ti7jmY6er42yZDTTKZs4TaHLcaY=; b=C5HeUDtZPo2kTo
	SVLE7580v7hHHF39ms3oeWkZfDnqjPDNZonuRqNfoZT3rdPRDP/WNHCtQMle9mpozcQ8SFRWqVgAA
	B7Fb+hlg9dk0oTl5Yv7KvgAeAEhPNSblM+uifawQV+5Bvxm6SQYTYqP5L3z8kagoOGkbrTJXNOP2h
	u0HU9mYsR6D0f88dpJOaaJgDSqAlx7pUJ9+07sjfgx/QSS0ADYwLjx5m51ib89Nov2emApbJJOFEp
	QqQjUi9bLdNRTgqfD4FY4UXPL+i301rcGTq5SzwPaz7sFXBXZ/3oWd5L89WLuCIlBahf6IwRr603g
	K4mDTKIhTPR3aLkSzC/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Tfo-0006kn-0q; Wed, 19 Feb 2020 18:02:12 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4TZa-0003s5-KL
 for linux-afs@lists.infradead.org; Wed, 19 Feb 2020 17:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582134944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=woJrYBQ5G1rIzUoBIxisrRt/fHuFNb6jWX81Ut30+Bc=;
 b=XepYboAfsQQNWtCx50VGEyzOfnRussqI55aiEJLCIQoTbXH/A4+DO9cuY7zKEfrg59NDwz
 8R0pIs4iH2CM8+DG1WWzKdFgmr0BqASAIZz9G3Fzl2Y8fq6RhJc+opDkAy1sPD4fK+fKbm
 eNhMkdgnTas7RhkhjGNRfn7WFeAQMrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-c4VgchpyOW2sfzE38trctg-1; Wed, 19 Feb 2020 12:55:36 -0500
X-MC-Unique: c4VgchpyOW2sfzE38trctg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DBF413F9;
 Wed, 19 Feb 2020 17:55:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-122-163.rdu2.redhat.com
 [10.10.122.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64AC21001920;
 Wed, 19 Feb 2020 17:55:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wjFwT-fRw0kH-dYS9M5eBz3Jg0FeUfhf6VnGrPMVDDCBg@mail.gmail.com>
References: <CAHk-=wjFwT-fRw0kH-dYS9M5eBz3Jg0FeUfhf6VnGrPMVDDCBg@mail.gmail.com>
 <158212290024.224464.862376690360037918.stgit@warthog.procyon.org.uk>
 <CAMuHMdV+H0p3qFV=gDz0dssXVhzd+L_eEn6s0jzrU5M79_50HQ@mail.gmail.com>
 <227117.1582124888@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH] vfs: syscalls: Add create_automount() and
 remove_automount()
MIME-Version: 1.0
Content-ID: <241567.1582134931.1@warthog.procyon.org.uk>
Date: Wed, 19 Feb 2020 17:55:31 +0000
Message-ID: <241568.1582134931@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_095546_742882_6C6ADE24 
X-CRM114-Status: GOOD (  12.10  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
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
X-Mailman-Approved-At: Wed, 19 Feb 2020 10:02:11 -0800
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

> What are the insane pioctl semantics you want?

There's a file type beyond file, dir and symlink that AFS supports:
mountpoint.  It appears as a directory with no lookup op in Linux - though it
does support readlink.  When a client walks over it, it causes an automount of
the volume named by the content of the mountpoint "file" on that point.  NFS
and CIFS have similar things.

AFS allows the user to create them and remove them:

	http://docs.openafs.org/Reference/1/fs_mkmount.html
	http://docs.openafs.org/Reference/1/fs_rmmount.html

provided the server grants permission to do so.

OpenAFS, Coda, etc. do this by means of a pair of pioctl() functions (at
least, I think Coda does - it ships the pioctl parameters off to userspace to
handle, so the handling is not actually in the kernel).

> If you can't even open a file on the filesystem, you damn well
> shouldn't be able to to "pioctl" on it.
> 
> And if you *can* open a file on the filesystem, why can't you just use
> ioctl on it?

Directory, not file.  You can do mkdir (requiring write and execute), for
example, in a directory you cannot open (which would require read).  If you
cannot open it, you cannot do ioctl on it.

open(O_PATH) doesn't help because that doesn't let you do ioctl.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
