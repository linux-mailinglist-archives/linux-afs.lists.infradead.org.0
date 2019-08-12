Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 724998A54F
	for <lists+linux-afs@lfdr.de>; Mon, 12 Aug 2019 20:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WJxBEAmVfk9SI0/iIjXyeLJ343oyqjWk1J6ppom1afI=; b=PZ7+s5bR+wT8Mr
	wpIYBB/IWJ+LFEdeGtHYoZI5lCAyezFV/4YRRy9QCczx1wFqwQqxmHiWRN12j1j2gExMWD7dGk8fz
	H6cCiozTbLhVaOdPEk8lLaEz8UB2vCyQ3edMKMde6pQuxFW9sioyoeKJBrORMnCCLgToqaBuhyIdF
	7E8Iv27MZBKRazuJOA8lmodOMQJmB2zb5IkXA/g+kHzfNmPxNs9Q3LeW9Ntm4f0UVNT2aFZb5h157
	vN8SfKNRjDtC+tB1NYBQiCNXdqf3a74P1oPPL9dvqJRIa577cFdhePpu5hoWhAsl5XbMruAnj5YTe
	qz9ktskdBR3vD2WGfABg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxEhp-0006Yz-Lg; Mon, 12 Aug 2019 18:06:05 +0000
Received: from mail-ot1-f71.google.com ([209.85.210.71])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxEhm-0006XT-99
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 18:06:03 +0000
Received: by mail-ot1-f71.google.com with SMTP id q16so85921403otn.11
 for <linux-afs@lists.infradead.org>; Mon, 12 Aug 2019 11:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=iH/156rgMT4fJuQS0nAy3Ez5veVeDUxUwLRyEyTI9H8=;
 b=neg5Z/9GmgpWcgFs71ctBeW4AXQVztzomqn7Qha8BJvm+ZgOlqa/wBh5JzXDVwzYPu
 q2k+YUYI7fIEyjCTRYJB0cAeYE2CSt+/7m8nzQ64LD5fS+2ZPiNHr1g8CYiFqb/SbNC1
 dA/T97UU3kkCIVkAB61n9iadTDGD8kmFDD4I41rnmR9Lzu4XdH6xJ0nZS7Bl7I2huJwx
 VZ3mgNeEOEd/OoMCQkTa8JdZV834RZ/wEi76VWluzmFvPhVwm1V+hIGWnosKZoXcJH6X
 VzQXoqJVmOQEVQ8h14CCCZe/xwty6DkR1Ohgfw6Mtf5YtiKtZIzErmw9OqMFDqXLnV/s
 jgnQ==
X-Gm-Message-State: APjAAAV4kR6PQKvNmQP9FxhQDXHjaowWXQuOgT2QdK+UZAjRv6dlhrqI
 RZD/P/aRYySuUlMqRcKfKqF7YshGvWRR2S840w6Md9IirdzM
X-Google-Smtp-Source: APXvYqwuMjKnkHlImBDK/Uqqq5JTnDh9EQ7P5bcsypbrgVf6mLj8vhU+JGvuhxpJikQONeVKnmVPfbXgiZemqDb4ZclS/LuIRawB
MIME-Version: 1.0
X-Received: by 2002:a5d:860e:: with SMTP id f14mr25026723iol.242.1565633161044; 
 Mon, 12 Aug 2019 11:06:01 -0700 (PDT)
Date: Mon, 12 Aug 2019 11:06:01 -0700
In-Reply-To: <0000000000007593f4058fea60d8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000069a89f058fef604a@google.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_queue_local
From: syzbot <syzbot+78e71c5bab4f76a6a719@syzkaller.appspotmail.com>
To: arvid.brodin@alten.se, davem@davemloft.net, dhowells@redhat.com, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 xiyou.wangcong@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_110602_322248_012ACD80 
X-CRM114-Status: UNSURE (   2.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.71 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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

commit b9a1e627405d68d475a3c1f35e685ccfb5bbe668
Author: Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu Jul 4 00:21:13 2019 +0000

     hsr: implement dellink to clean up resources

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10b4ebce600000
start commit:   125b7e09 net: tc35815: Explicitly check NET_IP_ALIGN is no..
git tree:       net
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12b4ebce600000
console output: https://syzkaller.appspot.com/x/log.txt?x=14b4ebce600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4c9e9f08e9e8960
dashboard link: https://syzkaller.appspot.com/bug?extid=78e71c5bab4f76a6a719
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165ec172600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=119d4eba600000

Reported-by: syzbot+78e71c5bab4f76a6a719@syzkaller.appspotmail.com
Fixes: b9a1e627405d ("hsr: implement dellink to clean up resources")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
