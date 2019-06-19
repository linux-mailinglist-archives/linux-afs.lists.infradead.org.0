Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B74C25C
	for <lists+linux-afs@lfdr.de>; Wed, 19 Jun 2019 22:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZsj5cHBSkEmktsCLm9iGKQv/jvmY8EATeYL6J8/tu8=; b=KkNwXS8zo2bzYP
	TLH6lbqWiXvBunKwHFjvc7A3N9ouDpG3im37JCw6+KdBFUbyLQ1ZXHabt+Ge4JOVNS0TBTqHH6KNO
	GBfBr2Dr/meG6qDGNsJAku0LaJkIRq/jw7k5wCfFWn3g8tyafE7zx6dF+aPxOA8eyP00ocgff0tDn
	cge+esrNM0VKwMffaULzYOVmUCLM+qqHl8ox/XHrHF4J0PhGZPIgk2ne4sdUdERxvBBDzv64zAckY
	Smb5R9L8a4kBodHzyxKJVhhHE8buz8zXSIf/YzpKBjRN6N9/7HVHZfXegXJKRi9vtHNi8Gu1I42FE
	FQZ3mAa5DYy2yCEdr50A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdh9b-0005vU-Qd; Wed, 19 Jun 2019 20:25:59 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddkQ-0006mN-W4
 for linux-afs@lists.infradead.org; Wed, 19 Jun 2019 16:47:48 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A2430A3B6F;
 Wed, 19 Jun 2019 16:47:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C5795D9C6;
 Wed, 19 Jun 2019 16:47:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 7/9] keys: Garbage collect keys for which the domain has
 been removed [ver #4]
From: David Howells <dhowells@redhat.com>
To: ebiederm@xmission.com, keyrings@vger.kernel.org
Date: Wed, 19 Jun 2019 17:47:43 +0100
Message-ID: <156096286376.28733.13843099343286423128.stgit@warthog.procyon.org.uk>
In-Reply-To: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
References: <156096279115.28733.8761881995303698232.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 19 Jun 2019 16:47:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_094747_067008_E9034C85 
X-CRM114-Status: GOOD (  17.24  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Wed, 19 Jun 2019 13:25:54 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, dwalsh@redhat.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 vgoyal@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

If a key operation domain (such as a network namespace) has been removed
then attempt to garbage collect all the keys that use it.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/key.h      |    2 ++
 security/keys/internal.h |    3 ++-
 security/keys/keyring.c  |   15 +++++++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index abc68555bac3..60c076c6e47f 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -278,6 +278,7 @@ extern void key_revoke(struct key *key);
 extern void key_invalidate(struct key *key);
 extern void key_put(struct key *key);
 extern bool key_put_tag(struct key_tag *tag);
+extern void key_remove_domain(struct key_tag *domain_tag);
 
 static inline struct key *__key_get(struct key *key)
 {
@@ -446,6 +447,7 @@ extern void key_init(void);
 #define key_fsgid_changed(c)		do { } while(0)
 #define key_init()			do { } while(0)
 #define key_free_user_ns(ns)		do { } while(0)
+#define key_remove_domain(d)		do { } while(0)
 
 #endif /* CONFIG_KEYS */
 #endif /* __KERNEL__ */
diff --git a/security/keys/internal.h b/security/keys/internal.h
index d3a9439e2386..5a561f5f199e 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -209,7 +209,8 @@ static inline bool key_is_dead(const struct key *key, time64_t limit)
 	return
 		key->flags & ((1 << KEY_FLAG_DEAD) |
 			      (1 << KEY_FLAG_INVALIDATED)) ||
-		(key->expiry > 0 && key->expiry <= limit);
+		(key->expiry > 0 && key->expiry <= limit) ||
+		key->domain_tag->removed;
 }
 
 /*
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 0da8fa282d56..d3c86fda1510 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -241,6 +241,21 @@ bool key_put_tag(struct key_tag *tag)
 	return false;
 }
 
+/**
+ * key_remove_domain - Kill off a key domain and gc its keys
+ * @domain_tag: The domain tag to release.
+ *
+ * This marks a domain tag as being dead and releases a ref on it.  If that
+ * wasn't the last reference, the garbage collector is poked to try and delete
+ * all keys that were in the domain.
+ */
+void key_remove_domain(struct key_tag *domain_tag)
+{
+	domain_tag->removed = true;
+	if (!key_put_tag(domain_tag))
+		key_schedule_gc_links();
+}
+
 /*
  * Build the next index key chunk.
  *


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
