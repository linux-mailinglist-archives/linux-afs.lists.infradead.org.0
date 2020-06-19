Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A52E0201DDE
	for <lists+linux-afs@lfdr.de>; Sat, 20 Jun 2020 00:13:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uiJ72Xs5IorwSMQcpOdT9yf9cwZzQIxwB+LaeEl5Vq4=; b=gV6j7WcPUecqpB
	gC443noVyk1xlJmOcQ3ZmT0XKWBXqvJOzbYKFOkW/ccL1Dn2vPDBBIpAWoRfbnyj5Ej5+i6CpcE3W
	s+n91j7dopbrEXRJ0sFnwRLgEykIkVB+UwK5yf9rWZOZbe9arJxbnQWTKAJbC6TEOuz8ngOdxAwHH
	0d6JTWT5lORLJJhFVDpzEVM5NLTl6WTgMgqqqSTEFWAKiGQrY34LTMZBulHvOBSZcCtlQSLRmQcYy
	h6b9rGvwOthGbxCtJ2TYNoPvFDPcnNUs2cIfElLbV7uj/s9gbZuKbhxGpdYm7qkY64skrgsBx4LCF
	6K6cxhfUExoMFLufUuwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmPFz-0001Wc-Kn; Fri, 19 Jun 2020 22:13:07 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmPFw-0001Uv-JJ
 for linux-afs@lists.infradead.org; Fri, 19 Jun 2020 22:13:05 +0000
Received: by mail-io1-f72.google.com with SMTP id a16so7857715iow.9
 for <linux-afs@lists.infradead.org>; Fri, 19 Jun 2020 15:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to:cc;
 bh=bDQBVe7l2yqt3mB06iVMiMUl/d4DebrpwMmTezaCnl8=;
 b=UiGWovv+hu7nDHC4heIMUwB6jMZ/act6paUOtXrvIoiIz0D6MtGxAYnMxluFWxIsHy
 siugIr6xFpFJhADL36LkEsnvASLtZN2lccLHFNnim9f6Uz3dGxvRVHSDQIE7N7cUmeMh
 dfHYVFzsiS6cQw/5uGpAXXzw+s4etIr46Oe69k0Y7scW8WSp31U4zX9whtyvZswSCC5E
 45egrI8L5wY69d7AzvJ3LFAT+myxjEeL+jiq76V4wj3fI24DJOvY6Mczehzlc8jiJ9bU
 UOUbHak9IsGzhuUbePfTI7n7u/CiSBWkq0FXEzaqEOtPmB2cErz8QwcrDGaXS1bfT82R
 r8KQ==
X-Gm-Message-State: AOAM533bqqJaTrMBKbt0ycQMGDE6J4bv6T75Dqq1l504h7AYS1l5EvYq
 08Tf7ER7tbUYdX/cGrmT8L6vk35qo+omPFhShGnRi4AxkKl3
X-Google-Smtp-Source: ABdhPJzjaETVaBpX1f0tHVMK3hsmWaEb1GQ3x0ua3YT2kGO5COxXB6fKHj4VZholdD5EaJS9f8p85/bf/O/linaN08vWq58XmZ7B
MIME-Version: 1.0
X-Received: by 2002:a02:cd89:: with SMTP id l9mr5712504jap.88.1592604782755;
 Fri, 19 Jun 2020 15:13:02 -0700 (PDT)
Date: Fri, 19 Jun 2020 15:13:02 -0700
In-Reply-To: <2214469.1592604774@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005805de05a87732bf@google.com>
Subject: Re: Re: net-next test error: KASAN: use-after-free Write in
 afs_wake_up_async_call
From: syzbot <syzbot+d3eccef36ddbd02713e9@syzkaller.appspotmail.com>
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_151304_640758_47C523C5 
X-CRM114-Status: UNSURE (   3.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git 559f5964f95ce6096ae0aa858eaee202500ab9ca

This crash does not have a reproducer. I cannot test it.

>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
