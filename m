Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF61A27C1
	for <lists+linux-afs@lfdr.de>; Wed,  8 Apr 2020 19:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7YLIZSvoyItxVvzHADMkxY1BnB3nJhA9ND58RSbyoU=; b=cTsBBgolELVbyQ
	9Rlljr39c88qK5yAS01xxh3yUhh+MkbmVMidk7QwbsiMWPhlj1cxbk2yEL7d0K9ju8Na3AgKxmAqg
	NfXAen2ExdlW8EWv17BF7PsfLbmp5nxlVB/69d8oR7+glyKmqH0NU4bgG7aOMIwVuW88qVr5M1bbq
	z1wtwINhRoe5NDjSB9VJMM/lef59YBmIRJRq/kKx3RSj2iRBf3Eb6g64R3mpoEyQMAYtadN0NZwLm
	9pzjD4oN9BFhIQVfcvzz8vBzasQTZ9Asy9Aw2SR6l3wzJfBiisfuVgWpQ2KhGw9xB/ep3LDhmr08p
	REZOAzzAmIlJn3yqjckg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMED5-0001oE-WB; Wed, 08 Apr 2020 17:09:56 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMED3-0001lK-Bv
 for linux-afs@lists.infradead.org; Wed, 08 Apr 2020 17:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586365792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yq2Ntbf2pJpk3GCbzlSWRmdJ4UPso8yJqcoAHIIEBy0=;
 b=dCgmLvo4BJdQiACBoW8P2U3P4SWu86qh8qvuV8ZRFt4uMrjVP30F08maDllJh3i9EOrQ1h
 CnK5WWSgr6+TRuB+FnlfByMxm1m2h5UASptO9SIhs9aR6dsuuIiKUqS7NzPH+UdKVPWHAV
 H29g+GjfmgudyHTf/rkAY3jtdfqaU2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-VDEJ_cYtP5KXW6lW_vIwwQ-1; Wed, 08 Apr 2020 13:09:49 -0400
X-MC-Unique: VDEJ_cYtP5KXW6lW_vIwwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5B8A18B9FED;
 Wed,  8 Apr 2020 17:09:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com
 [10.10.112.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24B89C0DA0;
 Wed,  8 Apr 2020 17:09:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/2] afs: Fix decoding of inline abort codes from version 1
 status records
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Wed, 08 Apr 2020 18:09:47 +0100
Message-ID: <158636578742.1104632.12892775634608777729.stgit@warthog.procyon.org.uk>
In-Reply-To: <158636578058.1104632.13067508192406964998.stgit@warthog.procyon.org.uk>
References: <158636578058.1104632.13067508192406964998.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_100953_478280_633733AA 
X-CRM114-Status: GOOD (  12.32  )
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, marc.dionne@auristor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

If we're decoding an AFSFetchStatus record and we see that the version is 1
and the abort code is set and we're expecting inline errors, then we store
the abort code and ignore the remaining status record (which is correct),
but we don't set the flag to say we got a valid abort code.

Fix this to indicate the reception of a valid abort code.

Fixes: a38a75581e6e ("afs: Fix unlink to handle YFS.RemoveFile2 better")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fsclient.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index fae73e13976a..de4331670c84 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -88,6 +88,7 @@ static int xdr_decode_AFSFetchStatus(const __be32 **_bp,
 
 	if (abort_code != 0 && inline_error) {
 		status->abort_code = abort_code;
+		scb->have_error = true;
 		goto good;
 	}
 



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
