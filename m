Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BA9128555
	for <lists+linux-afs@lfdr.de>; Sat, 21 Dec 2019 00:05:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h3MH4LIKlXOmDEhTPvZmAKHqqTXwVs8uojKiJu2DRTQ=; b=X1h8VF/rBqf5iE
	26QEps1eawKPjmWTHRzVYEM5Jjd5sYvqpXwTncpx1nVUo+7VdYaJq16zlgOsoIM+kdP1JW/IgMVNd
	97nZvOfvcOgjJLIDUAFvrq9XHXWETMEByk3Uginryna9zZtG1v4qXav2ri7AwOZyEHRTusjeuciCN
	nvoJtwggUADbLixv6yj+hdy/mrU97UOH7keJN6jfbCyxeMVcmQk2MqW4vYT6D+X2tfKCHFxx6SXbo
	T7zyA+sIE3qFfYo+bfVseEMTx3jfjumaO2QSF2DBIyPgnud7KU5Vkp63RB42ha9NauQmzZRrW69vD
	STZ5hyJ68lpGGiGCn7vQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiRL6-0000TS-6Q; Fri, 20 Dec 2019 23:05:44 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiRL2-0000Sm-UZ
 for linux-afs@lists.infradead.org; Fri, 20 Dec 2019 23:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576883140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qL/Mm3oMnQqw/MILDz90PSbUAcYZcAXsXZfzb5qXcZE=;
 b=cW1hj7MXx0cQLIC66YG1cAZvPuVStWPR0vc3Suvm1sv29DIoKPRteqfure8J+ICOelKmv7
 AufIa1MuVC2d/yp0XZOWm2KS8Hm1/Z4wcZYgIbs9zrCciK58WEjM6nK4TuQHkvDo6q12E6
 lZ4SaAeiB3vJTilDdJvOb798eIdtlg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-PKXINDOpPDewNjJM9XoBvg-1; Fri, 20 Dec 2019 18:05:37 -0500
X-MC-Unique: PKXINDOpPDewNjJM9XoBvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67EDDB21;
 Fri, 20 Dec 2019 23:05:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com
 [10.10.120.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DBC85C1B0;
 Fri, 20 Dec 2019 23:05:35 +0000 (UTC)
Subject: [PATCH net 0/3] rxrpc: Fixes
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 20 Dec 2019 23:05:35 +0000
Message-ID: <157688313527.18782.11664545318996365146.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_150541_055060_40F94E52 
X-CRM114-Status: GOOD (  11.16  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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


Here are a couple of bugfixes plus a patch that makes one of the bugfixes
easier:

 (1) Move the ping and mutex unlock on a new call from rxrpc_input_packet()
     into rxrpc_new_incoming_call(), which it calls.  This means the
     lock-unlock section is entirely within the latter function.  This
     simplifies patch (2).

 (2) Don't take the call->user_mutex at all in the softirq path.  Mutexes
     aren't allowed to be taken or released there and a patch was merged
     that caused a warning to be emitted every time this happened.  Looking
     at the code again, it looks like that taking the mutex isn't actually
     necessary, as the value of call->state will block access to the call.

 (3) Fix the incoming call path to check incoming calls earlier to reject
     calls to RPC services for which we don't have a security key of the
     appropriate class.  This avoids an assertion failure if YFS tries
     making a secure call to the kafs cache manager RPC service.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20191220

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (3):
      rxrpc: Unlock new call in rxrpc_new_incoming_call() rather than the caller
      rxrpc: Don't take call->user_mutex in rxrpc_new_incoming_call()
      rxrpc: Fix missing security check on incoming calls


 net/rxrpc/ar-internal.h  |   10 +++++--
 net/rxrpc/call_accept.c  |   60 ++++++++++++++++++++++++---------------
 net/rxrpc/conn_event.c   |   16 +----------
 net/rxrpc/conn_service.c |    4 +++
 net/rxrpc/input.c        |   18 ------------
 net/rxrpc/rxkad.c        |    5 ++-
 net/rxrpc/security.c     |   70 ++++++++++++++++++++++------------------------
 7 files changed, 85 insertions(+), 98 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
