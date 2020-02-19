Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B54351651D2
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 22:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLuN6zD/SKMN/MEDTPt92G7X5608jbVbXF47hTjmd/E=; b=su7/jVJ7Gi7KHL
	76NV2E8Oz/J4ceZ6uWNULIzfPI4b0gWhU1OyALyK9KBh+n014jg8REHn3LVBPFKmSOgMco2WDcJ/a
	IRk4lJyNnxKumr4L1wSc1rzAVJGKZya0V0FmuqufVicr4hEBFcMwedlIujsvs9sxrzDxVAgqLp//n
	1suUtUTFYe3U6Tz7TXsZoYWcaVe+VP+JSmLOoNkla7fnkdMwy7bWhmw//h0dmCLGIcWd+wZGqFEhG
	rJrfSHYylrixuwjalRrVeeXfXev8FKUc/Gh2LVt0BRxxA+yE6Pngy2ReC/DsVl1CUxnlP/qk/hC/G
	hzmlX52TWP3yGeYgG/GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4X5K-0007Ui-QE; Wed, 19 Feb 2020 21:40:46 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4X4c-0006BT-Fv
 for linux-afs@lists.infradead.org; Wed, 19 Feb 2020 21:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582148401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Akm5nZ5Nk5RDJvPlHXdmc1pTXqzcrHwStmylDtS4kdo=;
 b=cD6CMwlQM0OJsp1JzhHuJqeXtPLT8H5zzEaBUHr9zrSzhBYMLXmCX3hDGJzdk9IQf+st5k
 roXzrl0WHzh++ouGdsFuLES3giEAh3DIaPf0AFhvpXa1QNN+sjktyy62yUiDrLK1tb8xfX
 g246lyvm0qj0566do/CAAGbmF+kHr50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-lYV3sqb5NxSus3qboGNwYQ-1; Wed, 19 Feb 2020 16:39:58 -0500
X-MC-Unique: lYV3sqb5NxSus3qboGNwYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF399800D50;
 Wed, 19 Feb 2020 21:39:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-122-163.rdu2.redhat.com
 [10.10.122.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A04215C1B0;
 Wed, 19 Feb 2020 21:39:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wgtAEvD6J_zVPKXHDjZ7rNe3piRzD_bX2HcVgY3AMGhjw@mail.gmail.com>
References: <CAHk-=wgtAEvD6J_zVPKXHDjZ7rNe3piRzD_bX2HcVgY3AMGhjw@mail.gmail.com>
 <158212290024.224464.862376690360037918.stgit@warthog.procyon.org.uk>
 <CAMuHMdV+H0p3qFV=gDz0dssXVhzd+L_eEn6s0jzrU5M79_50HQ@mail.gmail.com>
 <227117.1582124888@warthog.procyon.org.uk>
 <CAHk-=wjFwT-fRw0kH-dYS9M5eBz3Jg0FeUfhf6VnGrPMVDDCBg@mail.gmail.com>
 <241568.1582134931@warthog.procyon.org.uk>
 <CAHk-=wi=UbOwm8PMQUB1xaXRWEhhoVFdsKDSz=bX++rMQOUj0w@mail.gmail.com>
 <CAHk-=whfoWHvL29PPXncxV6iprC4e_m6CQWQJ1G4-JtR+uGVUA@mail.gmail.com>
 <252465.1582142281@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH] vfs: syscalls: Add create_automount() and
 remove_automount()
MIME-Version: 1.0
Content-ID: <260917.1582148393.1@warthog.procyon.org.uk>
Date: Wed, 19 Feb 2020 21:39:53 +0000
Message-ID: <260918.1582148393@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_134002_627730_1F2DA510 
X-CRM114-Status: GOOD (  12.73  )
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
 coda@cs.cmu.edu, Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux-afs@lists.infradead.org,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> so you _could_ actually just make the rule be something simple like
> 
>    symlink(target, "//datagoeshere")
> 
> being the "create magic autolink directory using "datagoeshere".

Interesting.  I'll ask around to see if this is feasible.  Some applications
(emacs being one maybe) sometimes appear to store information in symlink
bodies - I'm not sure if any of those could be a problem.

Since the mountpoint body is formulaic:

	[%#](<cellname>:)?<volumename>(.readonly|.backup)?.

maybe I can use that pattern.

symlink() would be returning a dentry that appears to be a directory, but it
doesn't look like that should be a problem.

> So then you could again script things with
> 
>    mknod dirname c X Y
>    echo "datagoeshere" > dirname

This would be tricky to get right as it's not atomic and the second part could
fail to happen.  For extra fun, another client could interfere between the
steps (setxattr would be safer than write here).

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
