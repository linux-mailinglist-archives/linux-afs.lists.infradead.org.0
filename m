Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B2C4BCF7
	for <lists+linux-afs@lfdr.de>; Wed, 19 Jun 2019 17:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyOLzW4ns0LLA8qvsRrGSv5US35EvBbGYowlEt2CkeI=; b=agYKtFkk0fWtHZ
	ThvXZxE3IlRdYj9eTJ7PREYGcwkl0iGMbAblxbkxWff5zCqxQnbNO7kkSLTuu/82/eN4b2uUV56zR
	vumJKX6hx9k+yWIfxpvrW+KvdA/ex//fSmPPvG8ja4WS69n7LYiDWaiYYZq/mHIaUjB9FRjOO9LSb
	aqP49qkToqWJPfriRYxY0sX+XjE7/iL0loJw+q0caaJq9FWwxTiT1KF1K9j0VUnf1bog8ugOQ7h4/
	gvmcATXnXWs26ZQ8T3k6NYzDYx7lx9MHTKDKEUf6xSU3p1EUYRj0vhW4IsUzGu/QjeSfd56Ht6SAB
	9A5y0h6ilsRP1/nFMDfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdcd9-0000TA-4d; Wed, 19 Jun 2019 15:36:11 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdcd6-0000Ry-Gv
 for linux-afs@lists.infradead.org; Wed, 19 Jun 2019 15:36:09 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3AD2B308339E;
 Wed, 19 Jun 2019 15:36:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2137C19C6F;
 Wed, 19 Jun 2019 15:36:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 1/6] keys: Fix request_key() lack of Link perm check on
 found key [ver #2]
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
Date: Wed, 19 Jun 2019 16:36:03 +0100
Message-ID: <156095856342.25264.11029423243013014147.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095855610.25264.16666970456822465537.stgit@warthog.procyon.org.uk>
References: <156095855610.25264.16666970456822465537.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 19 Jun 2019 15:36:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_083608_578199_02E81E79 
X-CRM114-Status: GOOD (  15.34  )
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

The request_key() syscall allows a process to gain access to the 'possessor'
permits of any key that grants it Search permission by virtue of request_key()
not checking whether a key it finds grants Link permission to the caller.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Documentation/security/keys/core.rst |    4 ++++
 security/keys/request_key.c          |   10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index 823d29bf44f7..82dd457ff78d 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -433,6 +433,10 @@ The main syscalls are:
      /sbin/request-key will be invoked in an attempt to obtain a key. The
      callout_info string will be passed as an argument to the program.
 
+     To link a key into the destination keyring the key must grant link
+     permission on the key to the caller and the keyring must grant write
+     permission.
+
      See also Documentation/security/keys/request-key.rst.
 
 
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 857da65e1940..a6543ed98b1f 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -564,6 +564,16 @@ struct key *request_key_and_link(struct key_type *type,
 	key_ref = search_process_keyrings(&ctx);
 
 	if (!IS_ERR(key_ref)) {
+		if (dest_keyring) {
+			ret = key_task_permission(key_ref, current_cred(),
+						  KEY_NEED_LINK);
+			if (ret < 0) {
+				key_ref_put(key_ref);
+				key = ERR_PTR(ret);
+				goto error_free;
+			}
+		}
+
 		key = key_ref_to_ptr(key_ref);
 		if (dest_keyring) {
 			ret = key_link(dest_keyring, key);


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
