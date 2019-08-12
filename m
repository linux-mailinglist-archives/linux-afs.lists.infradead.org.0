Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5ED8BA1A
	for <lists+linux-afs@lfdr.de>; Tue, 13 Aug 2019 15:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bejFHnshGNkf+49GQ31RQ4+FcRCcn2WJ09teW8p9V68=; b=sl+a2mvwqwZcNX
	6LFauPe3pRHs5qkVylQ0he+x9eObsr+1gN7hKwvw2Nhn15RpDYlcIDdL9o61h8ubQRID3nO2zp3WL
	U5qYr+Mejv2eoCi9yDp9ydTiT7QyWSKCCQrCrx/ok29ZoJfrApO0CwRvnqfwWphE3NyEdgyNSAPXu
	hnu0isAV4LYCySdiVSLgjOo4O/m8o7ftJbGHcXjsoSL8GwSiX6nzQ6Fag45FJufd2P4RjulQHrTWU
	Tmlf2p2LCX4WaI0C8m75fLDfXQyrNzP+B6F8HWKMfGptkkYSdLq0VpSpxwbn0lIrBxgH8NS+/piBW
	7y0KeUiHwNqTInhbkkew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxWoo-0002Ao-8K; Tue, 13 Aug 2019 13:26:30 +0000
Received: from mail-ot1-f70.google.com ([209.85.210.70])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxIrF-0000TY-1K
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 22:32:06 +0000
Received: by mail-ot1-f70.google.com with SMTP id k22so6604275otn.12
 for <linux-afs@lists.infradead.org>; Mon, 12 Aug 2019 15:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=64I6Vg7GG8+qFEb4faWzZMot279mVpkPc+JNG+pcnJo=;
 b=fsqQGdR/9Sc3Le3O4GVmfC6QBLczn/0hx95Td+maBXmU0FDzKyCVMMb7jyczpPNQbk
 sZ1167DTUKXZELD+8jPHIMZWkHEt6jedS3iJ6WwV1m4PQJ2H1laHUpX+DX+61AhdiNBY
 wveJtYiLnGFMcYESO5QuwYnFwHiH4uO8N2Udi30W76gCZn4RkjQmXQYxAsT2LvBbihgR
 kNMEc48dF3Fnyf8SP/j42JpzmGNkWTaomb2I9gdBvl1kjzoh8prO/Z9mWspoloo5hmHQ
 3upMQZyMEdE73PWXsRb2a7p2Y4kYPHelKbxLebC5ZWm2al8cfyvNc/WsZJuILck1w/4u
 T0Dg==
X-Gm-Message-State: APjAAAWG6uCJ3viHObM4e490wa+suiSWOQP1a6/VbVi47DUGA3zO4Hoq
 XNNb2aliGCm5zbZocCcs9UMrOzznpWAY/O0xnSRB5FLaYhf8
X-Google-Smtp-Source: APXvYqxooASJlXu0RjqkCDVSMGmPqhOI1O1zfvCN3iXdvSrbaT+4RNgiVLCziOWr2XABL3qA2ywAcxce+Zmu66HFfJhZMK10foWY
MIME-Version: 1.0
X-Received: by 2002:a5e:924d:: with SMTP id z13mr1743448iop.247.1565649120561; 
 Mon, 12 Aug 2019 15:32:00 -0700 (PDT)
Date: Mon, 12 Aug 2019 15:32:00 -0700
In-Reply-To: <000000000000492086058fad2979@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ac9048058ff3176e@google.com>
Subject: Re: BUG: corrupted list in rxrpc_local_processor
From: syzbot <syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com>
To: arvid.brodin@alten.se, davem@davemloft.net, dhowells@redhat.com, 
 dirk.vandermerwe@netronome.com, edumazet@google.com, 
 jakub.kicinski@netronome.com, jiri@mellanox.com, john.hurley@netronome.com, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, oss-drivers@netronome.com, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_153205_079969_01F470F5 
X-CRM114-Status: UNSURE (   2.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.70 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.70 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Tue, 13 Aug 2019 06:26:26 -0700
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

syzbot has bisected this bug to:

commit 427545b3046326cd7b4dbbd7869f08737df2ad2b
Author: Jakub Kicinski <jakub.kicinski@netronome.com>
Date:   Tue Jul 9 02:53:12 2019 +0000

     nfp: tls: count TSO segments separately for the TLS offload

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11d04eee600000
start commit:   125b7e09 net: tc35815: Explicitly check NET_IP_ALIGN is no..
git tree:       net
final crash:    https://syzkaller.appspot.com/x/report.txt?x=13d04eee600000
console output: https://syzkaller.appspot.com/x/log.txt?x=15d04eee600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4c9e9f08e9e8960
dashboard link: https://syzkaller.appspot.com/bug?extid=193e29e9387ea5837f1d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=159d4eba600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ba194a600000

Reported-by: syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com
Fixes: 427545b30463 ("nfp: tls: count TSO segments separately for the TLS  
offload")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
