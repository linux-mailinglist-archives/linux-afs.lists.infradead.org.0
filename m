Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CDA1F481A
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 22:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tjIByNIqYdHcHMD+kY9JiYbb7Dafv4ALz5XK300KuyI=; b=H1XIXN4MyBKt21
	6k4jg6vCAN28KLLMJIw1tA2FLwAPS63UW6iy9hAWz+9aIVHEZIMDQFp15+HYtxJ48XthB6tcyyIHC
	beealO9gOrVmOuMjkYBJf9qOqLLpbNi1bBD1VTkZwPKXkbj4GiRYdJ5O7waDI+ZyUrn8Sx8M5NA1u
	T6HRP/vnc0pCuc1mqIuS1Xs5VRlncdKODe9gzRzda4tVuFaIOBE7R9eR3AIAwl2aXqoO6W76ZMTTA
	/esPlUJRAr4N/Z1J+Fvm411utuouXNDmoZz4NXDMxjjKggKpZLGY+jCXHSqs0Bjv34wmUT9+RQsQo
	eq+TaOiojlujgSuUbMmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiktV-0000ta-Ih; Tue, 09 Jun 2020 20:30:49 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiktP-0000oN-Fl
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 20:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591734640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NWthi4+vrXEX/1oiVdu5yh/nfH9kWltS19ynUlwFR9Y=;
 b=bO1YQl2nvlzrKDbXLNtCRvOxmqv809slE2LK/UPCxS7hwozRc3xkJ+HP5T2rjXMHTM9uaj
 VeNe72YNlrvGW2keT902FLVGGJZuX8iLUCNRbhJ/QiVRJqpcmWfyLTzuUZhesGWIiP3YTM
 ERiNI1QxGvb4CXeIVJSYYCFoT1x+Smg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-5qSl20efM7ypRXiyD12wPQ-1; Tue, 09 Jun 2020 16:30:37 -0400
X-MC-Unique: 5qSl20efM7ypRXiyD12wPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF449835B40;
 Tue,  9 Jun 2020 20:30:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54969768C1;
 Tue,  9 Jun 2020 20:30:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Subject: [GIT PULL] afs: Misc small fixes
MIME-Version: 1.0
Content-ID: <3071962.1591734633.1@warthog.procyon.org.uk>
Date: Tue, 09 Jun 2020 21:30:33 +0100
Message-ID: <3071963.1591734633@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_133043_618854_88C67B0D 
X-CRM114-Status: GOOD (  11.74  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

Here's a set of small patches to fix some things, most of them minor.
Would you prefer I defer and submit it again after -rc1?

 (1) Fix a memory leak in afs_put_sysnames().

 (2) Fix an oops in AFS file locking.

 (3) Fix new use of BUG().

 (4) Fix debugging statements containing %px.

 (5) Remove afs_zero_fid as it's unused.

 (6) Make afs_zap_data() static.

David
---
The following changes since commit aaa2faab4ed8e5fe0111e04d6e168c028fe2987f:

  Merge tag 'for-linus-5.8-ofs1' of git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux (2020-06-05 16:44:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20200609

for you to fetch changes up to c68421bbad755a280851afff0fb236dd4e53e684:

  afs: Make afs_zap_data() static (2020-06-09 18:17:14 +0100)

----------------------------------------------------------------
AFS fixes

----------------------------------------------------------------
David Howells (5):
      afs: Fix file locking
      afs: Fix use of BUG()
      afs: Fix debugging statements with %px to be %p
      afs: Remove afs_zero_fid as it's not used
      afs: Make afs_zap_data() static

Zhihao Cheng (1):
      afs: Fix memory leak in afs_put_sysnames()

 fs/afs/dir.c       | 2 +-
 fs/afs/flock.c     | 2 +-
 fs/afs/inode.c     | 2 +-
 fs/afs/internal.h  | 2 --
 fs/afs/proc.c      | 1 +
 fs/afs/vl_alias.c  | 5 +++--
 fs/afs/yfsclient.c | 2 --
 7 files changed, 7 insertions(+), 9 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
