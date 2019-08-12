Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 777078AA19
	for <lists+linux-afs@lfdr.de>; Tue, 13 Aug 2019 00:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y6iPz3IF8sYl8DZ4OTuTGmG8/OLy7Z/B9Fuh8i/lqw=; b=fuEzsvRSANP1H9
	9OVhFm4OV5qQQjRmSgZAiXQI47PY+LRe3x57iF5lCRvAuH18b1fOJOdUtShmUmXXM9lEvSgDG9BJi
	BMA3FyClJEbnuJWLV9o+uKAlyMrzBJRZIBglF9W0rHrCQ23SwQuHU0FFbwAf928Pdhg2Omkqc5SxR
	3vzjhUVxhjNFqXgXVR5ZX15LwQXaa8+S8uAhXJ0/F99TYZ8EKuYX9+yDgG+zxT9qYv+lG4mqUq+dn
	ZuSBx7yG4dtZuKWY7o1IjOHn/eW3T3V4WGzF5t5pUfBccURwvMeLkLqRkDyx0cdwSDozlBjuG2ZnI
	As3HUf5nr81+8pxT6GCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxIMb-0007va-FJ; Mon, 12 Aug 2019 22:00:25 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxIMX-0007ug-HK
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 22:00:23 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DE9C730FB8FC;
 Mon, 12 Aug 2019 22:00:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B4826A225;
 Mon, 12 Aug 2019 22:00:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <7e84e076-7096-028f-b49d-29160aea0831@I-love.SAKURA.ne.jp>
References: <7e84e076-7096-028f-b49d-29160aea0831@I-love.SAKURA.ne.jp>
 <00000000000021eea2058feaaf82@google.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: Re: WARNING in aa_sock_msg_perm
MIME-Version: 1.0
Content-ID: <18090.1565647215.1@warthog.procyon.org.uk>
Date: Mon, 12 Aug 2019 23:00:15 +0100
Message-ID: <18091.1565647215@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 12 Aug 2019 22:00:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_150021_784225_98EECB47 
X-CRM114-Status: UNSURE (   9.28  )
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
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 syzbot <syzbot+cda1ac91660a61b51495@syzkaller.appspotmail.com>,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:

> This is not AppArmor's bug. LSM modules expect that "struct socket" is not
> NULL.  For some reason, peer->local->socket became NULL. Thus, suspecting
> rxrpc's bug.
> 
> >  rxrpc_send_keepalive+0x1ff/0x940 net/rxrpc/output.c:656

I agree.  There's a further refcounting bug in the local object handling, but
it's proving annoyingly difficult to reliably reproduce.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
