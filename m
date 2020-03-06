Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C25117C279
	for <lists+linux-afs@lfdr.de>; Fri,  6 Mar 2020 17:04:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YXzX+bCGx//jfPIwNtk2Fbr8MCqERAcuhxIg66llqc8=; b=dXpjosO/IZCy8yEhcgwowk0EA0
	1cYVPVB/5AqPLNfJbdORaPFcHrgoIpPqTDKJpxAIeJTxGkkI2/lOgaYZoSkAiZDK/iSp7F+HnaOR7
	CaHT0RZ6xbw2WQy9Agg/+YjId+eccwmn0S9W3Pqs4dKqyp6W/CV6ihPoEXX7KEK+QJ7yL70sA43RT
	MYhqKO7zwXtNnxWaz81FdysPed2rWLb6LgO5B7rbpcrIf9LU0u8fM9XB3v0s8yreOrMntDhzuN9GD
	FcMW1We1yxqhk0cUk217TcOQ1ulrecWFbYpeFOY77qWOV1hIZAgnViLB7bGe9BRvqvwvG40KoMu7I
	AnBCPCnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAFSH-000321-2T; Fri, 06 Mar 2020 16:04:05 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAFSB-0002xl-QW
 for linux-afs@lists.infradead.org; Fri, 06 Mar 2020 16:04:01 +0000
Received: by mail-il1-x141.google.com with SMTP id e8so2450345ilc.13
 for <linux-afs@lists.infradead.org>; Fri, 06 Mar 2020 08:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=co5l3fYJW2hEM0dicTTYNlxonHCvLE/l/TXL4drN1go=;
 b=An3I9/9aVreMZgGP/I6ZDrR0f8poN6rez8sQMW9+pa9hCFgkPrvIKERz2Jvwl4gWP5
 LalqVDUaFmgSfcb8axwUz77rwLUmf//O0cmAqJZdQLXZwS2XeoC8IQZDz01r8tcpxL4f
 Pk2PWxCdSYx3OlS9oB21uhpw9rIVoIxT9jF+bov/CvKW3XJ7aWMrMiO1UX/tIhXP1W2B
 hu1SgRixfiLfTb2gIWzE0S+BcHnfzgONd31M5Ctxn5FHuvt4POpbnZSH6y+yCEvgQJ+1
 +N9+m5IrydSvizynVF8AsPHIB3Aamx7Nn0JlJMO2KnUSjpAoPXXkwj2p6jlwcDgmCEBA
 3e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=co5l3fYJW2hEM0dicTTYNlxonHCvLE/l/TXL4drN1go=;
 b=es3nVlqXcir93kq6ZqXuIcznIn3Eljtfk51Pq+k7dRYObh3m3Mte+KF34ZzePY4NrT
 /PFeVqco2Dtb+AMPXM/yMUjV+ZVUOFau58Hdk9oPXNOjpN9vj+kvXadeSHaa0WQoYYvS
 y1fhVuQyptXUhfv5aqLLLhK8xrlqVG4Sa0VEFxAy91z5lozlR9H6q0XYilzGjnPG8Niz
 sddv1XO+IxvK5Y7Ghs72E1KUckeyN4mh/ULc9yL3h6sjHTg24sNdaxCXVttZwr6SXFCy
 mDBuebLatmShI6JplDBFJs7U4V+5XJgowL0foe/7XHsoMrs9bxP4/xfZWdIIqCd9Wyiu
 rsSA==
X-Gm-Message-State: ANhLgQ1is6bEQFcFIXAhi/pRyDqZmQ0K3kk5JCQ6nA31g4O64gVOC5sY
 SJ+xu7RxGH6GtCmijkTWXOKNxJAkKZot7jihX3N/kOrXTnqVutUTCdNF/iWjYjCbRrfXeqGWjCd
 bH1I9cwGKS7qK1LTD4Yrigwfujka/8AAbdz6UnJUL+b9AA2Sqf5YxlP13plAKQ6jrUFso/NMN
X-Google-Smtp-Source: ADFU+vt0ftE/DUUSyzOYUuR3g0rm74ElvoWYRnaB3veztpOfDHmwEP8yXOvcY5uW/ymK3PMK9uidJA==
X-Received: by 2002:a92:9f95:: with SMTP id z21mr3713888ilk.91.1583510635004; 
 Fri, 06 Mar 2020 08:03:55 -0800 (PST)
Received: from aurum.olson.home (174-28-234-179.albq.qwest.net.
 [174.28.234.179])
 by smtp.gmail.com with ESMTPSA id e133sm7382062ioa.17.2020.03.06.08.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 08:03:54 -0800 (PST)
From: "Spencer E. Olson" <olsonse@umich.edu>
To: linux-afs@lists.infradead.org
Subject: [PATCH v2 3/3] debian: Add script to create copyright file in debian
 format
Date: Fri,  6 Mar 2020 09:03:14 -0700
Message-Id: <20200306160314.22047-4-olsonse@umich.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306160314.22047-3-olsonse@umich.edu>
References: <809786c0ed8ecfde410e3635e4c6b6fa@ca-zephyr.org>
 <20200306160314.22047-1-olsonse@umich.edu>
 <20200306160314.22047-2-olsonse@umich.edu>
 <20200306160314.22047-3-olsonse@umich.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_080359_860612_5F9FE729 
X-CRM114-Status: GOOD (  15.53  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:141 listed in]
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

The job of the script is to mostly insert copyright notices.

Things to improve in the future (if we really need to and feel like it):
  - Find some way of installing copyright mapping so that
    institutional/organizational copyrights are used instead of direct
    authors.  Perhaps we should be combing through headers of files...
  - Automatically collect file information to segregate copyrights to files
---
 debian/copyright.tmpl | 26 ++++++++++++++++++++
 debian/mk_copyright   | 55 +++++++++++++++++++++++++++++++++++++++++++
 debian/rules          |  2 +-
 3 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 debian/copyright.tmpl
 create mode 100755 debian/mk_copyright

diff --git a/debian/copyright.tmpl b/debian/copyright.tmpl
new file mode 100644
index 0000000..ea00a47
--- /dev/null
+++ b/debian/copyright.tmpl
@@ -0,0 +1,26 @@
+Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
+
+Files: *
+Copyright:
+   {authorship}
+License: GPL-2
+ This program is free software; you can redistribute it
+ and/or modify it under the terms of the GNU General Public
+ License as published by the Free Software Foundation; either
+ version 2 of the License, or (at your option) any later
+ version.
+ .
+ This program is distributed in the hope that it will be
+ useful, but WITHOUT ANY WARRANTY; without even the implied
+ warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
+ PURPOSE.  See the GNU General Public License for more
+ details.
+ .
+ You should have received a copy of the GNU General Public
+ License along with this package; if not, write to the Free
+ Software Foundation, Inc., 51 Franklin St, Fifth Floor,
+ Boston, MA  02110-1301 USA
+ .
+ On Debian systems, the full text of the GNU General Public
+ License version 2 can be found in the file
+ `/usr/share/common-licenses/GPL-2'.
diff --git a/debian/mk_copyright b/debian/mk_copyright
new file mode 100755
index 0000000..cf35860
--- /dev/null
+++ b/debian/mk_copyright
@@ -0,0 +1,55 @@
+#!/usr/bin/env python3
+# vim: ts=2:sw=2:et:tw=80:nowrap
+
+import os
+from subprocess import Popen, PIPE
+
+THIS_DIR = os.path.dirname(os.path.abspath(__file__))
+
+class GitAuthorship(object):
+  def __init__(self):
+    p = Popen(['git', 'log', '--oneline', '--format=%ad:%an:%ae',
+               '--date=format:%Y'], stdout=PIPE)
+    o = p.communicate()[0].decode()
+    self.authors = dict()
+    for yr, name, email in (l.split(':') for l in o.splitlines()):
+      self.authors.setdefault((name, email), set()).add(int(yr))
+
+  class YearLister(object):
+    def __init__(self, years):
+      self.years = sorted(years)
+      self.L = list()
+      self.begin = self.years[0]
+      self.incr = 0
+
+    def add_year(self, year):
+      if year == self.begin + self.incr + 1:
+          self.incr += 1
+          return
+      elif self.incr != 0:
+        self.L.append('{}-{}'.format(self.begin, self.begin + self.incr))
+      else:
+        self.L.append(str(self.begin))
+      self.begin = year
+      self.incr = 0
+
+    def __call__(self):
+      for year in self.years[1:]:
+        self.add_year(year)
+      self.add_year(-1)
+      return ', '.join(self.L)
+
+  def __iter__(self):
+    authors = sorted(self.authors.items(),
+                     key=lambda a_yrs: (min(a_yrs[1]),max(a_yrs[1])))
+    for (name, email), years in authors:
+      yield '{} {} <{}>'.format(self.YearLister(years)(), name, email)
+    
+
+def main():
+  c = GitAuthorship()
+  with open(os.path.join(THIS_DIR, 'copyright.tmpl')) as f:
+    print(f.read().format(authorship='\n   '.join(c)), end='')
+
+if __name__=='__main__':
+  main()
diff --git a/debian/rules b/debian/rules
index 302c7f9..411e58b 100755
--- a/debian/rules
+++ b/debian/rules
@@ -43,4 +43,4 @@ $(CURDIR)/debian/changelog : $(CURDIR)/debian/mk_changelog
 	$(CURDIR)/debian/mk_changelog > $(CURDIR)/debian/changelog
 
 $(CURDIR)/debian/copyright : $(CURDIR)/LICENCE.GPL
-	cp $(CURDIR)/LICENCE.GPL $(CURDIR)/debian/copyright
+	$(CURDIR)/debian/mk_copyright > $(CURDIR)/debian/copyright
-- 
2.17.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
