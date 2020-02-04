Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C3B151588
	for <lists+linux-afs@lfdr.de>; Tue,  4 Feb 2020 06:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=HSf2eiZFE5jCZqWg4RUVzljXF7YqRfxdYw1kTXP6gB4=; b=SKEOYmPVYj2I7O
	QwUQM8A1kkOObQsdOcMfz9nnCHkomioxWf84/GR/52U0j428yUPuGpbRXcY+CPfXGfsWsgwVgOMER
	e63fOWCot0Dq7loZ4/x29e8Tj/TpPM/tNkE9y6HvxNvMbLm0TMK8BpJovH8UXbyvAqEIlBZ8oMDbW
	SBfr0L0uWo30nvYe/sfzB15kyPmWa+NIzw3WaCaHbZXUumVBNzBuSfMgVFqnQlPUE7MOeUZFfUfEb
	WTXObxiUgvW6JMgPq7JMHfRSQHYnhFaewoj4xuZkPRdtYt+qVerFTVg4o/Eb0GZpS/6e8FLKctTXW
	HF7VIImiySoSzgad8f/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyqxQ-0001VP-CK; Tue, 04 Feb 2020 05:41:08 +0000
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyqxN-0001Ud-9D
 for linux-afs@lists.infradead.org; Tue, 04 Feb 2020 05:41:06 +0000
Received: by mail-il1-f198.google.com with SMTP id m18so14013116ill.7
 for <linux-afs@lists.infradead.org>; Mon, 03 Feb 2020 21:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=AM193aqkTInnm2sGLnq+KUrIMqtAH2ZiKkzgZdOGVwQ=;
 b=AoIyLv1Zlyxa69Jyx8tKYjmAeYdHT3mqZf+IK9GS9ckAWzerlZsIOFJ1kXqtL1Gk81
 WYhhPQfs0beCVmU8MGIskX9X69MLq4wCOsInhC8F3+f9l9tVYeZHgPlPWFOcgYFdKPD9
 Sk2zggV7qkbf2Cbkrt84wtYA7WGSby4RFMn49XMm4ssglkZiCJXqf3WYbRYuF7llp+Vj
 bZvl7dF1V/Z3yM8no8Cj8UC1uqzhlQX5J/IGCVb+zrxf7VxTTdDSOcsIuX3oO+gbKgJX
 ntafvcVc/DytR9sWn0gYuN9zCVdgwgXVknoJDNayZB5Wv5qykDKYWw9bcMn6z+yRf4HN
 IDiw==
X-Gm-Message-State: APjAAAX8tuR9c0AJcRBUqD32xuKSazo3wJGshv+WAu+S6qYq1mkKm0aq
 RyTG0sEtF/iqh2c4Hy8aQXvvaCLdzx18jnyqhaMB3Spb4hsM
X-Google-Smtp-Source: APXvYqwvRwRXAdFpSeJjYEpr6KHxHErox1HBAN2yNAGNRqLGQTC61VxpwWiTrg0QVCAeJf2FuqLD24CFactmGu/hKq+lNVtjl291
MIME-Version: 1.0
X-Received: by 2002:a6b:24b:: with SMTP id 72mr20523024ioc.63.1580794861893;
 Mon, 03 Feb 2020 21:41:01 -0800 (PST)
Date: Mon, 03 Feb 2020 21:41:01 -0800
In-Reply-To: <000000000000350337059db54167@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000034bde7059db97cf4@google.com>
Subject: Re: inconsistent lock state in rxrpc_put_client_conn
From: syzbot <syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, kuba@kernel.org, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_214105_324116_7117728F 
X-CRM114-Status: UNSURE (   3.32  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
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

commit 5273a191dca65a675dc0bcf3909e59c6933e2831
Author: David Howells <dhowells@redhat.com>
Date:   Thu Jan 30 21:50:36 2020 +0000

    rxrpc: Fix NULL pointer deref due to call->conn being cleared on disconnect

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1182314ee00000
start commit:   3d80c653 Merge tag 'rxrpc-fixes-20200203' of git://git.ker..
git tree:       net
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1382314ee00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1582314ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95b275782b150c86
dashboard link: https://syzkaller.appspot.com/bug?extid=3f1fd6b8cbf8702d134e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ac314ee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13ec4c5ee00000

Reported-by: syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com
Fixes: 5273a191dca6 ("rxrpc: Fix NULL pointer deref due to call->conn being cleared on disconnect")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
