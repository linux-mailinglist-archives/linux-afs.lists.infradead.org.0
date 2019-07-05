Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75860835
	for <lists+linux-afs@lfdr.de>; Fri,  5 Jul 2019 16:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEUyg4HkXpe9pYsFMfmrJ4zKLJqSns63dhY5yp5x8eI=; b=dLFgnKvQcKUQQO
	QIHt43aGaw7TfkWjTIGtrYGscGCoSOSfQHutjsdZfjCQO9/4Ccv4kEB15Glpn0BJR7KmZXF6w4Jof
	HhDx2gwS72puqmnCuvnMk1lIXIQKojTxsJn+N8GPKO2NN2t40buXYZG/cBTaCovGiDd7d5Geslcfy
	Rz2NuufePYMo8edm4jM4fEZ3S4cdsH2hCcN4OXmy8pQ1e8XpU9UvcsjeWt113qnhpiSxvNtGdHCrp
	vcHiMyiiBWfiXvXaqJAhvauFK6fehhJwR6apR6GC/HJ9L1tJQcPKHv92IX7Or1M4Wayp8g+M7I1+g
	yDW4Y6UQpWi8pSBsMaPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjPT1-0000nz-Eg; Fri, 05 Jul 2019 14:45:39 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjPRC-0005rC-Uw
 for linux-afs@bombadil.infradead.org; Fri, 05 Jul 2019 14:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wy7q/lSghMGgYWHueYARtusrEUxHAAv3+Vmwv4lPLPc=; b=u1Oh2popDAY62nlF9n8ZSh1E0
 Lc6LLdeGc7OJ5LITakXDis2DLThAU9i5/1bYuzVukATGi0/3DeIgrK2K+I6lPBfFvp+HsL9ZbBKeX
 skOqXBPXMPO3AgQ7L5QHZVpcPoPTTZqbuwT0lAZZ5T5fKu+BK0JS/CbvmJfwwyNLQPQx0T8Xdf5x0
 OTLHrUz/eFV8XY+6p6dPaCvuPxK1VDjZDvuU4fZKTaqlh7vHzc2OxBPVq8jBJ2wPb4olCi+NeKf8W
 e/2LqbnsOO02eP7yJ9Z8Spn3+a5DJ6Hj2uEQzawDsJE/vIoa6g6uAMl0TiPfTsXQww3ic1dKZs9aQ
 pduhW6OuQ==;
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjN9b-0001aj-2l
 for linux-afs@lists.infradead.org; Fri, 05 Jul 2019 12:17:28 +0000
Received: by mail-io1-xd43.google.com with SMTP id z3so3742441iog.0
 for <linux-afs@lists.infradead.org>; Fri, 05 Jul 2019 05:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wy7q/lSghMGgYWHueYARtusrEUxHAAv3+Vmwv4lPLPc=;
 b=Y4z590x8zZjU+nw79DHqFjYhZKANayNJIXz4wQb9+25F1kH3RJO2RBCpfGERgAZsAn
 ow2HKsxnsP1XGzDlaetFz86AnclIWeQxCeo3Oq1XylC9c3bhuRdEIY+A3pozwPPQ2gFm
 fAItExXm2FysS43TIjvUmCWMj6uF/QwUfqw/iobtpJWztRQ9fI8Nf/FdiMuBQrA9N/J2
 1Ddf9MJO9ZxoTDbUQnLef1m4aPO587Ce7W0qMy0q+buIjxarGoZCoZED/1KyktHkOEFT
 tLxBclUeZhEEetau9xtJQaDV99Hs9o+mXDylVSpCjyVxvsMbK7UGd/eEQjSz8hCzR2pI
 jHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wy7q/lSghMGgYWHueYARtusrEUxHAAv3+Vmwv4lPLPc=;
 b=EiDg9JSWwY9q/9xWmecW4tN8pdwEEJkRM6cwKnw8Wuo0o6+7d5E8p/zKs8i4MZRFvI
 sKslBVFQHtCVvxOqVB7F66l1YkEy4mmgvqWyI0bLDrn484RVRKZoJlLbltSWlE111opg
 LQPXJWn4zKFFN+8OWheISRyLtmnlYaSB/TbPAXzRb/Wvnevv/kswwXYnMikXxlwI9YuW
 F22MKBxxeywnSbTvgAiXNjzis/Ud67xc5FzcR8RE0ACARy8beefHArhkiU39pb3crcpx
 lNORdQLRbfR81ZbsgXjqso37tfYTiShuNOIRHsCF48I85Vkd37yCsQ8jQ2ryu0X2gol8
 DnEA==
X-Gm-Message-State: APjAAAWXYSK8/GRrp4mgPEToG+S1TQ23JDONa+/bGuzp3jrkKoyZSbRT
 L9W8r28JxFwlmEElycbT9APKc7d7dyJwSN8IwRPdfQ==
X-Google-Smtp-Source: APXvYqyNXAq6nNsn9MmE6y5O/LjdJEBIfuNPjZaUyp9GKnMkhxnB7VfGHsToH8TlsqDqXKgSCIgDjZabfk2Ai7eg4Ms=
X-Received: by 2002:a6b:fb0f:: with SMTP id h15mr3834536iog.266.1562328922761; 
 Fri, 05 Jul 2019 05:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004c2416058c594b30@google.com>
 <24282.1562074644@warthog.procyon.org.uk>
 <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
In-Reply-To: <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 5 Jul 2019 14:15:11 +0200
Message-ID: <CACT4Y+YOFjyYeKv1M8QL8fHF+zuGKRJrTs78hSTxZ1hPjNR5JA@mail.gmail.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
To: David Howells <dhowells@redhat.com>
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: SpamAssassin version 3.4.2 on merlin.infradead.org summary:
 Content analysis details:   (-15.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:d43 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 0.0 T_PDS_NO_HELO_DNS      High profile HELO but no A record
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
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
Cc: netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-afs@lists.infradead.org,
 Eric Biggers <ebiggers@kernel.org>,
 syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, Jul 5, 2019 at 2:12 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com> wrote:
> >
> > I *think* the reproducer boils down to the attached, but I can't get syzkaller
> > to work and the attached sample does not cause the oops to occur.  Can you try
> > it in your environment?
> >
> > > The bug was bisected to:
> > >
> > > commit 46894a13599a977ac35411b536fb3e0b2feefa95
> > > Author: David Howells <dhowells@redhat.com>
> > > Date:   Thu Oct 4 08:32:28 2018 +0000
> > >
> > >     rxrpc: Use IPv4 addresses throught the IPv6
> >
> > This might not be the correct bisection point.  If you look at the attached
> > sample, you're mixing AF_INET and AF_INET6.  If you try AF_INET throughout,
> > that might get a different point.  On the other hand, since you've bound the
> > socket, the AF_INET6 passed to socket() should be ignored.
> >
> > David
> > ---
> > #include <stdio.h>
> > #include <stdlib.h>
> > #include <string.h>
> > #include <unistd.h>
> > #include <sys/socket.h>
> > #include <arpa/inet.h>
> > #include <linux/rxrpc.h>
> >
> > static const unsigned char inet4_addr[4] = {
> >         0xe0, 0x00, 0x00, 0x01
> > };
> >
> > int main(void)
> > {
> >         struct sockaddr_rxrpc srx;
> >         int fd;
> >
> >         memset(&srx, 0, sizeof(srx));
> >         srx.srx_family                  = AF_RXRPC;
> >         srx.srx_service                 = 0;
> >         srx.transport_type              = AF_INET;
> >         srx.transport_len               = sizeof(srx.transport.sin);
> >         srx.transport.sin.sin_family    = AF_INET;
> >         srx.transport.sin.sin_port      = htons(0x4e21);
> >         memcpy(&srx.transport.sin.sin_addr, inet4_addr, 4);
> >
> >         fd = socket(AF_RXRPC, SOCK_DGRAM, AF_INET6);
> >         if (fd == -1) {
> >                 perror("socket");
> >                 exit(1);
> >         }
> >
> >         if (bind(fd, (struct sockaddr *)&srx, sizeof(srx)) == -1) {
> >                 perror("bind");
> >                 exit(1);
> >         }
> >
> >         sleep(20);
> >
> >         // Whilst sleeping, hit with:
> >         // echo -e '\0\0\0\0\0\0\0\0' | ncat -4u --send-only 224.0.0.1 20001
> >
> >         return 0;
> > }
>
> Hi David,
>
> I can't re-reproduce it locally in qemu either. Though, syzbot managed
> to re-reproduce it reliably during bisection (maybe there is some
> difference in hardware and as the result the injected ethernet packet
> would need some different values). Let's try to ask it again to make
> sure:
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> master
>
> Re bisection, I don't know if there are some more subtle things as
> play (you are in the better position to judge that), but bisection log
> looks good, it tracked the target crash throughout and wasn't
> distracted by any unrelated bugs, etc. So I don't see any obvious
> reasons to not trust it.

FWIW here is a more complete translation of the syzkaller repro to C using:

$ syz-prog2c -prog /tmp/prog -threaded -collide -repeat=0 -procs=6
-sandbox=namespace -enable=tun,net_dev,net_reset,cgroups,close_fds
-tmpdir -segv

https://gist.githubusercontent.com/dvyukov/f712ca7c3a0d355ce63823d7882c2934/raw/7a72635b99e5a85599a6bcf9b7901fa9d8c494d4/repro.c

However, both syzbot and me won't able to repro with this C program,
so it is expected that it does not reproduce the crash for some
reason.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
