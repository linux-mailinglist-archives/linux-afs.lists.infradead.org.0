Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB241FECDB
	for <lists+linux-afs@lfdr.de>; Thu, 18 Jun 2020 09:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1eVTAEoVPUtZSbmRlX4WdzGuIgXVhAT6QntvniqK/Ms=; b=YpOXJAjsSptL3A
	IuFMO4W+QSK9E23+yc5VpOIbJkMpoyXjZRlOmPVBzP5pVTaGI1wTLfOSKnUDwhwNnElrh28g5fWFn
	G82PTg+m/LuJDpAQnGCtBT4SR0A1t4+wpISiqyUjFrksir02xz8KkWdtIYQCHY2jZ8NTNxQmMjTOM
	Dsnl8IIHZoICYCdjzKXnfP+lSpo/BDPlrm8OqqAhgM7l2XBuLigM7AtdXY+GxiKldI8et4Qn/vpzf
	e0ULwkQUCCSOT7CVLA8VQqBdFh0rrl6KEvtzIhFe95wIroo3AkmqbCe+rhv37r/hvJlh4FC3yA9j6
	+74rhiOoabEb15zFhA4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlpJc-0005Cq-AX; Thu, 18 Jun 2020 07:50:28 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlpJY-0005C3-Ii
 for linux-afs@lists.infradead.org; Thu, 18 Jun 2020 07:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592466621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PDcgiaJNLiWYXI7v/eZt6zw/T0PDPCuZ8sjZurKJ94s=;
 b=S+sNhKyrdQrWXH1W/PoKEUyNCXTEV7oqiVTK7sNmmbXEklIdW+wqEVmg8VI6WJ6z7y2iSj
 X0YqmE/lkmvbcSATi5NACCFwnY0w9c+Fi0/ZOZYClFHgU21UhR2nwELkZaXTc/Drz6tgc9
 H80kK2394XrTYOvTxABSeIkXy9Ib51U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-gLG1G5RDM5C1hDqEODsWjQ-1; Thu, 18 Jun 2020 03:50:17 -0400
X-MC-Unique: gLG1G5RDM5C1hDqEODsWjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8A601883607;
 Thu, 18 Jun 2020 07:50:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECD401C4;
 Thu, 18 Jun 2020 07:50:15 +0000 (UTC)
Subject: [PATCH net 0/3] rxrpc: Performance drop fix and other fixes
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 18 Jun 2020 08:50:15 +0100
Message-ID: <159246661514.1229328.4419873299996950969.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_005024_693644_AC3DC093 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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


Here are three fixes for rxrpc:

 (1) Fix a trace symbol mapping.  It doesn't seem to let you map to "".

 (2) Fix the handling of the remote receive window size when it increases
     beyond the size we can support for our transmit window.

 (3) Fix a performance drop caused by retransmitted packets being
     accidentally marked as already ACK'd.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20200618

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
David Howells (1):
      rxrpc: Fix afs large storage transmission performance drop


 include/trace/events/rxrpc.h | 2 +-
 net/rxrpc/call_event.c       | 2 +-
 net/rxrpc/input.c            | 7 +++----
 3 files changed, 5 insertions(+), 6 deletions(-)



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
