Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE21F405B
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 18:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Njf/oJozBUxkBLq7bdapQzDGBzoUJEmnngj8JVdxgJg=; b=iydMGTJPch5Vwk
	Do94GpZJ2Vv+QATBnThIoqHSTEeKAD733ogc8Mwyo9bNFjy9++ECNO7qsBtmXBtauw0jnujvd3K0N
	KSLgs1gSyh1nGbXwSeFoTEoYe8Wwvjyvmges7sDZzFhNVF1KRRO7Fda4prsHYppSI7utislJ1Irc2
	gRV+u/awfJGSjnU2ojJ96ETt1D1CKdHKuTWN0FzxVI7AJNkI/ceMH649pBSn0ctiqoZohV+Ofs0BO
	NDvhM/ZQ8pcubyCBeKaHdqHJScDf89TOXVvBVj0rY4dK/UPxI4NKAhZkB2EV5fqrB3RivaX7V+mTq
	uhAHJSm+mAg5M6OgTGXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigsG-0000FO-01; Tue, 09 Jun 2020 16:13:16 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigsB-0000AY-Tp
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 16:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591719190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zKpZ5M/MSa2zdVQ4na34JwJsQBn+q9VK2DDsUPbUPUo=;
 b=OmyJp/y0hgTRBTQRFF3y4rgmvUt85RdrnxT5m92zQZK7VGu80v6/Ih616UF8X2lsiRZBz+
 ra95iwC3/MvFnZIR2k5VCZeUcKGllOmnECTTcO3jg0VTG+WMIY8nqlv6YtXEIXy5hjLIYR
 m63nhYtpqhP3lPuJmLCQZRIDNR9PCGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-BuP0OuJvPSufYfpqo3GjTQ-1; Tue, 09 Jun 2020 12:13:08 -0400
X-MC-Unique: BuP0OuJvPSufYfpqo3GjTQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E0DA464;
 Tue,  9 Jun 2020 16:13:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6A751001281;
 Tue,  9 Jun 2020 16:13:05 +0000 (UTC)
Subject: [PATCH 0/6] afs: Fixes
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 09 Jun 2020 17:13:05 +0100
Message-ID: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_091312_199133_503163C8 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here's a set of patches to fix some things, most of them minor.

 (1) Fix a memory leak in afs_put_sysnames().

 (2) Fix an oops in AFS file locking.

 (3) Fix new use of BUG().

 (4) Fix debugging statements containing %px.

 (5) Remove afs_zero_fid as it's unused.

 (6) Make afs_zap_data() static.

David
---
David Howells (1):
      afs: Make afs_zap_data() static


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
