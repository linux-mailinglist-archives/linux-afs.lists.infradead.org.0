Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1119E8AAA8
	for <lists+linux-afs@lfdr.de>; Tue, 13 Aug 2019 00:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euO+MvhTfC5rHE3HQLXqLjjwHGNv5DhU4aiXKHFrxmA=; b=CoZcBjlFs8VVc+
	tSj1thQR+3nCWEg8EG4T2Eq+4n2eP9Oj2dJlPsT03vI70gZgYSRynDk7BuZHAlfO+h5deQ7PsTCB0
	kZUE4vzHoCSdyykwV00jmb0RFw3czZT4dBABKwqCG5QmebXk/LWTv7w5AzCdbefgn/VaHkRpvY2I8
	kHe4hRm5jn0NunNbq8YzhhX9IpW2iEcqx1uK3w0cpb5XXiLoulGEGOZO1M0mEaUzHPtzjgl0NIIjr
	ezljwBsEznQzXfzCXVE79YkGP8xrLlAXdb32DH6PcRQcn0mcbqOhj8pKAUxJORYs1G0ZHR49+bsLg
	KU/OKLcv3Adk3KJQL/bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxJ0n-0003kG-2O; Mon, 12 Aug 2019 22:41:57 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxJ0k-0003jy-Jj
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 22:41:55 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53A603003761;
 Mon, 12 Aug 2019 22:41:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 171541001B20;
 Mon, 12 Aug 2019 22:41:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <000000000000492086058fad2979@google.com>
References: <000000000000492086058fad2979@google.com>
To: syzbot <syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com>
Subject: Re: BUG: corrupted list in rxrpc_local_processor
MIME-Version: 1.0
Content-ID: <5013.1565649712.1@warthog.procyon.org.uk>
Date: Mon, 12 Aug 2019 23:41:52 +0100
Message-ID: <5014.1565649712@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 12 Aug 2019 22:41:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_154154_671827_30A12663 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
 dhowells@redhat.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git 03a62469fffcbd535d85e42ef25ba098262e9d72

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
