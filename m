Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7D4BCFB
	for <lists+linux-afs@lfdr.de>; Wed, 19 Jun 2019 17:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AlZzcNtuBkktFrrl9RA7OZJScox9wEnjqkJQpazPts=; b=mDRg4vZjj9NNGq
	1D/J6Ed3ZddWhAm2oteIWYvEfRFtNapn2pOsWf/TG5/lDPGqn8E6HGLXFucS3nWHxPF4Ip84XPHNr
	ao+WeyZbd+e8W+xiUKsFlNlwzvv+yM1nG9mRpkQbQAg2n5oe8HQ+Pb68Q/Z63MAFX4bIwMoDiIHnM
	KibaEpbEdzDsAG/etn7Yl0TUSezJFddke0Cqqc4sBK0q6HG7TdrUNhY/T4QBbi43Z1l7n50jiRLko
	umTNr/UJKRvfmCUZ1DyLtwVKdVEGUTqdG238Hym1x/p5t3cfC3JQiALU4+VYNDv7kBONxYacH6edf
	BfhMkSsvrrIhp2KIxIEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdcdJ-0000Wb-Eb; Wed, 19 Jun 2019 15:36:21 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdcdG-0000VG-T8
 for linux-afs@lists.infradead.org; Wed, 19 Jun 2019 15:36:20 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6279A3001470;
 Wed, 19 Jun 2019 15:36:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 338531001DDC;
 Wed, 19 Jun 2019 15:36:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/6] keys: Invalidate used request_key authentication keys
 [ver #2]
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
Date: Wed, 19 Jun 2019 16:36:10 +0100
Message-ID: <156095857042.25264.613840154126127744.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095855610.25264.16666970456822465537.stgit@warthog.procyon.org.uk>
References: <156095855610.25264.16666970456822465537.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 19 Jun 2019 15:36:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_083618_964060_2F0585F3 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
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
index bba71acec886..e792d65c0af8 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -459,7 +459,7 @@ static int __key_instantiate_and_link(struct key *key,
 
 			/* disable the authorisation key */
 			if (authkey)
-				key_revoke(authkey);
+				key_invalidate(authkey);
 
 			if (prep->expiry != TIME64_MAX) {
 				key->expiry = prep->expiry;
@@ -616,7 +616,7 @@ int key_reject_and_link(struct key *key,
 
 		/* disable the authorisation key */
 		if (authkey)
-			key_revoke(authkey);
+			key_invalidate(authkey);
 	}
 
 	mutex_unlock(&key_construction_mutex);
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index a6543ed98b1f..244e538d113f 100644
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
