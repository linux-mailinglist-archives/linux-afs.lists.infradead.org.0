Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F2A92803
	for <lists+linux-afs@lfdr.de>; Mon, 19 Aug 2019 17:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R5NzsEPGY6hpsaE7Fotc1hDXbez7J5+ZQ/RhBRU664=; b=p8dGNjtYffcbdB
	R2cyWFY0Wte+NMv1sTcXnue6m4tZm57g67MrDLPx5jzh7gc4CZ19b42HyO3EAAWRaIqcs5P0Dt3FL
	QRP/YyVE++0cDrNPLA8qizr1dx+KXQgyZb8yxmqhAdhHzqo8iFK3msDfkXdMMvQ4WRGtGsKGf8XJn
	rpiMpleitJb6DZsUWQiBAlD7eL72DNSMH9084Ax7C/3tZnch92Ldc1KenmWERGzWvChuPJ4peFtdb
	TMImAWxFZROIBcbja/s7tgg+zHF8GTaJotXTKeK9kRnr02N4/okcHSgOuWYdStDFNizerKnqoEWqV
	Ol5EmI7oplHj3Tq2lQpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzjHG-0000vj-KH; Mon, 19 Aug 2019 15:08:58 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzcwT-0003vK-RZ
 for linux-afs@lists.infradead.org; Mon, 19 Aug 2019 08:23:07 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49A39195C2E8;
 Mon, 19 Aug 2019 08:23:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24DF8104B4ED;
 Mon, 19 Aug 2019 08:23:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190819071101.5796-1-hdanton@sina.com>
References: <20190819071101.5796-1-hdanton@sina.com> 
To: Hillf Danton <hdanton@sina.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
MIME-Version: 1.0
Content-ID: <21981.1566202980.1@warthog.procyon.org.uk>
Date: Mon, 19 Aug 2019 09:23:00 +0100
Message-ID: <21982.1566202980@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Mon, 19 Aug 2019 08:23:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_012305_914369_99869AE0 
X-CRM114-Status: UNSURE (   9.97  )
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
X-Mailman-Approved-At: Mon, 19 Aug 2019 08:08:56 -0700
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
Cc: ebiggers@kernel.org, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, dhowells@redhat.com,
 syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com>,
 davem@davemloft.net, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Hillf,

There are some commits in net/master that ought to fix this and conflict with
your longer patch:

	730c5fd42c1e3652a065448fd235cb9fafb2bd10
	rxrpc: Fix local endpoint refcounting

	68553f1a6f746bf860bce3eb42d78c26a717d9c0
	rxrpc: Fix local refcounting

	b00df840fb4004b7087940ac5f68801562d0d2de
	rxrpc: Fix local endpoint replacement

	06d9532fa6b34f12a6d75711162d47c17c1add72
	rxrpc: Fix read-after-free in rxrpc_queue_local()

After the first one, you should never see local->usage == 0 in
rxrpc_input_packet() as the UDP socket gets closed before the refcount is
reduced to 0 (there's now a second "usage" count that counts how many times
the local endpoint is in use and local->usage is the refcount for the struct
itself).

Thanks,
David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
