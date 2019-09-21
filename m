Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED015B9F39
	for <lists+linux-afs@lfdr.de>; Sat, 21 Sep 2019 19:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TV2RI0VrhQH024cC/5a5z2iFHp+aLv9ZSVxRvqhkmyM=; b=ujGCD0J5UacPPK
	IijcQ+XQeFHsN7qJrG7GeI//uecnL+Oj5zmrgQBWD1IiM58gFDi5iZexVJn+JqFRs8rAbw0YQiwaL
	XEf77wmXc8uTSpfjFAdlQ/8z6DJhqn45slurC2RlLmUOlpjxVXgg6Ye1dp2D06G8D9QQBwA3qtphj
	4Ff3qq8VgVDmwxn33AknzTj7JSO71s0spwF5oCCLz3uUkItlnTHZPPWKWp7HAKDyU1kRDF2QFCrd7
	ShDaXrAgoFxp85QkTcrr3yT/KdjeHUKloDgAFKwdkrvQzfx4WQQbQATttZiuVjqZCOcv04etuzULf
	vNuP/BvQG9SXCxOn8hmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBjNc-0007KG-LE; Sat, 21 Sep 2019 17:41:08 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBjNY-0007J0-U9
 for linux-afs@lists.infradead.org; Sat, 21 Sep 2019 17:41:06 +0000
Received: by mail-io1-f72.google.com with SMTP id l21so16121691iob.20
 for <linux-afs@lists.infradead.org>; Sat, 21 Sep 2019 10:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=Vou0Mi/j/M2Ma5Ajew5/N8RpeWCXouricDj+EREdNZY=;
 b=reeOQGpU+UOuoiCSCEW0sQ3qBBUkcPjYFA/8Q7XrSp6D4JmQaVcxXlsRYj2UVTBNJd
 6ubSOM+l7ICkglJ/558WtIDltjFsvkG4ud0LPwKMUkAoVLYh1DjS/BaoHdVYoHsyGprW
 gVNbtyzySukd4QB9Th3iRuTV6MQYPOcSTqYWlu/dxlt73g3c1FdF5a2Qx1HxxskJorBO
 w1mg/lMurXoOfViDTD6PaFrLF7l7rXX7R0Wz4azt2+jqpSZkFvr8iWNyvqmrEKAbEW2S
 Xk8AncUVNDIESAsgFDx/innpahW76f0lI9g9O+lybSjVQ42ZTvbtSiNwjdtyfGTjVwke
 1cYA==
X-Gm-Message-State: APjAAAVd6n2VTjPd4U88YgPGcK166EAG0NJkmQW/rw/2PqiQ6wMsBfy4
 0DqwNos9XIZ8RUGMIA38xkkIi3svdUCNpjBnG4we0WlP8BL/
X-Google-Smtp-Source: APXvYqyr/QnaH7gCOgIYf0MJcv1TUeTtRpr75v8rwd0Su2cX1DH7UXwxXu2hOzyHWLdGdlgaclDhr2teY+qtZB+BASzqQhvSpW0K
MIME-Version: 1.0
X-Received: by 2002:a6b:ec07:: with SMTP id c7mr4441481ioh.84.1569087661223;
 Sat, 21 Sep 2019 10:41:01 -0700 (PDT)
Date: Sat, 21 Sep 2019 10:41:01 -0700
In-Reply-To: <000000000000727bd10590c9cf6c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab325a059313b071@google.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_release_call
From: syzbot <syzbot+eed305768ece6682bb7f@syzkaller.appspotmail.com>
To: MAILER_DAEMON@email.uscc.net, davem@davemloft.net, dhowells@redhat.com, 
 hdanton@sina.com, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_104104_974582_448DB57D 
X-CRM114-Status: UNSURE (   2.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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

commit 2baec2c3f854d1f79c7bb28386484e144e864a14
Author: David Howells <dhowells@redhat.com>
Date:   Wed May 24 16:02:32 2017 +0000

     rxrpc: Support network namespacing

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16240b09600000
start commit:   f97c81dc Merge tag 'armsoc-late' of git://git.kernel.org/p..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=15240b09600000
console output: https://syzkaller.appspot.com/x/log.txt?x=11240b09600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61f948934213449f
dashboard link: https://syzkaller.appspot.com/bug?extid=eed305768ece6682bb7f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16cf8ea1600000

Reported-by: syzbot+eed305768ece6682bb7f@syzkaller.appspotmail.com
Fixes: 2baec2c3f854 ("rxrpc: Support network namespacing")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
