Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 925381DF31A
	for <lists+linux-afs@lfdr.de>; Sat, 23 May 2020 01:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BnuDoOYDHae9xL0+clN6xrPIGohNcBrJPDN54zwjvM=; b=dncXFp7hYI0mKt
	q2bAPHiHIaXIL1wY5GVO1aao79Gw9mKhxdfJgKCFlS1b3hv3x1XNbCRxYx6bRT7+DCkwrvB4g3098
	sowy1QBtfPdY8TPBRj4k883KKYKeHzjsHS7P6MZih5hSiZY+gDj1ipMg/oue4UJzbKdVmOOZ6Ds2M
	SjKxDDImqrpNgPnS61E9M+sW4ryRGj7VHyxxC/3h0z8gngFy5GD6yPJeSmB2dPfm92XD0HTFgb17v
	xdVguHF9f+ICA/4RmZYE9nY6tXqpOcnbCBU6ztRV9HV+4uBnAumDiELcDDsHd3IyEZh9SNsQKnTsX
	JtuC3dKuLzYA/SbeswhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcHJL-0000FI-Je; Fri, 22 May 2020 23:42:43 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcHJJ-0000Ew-30
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 23:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590190959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mbvdctjClQbp0Jrz489CT4trpZjcuEg4KIRu2UYcXZ4=;
 b=cTfr9Cu40m29y3cf0CkOst67DqeNXK1QixaIFeqg26nm4Wz2zfIWZhc0HQ5e2SjFf0yclb
 xqN5xuC4h6qe0KcA5uJ+udahCHcyPCOGWq1NIrUS8HbRWD4DiR6eilC65ED6X786uojYSe
 sXFFYNTuFUA+oE+t4FqIw0kUIzOZUAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-j7pi3hFmOI2JIEubdNxo2g-1; Fri, 22 May 2020 19:42:35 -0400
X-MC-Unique: j7pi3hFmOI2JIEubdNxo2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55DD680183C;
 Fri, 22 May 2020 23:42:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BCA060BE2;
 Fri, 22 May 2020 23:42:32 +0000 (UTC)
Subject: [PATCH net 0/2] rxrpc: Fix a warning and a leak [ver #2]
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Sat, 23 May 2020 00:42:32 +0100
Message-ID: <159019095229.999797.5088700147400532632.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_164241_203096_82EC2613 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
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
Cc: dhowells@redhat.com, Markus Elfring <Markus.Elfring@web.de>,
 linux-afs@lists.infradead.org, Qiushi Wu <wu000273@umn.edu>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


Here are a couple of fixes for AF_RXRPC:

 (1) Fix an uninitialised variable warning.

 (2) Fix a leak of the ticket on error in rxkad.

The patches are tagged here:

	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	rxrpc-fixes-20200523-v2

and can also be found on the following branch:

	http://git.kernel.org/cgit/linux/kernel/git/dhowells/linux-fs.git/log/?h=rxrpc-fixes

David
---
Qiushi Wu (1):
      rxrpc: Fix a memory leak in rxkad_verify_response()


 fs/afs/fs_probe.c | 2 +-
 net/rxrpc/rxkad.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
