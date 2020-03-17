Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B302189664
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 08:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4odY7UShbyJfntMLaXMlSuu8NleYAEvoamNRk3qi5Ac=; b=afp
	NT3Cwm2ElJIOV0m/rQ/SL0J/KucbGBIyy6Cs9tJQXQfewbeTagRjihp+1sMn87mm9YHPxnMerYK7i
	61kGmbMPsHughRXToQSjq4t9DvIkJJAkHHsRgb8Z63wHrXBwmpzEZ5QrMsTqrFDEn1RSs68kdeHzp
	+78jjC7BS3XdTuYdKpL/i8d5YN72OKbifXUZ5F0x9PsPE61d9gdOpalB2CE7d5lIm/sl9fX988uxy
	cyaFL4M9BsRsSmTnCkGvDOihA6dPv9fIH02XL+3CC9Yv9gzMQwUd+SVZzcLG8Eohla8tdcDVU95hI
	iYWTEhkbRaxLov4sgejssazJNX+LNQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETaI-0002MV-DT; Wed, 18 Mar 2020 07:57:50 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7E-0008WQ-5G
 for linux-afs@bombadil.infradead.org; Tue, 17 Mar 2020 19:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1fFQOEoei54nx8OzjJR+NcuP/thiJUDry70cCne9lJ0=; b=VP0I+Wq0JfDAGl9/a+yg7JYut+
 V6hlxR23eg7HjzZS2E1IMNgIkVynv9boyRr7JEt3B/NDxKXXvM+CmhHbdf0IoZsaP8pk5nF0YNgUt
 A1/A+fJoYkcDt6DXU+2rQvvviyuSjuLwwkcTIb3AYvxDISdxtNUShkL4QkvVLWjNJfly0MuV8NUl/
 /Xd+/QVDtGL2dX+KlOqTBiKu9zI0Kb0bSHqpLI9qK1mQIHCgFvoK+vXJFsxAFyX+y1st3pTkIHJvE
 6lcuyTVlr7W0lhn/47o0RrGYAZIWSUD/uQUab0MmJ2KXeFmu5WWIM2waWSTujuE0t9TpQnYdfAG9q
 AjEU6PBA==;
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7B-00005G-TF
 for linux-afs@lists.infradead.org; Tue, 17 Mar 2020 19:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584474160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=1fFQOEoei54nx8OzjJR+NcuP/thiJUDry70cCne9lJ0=;
 b=gO/vNSzQUcs2pQ7iCWXVHRPppZq6lu/indF2rUIxMfDK4Ml+Q0al0iL7vlm3xcJEFmgdBC
 EidnTnMxuVvY2pxJCebzyxH3NcFv4gS+SEIxk9Vo/+PRQJlqw1UGyF+1dBT5aX+XrzqTjk
 UJPDAQ1Ul9VZQjCYs+oSqSkqFSbVnis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-x4VM4dJDOzCifI5d55Tjjg-1; Tue, 17 Mar 2020 15:42:38 -0400
X-MC-Unique: x4VM4dJDOzCifI5d55Tjjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A4F6107ACCA;
 Tue, 17 Mar 2020 19:42:36 +0000 (UTC)
Received: from llong.com (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70EDD10002AB;
 Tue, 17 Mar 2020 19:42:26 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v4 0/4] KEYS: Read keys to internal buffer & then copy to
 userspace
Date: Tue, 17 Mar 2020 15:41:36 -0400
Message-Id: <20200317194140.6031-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Wed, 18 Mar 2020 00:57:49 -0700
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

Waiman Long (4):
  KEYS: Don't write out to userspace while holding key semaphore
  KEYS: Remove __user annotation from rxrpc_read()
  KEYS: Remove __user annotation from dns_resolver_read()
  KEYS: Avoid false positive ENOMEM error on key read

 include/keys/big_key-type.h               |  2 +-
 include/keys/user-type.h                  |  3 +-
 include/linux/key-type.h                  |  2 +-
 net/dns_resolver/dns_key.c                |  2 +-
 net/rxrpc/key.c                           | 27 +++----
 security/keys/big_key.c                   | 11 ++-
 security/keys/encrypted-keys/encrypted.c  |  7 +-
 security/keys/internal.h                  | 12 ++++
 security/keys/keyctl.c                    | 86 ++++++++++++++++++++---
 security/keys/keyring.c                   |  6 +-
 security/keys/request_key_auth.c          |  7 +-
 security/keys/trusted-keys/trusted_tpm1.c | 14 +---
 security/keys/user_defined.c              |  5 +-
 13 files changed, 116 insertions(+), 68 deletions(-)

-- 
2.18.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
