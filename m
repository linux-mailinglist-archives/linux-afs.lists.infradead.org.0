Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83BFC77
	for <lists+linux-afs@lfdr.de>; Tue, 30 Apr 2019 17:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I7475q/vwZA+PwXd+n82EQFhvtRRZeCjk/5/l2woggI=; b=fKErsYHYZ55H6U
	QSfYe+jxkZW5NlU4pxQCC8axaTuNg2e4QNzfpcebcLYzxsOAcX9wxu12F+pkHb3CZP7qaLGDOrIDX
	/oyGg0OEZLv3lHH//MYjX0O7IjQYZomdAXgc18Os13P2oTikjJoDL5huJ8S1gv5Lfl/u1lg7IGgQq
	B7zyr9Ab1x9eTd4ZWMWPKDDYueV0UPFq01yA02xyFgKpi59hf2jZQQe9oeNCIzNIsqUH7ZQ9rBvd3
	I2/k9ABqnmmYg5nSGKIhL7U9CNSUzZ0jsflIIE3qOLmTOcVRGJACV2LIGrT2aNOWjkcwR1f1wDDWH
	u6Rkatn5ujXVvjIF/qyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLUO5-0006OJ-9a; Tue, 30 Apr 2019 15:09:41 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLUL9-0005lw-Am
 for linux-afs@lists.infradead.org; Tue, 30 Apr 2019 15:06:44 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 550DE83F3B;
 Tue, 30 Apr 2019 15:06:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F006B600C2;
 Tue, 30 Apr 2019 15:06:32 +0000 (UTC)
Subject: [PATCH 00/11] keys: Namespacing [ver #2]
From: David Howells <dhowells@redhat.com>
To: ebiederm@xmission.com
Date: Tue, 30 Apr 2019 16:06:31 +0100
Message-ID: <155663679069.31331.3777091898004242996.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 30 Apr 2019 15:06:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_080639_601779_334D5ED5 
X-CRM114-Status: GOOD (  16.68  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Mailman-Approved-At: Tue, 30 Apr 2019 08:09:39 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 Jann Horn <jannh@google.com>, netdev@vger.kernel.org, dwalsh@redhat.com,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 vgoyal@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here are some patches to make keys and keyrings more namespace aware.  Note
that the branch is dependent on security/next-general.

Firstly some miscellaneous patches to make the process easier:

 (1) Invalidate rather than revoke request_key() authentication keys to
     recycle them more quickly.

 (2) Remove request_key_async*() as they aren't used and would have to be
     namespaced.

 (3) Simplify key index_key handling so that the word-sized chunks
     assoc_array requires don't have to be shifted about, making it easier
     to add more bits into the key.

 (4) Cache the hash value so that we don't have to calculate on every key
     we examine during a search (it involves a bunch of multiplications).

 (5) Allow keying_search() to search non-recursively.

Then the main patches:

 (6) Make it so that keyring names are per-user_namespace from the point of
     view of KEYCTL_JOIN_SESSION_KEYRING so that they're not accessible
     cross-user_namespace.

 (7) Move the user and user-session keyrings to the user_namespace rather
     than the user_struct.  This prevents them propagating directly across
     user_namespaces boundaries (ie. the KEY_SPEC_* flags will only pick
     from the current user_namespace).

 (8) Make it possible to include the target namespace in which the key shall
     operate in the index_key.  This will allow the possibility of multiple
     keys with the same description, but different target domains to be held
     in the same keyring.

 (9) Make it so that keys are implicitly invalidated by removal of a domain
     tag, causing them to be garbage collected.

(10) Institute a network namespace domain tag that allows keys to be
     differentiated by the network namespace in which they operate.  New keys
     that are of a type marked 'KEY_TYPE_NET_DOMAIN' are assigned the network
     domain in force when they are created.

(11) Make it so that the desired network namespace can be handed down into the
     request_key() mechanism.  This allows AFS, NFS, etc. to request keys
     specific to the network namespace of the superblock.

     This also means that the keys in the DNS record cache are thenceforth
     namespaced, provided network filesystems pass the appropriate network
     namespace down into dns_query().

     For DNS, AFS and NFS are good; CIFS and Ceph are not.  Other cache
     keyrings, such as idmapper keyrings, also need to set the domain tag.


Changes:

V2 fixes:
 - Missing initialisation of net key_domain usage count.
 - Missing barriering on the keyring register pointer.
 - Use snprintf() rather than sprintf().
 - Incorrect error handling in search_my_process_keyrings().
 - Incorrect error handling in call_sbin_request_key().

The patches can be found on the following branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-namespace

David
---
David Howells (11):
      keys: Invalidate used request_key authentication keys
      keys: Kill off request_key_async{,_with_auxdata}
      keys: Simplify key description management
      keys: Cache the hash value to avoid lots of recalculation
      keys: Add a 'recurse' flag for keyring searches
      keys: Namespace keyring names
      keys: Move the user and user-session keyrings to the user_namespace
      keys: Include target namespace in match criteria
      keys: Garbage collect keys for which the domain has been removed
      keys: Network namespace domain tag
      keys: Pass the network namespace into request_key mechanism


 Documentation/security/keys/core.rst     |   10 +
 certs/blacklist.c                        |    2 
 crypto/asymmetric_keys/asymmetric_type.c |    2 
 fs/afs/addr_list.c                       |    4 
 fs/afs/dynroot.c                         |    7 -
 fs/cifs/dns_resolve.c                    |    3 
 fs/nfs/dns_resolve.c                     |    2 
 include/linux/dns_resolver.h             |    3 
 include/linux/key-type.h                 |    3 
 include/linux/key.h                      |   50 ++++--
 include/linux/sched/user.h               |   14 --
 include/linux/user_namespace.h           |   12 +
 include/net/net_namespace.h              |    4 
 kernel/user.c                            |   10 -
 kernel/user_namespace.c                  |    9 -
 lib/digsig.c                             |    2 
 net/ceph/messenger.c                     |    3 
 net/core/net_namespace.c                 |   19 ++
 net/dns_resolver/dns_key.c               |    1 
 net/dns_resolver/dns_query.c             |    6 -
 net/rxrpc/key.c                          |    6 -
 net/rxrpc/security.c                     |    2 
 security/integrity/digsig_asymmetric.c   |    4 
 security/keys/gc.c                       |    2 
 security/keys/internal.h                 |   10 +
 security/keys/key.c                      |    9 +
 security/keys/keyctl.c                   |    4 
 security/keys/keyring.c                  |  263 +++++++++++++++++-------------
 security/keys/persistent.c               |   10 +
 security/keys/proc.c                     |    3 
 security/keys/process_keys.c             |  252 ++++++++++++++++++-----------
 security/keys/request_key.c              |  113 +++++++------
 security/keys/request_key_auth.c         |    3 
 33 files changed, 508 insertions(+), 339 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
