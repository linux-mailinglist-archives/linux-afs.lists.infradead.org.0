Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A451F1F46
	for <lists+linux-afs@lfdr.de>; Mon,  8 Jun 2020 20:50:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qgAp5FE24cc4lymUadaYjsMTgCy+YR2CqPWm/CqWay8=; b=aAzUXwGx7JQADO
	9X7Ys7QzoZHEDMoDddtHOiUgPd11RGcZHmxaMCNfmRcbaAXNNrsnwSsNRYMxzsRT4+/8UUESUcLxQ
	tXHOAzEd4x4NQGUZwwWarEC+H42vgTYI3mYGB1kyXBu95JDavNBA4KCGab8oh7ze/amSFPt3MROR0
	85ihATF3OjN/zSSPbqgik59P+b6KkTMh5elP0eQqveizXJAibW4Z7fRoazEo7cmM+a/sheBZHvJIM
	1mIYuJ6Meq3V8dIIepJKJrODHwagmQ7k+xosCsg8JWjl8PH+4yBl1a2FsMpd8CDfvQ59jJ9KVYLyJ
	qp/e9u7DM0yWiIxVfGkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiMqN-0003oX-S1; Mon, 08 Jun 2020 18:49:59 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiMqK-0003na-VS
 for linux-afs@lists.infradead.org; Mon, 08 Jun 2020 18:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591642194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l0ksCxzpwudUbpK7GfsKkgrf4ml8ic3g8I5MdiUao/c=;
 b=MkhForGDDbDtafQqDhLM3eRsJUNKaH+kPd1UekNeCYMArehJDcTyaJONQ3ePq7eOJBUG8q
 5pvBHqsRcbWb2jiWB5OJ2/0pA4QyNT91uH6W28Pg08dTAzlqwl60RdSacwUlSnjvCCdVUN
 K0+kNIZfEs5O/GEFTwQrgnqE2ALB56E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-btfcDdT-NnykoFjMxWfLlw-1; Mon, 08 Jun 2020 14:49:50 -0400
X-MC-Unique: btfcDdT-NnykoFjMxWfLlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 395CC835B42;
 Mon,  8 Jun 2020 18:49:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09B54648DB;
 Mon,  8 Jun 2020 18:49:47 +0000 (UTC)
Subject: [PATCH net 0/2] rxrpc: Fix hang due to missing notification
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Mon, 08 Jun 2020 19:49:47 +0100
Message-ID: <159164218727.2758133.1046957228494479308.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_114957_089943_2BB6DFC6 
X-CRM114-Status: GOOD (  10.06  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: Marc Dionne <marc.dionne@auristor.com>, dhowells@redhat.com,
 Gerry Seidman <gerry@auristor.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here's a fix for AF_RXRPC.  Occasionally calls hang because there are
circumstances in which rxrpc generate a notification when a call is
completed - primarily because initial packet transmission failed and the
call was killed off and an error returned.  But the AFS filesystem driver
doesn't check this under all circumstances, expecting failure to be
delivered by asynchronous notification.

There are two patches: the first moves the problematic bits out-of-line and
the second contains the fix.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20200605

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (1):
      rxrpc: Fix missing notification


 net/rxrpc/ar-internal.h | 119 ++++++++++--------------------------------------
 net/rxrpc/call_event.c  |   1 -
 net/rxrpc/conn_event.c  |   7 ++-
 net/rxrpc/input.c       |   7 +--
 net/rxrpc/peer_event.c  |   4 +-
 net/rxrpc/recvmsg.c     |  79 ++++++++++++++++++++++++++++++++
 net/rxrpc/sendmsg.c     |   4 +-
 7 files changed, 111 insertions(+), 110 deletions(-)



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
