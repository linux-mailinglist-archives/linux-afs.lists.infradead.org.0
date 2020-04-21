Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B471B1FC3
	for <lists+linux-afs@lfdr.de>; Tue, 21 Apr 2020 09:30:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62r2QQnJEtyRWV6qdfvvHXtOeaVTcDaZa4oOCGWfprE=; b=Bs08c9XpGJWeFv
	m8cQMWMkvEZyoUVAuLnLOlSy0jg1Nr9YM7vMUv9dPuK7l8uic/Gchn0J4Wjj4vWblEQZMuVNFHnR5
	gcbMLSFdpAGnUTGec6/T5fSb3sTaASaPs2+YleM1JKjMSJkeMzbJFKLbsb0w2xy7M3VHgMnUX+1N8
	SxcAVHWjhJQSHy7PUGJMYjKu0G6jXTgRekXusqXDpuUhYIfo+fRN5JP2EzWTrKuw7W7v1FFHny7ZB
	Ao+ofeOpigBHYoIcljHK7xx4eFEx1yp+hQMDxuL+tO3pOcsuhL6F0mav8QwnWdxfaCi/6hY/3UOPH
	tRoQX1ldMF3ZHMNuXNsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnLl-0007ic-Rf; Tue, 21 Apr 2020 07:29:45 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQicb-0003wH-Je
 for linux-afs@lists.infradead.org; Tue, 21 Apr 2020 02:26:51 +0000
Received: by mail-yb1-xb32.google.com with SMTP id a9so6554798ybc.8
 for <linux-afs@lists.infradead.org>; Mon, 20 Apr 2020 19:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRgQky4PDEZMWd12RdwHQNU2vo1l3+5UFXq3XUesRDU=;
 b=LQ8Bp0Ov7isBdAiER6YRYWyo8k3+eS6SZ42YaEAFUWiDZOS8+hgeZnWGISDcqJ1p2q
 UaSFjMATwjZUhisrmw/oV67tpJXZiKc1GFOexqcMkyc+i2HLNlyOXbZ/KK9ij0f9d+jg
 W2yjbH8bm3b9+pnfpqHbWw72UQ0HcwKPwhQUhuUUm4SQ+NUXmnFUFHB2TDnN7WoktHaY
 YMzb0JzH+UwJbGLZNjI6M24zAVo6RftVA0hwUGmuZE2n9OhTAYB3wRjnVF/cRuBhIgzU
 6dDsn1/OOeQ73kym2OXUtwIsvatGvdXrWf/ljV96GNnF19kFbfJ3DNcSn3ldAkIb1zOz
 nebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRgQky4PDEZMWd12RdwHQNU2vo1l3+5UFXq3XUesRDU=;
 b=n4to0WUocSjYEBi44EXdBLdyOdC9QAxTqpJ44UQrThhB9I7mqJXxIb1btv7eLC+4s/
 5flVfGmSX2rFy45xwsMwSzHoZWag42I7xcjzQ84MGNnapvxQJxkDJHEZtxQLt8/UCGNH
 7W472/0K/Fs8yxwvWA3T+LX4nKql6dna1vdRkVVqZbP0mtgsKXxGOMa8+YyfamAcfQq2
 HC8FWZeAvcPsFI3Iv3BH1+bRWNHOtSxrX0axYGvSUd37lhCAbkWkK/TxLng0bw8JtU69
 JpGVdQcSJSwfJER5s+58nnx7acIUKIdU2Dpqg8OlhZdUpdyh64yXbwYa1F/ySFDuGwle
 BMyg==
X-Gm-Message-State: AGi0PubykdLrUnSjcg6j4tFhPWb9NDBIdfmNbTrA34SAkRn0hjV6MvYw
 vVOtFu4yY7gNv9S9KA7c0OZvT+ELmcYa/7nyIczlNRhD
X-Google-Smtp-Source: APiQypIv3Fen+zztBkd5PHVGvOFmEtm69MJphpXA9m9M7QwlbhVOXTlpOGX/cyb0PXpOZ5m24EyY89GZPZz0ftd39Kw=
X-Received: by 2002:a25:cf12:: with SMTP id f18mr23230627ybg.167.1587436004988; 
 Mon, 20 Apr 2020 19:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <878siq587w.fsf@cjr.nz> <87imhvj7m6.fsf@cjr.nz>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <927453.1587285472@warthog.procyon.org.uk>
 <1136024.1587388420@warthog.procyon.org.uk>
 <1986040.1587420879@warthog.procyon.org.uk>
 <93e1141d15e44a7490d756b0a00060660306fadc.camel@redhat.com>
 <194431215.23515823.1587432599559.JavaMail.zimbra@redhat.com>
In-Reply-To: <194431215.23515823.1587432599559.JavaMail.zimbra@redhat.com>
From: Steve French <smfrench@gmail.com>
Date: Mon, 20 Apr 2020 21:26:34 -0500
Message-ID: <CAH2r5msYrA+3+VYYBFTvC+=72GNKH2mP=Ly9sBvOLYeSvebY_A@mail.gmail.com>
Subject: Re: cifs - Race between IP address change and sget()?
To: Ronnie Sahlberg <lsahlber@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_192649_649928_1EAB7A7F 
X-CRM114-Status: GOOD (  29.12  )
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
 linux-nfs <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@redhat.com>,
 Network Development <netdev@vger.kernel.org>, Paulo Alcantara <pc@cjr.nz>,
 LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, Apr 20, 2020 at 8:30 PM Ronnie Sahlberg <lsahlber@redhat.com> wrote:
>
>
>
>
>
> ----- Original Message -----
> > From: "Jeff Layton" <jlayton@redhat.com>
> > To: "David Howells" <dhowells@redhat.com>, "Paulo Alcantara" <pc@cjr.nz>
> > Cc: viro@zeniv.linux.org.uk, "Steve French" <smfrench@gmail.com>, "linux-nfs" <linux-nfs@vger.kernel.org>, "CIFS"
> > <linux-cifs@vger.kernel.org>, linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org, keyrings@vger.kernel.org,
> > "Network Development" <netdev@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, fweimer@redhat.com
> > Sent: Tuesday, 21 April, 2020 8:30:37 AM
> > Subject: Re: cifs - Race between IP address change and sget()?
> >
> > On Mon, 2020-04-20 at 23:14 +0100, David Howells wrote:
> > > Paulo Alcantara <pc@cjr.nz> wrote:
> > >
> > > > > > > What happens if the IP address the superblock is going to changes,
> > > > > > > then
> > > > > > > another mount is made back to the original IP address?  Does the
> > > > > > > second
> > > > > > > mount just pick the original superblock?
> > > > > >
> > > > > > It is going to transparently reconnect to the new ip address, SMB
> > > > > > share,
> > > > > > and cifs superblock is kept unchanged.  We, however, update internal
> > > > > > TCP_Server_Info structure to reflect new destination ip address.
> > > > > >
> > > > > > For the second mount, since the hostname (extracted out of the UNC
> > > > > > path
> > > > > > at mount time) resolves to a new ip address and that address was
> > > > > > saved
> > > > > > earlier in TCP_Server_Info structure during reconnect, we will end up
> > > > > > reusing same cifs superblock as per
> > > > > > fs/cifs/connect.c:cifs_match_super().
> > > > >
> > > > > Would that be a bug?
> > > >
> > > > Probably.
> > > >
> > > > I'm not sure how that code is supposed to work, TBH.
> > >
> > > Hmmm...  I think there may be a race here then - but I'm not sure it can be
> > > avoided or if it matters.
> > >
> > > Since the address is part of the primary key to sget() for cifs, changing
> > > the
> > > IP address will change the primary key.  Jeff tells me that this is
> > > governed
> > > by a spinlock taken by cifs_match_super().  However, sget() may be busy
> > > attaching a new mount to the old superblock under the sb_lock core vfs
> > > lock,
> > > having already found a match.
> > >
> >
> > Not exactly. Both places that match TCP_Server_Info objects by address
> > hold the cifs_tcp_ses_lock. The address looks like it gets changed in
> > reconn_set_ipaddr, and the lock is not currently taken there, AFAICT. I
> > think it probably should be (at least around the cifs_convert_address
> > call).
>
> I think you are right. We need the spinlock around this call too.
> I will send a patch to the list to add this.
>
> >
> > > Should the change of parameters made by cifs be effected with sb_lock held
> > > to
> > > try and avoid ending up using the wrong superblock?
> > >
> > > However, because the TCP_Server_Info is apparently updated, it looks like
> > > my
> > > original concern is not actually a problem (the idea that if a mounted
> > > server
> > > changes its IP address and then a new server comes online at the old IP
> > > address, it might end up sharing superblocks because the IP address is part
> > > of
> > > the key).
> > >
> >
> > I'm not sure we should concern ourselves with much more than just not
> > allowing addresses to change while matching/searching. If you're
> > standing up new servers at old addresses while you still have clients
> > are migrating, then you are probably Doing it Wrong.
>
> Agree. That is a migration process issue and not something we can/should
> try to address in cifs.ko.

Yep

-- 
Thanks,

Steve

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
