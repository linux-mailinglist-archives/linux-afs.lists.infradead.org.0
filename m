Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2764F101C9A
	for <lists+linux-afs@lfdr.de>; Tue, 19 Nov 2019 09:20:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KbrRTkErhGhhEfMpKBjVAVrwzEuHKjFEJDiZHpfDHKo=; b=tpk4uq5XPWJHzh
	byEnasgpU3LE2hEkLCPDBNDWOXoCqZs0461jebGzznA1F7d8rEyQFBLEZlFn/hgYI60wjr3Hk1dpz
	URnqbcGBcSkHh9igqUUjm8zQdbbZCKqLd1T8UiVKlswhO4omtmTNBOj1kj8yDX/Fihc8KjpBhISLB
	N879L4sq7HMA9GOsYLBu0IcBiTaG74YQkh1YJbtVj6krJqhGpeEeYe//se4/9ptveNSzg8azPm/6V
	elvAlk2FbCV0R57Ma74adVJ9APIa1lX3HbyYsDkI85xuH8V7ADnexvmEF0UYvRFuv4azuf2mzP48D
	e0766M9d5QwNlYoT1yRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWyk8-000807-2r; Tue, 19 Nov 2019 08:20:12 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWyk4-0007B3-DB
 for linux-afs@lists.infradead.org; Tue, 19 Nov 2019 08:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574151604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LAFtQvpQitasMAfv5/N/lnzPtr/clDbAYXKPwxRTq7I=;
 b=jJ5imNtqWYNFMC9cGVl7p6Mj6br5UmIOiFlqopqwSpQ6UAGehgUxskfrMNkZ4Io6sAxhvQ
 wI8eKBrQj8AGC3O32M3+QhwIyN07Jzl01+IUtB+v5Yyq5D3QtuAOdG+gKzzAd8ytjKDx5a
 HXV+eEfq+tHH/nDxFVdgN+pbn6DjOdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-rStInjVXPp262Khmrd9qMw-1; Tue, 19 Nov 2019 03:20:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A50E0800EBE;
 Tue, 19 Nov 2019 08:19:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-161.rdu2.redhat.com
 [10.10.120.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA5C769193;
 Tue, 19 Nov 2019 08:19:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix missing timeout reset
From: David Howells <dhowells@redhat.com>
To: marc.dionne@auristor.com
Date: Tue, 19 Nov 2019 08:19:57 +0000
Message-ID: <157415159751.19852.17758522503182579607.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: rStInjVXPp262Khmrd9qMw-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_002008_540545_4F453BFA 
X-CRM114-Status: GOOD (  14.09  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
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
