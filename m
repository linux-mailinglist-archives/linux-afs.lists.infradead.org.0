Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE327295
	for <lists+linux-afs@lfdr.de>; Thu, 23 May 2019 00:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9O+yUa6hL5dErTSwwC/O9LDFe0t6sNmCDklf1Q+XzIE=; b=jx2mGElHPYip4A
	nXL/H1jaPjvcuhJTzvy3H5v3nYTvKlo0NvSiYYXfeqVU2LYq4WXhdX7KAFlumwtsBtp0JUL5P3K+Z
	plmckh5MQUDiSuaraYYkTIoscNTIx2twgy/LAwD8P0nR+GEIMjNZTfnDyhg4gzMbLZMKGJj4ACaG7
	wPUrfoZIcE99A4hk7LajQn7F2BWAVwi8DrSz3w16gyOYHFnXXsc1M90Qp1hwSVNXUm8sWOy0gWiEH
	hL4UwatxkyHNG2UNO5P27bNA9VPv1oRteSG/R/X3YbKnfTuIMmqX3D+24L+L+uOpKZ7PVYxdddIIz
	7cWj3KZ4VsS6KpVR+QPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTa0R-0002GQ-1c; Wed, 22 May 2019 22:46:43 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTa0O-0002Fy-27
 for linux-afs@lists.infradead.org; Wed, 22 May 2019 22:46:41 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CC039307CDFC;
 Wed, 22 May 2019 22:46:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com
 [10.10.121.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8DAF600C0;
 Wed, 22 May 2019 22:46:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 5/6] afs: Provide an RCU-capable key lookup
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
Date: Wed, 22 May 2019 23:46:38 +0100
Message-ID: <155856519817.11737.3095092075887198321.stgit@warthog.procyon.org.uk>
In-Reply-To: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
References: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 22 May 2019 22:46:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_154640_118374_75F2572B 
X-CRM114-Status: GOOD (  15.48  )
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

Provide an RCU-capable key lookup function.  We don't want to call
afs_request_key() in RCU-mode pathwalk as request_key() might sleep, even if
we don't ask it to construct anything as it might find a key that is currently
undergoing construction.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/internal.h |    1 +
 fs/afs/security.c |   27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 2073c1a3ab4b..3090efcc823f 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1237,6 +1237,7 @@ extern void afs_cache_permit(struct afs_vnode *, struct key *, unsigned int,
 			     struct afs_status_cb *);
 extern void afs_zap_permits(struct rcu_head *);
 extern struct key *afs_request_key(struct afs_cell *);
+extern struct key *afs_request_key_rcu(struct afs_cell *);
 extern int afs_check_permit(struct afs_vnode *, struct key *, afs_access_t *);
 extern int afs_permission(struct inode *, int);
 extern void __exit afs_clean_up_permit_cache(void);
diff --git a/fs/afs/security.c b/fs/afs/security.c
index 5d8ece98561e..a6582d6a3882 100644
--- a/fs/afs/security.c
+++ b/fs/afs/security.c
@@ -49,6 +49,33 @@ struct key *afs_request_key(struct afs_cell *cell)
 	}
 }
 
+/*
+ * Get a key when pathwalk is in rcuwalk mode.
+ */
+struct key *afs_request_key_rcu(struct afs_cell *cell)
+{
+	struct key *key;
+
+	_enter("{%x}", key_serial(cell->anonymous_key));
+
+	_debug("key %s", cell->anonymous_key->description);
+	key = request_key_rcu(&key_type_rxrpc, cell->anonymous_key->description);
+	if (IS_ERR(key)) {
+		if (PTR_ERR(key) != -ENOKEY) {
+			_leave(" = %ld", PTR_ERR(key));
+			return key;
+		}
+
+		/* act as anonymous user */
+		_leave(" = {%x} [anon]", key_serial(cell->anonymous_key));
+		return cell->anonymous_key;
+	} else {
+		/* act as authorised user */
+		_leave(" = {%x} [auth]", key_serial(key));
+		return key;
+	}
+}
+
 /*
  * Dispose of a list of permits.
  */


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
