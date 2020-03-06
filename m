Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D7B17C278
	for <lists+linux-afs@lfdr.de>; Fri,  6 Mar 2020 17:04:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zWGYlPbDLQD+uUBXhsuPYJEC2zDkfy7KF2i/JIlY/0g=; b=HC5qWUHkNOUAesoEeia17w201S
	S9KzmY+TaoukHkxeXy9AA1M1xWRn/PYop0sz2oUJjq3s00ezqUIB752YN9jYcmbBXhSRx2pkLJxpZ
	skvJu/Z9wnjCVUC8b+EgGJoqZMaKckc+JqgEVPCfOxG17K2M+WccrYzhxcWRych5ycXfi1Sw1rRa3
	3pO6iL8CG+MMmaB0U40Vj8OklLL66C96Ay2DRZBPu+IXAUbe7+Wm4aCG2ACUDLQMjNIfpF4TuK/9k
	1fwpjU10Bhv9PDs+PH8UxTkdH0j+nqPT9obXHyP8eW/0flG9geuEC+tzRqnQt+hqBE9LJxKQARf5H
	UGVN+4bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAFSD-0002zw-CC; Fri, 06 Mar 2020 16:04:01 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAFS9-0002xF-3v
 for linux-afs@lists.infradead.org; Fri, 06 Mar 2020 16:03:59 +0000
Received: by mail-il1-x141.google.com with SMTP id g126so2496586ilh.2
 for <linux-afs@lists.infradead.org>; Fri, 06 Mar 2020 08:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tWR5Ylh+7em+7FHZqWQWADSiK4tBNU8C0zmeu+pTOiU=;
 b=FyVXknvhONi80RPxcivtAtiqC9eS/MqlCV2Xnug9+BCV6EzDLsrmAcKK6cqgnZOLwi
 O884pN/D94NJGNdB0zADi5i4UX0TSNGQfDENOrDAUYMLl0fA9aWvpbkLABSr/poZz332
 RIW54ioYgpdTPl0/G18T2plwb0NFpqAxuOEAKFxwCMA+qR/Q5YfsGmo5LABWgsUwNiUx
 5fwbnLCFd4WjpSBEjCW5tr+CeY5WUjpEPDe+e1jjUzYM8gnOI4m40BCiLuVHPP3mYP1P
 Ee/pTu09ddcVvMSlFsjHxwUXQDvFnS/c/Zvy3MpnoP1fFC4VJTaVVb5rlWAt8Mm5L2mt
 egaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tWR5Ylh+7em+7FHZqWQWADSiK4tBNU8C0zmeu+pTOiU=;
 b=HSz9bP3PO7nFjZOz3xRblOlxFmyET8tic84qdRFA+LK4PJfp1rPY5Yj+OHX+29QqR0
 zsNHZjRkRDUCnWZA9LvF57tjlh+Dy8XAytBTiXYK8eWmaqKK84xo5TRuv1SzTyyt3KnT
 /Kj5FRozF1F3s1YZcdZAx5IHvvk+7/kN5ETupqA2kYK+ZymcRyuhcL8vDnwDC2bqfd7i
 +uWRgHzaUQfEUzEdKc+QWM/Qm5tC81BTYKEOOfgc0AQHMsYUuSRYTh0A+3F3GyJdNh1C
 x4HiIRr+j5XVR9EeZcHNplBJ0k1CQk4PzuR36p6F4GeH9smcUPS5znA6gXTGOCPdIbKX
 8xCA==
X-Gm-Message-State: ANhLgQ02g9C4/7lrW5jURc9n0pNiD073qTBxd7Pomkn5FX/a2af1zkAW
 7PXgOjCrO8phSo1CLy1lnNfNy6mNtmcJf4sBaVZBWzI8OmBMFMbNQIylALPBY9yE4ELWTjbKe4K
 RhRIr0ToX2C95L2HeWwQqqdnqp7lBXlcC5DCSC/yO9skgI5yPL+5ml75iXcap+e3CCbXUSRxW
X-Google-Smtp-Source: ADFU+vuHgbA5muJ1f+danAfIuj3u5+8i2lCwbvBjz23SNQQ4cMUAwqbRPOu7MWzYHPwOQxGZwEPDIw==
X-Received: by 2002:a92:d745:: with SMTP id e5mr3750048ilq.285.1583510631885; 
 Fri, 06 Mar 2020 08:03:51 -0800 (PST)
Received: from aurum.olson.home (174-28-234-179.albq.qwest.net.
 [174.28.234.179])
 by smtp.gmail.com with ESMTPSA id e133sm7382062ioa.17.2020.03.06.08.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 08:03:51 -0800 (PST)
From: "Spencer E. Olson" <olsonse@umich.edu>
To: linux-afs@lists.infradead.org
Subject: [PATCH v2 1/3] Add debian build package
Date: Fri,  6 Mar 2020 09:03:12 -0700
Message-Id: <20200306160314.22047-2-olsonse@umich.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306160314.22047-1-olsonse@umich.edu>
References: <809786c0ed8ecfde410e3635e4c6b6fa@ca-zephyr.org>
 <20200306160314.22047-1-olsonse@umich.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_080357_219172_0AA0A2CF 
X-CRM114-Status: GOOD (  13.98  )
X-Spam-Score: 1.8 (+)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (1.8 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:141 listed in]
 [list.dnswl.org] 2.0 PDS_OTHER_BAD_TLD      Untrustworthy TLDs
 [URI: self.date (date)]
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

Signed-off-by: Spencer E. Olson <olsonse@umich.edu>
---
 debian/.gitignore              |  15 +++++
 debian/compat                  |   1 +
 debian/control                 |  28 ++++++++
 debian/kafs-client-dev.install |   2 +
 debian/kafs-client.docs        |   1 +
 debian/kafs-client.install     |   8 +++
 debian/mk_changelog            | 119 +++++++++++++++++++++++++++++++++
 debian/rules                   |  42 ++++++++++++
 8 files changed, 216 insertions(+)
 create mode 100644 debian/.gitignore
 create mode 100644 debian/compat
 create mode 100644 debian/control
 create mode 100644 debian/kafs-client-dev.install
 create mode 100644 debian/kafs-client.docs
 create mode 100644 debian/kafs-client.install
 create mode 100755 debian/mk_changelog
 create mode 100755 debian/rules

diff --git a/debian/.gitignore b/debian/.gitignore
new file mode 100644
index 0000000..03a5df2
--- /dev/null
+++ b/debian/.gitignore
@@ -0,0 +1,15 @@
+changelog
+copyright
+kafs-client/
+kafs-client.afs.mount
+kafs-client.service
+kafs-client-dev/
+*.log
+*.substvars
+files
+debhelper-build-stamp
+*.postinst.debhelper
+*.prerm.debhelper
+*.postrm.debhelper
+*.swp
+tmp/
diff --git a/debian/compat b/debian/compat
new file mode 100644
index 0000000..ec63514
--- /dev/null
+++ b/debian/compat
@@ -0,0 +1 @@
+9
diff --git a/debian/control b/debian/control
new file mode 100644
index 0000000..4789270
--- /dev/null
+++ b/debian/control
@@ -0,0 +1,28 @@
+Source: kafs-client
+Section: net
+Priority: optional
+Build-Depends: debhelper (>= 9), libkrb5-dev, libkeyutils-dev, libssl-dev
+Maintainer: Spencer E. Olson <olsonse@umich.edu>
+Standards-Version: 3.9.2
+Homepage: https://www.infradead.org/~dhowells/kafs/
+Vcs-Git: git://git.infradead.org/users/dhowells/kafs-client.git
+
+Package: kafs-client
+Architecture: any
+Depends: ${shlibs:Depends}, ${misc:Depends}
+Description: The basic tools for kAFS and mounter for the AFS dynamic root
+ Provide basic AFS-compatible tools for kAFS and systemd scripts to mount the
+ dynamic root on /afs and preload the cell database.
+ .
+ This package also provides a library of shareable routines for dealing with the
+ kAFS filesystem.  These provide things like configuration parsing and DNS
+ lookups.
+
+Package: kafs-client-dev
+Architecture: any
+Depends: ${shlibs:Depends}, ${misc:Depends}, kafs-client
+Description: The basic tools for kAFS and mounter for the AFS dynamic root
+ Provide basic AFS-compatible tools for kAFS and systemd scripts to mount the
+ dynamic root on /afs and preload the cell database.
+ .
+ Provides headers for kafs-client libraries.
diff --git a/debian/kafs-client-dev.install b/debian/kafs-client-dev.install
new file mode 100644
index 0000000..d9b5ef6
--- /dev/null
+++ b/debian/kafs-client-dev.install
@@ -0,0 +1,2 @@
+usr/include
+usr/*/*/*.so
diff --git a/debian/kafs-client.docs b/debian/kafs-client.docs
new file mode 100644
index 0000000..e845566
--- /dev/null
+++ b/debian/kafs-client.docs
@@ -0,0 +1 @@
+README
diff --git a/debian/kafs-client.install b/debian/kafs-client.install
new file mode 100644
index 0000000..0244810
--- /dev/null
+++ b/debian/kafs-client.install
@@ -0,0 +1,8 @@
+afs/
+etc/
+usr/bin
+usr/sbin
+usr/libexec
+usr/share/man
+usr/share/kafs-client/cellservdb.conf usr/share/kafs
+usr/lib/*/*.so.*
diff --git a/debian/mk_changelog b/debian/mk_changelog
new file mode 100755
index 0000000..7bec001
--- /dev/null
+++ b/debian/mk_changelog
@@ -0,0 +1,119 @@
+#!/usr/bin/env python3
+# vim: ts=2:sw=2:et:tw=80:nowrap
+
+from subprocess import Popen, PIPE
+import re, io
+from datetime import datetime
+
+class GitVersion(object):
+  PACKAGE_FMT = 'v(?P<version>[0-9].*)'
+  PACKAGE_NAME= 'kafs-client'
+
+  def __init__(self, tag=None):
+    self.date = None
+
+    if tag is None:
+      p = Popen(['git', 'describe', '--tags'], stdout=PIPE)
+      self.current_git_version = p.communicate()[0].decode().strip()
+
+      p = Popen(['git', 'describe', '--tags', '--abbrev=0'], stdout=PIPE)
+      self.current_git_tag = p.communicate()[0].decode().strip()
+
+      # let's set the date for this version to the last commit
+      p = Popen(['git','log','-1','--format=%cD',self.current_git_version],
+                stdout=PIPE)
+      self.date = p.communicate()[0].decode().strip()
+    else:
+      self.current_git_version = self.current_git_tag = tag
+
+    p = Popen(['git', 'describe', '--tags', self.current_git_version + '~1', '--abbrev=0'],
+              stdout=PIPE, stderr=PIPE)
+    self.last_git_version = p.communicate()[0].decode().strip()
+
+    p = Popen(['git','show',self.current_git_tag], stdout=PIPE)
+    tag_commit = p.communicate()[0].decode()
+    if 'Tagger:' in tag_commit:
+      # this is an annotated tag
+      m = re.search('\nTagger:\s*(?P<name>[^\n]*)\nDate:\s*(?P<date>[^\n]*)\n', tag_commit)
+    else:
+      # this is a non-annotated tag
+      m = re.search('\nAuthor:\s*(?P<name>[^\n]*)\nDate:\s*(?P<date>[^\n]*)\n', tag_commit)
+
+    self.maintainer = m.groupdict()['name']
+    if not self.date:
+      date = datetime.strptime(m.groupdict()['date'], '%a %b %d %H:%M:%S %Y %z')
+      self.date = date.strftime('%a, %d %b %Y %H:%M:%S %z')
+
+  def match_version(self):
+    try:
+      D = re.match(self.PACKAGE_FMT, self.current_git_version).groupdict()
+      D.setdefault('name', self.PACKAGE_NAME)
+      return D
+    except:
+      return dict(name='unknown', version='0.0.0')
+
+  @property
+  def version_number(self):
+    m = self.match_version()
+    if '-g' in m['version']:
+      return m['version'].rpartition('-g')[0]
+    else:
+      return m['version']
+
+  @property
+  def package_name(self):
+    return self.match_version()['name']
+
+  @property
+  def changes(self):
+    if self.last_git_version:
+      p = Popen(['git','log',self.last_git_version+'..'+self.current_git_version,
+                 '--format=<log-header>* %s%n%b'], stdout=PIPE)
+      psed = Popen(['sed','-e','s/^/    /', '-e', 's/\\s*<log-header>\\*/  */'],
+                   stdin=p.stdout, stdout=PIPE)
+      return psed.communicate()[0].decode()
+    else:
+      return '  * Initial version\n'
+
+  @property
+  def chlog_first_line(self):
+    return '{} ({}) unstable; urgency=low' \
+      .format(self.package_name, self.version_number)
+
+  @property
+  def chlog_last_line(self):
+    return ' -- {}  {}\n'.format(self.maintainer, self.date)
+
+  def __call__(self):
+    return '{}\n{}{}\n' \
+      .format(self.chlog_first_line, self.changes, self.chlog_last_line)
+
+
+class GitVersionCollection(object):
+  def __init__(self):
+    p = Popen(['git', 'tag'], stdout=PIPE)
+    self.tags = p.communicate()[0].decode().splitlines()
+    self.tags.reverse()
+
+    self.has_untagged_changes = False
+    p = Popen(['git', 'describe', '--tags'], stdout=PIPE)
+    current = p.communicate()[0].decode().strip()
+    if current not in self.tags:
+      self.has_untagged_changes = True
+
+  def __call__(self):
+    out = io.StringIO()
+    if self.has_untagged_changes:
+      out.write(GitVersion()())
+    for tag in self.tags:
+      out.write(GitVersion(tag)())
+
+    return out.getvalue()
+
+
+def main():
+  c = GitVersionCollection()
+  print(c())
+
+if __name__=='__main__':
+  main()
diff --git a/debian/rules b/debian/rules
new file mode 100755
index 0000000..c0eb5c6
--- /dev/null
+++ b/debian/rules
@@ -0,0 +1,42 @@
+#!/usr/bin/make -f
+# See debhelper(7) (uncomment to enable)
+# output every command that modifies files on the build system.
+DH_VERBOSE = 1
+export DESTDIR=$(CURDIR)/debian/kafs-client/
+export SBINDIR=/usr/sbin/
+export LIBDIR=/usr/lib/x86_64-linux-gnu
+
+# see EXAMPLES in dpkg-buildflags(1) and read /usr/share/dpkg/*
+DPKG_EXPORT_BUILDFLAGS = 1
+include /usr/share/dpkg/default.mk
+
+# see FEATURE AREAS in dpkg-buildflags(1)
+#export DEB_BUILD_MAINT_OPTIONS = hardening=+all
+
+# see ENVIRONMENT in dpkg-buildflags(1)
+# package maintainers to append CFLAGS
+#export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
+# package maintainers to append LDFLAGS
+#export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed
+
+# main packaging script based on dh7 syntax
+%:
+	dh $@ --with systemd
+
+build binary :  $(CURDIR)/debian/changelog $(CURDIR)/debian/copyright
+
+override_dh_auto_install:
+	mkdir -p $(CURDIR)/debian/tmp/afs
+	dh_auto_install
+	cp $(CURDIR)/conf/kafs-config.service  \
+	   $(CURDIR)/debian/kafs-client.service
+	cat $(CURDIR)/conf/afs.mount | sed -e 's/kafs-config/kafs-client/' \
+	   > $(CURDIR)/debian/kafs-client.afs.mount
+	dh_systemd_enable --name=afs
+	rm $(CURDIR)/debian/tmp/usr/share/man/man1/aklog.1
+
+$(CURDIR)/debian/changelog : $(CURDIR)/debian/mk_changelog
+	$(CURDIR)/debian/mk_changelog > $(CURDIR)/debian/changelog
+
+$(CURDIR)/debian/copyright : $(CURDIR)/LICENCE.GPL
+	cp $(CURDIR)/LICENCE.GPL $(CURDIR)/debian/copyright
-- 
2.17.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
