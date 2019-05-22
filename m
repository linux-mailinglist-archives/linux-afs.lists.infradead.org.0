Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9562327288
	for <lists+linux-afs@lfdr.de>; Thu, 23 May 2019 00:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xk0Od5ZqjNAEwIajsnSt/vEMWF5w3I4/PgzKo0vofao=; b=JpXCGXDDrXpd6a
	2xuAnAybX9P/sOxl3entNoxBGDD5O94b7eWsT8WV3Oct1HLJm4J5AY6yD9/42QpNaCbPCW3EV/q+n
	wWDAbdGf1cgV1G0ed2Y1Pu00Hc0LUMVCXcuHRPSl8M2F8M9VZdrNWyDgG1jebp0CZnpNJworKwgkM
	R0LXEKecG0B4qIayScmdVQoFQLGMvNdD+T4g2k7K1XEpTs7lUIc0pReSEcRqkzxYv06Ce8AJZs78c
	+YQDI0U8dW4cbyCZwHm9/80j1sY6VyeuxXB6sJAPbx0jrsB/ws6YFaImDxsXtw16NQeDHM9SSkfbg
	D6NBrFec2HgAMloGoDKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTZzu-00028j-4Q; Wed, 22 May 2019 22:46:10 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTZzq-000283-Sz
 for linux-afs@lists.infradead.org; Wed, 22 May 2019 22:46:08 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0E4E03058838;
 Wed, 22 May 2019 22:46:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com
 [10.10.121.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8516604CD;
 Wed, 22 May 2019 22:46:03 +0000 (UTC)
Subject: [PATCH 0/6] keys: request_key() improvements(vspace)s
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
Date: Wed, 22 May 2019 23:46:02 +0100
Message-ID: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 22 May 2019 22:46:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_154606_975370_D37FA26F 
X-CRM114-Status: GOOD (  13.80  )
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


Here's a fix and some improvements for request_key() intended for the next
merge window:

 (1) Fix the lack of a Link permission check on a key found by request_key(),
     thereby enabling request_key() to link keys that don't grant this
     permission to the target keyring (which must still grant Write
     permission).

     Note that the key must be in the caller's keyrings already to be found.

 (2) Invalidate used request_key authentication keys rather than revoking
     them, so that they get cleaned up immediately rather than hanging around
     till the expiry time is passed.

 (3) Move the RCU locks outwards from the keyring search functions so that a
     request_key_rcu() can be provided.  This can be called in RCU mode, so it
     can't sleep and can't upcall - but it can be called from LOOKUP_RCU
     pathwalk mode.

 (4) Cache the latest positive result of request_key*() temporarily in
     task_struct so that filesystems that make a lot of request_key() calls
     during pathwalk can take advantage of it to avoid having to redo the
     searching.

     It is assumed that the key just found is unlikely to be superseded
     between steps in an RCU pathwalk.

     Note that the cleanup of the cache is done on TIF_NOTIFY_RESUME, just
     before userspace resumes, and on exit.

I've included, for illustration, two patches to the in-kernel AFS filesystem
to make them use this.

The patches can be found on the following branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-request

and this depends on keys-misc.  Note that the AFS patches aren't on this branch.

David
---
David Howells (6):
      keys: Fix request_key() lack of Link perm check on found key
      keys: Invalidate used request_key authentication keys
      keys: Move the RCU locks outwards from the keyring search functions
      keys: Cache result of request_key*() temporarily in task_struct
      afs: Provide an RCU-capable key lookup
      afs: Support RCU pathwalk


 Documentation/security/keys/core.rst        |    8 ++
 Documentation/security/keys/request-key.rst |   11 +++
 fs/afs/dir.c                                |   54 ++++++++++++++
 fs/afs/internal.h                           |    1 
 fs/afs/security.c                           |  102 +++++++++++++++++++++++----
 include/keys/request_key_auth-type.h        |    1 
 include/linux/key.h                         |    3 +
 include/linux/sched.h                       |    5 +
 include/linux/tracehook.h                   |    5 +
 kernel/cred.c                               |    9 ++
 security/keys/internal.h                    |    6 +-
 security/keys/key.c                         |    4 +
 security/keys/keyring.c                     |   16 ++--
 security/keys/proc.c                        |    4 +
 security/keys/process_keys.c                |   41 +++++------
 security/keys/request_key.c                 |   97 +++++++++++++++++++++++++-
 security/keys/request_key_auth.c            |   60 ++++++++++------
 17 files changed, 346 insertions(+), 81 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
