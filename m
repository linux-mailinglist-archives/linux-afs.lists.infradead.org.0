Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE5FEAF4D
	for <lists+linux-afs@lfdr.de>; Thu, 31 Oct 2019 12:56:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0KzmIB7awwpf84MFdlhDidZzleOXcjEgBaRUPASf65M=; b=K9uueWyr9MKlNa
	Wy+DbSbV4GdpHrBwfMxam4kFpwc9Fnkpn7Z917lo+G3WlCnaRIY1GDyx51fCPc2aOTDuYFNmufCSE
	fZKoYoLd4uW01JjXuftEqfvFMmArC3DliRIcJ707YUnUb4OiY4EDhxFL8cMrbx28MTkPkctgFFCa5
	FQpsXeW4mTZ+9hlrEs2OPpPxGV/T+46gP/aq7zRp1zJNxYqw1wd9Xs0EuPsLK9TgzGamxurnBNZzj
	R5uMiciM+/RC57wdH6ZtJJ7RLEVZdfjWbrRxQ1YMfQYQobvmrWmPO5Wibrzh59QkxhnEdKuz27LkH
	TLDTo32A4kL6uFHRMCYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ93q-0002r4-9p; Thu, 31 Oct 2019 11:56:18 +0000
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNr51-00080H-PX
 for linux-afs@lists.infradead.org; Fri, 25 Oct 2019 04:20:05 +0000
Received: by mail-il1-f198.google.com with SMTP id y7so1141382ilb.3
 for <linux-afs@lists.infradead.org>; Thu, 24 Oct 2019 21:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=NF2elsax11pXsnm+smX3VLKpwTuafbnzKYyInM/Zfhg=;
 b=j/Nblagt8V+/DILAVhSDVzmGgzyUIvd7RTijpDaMVsQ0nLDYJEdYW44F+4LsjKAsG4
 Ma+2bJW+1Xaaa/7pct/JyVDPvHzOMtQJfbN9GMXKkJHwHv45cF5iW3VPLlQEXRSVFN1j
 rzGAaO5zqTuwBZS2tbJQBwjApnq+v6KYu86QBxMOd1TuIyZHW4ebHNFihbUIGEaOdyJY
 uheOI1ERZSB0pIRn1rjqP94FpNt8lY/mbuWLM1Nce85MrtiyKJVqUhdwvGBLp5SeutXa
 MFc0CihmIlbuo0BHArgBD6AuEPkEeJqTf3IhpXJph/f+bKBS8Xf8expKCJXHYUuj2+fH
 M/hg==
X-Gm-Message-State: APjAAAUYcksMZaXiAUkTXWcaIgtZBFfhM6FFyFbGCcqP0b2F1jyiRd9N
 SAhFsPmuia8lyd1SXwMjqEDjbs2C+6zOa7s6OJTvdDmWmkAA
X-Google-Smtp-Source: APXvYqxBLtXLb+ZNhposnuPP5R6TbEk6pDsIDIYFbKqUpk/R085DA7b4q4kzLVLphPbJ9kNcvFRhZFz7kEFExK0XH5h0eLU1wAlT
MIME-Version: 1.0
X-Received: by 2002:a92:ccd0:: with SMTP id u16mr1924578ilq.296.1571977201370; 
 Thu, 24 Oct 2019 21:20:01 -0700 (PDT)
Date: Thu, 24 Oct 2019 21:20:01 -0700
In-Reply-To: <00000000000074bc3105958042ef@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000aecf020595b4762f@google.com>
Subject: Re: KASAN: use-after-free Read in nf_ct_deliver_cached_events
From: syzbot <syzbot+c7aabc9fe93e7f3637ba@syzkaller.appspotmail.com>
To: coreteam@netfilter.org, davem@davemloft.net, dhowells@redhat.com, 
 fw@strlen.de, kadlec@netfilter.org, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, pablo@netfilter.org, 
 syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_212003_834459_0D93920A 
X-CRM114-Status: UNSURE (   2.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 3.1 (+++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (3.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
X-Mailman-Approved-At: Thu, 31 Oct 2019 04:56:15 -0700
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

commit 2341e0775747864b684abe8627f3d45b167f2940
Author: David Howells <dhowells@redhat.com>
Date:   Thu Jun 9 22:02:51 2016 +0000

     rxrpc: Simplify connect() implementation and simplify sendmsg() op

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12f869df600000
start commit:   12d61c69 Add linux-next specific files for 20191024
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11f869df600000
console output: https://syzkaller.appspot.com/x/log.txt?x=16f869df600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=afb75fd8c9fd5ed8
dashboard link: https://syzkaller.appspot.com/bug?extid=c7aabc9fe93e7f3637ba
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10938e18e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147caa97600000

Reported-by: syzbot+c7aabc9fe93e7f3637ba@syzkaller.appspotmail.com
Fixes: 2341e0775747 ("rxrpc: Simplify connect() implementation and simplify  
sendmsg() op")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
