Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F12811F
	for <lists+linux-afs@lfdr.de>; Thu, 23 May 2019 17:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/izv8iGvjamS8XRQIdd9l5Z+7GuDINIAIl/fqD66rkM=; b=Dk5GfSv2oceISs
	fnBTVSfIRdJso3FKsn7dddrP/j21K4j4K5XvI2MGbbgcV+djvmUr7JCRkWjU7mMMypQrKvsFPrKFX
	LVL5MpvmV9xityLZEHiUAWQXrgykUXpwjtQVpubYYoAF2l3+5BSc9N136rn++ZB45YcwIJqv5YIeX
	7ECEkAoQyheoG2LSt+4TpN+DUFlq0kxl6I0GRnC0ofV4yz3i88eE0yGM1ncnwISA6tOrpuACZVHJR
	Ucl45fhYCNYIYe2kbnuOIIbSFNGe2XiWgwxmNtVaovf/4HltDbiS1mbwcawCZwHAO17uKc6j4aZSy
	/1Hs6GZRWjBjJTpoyC8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTpcK-0004hY-H8; Thu, 23 May 2019 15:26:52 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTpTh-0001ip-51
 for linux-afs@lists.infradead.org; Thu, 23 May 2019 15:17:58 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7AFBB63162;
 Thu, 23 May 2019 15:17:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com
 [10.10.121.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9CDA1001E82;
 Thu, 23 May 2019 15:17:48 +0000 (UTC)
Subject: [PATCH 0/9] keys: Namespacing [ver #3]
From: David Howells <dhowells@redhat.com>
To: ebiederm@xmission.com
Date: Thu, 23 May 2019 16:17:47 +0100
Message-ID: <155862466770.15244.16038372267332150004.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 23 May 2019 15:17:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_081757_229878_80693BE9 
X-CRM114-Status: GOOD (  16.11  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Mailman-Approved-At: Thu, 23 May 2019 08:26:51 -0700
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

 (1) Simplify key index_key handling so that the word-sized chunks
     assoc_array requires don't have to be shifted about, making it easier
     to add more bits into the key.

 (2) Cache the hash value in the key so that we don't have to calculate on
     every key we examine during a search (it involves a bunch of
     multiplications).

 (3) Allow keying_search() to search non-recursively.

Then the main patches:

 (4) Make it so that keyring names are per-user_namespace from the point of
     view of KEYCTL_JOIN_SESSION_KEYRING so that they're not accessible
     cross-user_namespace.

 (5) Move the user and user-session keyrings to the user_namespace rather
     than the user_struct.  This prevents them propagating directly across
     user_namespaces boundaries (ie. the KEY_SPEC_* flags will only pick
     from the current user_namespace).

 (6) Make it possible to include the target namespace in which the key shall
     operate in the index_key.  This will allow the possibility of multiple
     keys with the same description, but different target domains to be held
     in the same keyring.

 (7) Make it so that keys are implicitly invalidated by removal of a domain
     tag, causing them to be garbage collected.

 (8) Institute a network namespace domain tag that allows keys to be
     differentiated by the network namespace in which they operate.  New keys
     that are of a type marked 'KEY_TYPE_NET_DOMAIN' are assigned the network
     domain in force when they are created.

 (9) Make it so that the desired network namespace can be handed down into the
     request_key() mechanism.  This allows AFS, NFS, etc. to request keys
     specific to the network namespace of the superblock.

     This also means that the keys in the DNS record cache are thenceforth
     namespaced, provided network filesystems pass the appropriate network
     namespace down into dns_query().

     For DNS, AFS and NFS are good; CIFS and Ceph are not.  Other cache
     keyrings, such as idmapper keyrings, also need to set the domain tag -
     for which they need access to the network namespace of the superblock.

The patches can be found on the following branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-namespace

David
---
David Howells (9):
      keys: Simplify key description management
      keys: Cache the hash value to avoid lots of recalculation
      keys: Add a 'recurse' flag for keyring searches
      keys: Namespace keyring names
      keys: Move the user and user-session keyrings to the user_namespace
      keys: Include target namespace in match criteria
      keys: Garbage collect keys for which the domain has been removed
      keys: Network namespace domain tag
      keys: Pass the network namespace into request_key mechanism


 Documentation/security/keys/core.rst        |   38 +++-
 Documentation/security/keys/request-key.rst |   29 ++-
 certs/blacklist.c                           |    2 
 crypto/asymmetric_keys/asymmetric_type.c    |    2 
 fs/afs/addr_list.c                          |    4 
 fs/afs/dynroot.c                            |    8 +
 fs/cifs/dns_resolve.c                       |    3 
 fs/nfs/dns_resolve.c                        |    3 
 fs/nfs/nfs4idmap.c                          |    2 
 include/linux/dns_resolver.h                |    3 
 include/linux/key-type.h                    |    3 
 include/linux/key.h                         |   81 ++++++++
 include/linux/sched/user.h                  |   14 -
 include/linux/user_namespace.h              |   12 +
 include/net/net_namespace.h                 |    3 
 kernel/user.c                               |    8 -
 kernel/user_namespace.c                     |    9 -
 lib/digsig.c                                |    2 
 net/ceph/messenger.c                        |    3 
 net/core/net_namespace.c                    |   19 ++
 net/dns_resolver/dns_key.c                  |    1 
 net/dns_resolver/dns_query.c                |    7 +
 net/rxrpc/key.c                             |    6 -
 net/rxrpc/security.c                        |    2 
 security/integrity/digsig_asymmetric.c      |    4 
 security/keys/gc.c                          |    2 
 security/keys/internal.h                    |   10 +
 security/keys/key.c                         |    5 -
 security/keys/keyctl.c                      |    4 
 security/keys/keyring.c                     |  263 +++++++++++++++------------
 security/keys/persistent.c                  |   10 +
 security/keys/proc.c                        |    3 
 security/keys/process_keys.c                |  262 +++++++++++++++++----------
 security/keys/request_key.c                 |   62 ++++--
 security/keys/request_key_auth.c            |    3 
 35 files changed, 583 insertions(+), 309 deletions(-)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
