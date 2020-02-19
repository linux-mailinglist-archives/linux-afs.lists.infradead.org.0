Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B821651CD
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 22:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85SxJqv3hLJ+BLftpeKjjBLwolfb8osYTEsu7QRFXHs=; b=uPFi62RBXhdZZY
	m0iiZjmBjJgqKLeZDApYHCWZJW4M9Hxd0IXW2HgLPK+Vfc4CuF6lecOs9uCZFH1N+gllFdkft6ksM
	6Cl/tfCaiLbkzAN3fFBMaGSp/vdaaM49GYw+nAH3QAw1Aoz2yajO+6VVQ4sslcHSLGIYLI6GcURzp
	6o5u6vVczWD0V9OAxALCGKKwb76WZuT0CpLDLoOgESz0FRGiOaEBU8KY/QyvWjqthI+qC1wP4dr/M
	30cW6LKRJfIbNM+LfDiMocjHR5Z81mcglBs6gCUEFAkWTwTgf/v1ECkfLQCvaNUDGQ6et9vBFtnwp
	gl66VDygIT6MhRVKxtZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4X5J-0007ST-Aq; Wed, 19 Feb 2020 21:40:45 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4UW3-0003dx-VU
 for linux-afs@lists.infradead.org; Wed, 19 Feb 2020 18:56:13 +0000
Received: by mail-lf1-x144.google.com with SMTP id z5so941617lfd.12
 for <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 10:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4/btNie2yJSHTlvtkEMVrzLJ5p+2iau4ZxcsT8Kh+V8=;
 b=OANlOLlls14aKMkL1WjVjo8f/tVbYdtb8Nt9MCvon8MWsZkBp2wf0M4h4HkivP25SY
 Lor+Pn5WeqeFiam04EJmGY4IF6tW7qKCzkRZwxbdgjj0f2w6R9Z2iIpFLl/G1lsUeweh
 z+TQEaepT45ebjzQ5n9r3U+GEMxGXZG+BGf8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4/btNie2yJSHTlvtkEMVrzLJ5p+2iau4ZxcsT8Kh+V8=;
 b=DJQjCMmC7j8DJoEqvWrKm2HXcVVgh9RE8JAHs4/CQ/zvcj4Vj2AlHf53NMs+LDFTeJ
 6SchRZ8REl69pr1AUB7zIVDgkOceI0abR7Tv8JV57JYCc/5iooK9gzyzpvK8KUU4Ei4i
 d8uH1xjWkKioo4cLF4wfRACYJ8vdpXwD3fGt4VZiyjAHkZE07ysrzeu8rbGP2XAXlYh6
 JZy6RXOWI8dmdTnnvIQmSzKAzIr0RUnkl9xiX6Te8NEBmmAKCCivJuiM8uo2Pm8oZHhu
 Zy99v+i9CX/zpDOqZZqBEqPlNZOjXBjmYsAa6PTalG8l0zQhAEjoTZydY8PU/UpkvfNZ
 cCkw==
X-Gm-Message-State: APjAAAVRY5C6ZGQNn1jLoIAAWia8ho2B6KzeOpScH3ED2tPNRvPoD8UP
 +gGhW6aVeIV1IicIYpkX65maO0fr7yY=
X-Google-Smtp-Source: APXvYqy0Vuo6Wl8GjNHbj8wCVppRoTKhZP54UqKd08kZSjCUmdhmnCW65gENWa9TWBNrwFqtPQSFAg==
X-Received: by 2002:a05:6512:10ca:: with SMTP id
 k10mr5527511lfg.154.1582138568847; 
 Wed, 19 Feb 2020 10:56:08 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id n13sm295900lji.91.2020.02.19.10.56.07
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 10:56:08 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id h23so1490250ljc.8
 for <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 10:56:07 -0800 (PST)
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr16927004ljk.201.1582138567368; 
 Wed, 19 Feb 2020 10:56:07 -0800 (PST)
MIME-Version: 1.0
References: <158212290024.224464.862376690360037918.stgit@warthog.procyon.org.uk>
 <CAMuHMdV+H0p3qFV=gDz0dssXVhzd+L_eEn6s0jzrU5M79_50HQ@mail.gmail.com>
 <227117.1582124888@warthog.procyon.org.uk>
 <CAHk-=wjFwT-fRw0kH-dYS9M5eBz3Jg0FeUfhf6VnGrPMVDDCBg@mail.gmail.com>
 <241568.1582134931@warthog.procyon.org.uk>
In-Reply-To: <241568.1582134931@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Feb 2020 10:55:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi=UbOwm8PMQUB1xaXRWEhhoVFdsKDSz=bX++rMQOUj0w@mail.gmail.com>
Message-ID: <CAHk-=wi=UbOwm8PMQUB1xaXRWEhhoVFdsKDSz=bX++rMQOUj0w@mail.gmail.com>
Subject: Re: [RFC PATCH] vfs: syscalls: Add create_automount() and
 remove_automount()
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_105612_019239_80B44A14 
X-CRM114-Status: GOOD (  12.84  )
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:144 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, coda@cs.cmu.edu,
 Geert Uytterhoeven <geert@linux-m68k.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux-afs@lists.infradead.org,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Feb 19, 2020 at 9:55 AM David Howells <dhowells@redhat.com> wrote:
>
> There's a file type beyond file, dir and symlink that AFS supports:
> mountpoint.  It appears as a directory with no lookup op in Linux - though it
> does support readlink.  When a client walks over it, it causes an automount of
> the volume named by the content of the mountpoint "file" on that point.  NFS
> and CIFS have similar things.

Honestly, AFS isn't common or relevant enough to make this worth a new
special system call etc.

Why don't you just use mkdir with S_ISVTX set, or something like that?
Maybe we can even add a new mode bit and allow you to set that one.

And why would removal be any different from rmdir()?

Or just do a perfectly regular mkdir(), followed by a ioctl().

> Directory, not file.  You can do mkdir (requiring write and execute), for
> example, in a directory you cannot open (which would require read).  If you
> cannot open it, you cannot do ioctl on it.

Honestly, who cares?

Seriously. Just make the rule be that you need read permission on the
directory too in order to do that ioctl() that is your magical "make
special node".

What makes this all *SO* special, and *SO* important that you need to
follow somebody elses rules that absolutely nobody cares about?

              Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
