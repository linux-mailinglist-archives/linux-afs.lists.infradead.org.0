Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD32A18E826
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ataS+KNGFsf0ZaG8eoV6eD4hNJ8/MbphLflmRX9mvoA=; b=RCO
	8x3hk5CW+xQPoMQOHxfG7Br2GYzL4BEGtRmAVnoUCw++n3awIPpJ61UicCrIbWa9XqlAUNI4bhw0S
	3PFnOrK7Y0vEIP1lPF0BVSD00a808/bnbBFNVroEDn4AnkMMlvrScJsbbJhfsuSaSVE1XAcP7SiBN
	+N+aONQ1eRV2Aw0BkQ4doWWQjRaQmuIquvKBBHWQsQJ9nHNTh2WAcmRE/H1CV1yWv1jzoPD4lnq60
	JahIftXtHXGiQIgl2OHHtcmDJi4OHohJXm7qok8l1MTqVhVZKKaDl2wnVjrIXoj526BObbRYGkfL4
	HA4NXHQKFGkP05+d9J2+xAbbZkdf7Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHg-0004kN-7n; Sun, 22 Mar 2020 10:56:48 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFNAw-0002UY-IT
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 19:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584731960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=+XPAoEW7/aQaCwyJ8m3ZuKBIeslANj/gOeGSexPCoFw=;
 b=MEUKUQz+efL/K3p2uNXO2qwssFgszpj+WlJbANDS8cTCtb0avnVElupOk+AhOoAQ05zLo8
 bgFgfwB8APhzIxMX8J98YKTOeqisa2BxuejfdMVgYynt/sbswpMJInHeTzATKM/5DngpLO
 RSf5jVaq+RTG78axeDX7LnHV52NO4o8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-VH2bTlNsPcqN0b-3DN_dRw-1; Fri, 20 Mar 2020 15:19:18 -0400
X-MC-Unique: VH2bTlNsPcqN0b-3DN_dRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C472CDB61;
 Fri, 20 Mar 2020 19:19:15 +0000 (UTC)
Received: from llong.com (ovpn-118-190.rdu2.redhat.com [10.10.118.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D91BF7E301;
 Fri, 20 Mar 2020 19:19:09 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v6 0/2] KEYS: Read keys to internal buffer & then copy to
 userspace
Date: Fri, 20 Mar 2020 15:19:01 -0400
Message-Id: <20200320191903.19494-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_121922_691093_E619959C 
X-CRM114-Status: GOOD (  10.25  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Sun, 22 Mar 2020 03:56:45 -0700
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Chris von Recklinghausen <crecklin@redhat.com>,
 Eric Biggers <ebiggers@google.com>, netdev@vger.kernel.org,
 Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, Waiman Long <longman@redhat.com>,
 linux-integrity@vger.kernel.org, linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

v6:
 - Make some variable name changes and revise comments as suggested by
   Jarkko. No functional change from v5.

v5:
 - Merge v4 patches 2 and 3 into 1 to avoid sparse warning. Merge some of 
   commit logs into patch 1 as well. There is no further change.

v4:
 - Remove the __user annotation from big_key_read() and user_read() in
   patch 1.
 - Add a new patch 2 to remove __user annotation from rxrpc_read().
 - Add a new patch 3 to remove __user annotation from dns_resolver_read().
 - Merge the original patches 2 and 3 into a single patch 4 and refactor
   it as suggested by Jarkko and Eric.

v3:
 - Reorganize the keyctl_read_key() code to make it more readable as
   suggested by Jarkko Sakkinen.
 - Add patch 3 to use kvmalloc() for safer large buffer allocation as
   suggested by David Howells.

v2:
 - Handle NULL buffer and buflen properly in patch 1.
 - Fix a bug in big_key.c.
 - Add patch 2 to handle arbitrary large user-supplied buflen.

The current security key read methods are called with the key semaphore
held.  The methods then copy out the key data to userspace which is
subjected to page fault and may acquire the mmap semaphore. That can
result in circular lock dependency and hence a chance to get into
deadlock.

To avoid such a deadlock, an internal buffer is now allocated for getting
out the necessary data first. After releasing the key semaphore, the
key data are then copied out to userspace sidestepping the circular
lock dependency.

The keyutils test suite was run and the test passed with these patchset
applied without any falure.

Waiman Long (2):
  KEYS: Don't write out to userspace while holding key semaphore
  KEYS: Avoid false positive ENOMEM error on key read

 include/keys/big_key-type.h               |  2 +-
 include/keys/user-type.h                  |  3 +-
 include/linux/key-type.h                  |  2 +-
 net/dns_resolver/dns_key.c                |  2 +-
 net/rxrpc/key.c                           | 27 +++-----
 security/keys/big_key.c                   | 11 ++-
 security/keys/encrypted-keys/encrypted.c  |  7 +-
 security/keys/internal.h                  | 12 ++++
 security/keys/keyctl.c                    | 84 ++++++++++++++++++++---
 security/keys/keyring.c                   |  6 +-
 security/keys/request_key_auth.c          |  7 +-
 security/keys/trusted-keys/trusted_tpm1.c | 14 +---
 security/keys/user_defined.c              |  5 +-
 13 files changed, 114 insertions(+), 68 deletions(-)

-- 
2.18.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
