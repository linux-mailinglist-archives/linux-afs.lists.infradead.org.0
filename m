Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E5527289
	for <lists+linux-afs@lfdr.de>; Thu, 23 May 2019 00:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eh3/Ao2y7ZKj9DdoMhiAq+K5bS4JWrvJsXMe/5vh3qQ=; b=n8g+6FEy1Hy2TZ
	1Hf+rIRohjPGFHZRcDIvPjI/fW+ltLbdXNSvQnq7b9qbWwKo2e5/jCXj/7Ihk/RSpPt8bJNn+Fhem
	4VKKZcTzmsE59k+QEpYPB4KTtm48M9/+TN8EaIH9SUHCndRRfSKXP4uF04l3lgiHNxgA450HDaa9l
	vMqqvHfxbcEU/gjW/rgf8FjTX8HvExplBSc9Yd3tN51POVMDb/OId8asw+sBjNjW5fapxHrXr5xtp
	Ubgyg9jkeU+bKjIG8A5cXpdomdmOFP+A9g7xI4YJVERqSmCgDLOd+PLwia5eY/C8XT2FGIXggNCMP
	0k4DzNE48lwTqp6N0T+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTa06-0002Bk-FF; Wed, 22 May 2019 22:46:22 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTa03-0002Aw-18
 for linux-afs@lists.infradead.org; Wed, 22 May 2019 22:46:20 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C3BC930832E6;
 Wed, 22 May 2019 22:46:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com
 [10.10.121.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D118319C4F;
 Wed, 22 May 2019 22:46:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/6] keys: Invalidate used request_key authentication keys
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
Date: Wed, 22 May 2019 23:46:17 +0100
Message-ID: <155856517715.11737.4000419348725296931.stgit@warthog.procyon.org.uk>
In-Reply-To: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
References: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 22 May 2019 22:46:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_154619_086970_B6DB2F65 
X-CRM114-Status: GOOD (  15.32  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: dhowells@redhat.com, linux-security-module@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Invalidate used request_key authentication keys rather than revoking them
so that they get cleaned up immediately rather than potentially hanging
around.  There doesn't seem any need to keep the revoked keys around.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/key.c         |    4 ++--
 security/keys/request_key.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/keys/key.c b/security/keys/key.c
index e0750bc85b68..00c7dbfc6a77 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -459,7 +459,7 @@ static int __key_instantiate_and_link(struct key *key,
 
 			/* disable the authorisation key */
 			if (authkey)
-				key_revoke(authkey);
+				key_invalidate(authkey);
 
 			if (prep->expiry != TIME64_MAX) {
 				key->expiry = prep->expiry;
@@ -607,7 +607,7 @@ int key_reject_and_link(struct key *key,
 
 		/* disable the authorisation key */
 		if (authkey)
-			key_revoke(authkey);
+			key_invalidate(authkey);
 	}
 
 	mutex_unlock(&key_construction_mutex);
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index d204d7c0152e..807c32b2c736 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -222,7 +222,7 @@ static int construct_key(struct key *key, const void *callout_info,
 	/* check that the actor called complete_request_key() prior to
 	 * returning an error */
 	WARN_ON(ret < 0 &&
-		!test_bit(KEY_FLAG_REVOKED, &authkey->flags));
+		!test_bit(KEY_FLAG_INVALIDATED, &authkey->flags));
 
 	key_put(authkey);
 	kleave(" = %d", ret);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
