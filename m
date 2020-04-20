Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAF31B1FC5
	for <lists+linux-afs@lfdr.de>; Tue, 21 Apr 2020 09:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IP1meqSQ1b6hmmApko/GkPKfe14LsyzPDUPC3+WDZmw=; b=Qgo3cXKO09PMzB
	u2iifNk2kKd6PkqWcc2yZxu6bGzgryOQwjkJj/Gzf5NXbxDM3J1xS3H3pCZjxIs2ohG9eqWmAj4W+
	Ydl1PSDKeE96hAw1i0dtSxMxAr2t5XHyBmxZSnfkqQmVteAzGRw3n58z502NsUd0P4xdqkV+GuibQ
	uThrNdu6hGDsCTD/XupLw38ElhFEgtrEIUYwuFdTKH318IGH4wPA6eEMxJVwIgbJrW/7347JDpPPD
	FxLDsJDWyXTTaVnywLazA/3SWq+82m6xX/ibLYMICoba7yeJ3q65eyHVUSsp8Qnyha0r9Qnoy+dDE
	It/0CBpC0E2qTal3/97g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnLl-0007hM-EH; Tue, 21 Apr 2020 07:29:45 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQeyU-0007Vu-8Q
 for linux-afs@bombadil.infradead.org; Mon, 20 Apr 2020 22:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=9q6YhDfeioGYYNbOwoNDtbd8XWXwGnM98df6kx4/308=; b=dar5cGJQRj/oQXo8PdsxFBZNgo
 LHFlfcxpdqEUWSIDWBI5jBNMT69V8oWeOrjMvD1togKSzlZX/Hmp1L6KtgAxhrJdvmHTikaKL0STY
 HAMACoS6dXhtTssazds2izxryU5Zi+MIdDV88711rk5CYQIDKmYGYgC1T6EaiuQHuE6Eh0C3r+48N
 GEPT+fj77jcBS8P6Qbp36YGByZ+JvRWxIKfMcZ5kaXHwK8ys8rnE7Aeb9hiXCwGawwrbUfhuoZRd1
 iyRXL/fHP7b9uWY0QFUyRUrOe1FrQi4eVkDMsxkBBEyugUDt9SGPKqQQSxmilg97okF2om5Uen217
 1hNfd4WA==;
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQeyR-0001Yh-I4
 for linux-afs@lists.infradead.org; Mon, 20 Apr 2020 22:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587421841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9q6YhDfeioGYYNbOwoNDtbd8XWXwGnM98df6kx4/308=;
 b=M9K+Ce0pFPTIUPMmsJa/84tA2++gzQV2giT50alI0titPuGjK4zvuhG12ohwkZ4D2mbODb
 55NO65uVc3NxVaZQm75EdMdhocDXmJ+EKK+wUH90MO81UGXpoZQwwSSqTb0kVcD5WT5Tyn
 j0xhA7UqH0DNtzVKeLQHnsocxS1JvdU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587421861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9q6YhDfeioGYYNbOwoNDtbd8XWXwGnM98df6kx4/308=;
 b=beb6/KQ9cOCv6PFettZnx8v/RYI52XgJk+7PFN+DYLJSy7u3lyxd+fKJKaY3BIc4+LtmCg
 s+98WsUEwvhl5I5J8DyaJQonkBYIiVntQ2sxlp+W1+7eksRCY6rE9J/V7SVI4ZXxOeHjlM
 Z9atuPA6QFB8t946ipnt4PmyshL88xs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-M6VMgK6oMuWsIOZJRIDovQ-1; Mon, 20 Apr 2020 18:30:40 -0400
X-MC-Unique: M6VMgK6oMuWsIOZJRIDovQ-1
Received: by mail-qv1-f70.google.com with SMTP id m11so11868867qvf.20
 for <linux-afs@lists.infradead.org>; Mon, 20 Apr 2020 15:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=9q6YhDfeioGYYNbOwoNDtbd8XWXwGnM98df6kx4/308=;
 b=BEUHoWRqKs0xXVdVQDVRts0ZYBKZBDKevSUhY0BUHpKARonhlYAYnwHprfVqDl2MrS
 sWPgVNBk9GB0NPk5tsxHZSTz0mwprc2FFbq0pX0pCXJn8RFvR6uAj9/MUC14foIRVX1K
 L+GVIs2iJDQWhKaJcHqR5TfZCoZ/GUgi/54gECmTBiFaLyk3Fs3SFbNGX/ozPUBtYtQY
 opLZpC49LUIybDNNLf2LNloyF/MQy0rf0bMzwA4DkyfAVunwl4EKU9BpxLC6dAfbogM/
 Y40f2S0Unyl5VtM/T3ISiD8LJHDpiFXWgMowUsk9cyvOuxvgaA8pPLow5w/NSpb0MaFd
 srvQ==
X-Gm-Message-State: AGi0PuYuzxxtOsVzhkcRkSUMtYTmZDBp89XdHxIEHdX1CLJY2XtHmG84
 lWavbCtULodxG3pt/KIl7SgV5qpbLCFI40QnRuNMVAnprajTJyyNg5BpVnDiVjHlFeej6A9U2aJ
 alXuvZIs400dC6Y5Jdspd6JKZdA==
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr18266941qtj.154.1587421839479; 
 Mon, 20 Apr 2020 15:30:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypL1XEhHKfWJ4L3lMwmFDzE2+TBxLfE0ulmEwOUTO4o7oVPQ7Klu15FdcDd0dnvjj9vSaCf+vQ==
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr18266910qtj.154.1587421839193; 
 Mon, 20 Apr 2020 15:30:39 -0700 (PDT)
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
 by smtp.gmail.com with ESMTPSA id m40sm545368qtc.33.2020.04.20.15.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 15:30:38 -0700 (PDT)
Message-ID: <93e1141d15e44a7490d756b0a00060660306fadc.camel@redhat.com>
Subject: Re: cifs - Race between IP address change and sget()?
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@cjr.nz>
Date: Mon, 20 Apr 2020 18:30:37 -0400
In-Reply-To: <1986040.1587420879@warthog.procyon.org.uk>
References: <878siq587w.fsf@cjr.nz> <87imhvj7m6.fsf@cjr.nz>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <927453.1587285472@warthog.procyon.org.uk>
 <1136024.1587388420@warthog.procyon.org.uk>
 <1986040.1587420879@warthog.procyon.org.uk>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <smfrench@gmail.com>,
 keyrings@vger.kernel.org, viro@zeniv.linux.org.uk, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, 2020-04-20 at 23:14 +0100, David Howells wrote:
> Paulo Alcantara <pc@cjr.nz> wrote:
> 
> > > > > What happens if the IP address the superblock is going to changes, then
> > > > > another mount is made back to the original IP address?  Does the second
> > > > > mount just pick the original superblock?
> > > > 
> > > > It is going to transparently reconnect to the new ip address, SMB share,
> > > > and cifs superblock is kept unchanged.  We, however, update internal
> > > > TCP_Server_Info structure to reflect new destination ip address.
> > > > 
> > > > For the second mount, since the hostname (extracted out of the UNC path
> > > > at mount time) resolves to a new ip address and that address was saved
> > > > earlier in TCP_Server_Info structure during reconnect, we will end up
> > > > reusing same cifs superblock as per fs/cifs/connect.c:cifs_match_super().
> > > 
> > > Would that be a bug?
> > 
> > Probably.
> > 
> > I'm not sure how that code is supposed to work, TBH.
> 
> Hmmm...  I think there may be a race here then - but I'm not sure it can be
> avoided or if it matters.
> 
> Since the address is part of the primary key to sget() for cifs, changing the
> IP address will change the primary key.  Jeff tells me that this is governed
> by a spinlock taken by cifs_match_super().  However, sget() may be busy
> attaching a new mount to the old superblock under the sb_lock core vfs lock,
> having already found a match.
> 

Not exactly. Both places that match TCP_Server_Info objects by address
hold the cifs_tcp_ses_lock. The address looks like it gets changed in
reconn_set_ipaddr, and the lock is not currently taken there, AFAICT. I
think it probably should be (at least around the cifs_convert_address
call).

> Should the change of parameters made by cifs be effected with sb_lock held to
> try and avoid ending up using the wrong superblock?
> 
> However, because the TCP_Server_Info is apparently updated, it looks like my
> original concern is not actually a problem (the idea that if a mounted server
> changes its IP address and then a new server comes online at the old IP
> address, it might end up sharing superblocks because the IP address is part of
> the key).
> 

I'm not sure we should concern ourselves with much more than just not
allowing addresses to change while matching/searching. If you're
standing up new servers at old addresses while you still have clients
are migrating, then you are probably Doing it Wrong.

-- 
Jeff Layton <jlayton@redhat.com>


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
