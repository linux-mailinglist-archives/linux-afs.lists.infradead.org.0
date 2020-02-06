Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC0A153C9E
	for <lists+linux-afs@lfdr.de>; Thu,  6 Feb 2020 02:29:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XqvhtX5vge5UVVVNPY9aAF85XDlU5Uz7nkt/t7OLGlY=; b=b94lYsfqivAee+
	HjkGRbGmElXwozuLdbijYXJBN1C3LVHOtGzjI1Ad4T4McjFNFcpEvaHe8l5Q92z2hMuqM73mlyi+J
	+SgCWsm210+9R8nBEtEMwP2dPO9djWTeYRoq5aACuQPppSaChu0TC9+6bYAjFmCL7zPhcsPtyKfCq
	v3vnFAcGIthoIOTS1bLvGTELGi+Gy38b7bgW7zBoXmOFQqJr8SfDa0lUj4tipJ6acncVqBFlaSFJW
	bfnfaIvISgDMyZ01r4ldyuSxA7oS+m7366EICHgux/R5sznsvA432NylhqKUkyvOZ5l4SBIKjvIDl
	cOPskmefrXL9lcE84PHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izVyf-0001Ai-5W; Thu, 06 Feb 2020 01:29:09 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izVyb-00019v-7D
 for linux-afs@lists.infradead.org; Thu, 06 Feb 2020 01:29:07 +0000
Received: by mail-il1-f199.google.com with SMTP id t4so3100434ili.21
 for <linux-afs@lists.infradead.org>; Wed, 05 Feb 2020 17:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=klRVBdr46Gl8WIF/3JqDp9paxXMagfLFmZ3zT/aOfAA=;
 b=MlneMMEUkDh0dQg7xNJKdu2aDs+SjqHtjhaK094TE92XRBMIZrIvImf1TBAisfj8i2
 zS6uxbsSEqM5n8kPkUCf2NiISioqUSUEU1QR3Vo5YRExrJXG1u5aiEEs4njBHqTpI8H0
 eOXBtrzmawLmL+KY1epxqOP7fn5yP518HR+MxJM2WYeAORMhI1RhzFfxMtOkhkqmxIsj
 qPcb3L8ixwIlCeLND1uZSO6p9KVt59U7fXwhaVEFjBAZHC5+cgHUQ668gce1pxp9DVxd
 GR2v/YGCarsNs3CSDxNd+ndxskBSbVwB0Qch3xo9hOPwf/lyhKE+KzaCCTqznPyhx6Xi
 sYUA==
X-Gm-Message-State: APjAAAVBLMXBCnhlh9dwqG/FNoKXP42xDu+hpnU6e5SEwVV1Nb3yAeCt
 c3ly2dAtsCVXeST3GM+J2HcB7Chctk8sFfDgGQPZUkeiyQRg
X-Google-Smtp-Source: APXvYqyWzNDAJ3ZpISUwsx17tVrhy9Z/G8ZUJfNIMmI6YX1SRk5jCpKRGWJGMzRGbI8uNNHSqXoSH+2xK2x4wJjiLsGtYiFdEy2t
MIME-Version: 1.0
X-Received: by 2002:a92:1bd9:: with SMTP id f86mr1114630ill.18.1580952541990; 
 Wed, 05 Feb 2020 17:29:01 -0800 (PST)
Date: Wed, 05 Feb 2020 17:29:01 -0800
In-Reply-To: <000000000000f0baeb059db8b055@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ac1561059dde321a@google.com>
Subject: Re: inconsistent lock state in rxrpc_put_client_connection_id
From: syzbot <syzbot+d82f3ac8d87e7ccbb2c9@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, kuba@kernel.org, 
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_172905_259723_3B1FA6DF 
X-CRM114-Status: UNSURE (   2.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=173d9dbee00000
start commit:   6992ca0d Merge branch 'parisc-5.6-1' of git://git.kernel.o..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=14bd9dbee00000
console output: https://syzkaller.appspot.com/x/log.txt?x=10bd9dbee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f22d38d7f9a488a8
dashboard link: https://syzkaller.appspot.com/bug?extid=d82f3ac8d87e7ccbb2c9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14317dbee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145a44f6e00000

Reported-by: syzbot+d82f3ac8d87e7ccbb2c9@syzkaller.appspotmail.com
Fixes: 5273a191dca6 ("rxrpc: Fix NULL pointer deref due to call->conn being cleared on disconnect")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
