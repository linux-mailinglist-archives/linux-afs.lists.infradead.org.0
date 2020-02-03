Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D773E15043E
	for <lists+linux-afs@lfdr.de>; Mon,  3 Feb 2020 11:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PFfnBkHDCpp8UaU+0lKoY+KRFvrT7HiSTVeaxiuz18A=; b=Z0Or8kt85vi+to
	C0kRjeKytfMeN4u2W+0hshfqAlNloAGjsIuYQkJV2D7OIwkp5BvWDgwAIZvxPSFilFnMNzJVyrxLP
	b+oPIuSb+yQmsXKkkUdY4xGqnh5y02T2TZcApRSmTCaa2NJfcvI+FINkFwWVpv1XKajR4wxoUG5l6
	mTNyuUY1UNB4yFV2ziY+yuqfajw0/o8U8AaIkd+pj+HLvOA3QV4u7kP2aQO338GD9FEQr9BUG5Hi2
	CAP2/B5LPKGNzV1akz+gvWBdL8GNVGtyBxaTctuIB6Fb08WWH9iH7UWNUuxocDN9MAIAwxEYSTZLs
	7xxWYSDmGkLcZasOVasw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyZ0P-00066J-Rm; Mon, 03 Feb 2020 10:31:01 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyZ0M-000634-AT
 for linux-afs@lists.infradead.org; Mon, 03 Feb 2020 10:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580725857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SnRCq3AS1z4sFuxBCb6ZulsCTqiIP0mZ/GCJGWgKAJU=;
 b=d2lY/XGkibvLHndc4HlZignvxiibMlgXqfLn1mjL2n+SeTSWSKKvWH9BiKLE28jN6uYhoQ
 kSL1IdVHfg97z8HlWSbuAdfG7UiBvqDkUpd3BZFi+Liy8sZ1UBC1IhUXnhTFgLp8NpX8Bh
 teMTRwEopfN3q4P8OtFyXtPO8ms/8jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-4EqTogPSNMS0-fukX4_jeg-1; Mon, 03 Feb 2020 05:30:47 -0500
X-MC-Unique: 4EqTogPSNMS0-fukX4_jeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8E8C107ACC4;
 Mon,  3 Feb 2020 10:30:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com
 [10.10.120.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF9047792E;
 Mon,  3 Feb 2020 10:30:45 +0000 (UTC)
Subject: [PATCH net 0/4] rxrpc: Fixes ver #2
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Mon, 03 Feb 2020 10:30:45 +0000
Message-ID: <158072584492.743488.4616022353630142921.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_023058_435835_4EB6E42A 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here are a number of fixes for AF_RXRPC:

 (1) Fix a potential use after free in rxrpc_put_local() where it was
     accessing the object just put to get tracing information.

 (2) Fix insufficient notifications being generated by the function that
     queues data packets on a call.  This occasionally causes recvmsg() to
     stall indefinitely.

 (3) Fix a number of packet-transmitting work functions to hold an active
     count on the local endpoint so that the UDP socket doesn't get
     destroyed whilst they're calling kernel_sendmsg() on it.

 (4) Fix a NULL pointer deref that stemmed from a call's connection pointer
     being cleared when the call was disconnected.

Changes:

 v2: Removed a couple of BUG() statements that got added.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20200130

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (4):
      rxrpc: Fix use-after-free in rxrpc_put_local()
      rxrpc: Fix insufficient receive notification generation
      rxrpc: Fix missing active use pinning of rxrpc_local object
      rxrpc: Fix NULL pointer deref due to call->conn being cleared on disconnect


 net/rxrpc/af_rxrpc.c     |    2 ++
 net/rxrpc/ar-internal.h  |   11 +++++++++++
 net/rxrpc/call_object.c  |    4 ++--
 net/rxrpc/conn_client.c  |    3 +--
 net/rxrpc/conn_event.c   |   30 ++++++++++++++++++++----------
 net/rxrpc/conn_object.c  |    4 ++--
 net/rxrpc/input.c        |    6 ++----
 net/rxrpc/local_object.c |   23 +++++++++++------------
 net/rxrpc/output.c       |   27 +++++++++------------------
 net/rxrpc/peer_event.c   |   42 +++++++++++++++++++++++-------------------
 10 files changed, 83 insertions(+), 69 deletions(-)



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
