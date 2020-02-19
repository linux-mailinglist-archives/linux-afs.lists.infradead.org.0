Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A11651D1
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 22:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huTlDcMIPSQTMwtFJpRg8A6KGY8VbbFA2k55i40yTME=; b=nF4ZLAvLUwy87o
	U8uPywUJ7ecHDRW5JNPBK6DUTNL4f/7fTB1diDBzd+lHgDoILiJlMPsJY8lk9A3mhHXV+bRkW/hCI
	8D6CmmzzOVURxdCAjP3p4nN15ltsqftQTH0v5Equc1HSQP3WkAXZMewJwHZBGzD8HCcv5eFEbq9/6
	G9PIpEhYk8fT5w+a48RYtEXMRMQshRFWBq0BBdDM7HL1VYnSCIae5nq5BtQukEwjA/TaWjY4qAT8W
	HyBCMMm7LNeiHTF0hN0VT7rIAUtOmn5qPizhxDThxLDv3JCDU52nF9W08UhxWj2VljQAIFgwPlBmb
	kuOmPvzOUWwoaecOu5EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4X5K-0007U9-A3; Wed, 19 Feb 2020 21:40:46 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Vig-0003pM-Jh
 for linux-afs@lists.infradead.org; Wed, 19 Feb 2020 20:13:19 +0000
Received: by mail-lj1-x244.google.com with SMTP id q8so1704281ljj.11
 for <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 12:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgq6Y7b2zz3iA7vvFl1zD3iuBLDCnggP0uD/ReDPtoY=;
 b=L1xcjpv9tg4ovUYUrEvMleJYYGnxMSzUIGeTIEI8pb3Dp4HZy1mT2JTLUJYr+nQrPs
 RkPEHZFY1/xrXLf8wYx0g7zYXtc/srkM5eYLE0fb8urwD0Hu/6f09qRJUwi9vY+uxkbK
 MkE8Vg3sCpw9CxMHOqUIpxk4GiRP39hrEEF6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgq6Y7b2zz3iA7vvFl1zD3iuBLDCnggP0uD/ReDPtoY=;
 b=lnB2HZSDVeDjjSVLEA47f2Ss24em7rUcLPhWjOnImsd7UZ/nuVqL/uD1l+Rah0euNf
 1JcoKh9ydumcUdOX7nmwTNFXbxiMMwBJEX+Lgs0kXD5i07oTawUkZNX+53gPEmLU7JL3
 OtahdlOjAu7cg8DUiemSNda76KKoDN45kXSGBd+3h0+nqYtLzwYi+gaNEfrfGdIgyHFo
 T8A+qst3BPMp1+WnXPvjhlsdjNyA8p0iFw9lRdL4pWLycxdup/F01kaXsODgkQGMVaTP
 5f6ur2UzMItaQpbTbMrFPoyM7mWTtnUBE9lQDBEQ+0t7aR5UAtUOtpZd5W37Btl4UfOT
 iSNA==
X-Gm-Message-State: APjAAAWstXbFpP94VKJMqORPVc7Fqc0vBYvmaAeWlaVWSeRkH6lYs33H
 EuJ407+R7hyjQBqX1jLR75xqhiRODug=
X-Google-Smtp-Source: APXvYqzKeP0t6E3+KDW7uz3Rp56bYRTMGFk8HB5fg3yXUaK7oE/WeTz0nHg+3yca7U2FF1vbEv56Jg==
X-Received: by 2002:a2e:7816:: with SMTP id t22mr16771365ljc.161.1582143196452; 
 Wed, 19 Feb 2020 12:13:16 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id y7sm357929lfk.83.2020.02.19.12.13.15
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 12:13:15 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id r19so1751674ljg.3
 for <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 12:13:15 -0800 (PST)
X-Received: by 2002:a2e:9d92:: with SMTP id c18mr17708042ljj.265.1582143194731; 
 Wed, 19 Feb 2020 12:13:14 -0800 (PST)
MIME-Version: 1.0
References: <158212290024.224464.862376690360037918.stgit@warthog.procyon.org.uk>
 <CAMuHMdV+H0p3qFV=gDz0dssXVhzd+L_eEn6s0jzrU5M79_50HQ@mail.gmail.com>
 <227117.1582124888@warthog.procyon.org.uk>
 <CAHk-=wjFwT-fRw0kH-dYS9M5eBz3Jg0FeUfhf6VnGrPMVDDCBg@mail.gmail.com>
 <241568.1582134931@warthog.procyon.org.uk>
 <CAHk-=wi=UbOwm8PMQUB1xaXRWEhhoVFdsKDSz=bX++rMQOUj0w@mail.gmail.com>
 <CAHk-=whfoWHvL29PPXncxV6iprC4e_m6CQWQJ1G4-JtR+uGVUA@mail.gmail.com>
 <252465.1582142281@warthog.procyon.org.uk>
In-Reply-To: <252465.1582142281@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Feb 2020 12:12:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgtAEvD6J_zVPKXHDjZ7rNe3piRzD_bX2HcVgY3AMGhjw@mail.gmail.com>
Message-ID: <CAHk-=wgtAEvD6J_zVPKXHDjZ7rNe3piRzD_bX2HcVgY3AMGhjw@mail.gmail.com>
Subject: Re: [RFC PATCH] vfs: syscalls: Add create_automount() and
 remove_automount()
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_121318_653158_0A4CEAD0 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:244 listed in]
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

On Wed, Feb 19, 2020 at 11:58 AM David Howells <dhowells@redhat.com> wrote:
>
> Actually, in many ways, they're more akin to symlinks (and are implemented as
> symlinks with funny attributes).  It's a shame that symlinkat() doesn't have
> an at_flags parameter.

Interesting. Then you'd get the metadata as the symlink data. Is the
size of the available buffer (PATH_MAX) sufficient?

In fact, would PATH_MAX-2 be sufficient?

Because POSIX actually says that a double slash at the beginning of a
filename is special:

 "A pathname consisting of a single slash shall resolve to the root
directory of the process. A null pathname shall not be successfully
resolved. A pathname that begins with two successive slashes may be
interpreted in an implementation-defined manner, although more than
two leading slashes shall be treated as a single slash"

so you _could_ actually just make the rule be something simple like

   symlink(target, "//datagoeshere")

being the "create magic autolink directory using "datagoeshere".

The advantage of that interface is that now you can do things from
simple perl/shell scripts etc, instead of using any magic at all.

> mknod() isn't otherwise supported on AFS as there aren't any UNIX special
> files.

Well, arguably that's a feature. You _could_ decide that a S_IFCHR
mknod (with a special number pattern too, just as a special check)
becomes that special node that you can then write the data to to
create it.

So then you could again script things with

   mknod dirname c X Y
   echo "datagoeshere" > dirname

if that's what it takes.

But the symlink thing strikes me as not unreasonable. It's POSIXy,
even if Linux hasn't really traditionally treated two slashes
specially (we've discussed it, and there may be _tools_ that already
do, though)

         Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
