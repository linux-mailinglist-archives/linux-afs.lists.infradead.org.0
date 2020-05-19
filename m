Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D3E1DB440
	for <lists+linux-afs@lfdr.de>; Wed, 20 May 2020 14:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nze5EOm2qXWn4IZNi/stD0JqyCDhFlDzAj1DKX/pINQ=; b=uiiV5kPZ4V/zlN
	tW3KqNJG1xDrhMFAwf3/yzgqmJE0m0ET2yDEHtRwDV56HgVZM3bZo7xOCgbZpNutl/Hj6S8JGRXXg
	7jM3KNrr0rrebKkvqa+HhL0Z+y70PgGyexbJfnqarAN8E1bPHmUXs3JcqvEKEBbPh5y/pMXVPQHxB
	Z647sfvZED2Az10gO6rVHE9Wa6k3+ufNChBmCWdlFqRskjpc4oPKpe1kncNBntaZWLhMM+iH+4yms
	OUl8ND81XWJzsmh8MNZCZhIwFGjFcbIYwLOx6YKzUuhRc80OncJHh5fkJjREjuv7WbGuOPU5R/+qi
	WbA/oP+Lt1a8GMfdSpag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbOGU-0006bi-Az; Wed, 20 May 2020 12:56:06 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb4lm-0003sP-R8
 for linux-afs@lists.infradead.org; Tue, 19 May 2020 16:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589904424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T+1wIgatcNw+bs4bC4UVA93HHDhP2YXSs8RVpPtE368=;
 b=iMvlZCOP4/TnqwTtHxpxgW3rriXAwDhcG6L79Ho8ozQ+ThxMHSKHcdFuGNsuIqq/7ZZJFl
 dq6KwkmSkEp1mErXL3NusYqi4DTaD2tmfhWtEg5st8okSv8/2nbv43R2si+SNCcQjSGYEP
 67NWXbRV++wJ9Sh7MS1eF56F+2Iuw8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-KfD76cAVOHCMJEdCOgDVPQ-1; Tue, 19 May 2020 12:06:57 -0400
X-MC-Unique: KfD76cAVOHCMJEdCOgDVPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 350021005510;
 Tue, 19 May 2020 16:06:55 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
 [10.10.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7730F5D9C5;
 Tue, 19 May 2020 16:06:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200519141432.GA2949457@erythro.dev.benboeckel.internal>
References: <20200519141432.GA2949457@erythro.dev.benboeckel.internal>
 <20200518155148.GA2595638@erythro.dev.benboeckel.internal>
 <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
 <1080378.1589895580@warthog.procyon.org.uk>
To: me@benboeckel.net, fweimer@redhat.com
Subject: Re: [PATCH] dns: Apply a default TTL to records obtained from
 getaddrinfo()
MIME-Version: 1.0
Content-ID: <1512926.1589904409.1@warthog.procyon.org.uk>
Date: Tue, 19 May 2020 17:06:49 +0100
Message-ID: <1512927.1589904409@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_090706_955404_CD73E608 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Wed, 20 May 2020 05:56:04 -0700
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
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 keyrings@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Okay, how about this incremental change, then?  If fixes the typo, only prints
the "READ CONFIG" line in verbose mode, filters escape chars in the config
file and reduces the expiration time to 5s.

David
---
diff --git a/key.dns_resolver.c b/key.dns_resolver.c
index c241eda3..7a7ec424 100644
--- a/key.dns_resolver.c
+++ b/key.dns_resolver.c
@@ -52,7 +52,7 @@ key_serial_t key;
 static int verbose;
 int debug_mode;
 unsigned mask = INET_ALL;
-unsigned int key_expiry = 10 * 60;
+unsigned int key_expiry = 5;
 
 
 /*
@@ -109,7 +109,7 @@ void _error(const char *fmt, ...)
 }
 
 /*
- * Pring a warning to stderr or the syslog
+ * Print a warning to stderr or the syslog
  */
 void warning(const char *fmt, ...)
 {
@@ -454,7 +454,7 @@ static void read_config(void)
 	unsigned int line = 0, u;
 	int n;
 
-	printf("READ CONFIG %s\n", config_file);
+	info("READ CONFIG %s", config_file);
 
 	f = fopen(config_file, "r");
 	if (!f) {
@@ -514,6 +514,16 @@ static void read_config(void)
 			v = p = b;
 			while (*b) {
 				if (esc) {
+					switch (*b) {
+					case ' ':
+					case '\t':
+					case '"':
+					case '\'':
+					case '\\':
+						break;
+					default:
+						goto invalid_escape_char;
+					}
 					esc = false;
 					*p++ = *b++;
 					continue;
@@ -563,6 +573,8 @@ static void read_config(void)
 
 missing_value:
 	error("%s:%u: %s: Missing value", config_file, line, k);
+invalid_escape_char:
+	error("%s:%u: %s: Invalid char in escape", config_file, line, k);
 post_quote_data:
 	error("%s:%u: %s: Data after closing quote", config_file, line, k);
 bad_value:
diff --git a/man/key.dns_resolver.conf.5 b/man/key.dns_resolver.conf.5
index 03d04049..c944ad55 100644
--- a/man/key.dns_resolver.conf.5
+++ b/man/key.dns_resolver.conf.5
@@ -34,7 +34,7 @@ Available options include:
 The number of seconds to set as the expiration on a cached record.  This will
 be overridden if the program manages to retrieve TTL information along with
 the addresses (if, for example, it accesses the DNS directly).  The default is
-600 seconds.  The value must be in the range 1 to INT_MAX.
+5 seconds.  The value must be in the range 1 to INT_MAX.
 .P
 The file can also include comments beginning with a '#' character unless
 otherwise suppressed by being inside a quoted value or being escaped with a


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
