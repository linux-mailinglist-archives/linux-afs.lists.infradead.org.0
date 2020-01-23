Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8C14A5A2
	for <lists+linux-afs@lfdr.de>; Mon, 27 Jan 2020 15:03:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rzYCks4Vr1zzHlsF+1aTf2vJKIxE550uvfTe3EmocWU=; b=iBZJ7YNFez4aK4
	ozqi5DGHWzmo3UKGmaYYGikWH/GuWmic2Th+E23iuv87b7IzzDcU46QrkvrrIDyyUdPCa13kMq3EB
	c4B9kFIIb98Ukj3X3igDaCAldXc/KNq7zouumbt6XfiFzWiN85E1UHsLQf6NHnRD0UdB8JCF2Xgoa
	jcqUsF0VQP61Ah9EVPXdJZpwfbbVI2smmBBl4t8bO0hmt3RAqATuQrPNf0E2om1ZktljATL9Gd7U0
	RdolX9q1OA3h+a0rDfuHRU2ha04zHOvHXILGc2t3L2HfJ2L0ok/x3IYYpGEwJHBXoMUC3VrgGCUDt
	phza9K9UkHWwzocJ7ncg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw4yo-0006ih-8j; Mon, 27 Jan 2020 14:03:06 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iukrU-0007TN-VC
 for linux-afs@lists.infradead.org; Thu, 23 Jan 2020 22:22:06 +0000
Received: by mail-io1-f71.google.com with SMTP id t12so45010iog.12
 for <linux-afs@lists.infradead.org>; Thu, 23 Jan 2020 14:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=U2ciZII89LyEb1jgPxE5/IJrQKEwwRWzV2RXknpTZh0=;
 b=FCuHs4RPSqeBh+OX9pyhcl3NimyhAy0UVU8rULpY3/WPkNYoSPEIAsZGT2thuBVump
 uNagFOKX7P8N9CVexdDMltDC+QuzaVUDmi2WgDYqwcbP8JyIiOJZT7Z4/71kYNebp5K/
 mU3bxwDvh0esd9u1SA3AKBT8AWeOuhTE2N0f0POskJ76528TWxCZE2vObP3oy8VixVAr
 PX8GMdWzmY8A1SalF7BjD+5SOAvvCU3uqZDbqrvbhgfx+t9Y3Q8yEUHT3VDGc237JQtZ
 muKYuG57ZlPxBCK49EBGi1bqX/bAS5FGniVsi/ST81YrrUij1o1r3gPd7imSL7RPsMg1
 3cgA==
X-Gm-Message-State: APjAAAUgQ/zT45rwCO7X946lssR9aFnpWhywNO7SliQRNeBxsdQoWb7D
 X6kLbfeZoSyV/evQySvULV1hMfL92UK1EdRsC5Jhqnlp66Gv
X-Google-Smtp-Source: APXvYqzaQsx9AEgaVI+glQ1AcIBsAAutP1ZctuK9ZTtYuJ4mdcopjSrfR25SqY6ZJWnqbTQIJlRs2yTGajrbtyPIUwun6yUoBqiI
MIME-Version: 1.0
X-Received: by 2002:a02:8587:: with SMTP id d7mr59180jai.39.1579818122597;
 Thu, 23 Jan 2020 14:22:02 -0800 (PST)
Date: Thu, 23 Jan 2020 14:22:02 -0800
In-Reply-To: <000000000000da7a79059caf2656@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000001df94059cd612b2@google.com>
Subject: Re: WARNING in __proc_create (2)
From: syzbot <syzbot+b904ba7c947a37b4b291@syzkaller.appspotmail.com>
To: a@unstable.cc, b.a.t.m.a.n@lists.open-mesh.org, dan.carpenter@oracle.com, 
 davem@davemloft.net, dhowells@redhat.com, info@drgreenstore.com, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 mareklindner@neomailbox.ch, netdev@vger.kernel.org, sw@simonwunderlich.de, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_142205_024511_B1A26530 
X-CRM114-Status: UNSURE (   2.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Mon, 27 Jan 2020 06:03:04 -0800
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

syzbot has bisected this bug to:

commit f4b3526d83c40dd8bf5948b9d7a1b2c340f0dcc8
Author: David Howells <dhowells@redhat.com>
Date:   Thu Nov 2 15:27:48 2017 +0000

    afs: Connect up the CB.ProbeUuid

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1627a721e00000
start commit:   d96d875e Merge tag 'fixes_for_v5.5-rc8' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1527a721e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1127a721e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=83c00afca9cf5153
dashboard link: https://syzkaller.appspot.com/bug?extid=b904ba7c947a37b4b291
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c96185e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14f859c9e00000

Reported-by: syzbot+b904ba7c947a37b4b291@syzkaller.appspotmail.com
Fixes: f4b3526d83c4 ("afs: Connect up the CB.ProbeUuid")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
