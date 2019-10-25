Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 28019EAF4F
	for <lists+linux-afs@lfdr.de>; Thu, 31 Oct 2019 12:56:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTmSk2Cd/J596TBdO6Lb/eJAJpjaAdj14kdq75mlCtE=; b=icIKDYwc3VcVjd
	07R2JJ+0iknF10RFAFqBEhOOFb9mfoYUenq81T8ruhsdGgXphDPWjI/S5DfrMXRcicSAaKJPoATgd
	5h7i0DhY1XUNrAPXa9PrCA05GZItBFBFN7a94biY33maS96TwDVlkBiEQKLUjvdm7hj23xcxH8sUS
	FYd7br9kgGOI5k+FaKgr/P9zRRZnUwgonbYkAYF257si5OMfoTPJSyAfjjludV/GyMmPxvs7Nw/Sx
	y/GCpNHitiKg5S07Dsv+ApIcd1GpssAjd0NrMiY3XgleLqyWFECJujyeTYD5P1qmOW3u3/5cWnUVE
	jLUBt2lKTwoYBUURoSyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ93q-0002sE-S2; Thu, 31 Oct 2019 11:56:18 +0000
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:12e:520::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNspH-0005oa-Oq
 for linux-afs@lists.infradead.org; Fri, 25 Oct 2019 06:11:57 +0000
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
 (envelope-from <fw@strlen.de>)
 id 1iNsp8-0000Se-02; Fri, 25 Oct 2019 08:11:46 +0200
Date: Fri, 25 Oct 2019 08:11:45 +0200
From: Florian Westphal <fw@strlen.de>
To: syzbot <syzbot+c7aabc9fe93e7f3637ba@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in nf_ct_deliver_cached_events
Message-ID: <20191025061145.GX25052@breakpoint.cc>
References: <00000000000074bc3105958042ef@google.com>
 <000000000000aecf020595b4762f@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000aecf020595b4762f@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_231155_807266_DC928245 
X-CRM114-Status: UNSURE (   5.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [2a0a:51c0:0:12e:520:0:0:1 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: netdev@vger.kernel.org, fw@strlen.de, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, dhowells@redhat.com, coreteam@netfilter.org,
 netfilter-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 kadlec@netfilter.org, davem@davemloft.net, pablo@netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

syzbot <syzbot+c7aabc9fe93e7f3637ba@syzkaller.appspotmail.com> wrote:
> syzbot has bisected this bug to:
> 
> commit 2341e0775747864b684abe8627f3d45b167f2940
> Author: David Howells <dhowells@redhat.com>
> Date:   Thu Jun 9 22:02:51 2016 +0000
> 
>     rxrpc: Simplify connect() implementation and simplify sendmsg() op
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12f869df600000

Looks like 5.2 and earlier crash with a different backtrace than
original.

Proposed patch for this netfilter splat is:
https://patchwork.ozlabs.org/patch/1181533/

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
