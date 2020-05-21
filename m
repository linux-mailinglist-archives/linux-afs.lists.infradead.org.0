Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC0B1DC732
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 08:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tum5tKZSl0o3NB77Spjk1bsAd+kaB1c+ts0XVIqLio4=; b=Y/ELIcGhuQHZvy
	M2+uYNPbWMnJjtQnkg2C7lH0ItFysDOh50hnlRK5FoIgMiImFZ/8iR5jIwoUG8C41ZTxxJ3CvaB4Y
	WwtTICbueunUZAJWdYXMxMlFQ5jm/pfsDf3n9zKhMnXoHZH43vupeluj08+Ec1tHo+OECHqOwntUE
	0ZA57MHVftTSeY6ZqfKFrvHvjD+gRDM+6zvgz8EWHtTwAFLm1FpeQ6u07VFOuap8pspGsiw6Bt/Jw
	/XPD2Jz5ZqcGSlgRLHEG18CRdpgVyo2efeBtIMd0xrR2mNfuqZvjIoZAZF7LSvbvBzzMCs2K/X76u
	UtLq4xEBcdS6sGMcphcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbf8X-0004FK-NJ; Thu, 21 May 2020 06:57:01 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbf8T-0004ET-Op
 for linux-afs@lists.infradead.org; Thu, 21 May 2020 06:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590044215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NEPsuI322n1SfGdGZ1bt40k2iNByP761ppUmMqLTrT4=;
 b=abs7UsFVACzy9aPZbHgU65fyqt2TXdneYaC+yZ1kvWph3tkjBPFV2xwC8M0aBg2eTxOj2P
 +07OZrKo7MOTe/XroEa/BqS0iUCNpHQJt4CZYkIomhyXmYxfTlKmDHMNlTOvCV2oEsO8Vm
 ws5RXBqNpQSLDNIwKaBDOVxo9S8BhSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-bpOhwA4xPfyJjo_ViOMyPg-1; Thu, 21 May 2020 02:56:46 -0400
X-MC-Unique: bpOhwA4xPfyJjo_ViOMyPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 235A580183C;
 Thu, 21 May 2020 06:56:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54C4E5D9CA;
 Thu, 21 May 2020 06:56:44 +0000 (UTC)
Subject: [PATCH net 0/3] rxrpc: Fix retransmission timeout and ACK discard
 [ver #2]
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 21 May 2020 07:56:43 +0100
Message-ID: <159004420353.66254.3034741691675793468.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_235657_887478_E9839990 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here are a couple of fixes and an extra tracepoint for AF_RXRPC:

 (1) Calculate the RTO pretty much as TCP does, rather than making
     something up, including an initial 4s timeout (which causes return
     probes from the fileserver to fail if a packet goes missing), and add
     backoff.

 (2) Fix the discarding of out-of-order received ACKs.  We mustn't let the
     hard-ACK point regress, nor do we want to do unnecessary
     retransmission because the soft-ACK list regresses.  This is not
     trivial, however, due to some loose wording in various old protocol
     specs, the ACK field that should be used for this sometimes has the
     wrong information in it.

 (3) Add a tracepoint to log a discarded ACK.

[V2] Fixed a "Fixes" line in a commit message.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20200520

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (1):
      rxrpc: Fix ack discard


 fs/afs/fs_probe.c            |  18 ++--
 fs/afs/vl_probe.c            |  18 ++--
 include/net/af_rxrpc.h       |   2 +-
 include/trace/events/rxrpc.h |  52 +++++++++---
 net/rxrpc/Makefile           |   1 +
 net/rxrpc/ar-internal.h      |  25 ++++--
 net/rxrpc/call_accept.c      |   2 +-
 net/rxrpc/call_event.c       |  22 ++---
 net/rxrpc/input.c            |  44 ++++++++--
 net/rxrpc/misc.c             |   5 --
 net/rxrpc/output.c           |   9 +-
 net/rxrpc/peer_event.c       |  46 ----------
 net/rxrpc/peer_object.c      |  12 +--
 net/rxrpc/proc.c             |   8 +-
 net/rxrpc/rtt.c              | 195 +++++++++++++++++++++++++++++++++++++++++++
 net/rxrpc/sendmsg.c          |  26 ++----
 net/rxrpc/sysctl.c           |   9 --
 17 files changed, 335 insertions(+), 159 deletions(-)
 create mode 100644 net/rxrpc/rtt.c



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
