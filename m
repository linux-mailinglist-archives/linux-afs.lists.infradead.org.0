Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C041378EB
	for <lists+linux-afs@lfdr.de>; Fri, 10 Jan 2020 23:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWSDgwkDQKMu3wU0CpJrAKwcI9csnhoGX3jpTXsf/4c=; b=Zj8qhfGRT7zMH5
	Abz2r4gqeIN8eQK0YCVPQ/hxa5PdgGfzOjBSxcW85SVPJD0tbb5pogoGvYIMq1y5zyKHy7FTTjI4b
	p1/e1lmCIRFst1KNnOK3LpGDv6fJiWC6tdIgZlRB196oA7tEUmfGgQK7Ldr2GruUjgPlkPXIxekdz
	lS+LnAJS67np0NfLUT+ZT5Sijw+3Lmj19OCmLcgHItzC2s65cJ/L+Fj+NSd4oBz1E+BkrmrwjncIN
	Zy/cU1DBc9HT25k1fu7ID3nPkCuAZzDVDSMXAZLTnqcV1r8DFoEi5B24K3xkYEF3tp4jtSBBkSdLn
	nwgEee3H/7aGg0LsTfNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iq2PH-0006K1-6S; Fri, 10 Jan 2020 22:05:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iq2PE-0006Iq-NK
 for linux-afs@lists.infradead.org; Fri, 10 Jan 2020 22:05:26 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2A442082E;
 Fri, 10 Jan 2020 22:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578693924;
 bh=Lr6ccyq9r++RHavAZxJatXl+CulmdR3K9ktH+EoAu+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ti0MdYNwu2VwJYrCMIV1dtCFN/mZHZnkr4SATrc6XccJgO7fhptdjhrGYW5KTwKWk
 BTNcK8RoLMv1fhymsfm6jCqRN9yfNoaKmY+oUk6AjWjZ2QKSsCfXBGY1SFtjjzWqHG
 Q4rHPPPmcbd9rBlF/PvZPRlkzhda618pg6hvNwQA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 08/26] rxrpc: Fix missing security check on
 incoming calls
Date: Fri, 10 Jan 2020 17:05:01 -0500
Message-Id: <20200110220519.28250-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110220519.28250-1-sashal@kernel.org>
References: <20200110220519.28250-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_140524_817863_610B9419 
X-CRM114-Status: GOOD (  20.18  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 063c60d39180cec7c9317f5acfc3071f8fecd705 ]

Fix rxrpc_new_incoming_call() to check that we have a suitable service key
available for the combination of service ID and security class of a new
incoming call - and to reject calls for which we don't.

This causes an assertion like the following to appear:

	rxrpc: Assertion failed - 6(0x6) == 12(0xc) is false
	kernel BUG at net/rxrpc/call_object.c:456!

Where call->state is RXRPC_CALL_SERVER_SECURING (6) rather than
RXRPC_CALL_COMPLETE (12).

Fixes: 248f219cb8bc ("rxrpc: Rewrite the data and ack handling code")
Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rxrpc/ar-internal.h  | 10 ++++--
 net/rxrpc/call_accept.c  | 14 ++++++--
 net/rxrpc/conn_event.c   | 16 +--------
 net/rxrpc/conn_service.c |  4 +++
 net/rxrpc/rxkad.c        |  5 +--
 net/rxrpc/security.c     | 70 +++++++++++++++++++---------------------
 6 files changed, 59 insertions(+), 60 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 7c7d10f2e0c1..5e99df80e80a 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -209,6 +209,7 @@ struct rxrpc_skb_priv {
 struct rxrpc_security {
 	const char		*name;		/* name of this service */
 	u8			security_index;	/* security type provided */
+	u32			no_key_abort;	/* Abort code indicating no key */
 
 	/* Initialise a security service */
 	int (*init)(void);
@@ -977,8 +978,9 @@ static inline void rxrpc_reduce_conn_timer(struct rxrpc_connection *conn,
 struct rxrpc_connection *rxrpc_find_service_conn_rcu(struct rxrpc_peer *,
 						     struct sk_buff *);
 struct rxrpc_connection *rxrpc_prealloc_service_connection(struct rxrpc_net *, gfp_t);
-void rxrpc_new_incoming_connection(struct rxrpc_sock *,
-				   struct rxrpc_connection *, struct sk_buff *);
+void rxrpc_new_incoming_connection(struct rxrpc_sock *, struct rxrpc_connection *,
+				   const struct rxrpc_security *, struct key *,
+				   struct sk_buff *);
 void rxrpc_unpublish_service_conn(struct rxrpc_connection *);
 
 /*
@@ -1103,7 +1105,9 @@ extern const struct rxrpc_security rxkad;
 int __init rxrpc_init_security(void);
 void rxrpc_exit_security(void);
 int rxrpc_init_client_conn_security(struct rxrpc_connection *);
-int rxrpc_init_server_conn_security(struct rxrpc_connection *);
+bool rxrpc_look_up_server_security(struct rxrpc_local *, struct rxrpc_sock *,
+				   const struct rxrpc_security **, struct key **,
+				   struct sk_buff *);
 
 /*
  * sendmsg.c
diff --git a/net/rxrpc/call_accept.c b/net/rxrpc/call_accept.c
index 44fa22b020ef..70e44abf106c 100644
--- a/net/rxrpc/call_accept.c
+++ b/net/rxrpc/call_accept.c
@@ -263,6 +263,8 @@ static struct rxrpc_call *rxrpc_alloc_incoming_call(struct rxrpc_sock *rx,
 						    struct rxrpc_local *local,
 						    struct rxrpc_peer *peer,
 						    struct rxrpc_connection *conn,
+						    const struct rxrpc_security *sec,
+						    struct key *key,
 						    struct sk_buff *skb)
 {
 	struct rxrpc_backlog *b = rx->backlog;
@@ -310,7 +312,7 @@ static struct rxrpc_call *rxrpc_alloc_incoming_call(struct rxrpc_sock *rx,
 		conn->params.local = rxrpc_get_local(local);
 		conn->params.peer = peer;
 		rxrpc_see_connection(conn);
-		rxrpc_new_incoming_connection(rx, conn, skb);
+		rxrpc_new_incoming_connection(rx, conn, sec, key, skb);
 	} else {
 		rxrpc_get_connection(conn);
 	}
@@ -349,9 +351,11 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 					   struct sk_buff *skb)
 {
 	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
+	const struct rxrpc_security *sec = NULL;
 	struct rxrpc_connection *conn;
 	struct rxrpc_peer *peer = NULL;
-	struct rxrpc_call *call;
+	struct rxrpc_call *call = NULL;
+	struct key *key = NULL;
 
 	_enter("");
 
@@ -372,7 +376,11 @@ struct rxrpc_call *rxrpc_new_incoming_call(struct rxrpc_local *local,
 	 */
 	conn = rxrpc_find_connection_rcu(local, skb, &peer);
 
-	call = rxrpc_alloc_incoming_call(rx, local, peer, conn, skb);
+	if (!conn && !rxrpc_look_up_server_security(local, rx, &sec, &key, skb))
+		goto no_call;
+
+	call = rxrpc_alloc_incoming_call(rx, local, peer, conn, sec, key, skb);
+	key_put(key);
 	if (!call) {
 		skb->mark = RXRPC_SKB_MARK_REJECT_BUSY;
 		goto no_call;
diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
index a1ceef4f5cd0..808a4723f868 100644
--- a/net/rxrpc/conn_event.c
+++ b/net/rxrpc/conn_event.c
@@ -376,21 +376,7 @@ static void rxrpc_secure_connection(struct rxrpc_connection *conn)
 	_enter("{%d}", conn->debug_id);
 
 	ASSERT(conn->security_ix != 0);
-
-	if (!conn->params.key) {
-		_debug("set up security");
-		ret = rxrpc_init_server_conn_security(conn);
-		switch (ret) {
-		case 0:
-			break;
-		case -ENOENT:
-			abort_code = RX_CALL_DEAD;
-			goto abort;
-		default:
-			abort_code = RXKADNOAUTH;
-			goto abort;
-		}
-	}
+	ASSERT(conn->server_key);
 
 	if (conn->security->issue_challenge(conn) < 0) {
 		abort_code = RX_CALL_DEAD;
diff --git a/net/rxrpc/conn_service.c b/net/rxrpc/conn_service.c
index 123d6ceab15c..21da48e3d2e5 100644
--- a/net/rxrpc/conn_service.c
+++ b/net/rxrpc/conn_service.c
@@ -148,6 +148,8 @@ struct rxrpc_connection *rxrpc_prealloc_service_connection(struct rxrpc_net *rxn
  */
 void rxrpc_new_incoming_connection(struct rxrpc_sock *rx,
 				   struct rxrpc_connection *conn,
+				   const struct rxrpc_security *sec,
+				   struct key *key,
 				   struct sk_buff *skb)
 {
 	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
@@ -160,6 +162,8 @@ void rxrpc_new_incoming_connection(struct rxrpc_sock *rx,
 	conn->service_id	= sp->hdr.serviceId;
 	conn->security_ix	= sp->hdr.securityIndex;
 	conn->out_clientflag	= 0;
+	conn->security		= sec;
+	conn->server_key	= key_get(key);
 	if (conn->security_ix)
 		conn->state	= RXRPC_CONN_SERVICE_UNSECURED;
 	else
diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index 8d8aa3c230b5..098f1f9ec53b 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -648,9 +648,9 @@ static int rxkad_issue_challenge(struct rxrpc_connection *conn)
 	u32 serial;
 	int ret;
 
-	_enter("{%d,%x}", conn->debug_id, key_serial(conn->params.key));
+	_enter("{%d,%x}", conn->debug_id, key_serial(conn->server_key));
 
-	ret = key_validate(conn->params.key);
+	ret = key_validate(conn->server_key);
 	if (ret < 0)
 		return ret;
 
@@ -1293,6 +1293,7 @@ static void rxkad_exit(void)
 const struct rxrpc_security rxkad = {
 	.name				= "rxkad",
 	.security_index			= RXRPC_SECURITY_RXKAD,
+	.no_key_abort			= RXKADUNKNOWNKEY,
 	.init				= rxkad_init,
 	.exit				= rxkad_exit,
 	.init_connection_security	= rxkad_init_connection_security,
diff --git a/net/rxrpc/security.c b/net/rxrpc/security.c
index a4c47d2b7054..9b1fb9ed0717 100644
--- a/net/rxrpc/security.c
+++ b/net/rxrpc/security.c
@@ -101,62 +101,58 @@ int rxrpc_init_client_conn_security(struct rxrpc_connection *conn)
 }
 
 /*
- * initialise the security on a server connection
+ * Find the security key for a server connection.
  */
-int rxrpc_init_server_conn_security(struct rxrpc_connection *conn)
+bool rxrpc_look_up_server_security(struct rxrpc_local *local, struct rxrpc_sock *rx,
+				   const struct rxrpc_security **_sec,
+				   struct key **_key,
+				   struct sk_buff *skb)
 {
 	const struct rxrpc_security *sec;
-	struct rxrpc_local *local = conn->params.local;
-	struct rxrpc_sock *rx;
-	struct key *key;
-	key_ref_t kref;
+	struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
+	key_ref_t kref = NULL;
 	char kdesc[5 + 1 + 3 + 1];
 
 	_enter("");
 
-	sprintf(kdesc, "%u:%u", conn->service_id, conn->security_ix);
+	sprintf(kdesc, "%u:%u", sp->hdr.serviceId, sp->hdr.securityIndex);
 
-	sec = rxrpc_security_lookup(conn->security_ix);
+	sec = rxrpc_security_lookup(sp->hdr.securityIndex);
 	if (!sec) {
-		_leave(" = -ENOKEY [lookup]");
-		return -ENOKEY;
+		trace_rxrpc_abort(0, "SVS",
+				  sp->hdr.cid, sp->hdr.callNumber, sp->hdr.seq,
+				  RX_INVALID_OPERATION, EKEYREJECTED);
+		skb->mark = RXRPC_SKB_MARK_REJECT_ABORT;
+		skb->priority = RX_INVALID_OPERATION;
+		return false;
 	}
 
-	/* find the service */
-	read_lock(&local->services_lock);
-	rx = rcu_dereference_protected(local->service,
-				       lockdep_is_held(&local->services_lock));
-	if (rx && (rx->srx.srx_service == conn->service_id ||
-		   rx->second_service == conn->service_id))
-		goto found_service;
+	if (sp->hdr.securityIndex == RXRPC_SECURITY_NONE)
+		goto out;
 
-	/* the service appears to have died */
-	read_unlock(&local->services_lock);
-	_leave(" = -ENOENT");
-	return -ENOENT;
-
-found_service:
 	if (!rx->securities) {
-		read_unlock(&local->services_lock);
-		_leave(" = -ENOKEY");
-		return -ENOKEY;
+		trace_rxrpc_abort(0, "SVR",
+				  sp->hdr.cid, sp->hdr.callNumber, sp->hdr.seq,
+				  RX_INVALID_OPERATION, EKEYREJECTED);
+		skb->mark = RXRPC_SKB_MARK_REJECT_ABORT;
+		skb->priority = RX_INVALID_OPERATION;
+		return false;
 	}
 
 	/* look through the service's keyring */
 	kref = keyring_search(make_key_ref(rx->securities, 1UL),
 			      &key_type_rxrpc_s, kdesc, true);
 	if (IS_ERR(kref)) {
-		read_unlock(&local->services_lock);
-		_leave(" = %ld [search]", PTR_ERR(kref));
-		return PTR_ERR(kref);
+		trace_rxrpc_abort(0, "SVK",
+				  sp->hdr.cid, sp->hdr.callNumber, sp->hdr.seq,
+				  sec->no_key_abort, EKEYREJECTED);
+		skb->mark = RXRPC_SKB_MARK_REJECT_ABORT;
+		skb->priority = sec->no_key_abort;
+		return false;
 	}
 
-	key = key_ref_to_ptr(kref);
-	read_unlock(&local->services_lock);
-
-	conn->server_key = key;
-	conn->security = sec;
-
-	_leave(" = 0");
-	return 0;
+out:
+	*_sec = sec;
+	*_key = key_ref_to_ptr(kref);
+	return true;
 }
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
