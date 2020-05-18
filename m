Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB851D7B17
	for <lists+linux-afs@lfdr.de>; Mon, 18 May 2020 16:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EI+aqfpf6ZnBOgmLQB88DZTXpahj7gX5IPqKF6myilU=; b=P7Qg0xuAVHQ3fK
	M7S00X3FeIvDYgDazg23RkHuA9Qhl5QyQeoD7iTzLYNY6qk3CLsHvQGYozEWr7TzlEjhFmtYV4zBw
	yRpJjYRDA1nCotVStGiAR3ZC7iVPvatvZh3n4pKiP6YVISulunbuZ0lhfVZqhDnMgR2HF/KnUGtYJ
	iOjO0p4jbUZhb222iQjwhqDJOx11gotYOBaBfMBg+IC61jqmXTc9no+lJ0jSmU7GT1g9WmtTisoRl
	Pa2cjBMwIZ49x3C7PiWwV/nHs1DlAI9IXN6U90VFyMI0nokmoy7ygcQEdZ6I6XhG12avdVgJY4s2B
	rEM0oUv0WBDfXtr5xe0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jagfR-0001y4-Kq; Mon, 18 May 2020 14:22:57 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagfO-0001xB-W4
 for linux-afs@lists.infradead.org; Mon, 18 May 2020 14:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589811773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5T0wa0ZGQ5Gm8HF1P0Qio2NduZZ/K3dFSYEyCYcEGkM=;
 b=FOEGsKknFgv1M3mQCXFTjPW4/AGObt/Wrif2IMZAeAJSiwgFOFwr6K8YhXzzpakFOVlFFj
 S/caH45/ScfIu/h2XQVp1GLvDG+hv4VEu6s2hbyeV3AmTUN6eyqstFeWogsQAtrA5Ok6lP
 sjOyd1LZInojGyWurvXAd5fSsGDgyxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-bdbyJvCaPf6jVxSy4smGWg-1; Mon, 18 May 2020 10:22:49 -0400
X-MC-Unique: bdbyJvCaPf6jVxSy4smGWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48D37835B40;
 Mon, 18 May 2020 14:22:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
 [10.10.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A544E60BF3;
 Mon, 18 May 2020 14:22:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] dns: Apply a default TTL to records obtained from
 getaddrinfo()
From: David Howells <dhowells@redhat.com>
To: linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org
Date: Mon, 18 May 2020 15:22:45 +0100
Message-ID: <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_072255_106294_1DC3CF71 
X-CRM114-Status: GOOD (  22.66  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, keyrings@vger.kernel.org,
 fweimer@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Address records obtained from getaddrinfo() don't come with any TTL
information, even if they're obtained from the DNS, with the result that
key.dns_resolver upcall program doesn't set an expiry time on dns_resolver
records unless they include a component obtained directly from the DNS,
such as an SRV or AFSDB record.

Fix this to apply a default TTL of 10mins in the event that we haven't got
one.  This can be configured in /etc/keyutils/key.dns_resolver.conf by
adding the line:

	default_ttl: <number-of-seconds>

to the file.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Makefile               |    1 +
 dns.afsdb.c            |   16 ++++------
 key.dns.h              |    2 +
 key.dns_resolver.c     |   76 +++++++++++++++++++++++++++++++++++++++++++++---
 man/key.dns_resolver.8 |   19 +++++++++++-
 5 files changed, 100 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 6f79446b..4d055701 100644
--- a/Makefile
+++ b/Makefile
@@ -202,6 +202,7 @@ endif
 	$(INSTALL) -D key.dns_resolver $(DESTDIR)$(SBINDIR)/key.dns_resolver
 	$(INSTALL) -D -m 0644 request-key.conf $(DESTDIR)$(ETCDIR)/request-key.conf
 	mkdir -p $(DESTDIR)$(ETCDIR)/request-key.d
+	mkdir -p $(DESTDIR)$(ETCDIR)/keyutils
 	mkdir -p $(DESTDIR)$(MAN1)
 	$(INSTALL) -m 0644 $(wildcard man/*.1) $(DESTDIR)$(MAN1)
 	mkdir -p $(DESTDIR)$(MAN3)
diff --git a/dns.afsdb.c b/dns.afsdb.c
index fa60e04f..986c0f38 100644
--- a/dns.afsdb.c
+++ b/dns.afsdb.c
@@ -37,8 +37,6 @@
  */
 #include "key.dns.h"
 
-static unsigned long afs_ttl = ULONG_MAX;
-
 /*
  *
  */
@@ -114,8 +112,8 @@ static void afsdb_hosts_to_addrs(ns_msg handle, ns_sect section)
 		}
 	}
 
-	afs_ttl = ttl;
-	info("ttl: %u", ttl);
+	key_expiry = ttl;
+	info("ttl: %u", key_expiry);
 }
 
 /*
@@ -203,8 +201,8 @@ static void srv_hosts_to_addrs(ns_msg handle, ns_sect section)
 		}
 	}
 
-	afs_ttl = ttl;
-	info("ttl: %u", ttl);
+	key_expiry = ttl;
+	info("ttl: %u", key_expiry);
 }
 
 /*
@@ -240,7 +238,7 @@ static int dns_query_AFSDB(const char *cell)
 	/* look up the hostnames we've obtained to get the actual addresses */
 	afsdb_hosts_to_addrs(handle, ns_s_an);
 
-	info("DNS query AFSDB RR results:%u ttl:%lu", payload_index, afs_ttl);
+	info("DNS query AFSDB RR results:%u ttl:%u", payload_index, key_expiry);
 	return 0;
 }
 
@@ -279,7 +277,7 @@ static int dns_query_VL_SRV(const char *cell)
 	/* look up the hostnames we've obtained to get the actual addresses */
 	srv_hosts_to_addrs(handle, ns_s_an);
 
-	info("DNS query VL SRV RR results:%u ttl:%lu", payload_index, afs_ttl);
+	info("DNS query VL SRV RR results:%u ttl:%u", payload_index, key_expiry);
 	return 0;
 }
 
@@ -293,7 +291,7 @@ void afs_instantiate(const char *cell)
 
 	/* set the key's expiry time from the minimum TTL encountered */
 	if (!debug_mode) {
-		ret = keyctl_set_timeout(key, afs_ttl);
+		ret = keyctl_set_timeout(key, key_expiry);
 		if (ret == -1)
 			error("%s: keyctl_set_timeout: %m", __func__);
 	}
diff --git a/key.dns.h b/key.dns.h
index b143f4a4..e884cc4a 100644
--- a/key.dns.h
+++ b/key.dns.h
@@ -29,6 +29,7 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include <time.h>
+#include <ctype.h>
 
 #define	MAX_VLS			15	/* Max Volume Location Servers Per-Cell */
 #define	INET_IP4_ONLY		0x1
@@ -42,6 +43,7 @@
 extern key_serial_t key;
 extern int debug_mode;
 extern unsigned mask;
+extern unsigned int key_expiry;
 
 #define N_PAYLOAD 256
 extern struct iovec payload[N_PAYLOAD];
diff --git a/key.dns_resolver.c b/key.dns_resolver.c
index 4ac27d30..df35493d 100644
--- a/key.dns_resolver.c
+++ b/key.dns_resolver.c
@@ -46,10 +46,13 @@ static const char key_type[] = "dns_resolver";
 static const char a_query_type[] = "a";
 static const char aaaa_query_type[] = "aaaa";
 static const char afsdb_query_type[] = "afsdb";
+static const char *config_file = "/etc/keyutils/key.dns_resolver.conf";
+static bool config_specified = false;
 key_serial_t key;
 static int verbose;
 int debug_mode;
 unsigned mask = INET_ALL;
+unsigned int key_expiry = 10 * 60;
 
 
 /*
@@ -272,6 +275,7 @@ void dump_payload(void)
 	}
 
 	info("The key instantiation data is '%s'", buf);
+	info("The expiry time is %us", key_expiry);
 	free(buf);
 }
 
@@ -412,6 +416,9 @@ int dns_query_a_or_aaaa(const char *hostname, char *options)
 
 	/* load the key with data key */
 	if (!debug_mode) {
+		ret = keyctl_set_timeout(key, key_expiry);
+		if (ret == -1)
+			error("%s: keyctl_set_timeout: %m", __func__);
 		ret = keyctl_instantiate_iov(key, payload, payload_index, 0);
 		if (ret == -1)
 			error("%s: keyctl_instantiate: %m", __func__);
@@ -420,6 +427,61 @@ int dns_query_a_or_aaaa(const char *hostname, char *options)
 	exit(0);
 }
 
+/*
+ * Read the config file.
+ */
+static void read_config(void)
+{
+	FILE *f;
+	char buf[4096], *p;
+	unsigned int line = 0, u;
+	int n;
+
+	printf("READ CONFIG %s\n", config_file);
+
+	f = fopen(config_file, "r");
+	if (!f) {
+		if (errno == ENOENT && !config_specified) {
+			debug("%s: %m", config_file);
+			return;
+		}
+		error("%s: %m", config_file);
+	}
+
+	while (fgets(buf, sizeof(buf) - 1, f)) {
+		line++;
+		if (buf[0] == '#')
+			continue;
+		p = strchr(buf, '\n');
+		if (!p)
+			error("%s:%u: line missing newline or too long", config_file, line);
+		while (p > buf && isspace(p[-1]))
+			p--;
+		*p = 0;
+
+		if (strncmp(buf, "default_ttl:", 12) == 0) {
+			p = buf + 12;
+			while (isspace(*p))
+				p++;
+			if (sscanf(p, "%u%n", &u, &n) != 1)
+				error("%s:%u: default_ttl: Bad value",
+				      config_file, line);
+			if (p[n])
+				error("%s:%u: default_ttl: Extra data supplied",
+				      config_file, line);
+			if (u < 1 || u > INT_MAX)
+				error("%s:%u: default_ttl: Out of range",
+				      config_file, line);
+			key_expiry = u;
+		} else {
+			error("%s:%u: Unknown option", config_file, line);
+		}
+	}
+
+	if (ferror(f) || fclose(f) == EOF)
+		error("%s: %m", config_file);
+}
+
 /*
  * Print usage details,
  */
@@ -428,18 +490,19 @@ void usage(void)
 {
 	if (isatty(2)) {
 		fprintf(stderr,
-			"Usage: %s [-vv] key_serial\n",
+			"Usage: %s [-vv] [-c config] key_serial\n",
 			prog);
 		fprintf(stderr,
-			"Usage: %s -D [-vv] <desc> <calloutinfo>\n",
+			"Usage: %s -D [-vv] [-c config] <desc> <calloutinfo>\n",
 			prog);
 	} else {
-		info("Usage: %s [-vv] key_serial", prog);
+		info("Usage: %s [-vv] [-c config] key_serial", prog);
 	}
 	exit(2);
 }
 
 const struct option long_options[] = {
+	{ "config",	0, NULL, 'c' },
 	{ "debug",	0, NULL, 'D' },
 	{ "verbose",	0, NULL, 'v' },
 	{ "version",	0, NULL, 'V' },
@@ -460,6 +523,10 @@ int main(int argc, char *argv[])
 
 	while ((ret = getopt_long(argc, argv, "vDV", long_options, NULL)) != -1) {
 		switch (ret) {
+		case 'c':
+			config_file = optarg;
+			config_specified = true;
+			continue;
 		case 'D':
 			debug_mode = 1;
 			continue;
@@ -481,6 +548,7 @@ int main(int argc, char *argv[])
 
 	argc -= optind;
 	argv += optind;
+	read_config();
 
 	if (!debug_mode) {
 		if (argc != 1)
@@ -542,7 +610,7 @@ int main(int argc, char *argv[])
 	name++;
 
 	info("Query type: '%*.*s'", qtlen, qtlen, keyend);
-	
+
 	if ((qtlen == sizeof(a_query_type) - 1 &&
 	     memcmp(keyend, a_query_type, sizeof(a_query_type) - 1) == 0) ||
 	    (qtlen == sizeof(aaaa_query_type) - 1 &&
diff --git a/man/key.dns_resolver.8 b/man/key.dns_resolver.8
index e1882e06..f7c44300 100644
--- a/man/key.dns_resolver.8
+++ b/man/key.dns_resolver.8
@@ -13,7 +13,9 @@ key.dns_resolver \- upcall for request\-key to handle dns_resolver keys
 .SH SYNOPSIS
 \fB/sbin/key.dns_resolver \fR<key>
 .br
-\fB/sbin/key.dns_resolver \fR\-D [\-v] [\-v] <keydesc> <calloutinfo>
+\fB/sbin/key.dns_resolver \fR\-D [\-v] [\-v] [\-c <configfile>] <keydesc>
+.br
+<calloutinfo>
 .SH DESCRIPTION
 This program is invoked by request\-key on behalf of the kernel when kernel
 services (such as NFS, CIFS and AFS) want to perform a hostname lookup and the
@@ -24,6 +26,21 @@ It can be called in debugging mode to test its functionality by passing a
 \fB\-D\fR flag on the command line.  For this to work, the key description and
 the callout information must be supplied.  Verbosity can be increased by
 supplying one or more \fB\-v\fR flags.
+.P
+A configuration file can be supplied to adjust various parameters.  The file
+is looked for at:
+.IP
+/etc/keyutils/key.dns_resolver.conf
+.P
+unless otherwise specified with the \fB\-c\fR flag.
+.P
+Configuration options include:
+.TP
+.B default_ttl: <number>
+The number of seconds to set as the expiration on a cached record.  This will
+be overridden if the program manages to retrieve TTL information along with
+the addresses (if, for example, it accesses the DNS directly).  The default is
+600 seconds.
 .SH ERRORS
 All errors will be logged to the syslog.
 .SH SEE ALSO



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
