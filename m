Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A017C277
	for <lists+linux-afs@lfdr.de>; Fri,  6 Mar 2020 17:04:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jOgMplqvY+1reNNhF5lhmdN641kNxxQyoCajJwsgGGo=; b=Vm43fmmGarP5yIrI5ipSBHtvE7
	ep4BXT2xzTpouMGkWi5f+NXI+ZmGNLv9wALcXyrza7lOg0P4zHRGFeJMZJpGXpXgxkn04BEWZ7zoV
	Ctp/UWS7khGzKbNrlHoR2MajSnj99mdmrWyJpS0Cnb9zbHq+MPlvJ92DHt0qGj/JcyGmUOp6eI/QQ
	7I5V137YhPTizSZEhZjyldU+hZ9K1jxwxhM+JGEcwDnxMducwTylSDQq7JpbSRLbkmq/ZCVKgzUow
	PMnbVtDptFHU3XtI6Hnzzm+/aEkLJthLNITHyXdULVsrLRvWBWz82Z/obCLHVvnVJfLCtcYo9nfIx
	lZ8dZ8GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAFSD-0002zj-2J; Fri, 06 Mar 2020 16:04:01 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAFS9-0002xB-9w
 for linux-afs@lists.infradead.org; Fri, 06 Mar 2020 16:03:59 +0000
Received: by mail-il1-x143.google.com with SMTP id j69so2455782ila.11
 for <linux-afs@lists.infradead.org>; Fri, 06 Mar 2020 08:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RWLPIzFZ9h0ZVDXP2mgyX3njN6wfJjY76vvtb4utlFc=;
 b=AYKVajQeO9Vgbx+tU/XMWrsfjEJsVEMIXjhVZtYYLbDQ13OuasHlCW8nzsDguGo7R5
 6lz6aoyVk/GYtYCVwGr4wBOUL24jatxCxGjbzz2m/uB8nEzIBImNUwcQ4UWFD5fGvGBJ
 KR0vMo/q703H8r/zRAXHrwNK/6zUeYVJ47ZpCATwHmLyUDbMPW9eGjEH9k+2do6ePtA7
 IZTe/VPkPiAQhsBH5FwuU9nSJ7Oe9V6yAl5B+d9NVokGIx709bShEhVtM+Bzy0gsbfBL
 K4HIpU00ptSKZG5+vfaPDtIArDRgKL9paiDg+DEvI1PEhyaQoskQiDx9yfOsDNmyJdEW
 w26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RWLPIzFZ9h0ZVDXP2mgyX3njN6wfJjY76vvtb4utlFc=;
 b=bQVrXTwNzTqiCeTROYAwo23qxlitWTwbQ/xUX9nRPFKXUa2xhQL1oLzY3YQiVemsV+
 TqnyVrlV1VO7H9M2Lc9za/BZJJV4Ukv3duMuH8xXR/+3xemuS7CLSZ8xc/b3Xem/exFr
 aigPfxA3HYTa4Y0ZDomRCegD3C/7qbkwLbpK9/+PlHawq+Irk2LW6vmmWxqAa9Q2gfPm
 1NlVKUxiBhPbmRg3Qqibqux1Bsmwy5NZMykFx6M+coBlTt/Dfx/y+XZMNbagwDucgqGh
 +FWXRVtxw6NjxEqjJU3+t1pikMz04Dfk7IQ68rZqT0Y4Q2xGn5ipnSVtrIrGAQfXnGcY
 GQmw==
X-Gm-Message-State: ANhLgQ2K0cVKpp6NF8lU+P/rsS0A0coTqZD6jMRlhcSkvlN5XmYZzSbX
 7UkaFX59tbqLOoOXm9Wcf3THgNY61/0v7pLhImrZbjqaxBMilD2RnNRJYqf4qVwaK8vWmbZpar1
 CXdy/Cx9FfhvuDejO1mQ4kr2V1asfIMb7HPkwiy+oLu3Q/dKHlBfgAstklpqDMpEOhCje6Z7k
X-Google-Smtp-Source: ADFU+vtOWIZzpJEB9Sy41Z+f2liyFlWzk/KSl+JhKNqGp6UtbpTnpb0N4qJv7GuGgra0H/5oJqpbWw==
X-Received: by 2002:a92:d341:: with SMTP id a1mr3866127ilh.257.1583510630236; 
 Fri, 06 Mar 2020 08:03:50 -0800 (PST)
Received: from aurum.olson.home (174-28-234-179.albq.qwest.net.
 [174.28.234.179])
 by smtp.gmail.com with ESMTPSA id e133sm7382062ioa.17.2020.03.06.08.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 08:03:49 -0800 (PST)
From: "Spencer E. Olson" <olsonse@umich.edu>
To: linux-afs@lists.infradead.org
Subject: [PATCH v2 0/3] Add debian packaging to kafs-client
Date: Fri,  6 Mar 2020 09:03:11 -0700
Message-Id: <20200306160314.22047-1-olsonse@umich.edu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <809786c0ed8ecfde410e3635e4c6b6fa@ca-zephyr.org>
References: <809786c0ed8ecfde410e3635e4c6b6fa@ca-zephyr.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_080357_347169_C7FFB143 
X-CRM114-Status: GOOD (  10.94  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:143 listed in]
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

This is a second iteration of a patch to add debian packaging for kafs-client.

Bill:  This second iteration really just adds two more patches...

This patchset doesn't yet squash all the changes into one commit:
0001: First (original) patch adds debian packaging to kafs-client.
0002: This patch upgrades the dh compatibility to 11 and hence uses
      dh_installsystemd.  Makes systemd installing slightly more
      straight-forward.
0003: Try to make a Debian-type copyright file with copyrights auto-pulled from
      git log.  This is certainly not perfect and not too fine-grained.  But at
      least alleviates the need to manually update the copyright file (as long
      as we are not too picky about how find-grained the info is).

Spencer E. Olson (3):
  Add debian build package
  Cleanup systemd install
  debian: Add script to create copyright file in debian format

 debian/.gitignore              |  15 +++++
 debian/compat                  |   1 +
 debian/control                 |  28 ++++++++
 debian/copyright.tmpl          |  26 +++++++
 debian/kafs-client-dev.install |   2 +
 debian/kafs-client.docs        |   1 +
 debian/kafs-client.install     |   8 +++
 debian/mk_changelog            | 119 +++++++++++++++++++++++++++++++++
 debian/mk_copyright            |  55 +++++++++++++++
 debian/rules                   |  46 +++++++++++++
 10 files changed, 301 insertions(+)
 create mode 100644 debian/.gitignore
 create mode 100644 debian/compat
 create mode 100644 debian/control
 create mode 100644 debian/copyright.tmpl
 create mode 100644 debian/kafs-client-dev.install
 create mode 100644 debian/kafs-client.docs
 create mode 100644 debian/kafs-client.install
 create mode 100755 debian/mk_changelog
 create mode 100755 debian/mk_copyright
 create mode 100755 debian/rules

-- 
2.17.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
