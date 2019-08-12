Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E98A01D
	for <lists+linux-afs@lfdr.de>; Mon, 12 Aug 2019 15:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qj+rUs/naqgHz8tK5agx0w/lu9SJy1+RHIdg0QMWBdw=; b=G3Ylk7233xqf/8
	AKrNyVEpm0Ml0kxusHHzVZf/SWhyuDru4OQlP9v8NGg0lkISim0NTjRLx52voPaDFKPb+vmxfWtr8
	eWtOIEqLqvR485ADjQdPZPgI9xdf5dcVppCgB1hT8itZ2B4KhM0KomtmqL+qfsSHeYSeNmbCHSmB1
	9S8LpOoGoBYvntBHC1fKFSzOxKrDA+W94CDJ/odvR9jEewSGztC69124oCqLfbo6q6mSvFEjtu3wP
	0EG6F5PoJVaS3uQuVlyo92K3GCClklYcFbUUy+xrp+QuNKs3o6JhNtv7yhmyE9R5fhbenFGrWqkcJ
	wy/EiXpRtE0MeadQs/SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxAli-0007j3-UZ; Mon, 12 Aug 2019 13:53:51 +0000
Received: from www262.sakura.ne.jp ([202.181.97.72])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxAld-0007ZF-UW
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 13:53:47 +0000
Received: from fsav102.sakura.ne.jp (fsav102.sakura.ne.jp [27.133.134.229])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x7CDrKgt043710;
 Mon, 12 Aug 2019 22:53:20 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav102.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav102.sakura.ne.jp);
 Mon, 12 Aug 2019 22:53:20 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav102.sakura.ne.jp)
Received: from [192.168.1.8] (softbank126227201116.bbtec.net [126.227.201.116])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x7CDrJAq043707
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Mon, 12 Aug 2019 22:53:20 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Subject: Re: WARNING in aa_sock_msg_perm
To: syzbot <syzbot+cda1ac91660a61b51495@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, David Howells <dhowells@redhat.com>
References: <00000000000021eea2058feaaf82@google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <7e84e076-7096-028f-b49d-29160aea0831@I-love.SAKURA.ne.jp>
Date: Mon, 12 Aug 2019 22:53:19 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <00000000000021eea2058feaaf82@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_065346_272895_76D2C81D 
X-CRM114-Status: UNSURE (   5.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Cc: linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 2019/08/12 21:30, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    fcc32a21 liquidio: Use pcie_flr() instead of reimplementin..
> git tree:       net-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=11233726600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d4cf1ffb87d590d7
> dashboard link: https://syzkaller.appspot.com/bug?extid=cda1ac91660a61b51495
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

> ------------[ cut here ]------------
> AppArmor WARN aa_sock_msg_perm: ((!sock)):

This is not AppArmor's bug. LSM modules expect that "struct socket" is not NULL.
For some reason, peer->local->socket became NULL. Thus, suspecting rxrpc's bug.

>  rxrpc_send_keepalive+0x1ff/0x940 net/rxrpc/output.c:656

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
