Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ADC17C27A
	for <lists+linux-afs@lfdr.de>; Fri,  6 Mar 2020 17:04:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W6azWBgdeMW6Z0YpF+qXUdrRU753lV7WEejTW+dQ49w=; b=ivnNynmHDocS7LBTlZ++5y7evm
	cWLfpkEu2eJuvu6Mm3fAzRQQ/uuPOu9H4OCTF/26eKqQWezXUjQuezrxoPKLfkTkiHSmqgqctFnrJ
	8QBRJnH//0TkKMogo7RfW8MmR8Xwm89btF/VWSOj6r85nGJQCAdG/P4zPCQqw4msIQ+kGjxF7reeg
	+ws4zHHaYSvzgpivdBwFoItZbdmbFunF0WiultBg8l6vykQPEqWw2y0GRfmt1FDYluzxjw6SRlwqZ
	c4AKqty/bWjXUOOBczZ8ypAAh9KzhN05/5euVAze0KE0DHFrlez1uEuDmDf26tAM/wdmVS2LdFKcp
	OP5taFYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAFSE-000312-Kk; Fri, 06 Mar 2020 16:04:02 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAFSA-0002xG-U7
 for linux-afs@lists.infradead.org; Fri, 06 Mar 2020 16:04:00 +0000
Received: by mail-io1-xd44.google.com with SMTP id n21so2548994ioo.10
 for <linux-afs@lists.infradead.org>; Fri, 06 Mar 2020 08:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4LiMikz7xFp/pZ6WLfCFnZjeipASwBvvRDVVdi+3AR8=;
 b=olF86I6oUG14/RfRMDcc7zJ/augUkNfUANZ7SXsNIp4TWWfwY5wTOUzzkbyEU2TZM4
 ZD0nz9qVqQQQ3cLyVH25AhtR85lDXRAkJoV3jmLMlaTqQf3w6WHK6GXEofcBYB5I2EmA
 JuukATeZ6ul1fJlSVXjK/PQWNSbhcdSnHKYskjwSPiVYapynX0KM41XoXyw2e4WWBUU7
 PIz1/FC2JJZaISHbz8npavIVqiZaZtGw/K0GBrh75yXdTntmaj9etGvPakFx6hWbb2JF
 xevzxIsRqcYG3RRHh3fzmK36sGtW6ZYJkojxLcGsy1IPeBxOZz+qnznls+DfA13Ghtge
 z1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4LiMikz7xFp/pZ6WLfCFnZjeipASwBvvRDVVdi+3AR8=;
 b=D4Gj9hFpbflBvAi8sFH81w9nrhyBIwoZUFBNGb996pe5MjFhpeSOcNByDlYypA36ud
 MQSZ8ykSMzFsRSzGiullIFlnGZsziipUZoR461neUm4BpHSqLWq7azsDdJslwkRMrSvp
 +iLlQYL1Mv3aE9VeZI8Hy5NVDhnhMPRdgDMMFFdNLy8oaXHhE5DMez6wP4DpH+mKjNJt
 0ZVMLkty19/Ug6wRInsG6mK8LsZqyQvqwvt3u9dU4B0DjXsxhFfAWoOW5rZfRPTTlsmv
 4vSrjfMPEhnxSpodpFNES3E6NIO4N92aA852Rke2uyg1wbnU1ZA/jOW7NX6Li5r+YgV6
 UprA==
X-Gm-Message-State: ANhLgQ1MtWjU5no2/2mC38cEJiC3h/B/qZiS9HoMKnzqLjiKYXZo9HN2
 zZc/w5K5smqa+uuYetpBJ8nM8MPedv/dSi2Ik3AKVUkJXcRAqsfii1MUnQh9Nw/PFLUN5v0LwBp
 vY2gq18JTFK2iA2v3DXc8rFfpZ85WDlen6h6MggtpY7CwcoOMIGWdd9tepXUwSmIAozWRnnPk
X-Google-Smtp-Source: ADFU+vs/PVGCffWCdeA5UG7KsUJNGFy/IffDEW7b3oRQpbYbN8np4MwzpWdrabJ1F/0mfwZBK32Zvw==
X-Received: by 2002:a5d:9ed4:: with SMTP id a20mr3590440ioe.187.1583510633408; 
 Fri, 06 Mar 2020 08:03:53 -0800 (PST)
Received: from aurum.olson.home (174-28-234-179.albq.qwest.net.
 [174.28.234.179])
 by smtp.gmail.com with ESMTPSA id e133sm7382062ioa.17.2020.03.06.08.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 08:03:52 -0800 (PST)
From: "Spencer E. Olson" <olsonse@umich.edu>
To: linux-afs@lists.infradead.org
Subject: [PATCH v2 2/3] Cleanup systemd install
Date: Fri,  6 Mar 2020 09:03:13 -0700
Message-Id: <20200306160314.22047-3-olsonse@umich.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306160314.22047-2-olsonse@umich.edu>
References: <809786c0ed8ecfde410e3635e4c6b6fa@ca-zephyr.org>
 <20200306160314.22047-1-olsonse@umich.edu>
 <20200306160314.22047-2-olsonse@umich.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_080358_971600_2D5B205C 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:d44 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: David Howells <dhowells@redhat.com>, Bill MacAllister <mac@ca-zephyr.org>,
 "Spencer E. Olson" <olsonse@umich.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

This patch upgrades the dh compatibility to 11 and hence uses
dh_installsystemd.  Makes systemd installing slightly more
straight-forward.

Notably, this patch also stops changing the name of the kafs-config.service
to kafs-client.service--the config name seems more appropriate for the
action and sticks with the naming of the install done by the Makefile.
---
 debian/.gitignore |  2 +-
 debian/compat     |  2 +-
 debian/control    |  8 ++++----
 debian/rules      | 14 +++++++++-----
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/debian/.gitignore b/debian/.gitignore
index 03a5df2..eb39800 100644
--- a/debian/.gitignore
+++ b/debian/.gitignore
@@ -2,7 +2,7 @@ changelog
 copyright
 kafs-client/
 kafs-client.afs.mount
-kafs-client.service
+kafs-client.kafs-config.service
 kafs-client-dev/
 *.log
 *.substvars
diff --git a/debian/compat b/debian/compat
index ec63514..b4de394 100644
--- a/debian/compat
+++ b/debian/compat
@@ -1 +1 @@
-9
+11
diff --git a/debian/control b/debian/control
index 4789270..53ac62f 100644
--- a/debian/control
+++ b/debian/control
@@ -1,16 +1,16 @@
 Source: kafs-client
 Section: net
 Priority: optional
-Build-Depends: debhelper (>= 9), libkrb5-dev, libkeyutils-dev, libssl-dev
+Build-Depends: debhelper (>= 12), libkrb5-dev, libkeyutils-dev, libssl-dev
 Maintainer: Spencer E. Olson <olsonse@umich.edu>
-Standards-Version: 3.9.2
+Standards-Version: 4.5.0
 Homepage: https://www.infradead.org/~dhowells/kafs/
 Vcs-Git: git://git.infradead.org/users/dhowells/kafs-client.git
 
 Package: kafs-client
 Architecture: any
 Depends: ${shlibs:Depends}, ${misc:Depends}
-Description: The basic tools for kAFS and mounter for the AFS dynamic root
+Description: Basic tools for kAFS and mounter for the AFS dynamic root
  Provide basic AFS-compatible tools for kAFS and systemd scripts to mount the
  dynamic root on /afs and preload the cell database.
  .
@@ -21,7 +21,7 @@ Description: The basic tools for kAFS and mounter for the AFS dynamic root
 Package: kafs-client-dev
 Architecture: any
 Depends: ${shlibs:Depends}, ${misc:Depends}, kafs-client
-Description: The basic tools for kAFS and mounter for the AFS dynamic root
+Description: Basic tools for kAFS and mounter for the AFS dynamic root
  Provide basic AFS-compatible tools for kAFS and systemd scripts to mount the
  dynamic root on /afs and preload the cell database.
  .
diff --git a/debian/rules b/debian/rules
index c0eb5c6..302c7f9 100755
--- a/debian/rules
+++ b/debian/rules
@@ -1,6 +1,7 @@
 #!/usr/bin/make -f
 # See debhelper(7) (uncomment to enable)
 # output every command that modifies files on the build system.
+export DH_VERBOSE = 1
 DH_VERBOSE = 1
 export DESTDIR=$(CURDIR)/debian/kafs-client/
 export SBINDIR=/usr/sbin/
@@ -21,7 +22,7 @@ include /usr/share/dpkg/default.mk
 
 # main packaging script based on dh7 syntax
 %:
-	dh $@ --with systemd
+	dh $@
 
 build binary :  $(CURDIR)/debian/changelog $(CURDIR)/debian/copyright
 
@@ -29,12 +30,15 @@ override_dh_auto_install:
 	mkdir -p $(CURDIR)/debian/tmp/afs
 	dh_auto_install
 	cp $(CURDIR)/conf/kafs-config.service  \
-	   $(CURDIR)/debian/kafs-client.service
-	cat $(CURDIR)/conf/afs.mount | sed -e 's/kafs-config/kafs-client/' \
-	   > $(CURDIR)/debian/kafs-client.afs.mount
-	dh_systemd_enable --name=afs
+	   $(CURDIR)/debian/kafs-client.kafs-config.service
+	cp $(CURDIR)/conf/afs.mount \
+	   $(CURDIR)/debian/kafs-client.afs.mount
 	rm $(CURDIR)/debian/tmp/usr/share/man/man1/aklog.1
 
+override_dh_installsystemd:
+	dh_installsystemd --name=kafs-config
+	dh_installsystemd --name=afs
+
 $(CURDIR)/debian/changelog : $(CURDIR)/debian/mk_changelog
 	$(CURDIR)/debian/mk_changelog > $(CURDIR)/debian/changelog
 
-- 
2.17.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
