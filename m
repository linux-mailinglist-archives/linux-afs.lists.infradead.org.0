Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D551318B2AE
	for <lists+linux-afs@lfdr.de>; Thu, 19 Mar 2020 12:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N/CmzPeymMWQyk2OyT9JIv1BSkfV7XzVnqBIoeYK358=; b=j3lyUQ7QQ38Stl
	ojGO5kvEOmLS78n8ZYMymuhpdEzb039TKVXqx5ia038BYaAt7NQXclitlVeqk5iTuF8jW6NxOMQQ6
	Lr2KRrhA3sVFXRAApSIeNDOX/GrqkRQTDrZF6iGEq/ovjGnPblDaigloMv2dXbSypaeqlAyL2CLU1
	gDrdVDMPufuy9VLbm82GmIb2Mkbd5kWPaKw+v07Mc8aoyc06nu39WuWukdTBM5q9iUJQfuhXMGK7j
	25/qVjTQsNG0T+L4q1rnUM3ixX1cLxS8d7Do/dUiTiRGHRBOqrf9TqTYOjiE1Al1VOnalsirjgMQk
	Nuc1TIiqKlDn1o86DO1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEtk6-0007L0-VR; Thu, 19 Mar 2020 11:53:42 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEtk4-0007Jw-2P
 for linux-afs@lists.infradead.org; Thu, 19 Mar 2020 11:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584618816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oXSDVbAEHWUnwLZgdo0+1RA3BdMgsrd4QkpoIWfyKRM=;
 b=WcsFdqNEPX6Mo6bmagS1XKRV2bDDEfaLDlzPMAiFybW9iMFmbsWnXy0dGIoH8PMdXaLxvc
 rIDZJAMRf1aY87v20X/1wWfM64l50Ch54EMzKCgIaKuQ5vHKDSwi1144stlPwMTc1MTsp0
 Awe6zO5/N0qNBbxwKL5S+ZjYKp/2ZPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-CnL5eWaPNJeevBlU9R1ydg-1; Thu, 19 Mar 2020 07:53:32 -0400
X-MC-Unique: CnL5eWaPNJeevBlU9R1ydg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CD0800D5A;
 Thu, 19 Mar 2020 11:53:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8182994945;
 Thu, 19 Mar 2020 11:53:30 +0000 (UTC)
Subject: [PATCH net 0/6] rxrpc, afs: Interruptibility fixes
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 19 Mar 2020 11:53:29 +0000
Message-ID: <158461880968.3094720.5019510060910604912.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_045340_190382_988E1B02 
X-CRM114-Status: GOOD (  13.53  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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


Here are a number of fixes for AF_RXRPC and AFS that make AFS system calls
less interruptible and so less likely to leave the filesystem in an
uncertain state.  There's also a miscellaneous patch to make tracing
consistent.

 (1) Firstly, abstract out the Tx space calculation in sendmsg.  Much the
     same code is replicated in a number of places that subsequent patches
     are going to alter, including adding another copy.

 (2) Fix Tx interruptibility by allowing a kernel service, such as AFS, to
     request that a call be interruptible only when waiting for a call slot
     to become available (ie. the call has not taken place yet) or that a
     call be not interruptible at all (e.g. when we want to do writeback
     and don't want a signal interrupting a VM-induced writeback).

 (3) Increase the minimum delay on MSG_WAITALL for userspace sendmsg() when
     waiting for Tx buffer space as a 2*RTT delay is really small over 10G
     ethernet and a 1 jiffy timeout might be essentially 0 if at the end of
     the jiffy period.

 (4) Fix some tracing output in AFS to make it consistent with rxrpc.

 (5) Make sure aborted asynchronous AFS operations are tidied up properly
     so we don't end up with stuck rxrpc calls.

 (6) Make AFS client calls uninterruptible in the Rx phase.  If we don't
     wait for the reply to be fully gathered, we can't update the local VFS
     state and we end up in an indeterminate state with respect to the
     server.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20200319

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (6):
      rxrpc: Abstract out the calculation of whether there's Tx space
      rxrpc: Fix call interruptibility handling
      rxrpc: Fix sendmsg(MSG_WAITALL) handling
      afs: Fix some tracing details
      afs: Fix handling of an abort from a service handler
      afs: Fix client call Rx-phase signal handling


 fs/afs/cmservice.c         |   14 +++++++-
 fs/afs/internal.h          |   12 ++++++-
 fs/afs/rxrpc.c             |   74 ++++++-------------------------------------
 include/net/af_rxrpc.h     |   12 +++++--
 include/trace/events/afs.h |    2 +
 net/rxrpc/af_rxrpc.c       |   37 +++-------------------
 net/rxrpc/ar-internal.h    |    5 +--
 net/rxrpc/call_object.c    |    3 +-
 net/rxrpc/conn_client.c    |   13 ++++++--
 net/rxrpc/input.c          |    1 -
 net/rxrpc/sendmsg.c        |   75 +++++++++++++++++++++++++++++++++-----------
 11 files changed, 115 insertions(+), 133 deletions(-)



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
