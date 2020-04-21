Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E51B1FC8
	for <lists+linux-afs@lfdr.de>; Tue, 21 Apr 2020 09:30:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qr9NoVqBiAiT+KiW4nmWTZz2kd3m8UfAru4ovsDpM7c=; b=TsXL0SHYmj0Xva
	kUrpc2K6/TfJ4TK4g0YdZz+yaQhEodaxay9WWru5tNajqaI/9NH6L/E3JOkveSjBoPTwC5Ii2r47h
	uVsz+F7oDdhl/IWoPhE+BvesoVDKcXBCPGWPycjMuwv2o87Htg9qkc790SsUY4+29Wh7Db2E9dTAy
	2x1bPfPKwzi4vjRhP0zc6attGloxHUb7lXAN5H2Io/7AxHfb54JLtjm0QJCBN77Xe9H7aiczXYNpA
	hHo4bQBWD5kfiZICeSzQHIfjA8JyiaBl5G9ws8FUSwzF+/xLvdEordrr1OFXOvk2zyUfuQPkGdWis
	ErS0kEajRybEgb0o+/Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnLm-0007j6-1W; Tue, 21 Apr 2020 07:29:46 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQifc-000539-Hx
 for linux-afs@lists.infradead.org; Tue, 21 Apr 2020 02:29:57 +0000
Received: by mail-yb1-xb32.google.com with SMTP id h205so6569950ybg.6
 for <linux-afs@lists.infradead.org>; Mon, 20 Apr 2020 19:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciqMYOZ6XZlVSQyI6y4r8cJk5afnaKUbe9fyNVTLy4E=;
 b=nskicTJK540KM6kUpMBHGIY79Scrkytk33f3ctgvzoNRv0IVgrN9FbpxZo338pKKKA
 dxIuxHw7RBGUbRoiqGjAjYWA18x2D3jDIuVIzE+z4oVzr6HVh1Am00169EbpDgEwdPYd
 pRzdCpwBS8wO49lvtS4xA+/NezVfob8lBCrdnQzr6TM4nJKx1PKViH5vUgZR2wLcm+hH
 BJlfJUVNWBYU6IhQbe9wx4izmJQOYRmg4JoaiOHXWH5XrPh7b+/nPthf7pIqlbk61q+9
 gMs0c04/nw8Vb8XgXULeNori93Te19o399FtO32zVOcz+yqBDY26SSCEiKh4OhEigwiT
 VvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciqMYOZ6XZlVSQyI6y4r8cJk5afnaKUbe9fyNVTLy4E=;
 b=Bis4Fx1IApKakMXtfDXxJZfToNVKqsXa87O4zTtAl+8VpZniOp69TZhX2T10Qpg3DE
 hkfItgm2MLqnmnFzJVmmI3gQrmjAnv7llrXXvaiRcocSI/PyXHUKbAjGjsOwMJoQuog7
 +HIXccjf+GkOXGFgNi3Zcng+hnHH7WCqlXnI59WZYf8dw51cQ9+llmIC8AJ8PYK27kub
 wmsEGO6cmnSe91w7ev3JDihoBSHxn57FDorSaVP7omAHH9Dz+1nCRdc3U1ajwh0FirIG
 r2Q6XwxFASI+rFuVrV89N9HszP78UMVrv2W125kZu/4E4a5DaawUtxNr9eOQ7qalIWt4
 IbiQ==
X-Gm-Message-State: AGi0PubJUAKhpFx9j76pNrA33JhL1EZfcPvvG0xPDwmsvyY/RmJUZcRT
 VlnI6rYBNKjn8LzrZKMEQLgLQHm+hAkWjR/XBU8=
X-Google-Smtp-Source: APiQypJEyN++b8Zrn/RN2+wWJ9QpMpPqYddQf+U0oij1N2zwZqnREbkZdKwu5PYzQWVoGBjggaLlEfcGSBG6yNXVHdk=
X-Received: by 2002:a25:9cc2:: with SMTP id z2mr22838180ybo.375.1587436195667; 
 Mon, 20 Apr 2020 19:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <878siq587w.fsf@cjr.nz> <87imhvj7m6.fsf@cjr.nz>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <927453.1587285472@warthog.procyon.org.uk>
 <1136024.1587388420@warthog.procyon.org.uk>
 <1986040.1587420879@warthog.procyon.org.uk>
 <93e1141d15e44a7490d756b0a00060660306fadc.camel@redhat.com>
In-Reply-To: <93e1141d15e44a7490d756b0a00060660306fadc.camel@redhat.com>
From: Steve French <smfrench@gmail.com>
Date: Mon, 20 Apr 2020 21:29:44 -0500
Message-ID: <CAH2r5msv0r1-bXJKdN-ansMnpay0+Aw9FP5us5zHrhp3adzV=Q@mail.gmail.com>
Subject: Re: cifs - Race between IP address change and sget()?
To: Jeff Layton <jlayton@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_192956_599852_5C9FA05E 
X-CRM114-Status: GOOD (  23.73  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:b32 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [smfrench[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Mailman-Approved-At: Tue, 21 Apr 2020 00:29:44 -0700
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
Cc: Florian Weimer <fweimer@redhat.com>, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>, Paulo Alcantara <pc@cjr.nz>,
 LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, Apr 20, 2020 at 5:30 PM Jeff Layton <jlayton@redhat.com> wrote:
>
> On Mon, 2020-04-20 at 23:14 +0100, David Howells wrote:
> > Paulo Alcantara <pc@cjr.nz> wrote:
> >
> > > > > > What happens if the IP address the superblock is going to changes, then
> > > > > > another mount is made back to the original IP address?  Does the second
> > > > > > mount just pick the original superblock?
> > > > >
> > > > > It is going to transparently reconnect to the new ip address, SMB share,
> > > > > and cifs superblock is kept unchanged.  We, however, update internal
> > > > > TCP_Server_Info structure to reflect new destination ip address.
> > > > >
> > > > > For the second mount, since the hostname (extracted out of the UNC path
> > > > > at mount time) resolves to a new ip address and that address was saved
> > > > > earlier in TCP_Server_Info structure during reconnect, we will end up
> > > > > reusing same cifs superblock as per fs/cifs/connect.c:cifs_match_super().
> > > >
> > > > Would that be a bug?
> > >
> > > Probably.
> > >
> > > I'm not sure how that code is supposed to work, TBH.
> >
> > Hmmm...  I think there may be a race here then - but I'm not sure it can be
> > avoided or if it matters.
> >
> > Since the address is part of the primary key to sget() for cifs, changing the
> > IP address will change the primary key.  Jeff tells me that this is governed
> > by a spinlock taken by cifs_match_super().  However, sget() may be busy
> > attaching a new mount to the old superblock under the sb_lock core vfs lock,
> > having already found a match.
> >
>
> Not exactly. Both places that match TCP_Server_Info objects by address
> hold the cifs_tcp_ses_lock. The address looks like it gets changed in
> reconn_set_ipaddr, and the lock is not currently taken there, AFAICT. I
> think it probably should be (at least around the cifs_convert_address
> call).
>
> > Should the change of parameters made by cifs be effected with sb_lock held to
> > try and avoid ending up using the wrong superblock?
> >
> > However, because the TCP_Server_Info is apparently updated, it looks like my
> > original concern is not actually a problem (the idea that if a mounted server
> > changes its IP address and then a new server comes online at the old IP
> > address, it might end up sharing superblocks because the IP address is part of
> > the key).
> >
>
> I'm not sure we should concern ourselves with much more than just not
> allowing addresses to change while matching/searching. If you're
> standing up new servers at old addresses while you still have clients
> are migrating, then you are probably Doing it Wrong.

Yes.   The most important thing is to support the reasonably
common scenario where the server's IP address changes (there are
fancier ways to handle this gracefully e.g. the "Witness Protocol" feature
of SMB3 mounts, but that is not always supported by servers and we
still need to add Witness protocol to clients - but current code allowing
SMB3 server IP address to change has helped some customers out)

-- 
Thanks,

Steve

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
