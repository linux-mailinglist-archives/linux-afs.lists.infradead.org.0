Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A963102DD7
	for <lists+linux-afs@lfdr.de>; Tue, 19 Nov 2019 22:00:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YolfYO1GXAcXJko+ZNqVpNqFhMU4K2tIaVTQOJOwl8c=; b=W0q3b3YaVBulb7
	N7ZHcKv4nDrhKTSG24PYBOW+roWnfPmrx3c4g/g3/UPxH81h4RtY6Sragw/jASyAQ08FHm3aNnjyx
	MZKYussDsvTvHz0Ujk/Ft6yZShRbVhJwlRQhubo0URjWWvZ/CSzZXO1y7BIpBYYp9dNDYkt0El/nE
	2mKrBgZkATQhFwyTXIIkb7PMirGl5ll/0CMJeY0Wh7HT2ktWo06EpyC8JHASNbKPLfqJ0nJZi45pH
	LUx0kOnb74U0Ubp5CpkDnqUcbb0rLnbHAUATnO4x03P7NX9t2LR13/EOeRjNC7mSDF3F4J/dgS495
	H73ohONfrcl1i274Ieig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXAcE-00030R-3F; Tue, 19 Nov 2019 21:00:50 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXAcA-0002z0-S9
 for linux-afs@lists.infradead.org; Tue, 19 Nov 2019 21:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574197244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SfJF//RHUtnN8ZNiGvqInwcMiBwPOPwFchLayKBNSGc=;
 b=hr2RChQUJm7GcSKBtGks8ADO179G9e/2FMjp86hPe2D1EJUuQKF1EO6HPgthH6e/ZrQOhE
 +/0tYnBhIEM/nPwKfRftOwwN/t9qrQN9JBmMUP3Za8xMSKIPKaaYSUBfdJtMkSMxWSk4Z3
 ER1UKOZIKuRKmRiCd0fsHtDO3+IALhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-pV0OOeMxP9Sn97oUKzHXYA-1; Tue, 19 Nov 2019 16:00:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05D14477;
 Tue, 19 Nov 2019 21:00:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-161.rdu2.redhat.com
 [10.10.120.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8FB962926;
 Tue, 19 Nov 2019 21:00:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix missing timeout reset
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Tue, 19 Nov 2019 21:00:36 +0000
Message-ID: <157419723680.5784.6298499053943932392.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: pV0OOeMxP9Sn97oUKzHXYA-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_130046_982060_9B306E54 
X-CRM114-Status: GOOD (  13.99  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

In afs_wait_for_call_to_complete(), rather than immediately aborting an
operation if a signal occurs, the code attempts to wait for it to complete,
using a schedule timeout of 2*RTT (or min 2 jiffies) and a check that we're
still receiving relevant packets from the server before we consider
aborting the call.  We may even ping the server to check on the status of
the call.

However, there's a missing timeout reset in the event that we do actually
get a packet to process, such that if we then get a couple of short stalls,
we then time out when progress is actually being made.

Fix this by resetting the timeout any time we get something to process.  If
it's the failure of the call then the call state will get changed and we'll
exit the loop shortly thereafter.

A symptom of this is data fetches and stores failing with EINTR when they
really shouldn't.

Fixes: bc5e3a546d55 ("rxrpc: Use MSG_WAITALL to tell sendmsg() to temporarily ignore signals")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Marc Dionne <marc.dionne@auristor.com>
---

 fs/afs/rxrpc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 0e5269374ac1..61498d9f06ef 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -637,6 +637,7 @@ long afs_wait_for_call_to_complete(struct afs_call *call,
 			call->need_attention = false;
 			__set_current_state(TASK_RUNNING);
 			afs_deliver_to_call(call);
+			timeout = rtt2;
 			continue;
 		}
 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
