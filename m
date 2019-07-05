Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 507826070E
	for <lists+linux-afs@lfdr.de>; Fri,  5 Jul 2019 16:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGF0xahwc/YW9jMpnn80gqt9s1hXPdGr0zw3zmU8HJU=; b=noq49um+YuGeJW
	6LAv24rn9Kdb0Iv4bjJtBGEMjlQ7vgMPa6o7OTyfjVBJymea1UJn0df3tabIDm2OXNM/y3dUvCLLI
	eSnZqbAc3lLdpbnh3GtOhEBuithm8SURfZt6fYZ+8JTsM/Fd+n/SImbHLIP0FKu9gjPf01tjr0VSR
	CPgFNU9PJ2GERdFywG8q/h1YyVsBOoHvKg4DRVbuxkauDWbjXuVRXAcl60/k3M0wGDPYr5ZLziFCr
	qNIzH6lfUZ1CVpDmVCTs6OGXODHYMs6Hjby/u77HgMEjhh3JUxPtJcPIoPibkxg8knW9j2121o9NP
	s7FjCtpG48hNKJN7Tf6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjOlT-0004ow-JJ; Fri, 05 Jul 2019 14:00:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjOfT-0004ct-MM
 for linux-afs@bombadil.infradead.org; Fri, 05 Jul 2019 13:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZjSi1phh9bs9cO7L1xnR1XrPIATfNuDiH5azONYl06E=; b=Yu82eCynPpv6aEjjRlPRwb0bQ
 YAFMZwLSrYoqkHfuB8q6LUfHsDel3cB0LkBGgCfr6QyHlGwZOOHo10envIvnajgLs9y7Ma1nc5v5p
 2+pDv15KCL6lQyHuv8la/qvWB8yDRYOP8A5T/M3V+Xy2dPLeIaEIDL370v6WiAoJPFbHadivJq2qP
 AHXjApaVQkrpyDwh1dC8R03p+iT1O/fyRbA+WutyNlnPuhdpCeONVW5Qjfz6E9++J10JShLX0fxq3
 zpOkGETqp++CocSq1pJ5YMhHBNsC+n0aLJ104Gv6jsqdgmpRiw0dXcqAO3tFytbJyZwF17MFN0BS3
 ++7RSYO1Q==;
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjN7P-00016B-N5
 for linux-afs@lists.infradead.org; Fri, 05 Jul 2019 12:15:13 +0000
Received: by mail-io1-xd43.google.com with SMTP id k8so18751013iot.1
 for <linux-afs@lists.infradead.org>; Fri, 05 Jul 2019 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjSi1phh9bs9cO7L1xnR1XrPIATfNuDiH5azONYl06E=;
 b=paysDx96hoCWePm5oMMcsaQJqv9GUq2HdAxau0cn7Ksk6cmgX/E/PlM5wdfq5dRaA0
 ZqfcyHQ2vyGLupa/17Bi628ZopXct62bX+iu86AaaOSDWPB/eCU7I4pgc0pcEAFbZsme
 9MaeRHSIqr4CSKAdIBG0a1ARSdeKfhKCMgejPLo7sfBYsywQ+OlqtkK3IbyRCI6hrcX1
 cQTHU7JFEA2LX6BzxxnD00D2n6KC6CuXMACz8oPaLF9i5f6vQAww+HkeYI/SosdEfErW
 Vv0CMPvxnRXwC8pMxyNZBRGISsqrOM2cgnoMEU8AQld0WjodU460hcpGJVlGx3fL+AR+
 QaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjSi1phh9bs9cO7L1xnR1XrPIATfNuDiH5azONYl06E=;
 b=nZ2ypWL3ODsCun4HFFE36Li/R/z6ATWnUGFX5/bQly1JkPCrImQKbFPNnrT8bYrdZu
 0KvtHNiX9yRHbNQ4NyQFmVp96XuInsuljP0pY4j3sahkURdGLAKK+aTwPesFhhDbx4nc
 BfxGOvoADoo48Fl8MR8xkPzypR2legoystnNoRGClDz0qJTKcTlpz/0+Q4MnjH0xQpkE
 AakVKr9XHuet4lisEpRhhusQz8SPSNzEK1KaB1aJjvOutTvMqRBhc5c7ax5yQ1NDkXsC
 McNy372uy9iLg+b4TPOEN8yMHXryjt5/aBAS6bBdepMfjn2XhqZVcFGaCTYVsv2U4xC4
 dhHQ==
X-Gm-Message-State: APjAAAXqHDj9Rz/mjCJGc6Vlk2AkOwLgvzGE+rjDGzyVHbxKnLrRQyOL
 gr9Z1hMYonpzveP/Rnw8tdLmV5wMKhJSkcbr4p5XHg==
X-Google-Smtp-Source: APXvYqz7ZT1v+Nqu10I2/ufgDaj6I6GvF4VP462R+l2op+FhKm5UWHNcYFV/bqFT/3p6G+nQ9qnf4pMo9wkiq6tiTNg=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr4012381jao.82.1562328780417;
 Fri, 05 Jul 2019 05:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004c2416058c594b30@google.com>
 <24282.1562074644@warthog.procyon.org.uk>
In-Reply-To: <24282.1562074644@warthog.procyon.org.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 5 Jul 2019 14:12:48 +0200
Message-ID: <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190705_131511_782962_933F12BA 
X-CRM114-Status: GOOD (  21.13  )
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: SpamAssassin version 3.4.2 on casper.infradead.org summary:
 Content analysis details:   (-15.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:d43 listed in]
 [list.dnswl.org]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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

,On Tue, Jul 2, 2019 at 3:37 PM David Howells <dhowells@redhat.com> wrote:
>
> syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com> wrote:
>
> I *think* the reproducer boils down to the attached, but I can't get syzkaller
> to work and the attached sample does not cause the oops to occur.  Can you try
> it in your environment?
>
> > The bug was bisected to:
> >
> > commit 46894a13599a977ac35411b536fb3e0b2feefa95
> > Author: David Howells <dhowells@redhat.com>
> > Date:   Thu Oct 4 08:32:28 2018 +0000
> >
> >     rxrpc: Use IPv4 addresses throught the IPv6
>
> This might not be the correct bisection point.  If you look at the attached
> sample, you're mixing AF_INET and AF_INET6.  If you try AF_INET throughout,
> that might get a different point.  On the other hand, since you've bound the
> socket, the AF_INET6 passed to socket() should be ignored.
>
> David
> ---
> #include <stdio.h>
> #include <stdlib.h>
> #include <string.h>
> #include <unistd.h>
> #include <sys/socket.h>
> #include <arpa/inet.h>
> #include <linux/rxrpc.h>
>
> static const unsigned char inet4_addr[4] = {
>         0xe0, 0x00, 0x00, 0x01
> };
>
> int main(void)
> {
>         struct sockaddr_rxrpc srx;
>         int fd;
>
>         memset(&srx, 0, sizeof(srx));
>         srx.srx_family                  = AF_RXRPC;
>         srx.srx_service                 = 0;
>         srx.transport_type              = AF_INET;
>         srx.transport_len               = sizeof(srx.transport.sin);
>         srx.transport.sin.sin_family    = AF_INET;
>         srx.transport.sin.sin_port      = htons(0x4e21);
>         memcpy(&srx.transport.sin.sin_addr, inet4_addr, 4);
>
>         fd = socket(AF_RXRPC, SOCK_DGRAM, AF_INET6);
>         if (fd == -1) {
>                 perror("socket");
>                 exit(1);
>         }
>
>         if (bind(fd, (struct sockaddr *)&srx, sizeof(srx)) == -1) {
>                 perror("bind");
>                 exit(1);
>         }
>
>         sleep(20);
>
>         // Whilst sleeping, hit with:
>         // echo -e '\0\0\0\0\0\0\0\0' | ncat -4u --send-only 224.0.0.1 20001
>
>         return 0;
> }

Hi David,

I can't re-reproduce it locally in qemu either. Though, syzbot managed
to re-reproduce it reliably during bisection (maybe there is some
difference in hardware and as the result the injected ethernet packet
would need some different values). Let's try to ask it again to make
sure:
#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

Re bisection, I don't know if there are some more subtle things as
play (you are in the better position to judge that), but bisection log
looks good, it tracked the target crash throughout and wasn't
distracted by any unrelated bugs, etc. So I don't see any obvious
reasons to not trust it.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
