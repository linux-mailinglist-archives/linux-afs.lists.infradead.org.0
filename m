Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E23A468C
	for <lists+linux-afs@lfdr.de>; Sun,  1 Sep 2019 01:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=IWQhEBCYEe4H3rIbxr661QbMAnDfaEEpVJIFJZ/bL90=; b=V81oLAf/LVleYE
	qmA9Fvitsvv9M0YFd1xrcY1pZ98HpyyBL4p5rGNGH25JOa5G2+m8Lg50+pCZfgeYSs/mJsx10Ct6O
	Ns1JaethVCIc8AsD/xzicoDkGsFFAO0GI07pJHoBjKJ+u2mZkR4aXZF3MJfkZ8E/zwGeAyA+iGX6/
	d9EWt1jJj/xXtRRJkXgbsDeoEVrrH1t/8jNwqmC5P1Vp0UxhabP3i/z+Wy6PKSYeU9wakf0tgM2HB
	c4yD5/6WUcqnB4tnZia1OFKKG2WrblwSj8SVnEUb9riUDp49g6ztRm6rcv0fsbQVWKVHUHBEPCpWA
	DI4bM3u+QB+apsPaDpsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4Cmt-0008CP-Hv; Sat, 31 Aug 2019 23:28:07 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4Cmq-0008By-RS
 for linux-afs@lists.infradead.org; Sat, 31 Aug 2019 23:28:06 +0000
Received: by mail-io1-f72.google.com with SMTP id v16so13762554ioh.7
 for <linux-afs@lists.infradead.org>; Sat, 31 Aug 2019 16:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=DF0M02XSKSG9Ky5Dz+j/9n/5tv2umgn8yDW6MUegt08=;
 b=ViYnRh8aH4gCCNWy3JEH6QLfyt1YEXQe25IARZv/Yby4jZWz7FGjcUih9EYzzYtMwT
 Tpe6xdvZfq7QI/jOaBsdYnGtrb0JHO5skPSgXXfeU/j5vKPLj9DHRBqY+8y/YB8bS0sc
 gA84Rjdrazwo4gPdPy0HJhPZPhhH/KmOZws6OtEmzaY+n5zRX61ABnxo86UXbNYDTi7l
 r6A5jsPC0VhX3/4EF/eVQi+adZtxD/pRfS6WNfiBximykWs+LDiqTT/iwGzn3ANQa/Qt
 nQLP4yNzpwhYUPfagm01MPE9Nw8JJGh6mOrOd8bxqbD8Aa1ZApH+LRsBZV0XjkQgQLmf
 WgfA==
X-Gm-Message-State: APjAAAXhTj6TzDsxc4MR/vsnj/Wh1aYI/O9F+vuCHIcJiKN8sauCUMtP
 2WeJzfYTA8ZOx/BRnJx7f28XPp9mfda11z93y1rQOAZBNM67
X-Google-Smtp-Source: APXvYqxE+/QPd0YyE0CRJ7ZUYgbX8l8AKlELMS2qzspSJoXFaK8yVey/1Bn7C0LONcGhXNF7+6dkbIAQ/o2msjszjCFAtAcBAouU
MIME-Version: 1.0
X-Received: by 2002:a5e:c914:: with SMTP id z20mr6545534iol.272.1567294081178; 
 Sat, 31 Aug 2019 16:28:01 -0700 (PDT)
Date: Sat, 31 Aug 2019 16:28:01 -0700
In-Reply-To: <21753.1567081045@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f7a0b3059172166c@google.com>
Subject: Re: KASAN: use-after-free Read in rxrpc_put_peer
From: syzbot <syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com>
To: davem@davemloft.net, dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190831_162804_891753_41EF61D3 
X-CRM114-Status: UNSURE (   2.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com

Tested on:

commit:         48b9e92a rxrpc: Fix lack of conn cleanup when local endpoi..
git tree:        
git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=230542aa16bfc4b0
dashboard link: https://syzkaller.appspot.com/bug?extid=b9be979c55f2bea8ed30
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Note: testing is done by a robot and is best-effort only.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
