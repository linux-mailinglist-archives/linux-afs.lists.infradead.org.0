Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9D1F6F05
	for <lists+linux-afs@lfdr.de>; Thu, 11 Jun 2020 22:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bsEeDSy4KMz/x4gJzY0PH9e0H9bjgE+vvWEO4BFZWtk=; b=rNy6JWSCqy/Rgf
	87Bw9rHsDwLMuBuzrqCDOh7dj/mLvoiMGtDQ5bl7y9zQ+smaP/Im66jHRXp3kexzqQgoiMB4HHCNw
	sdV0yvtigz4O5+Bfszp/9Dw9DEmZ04mOtZV1E79oWzU/A4qgtJcnk1Z+gTlMZRja1UVBdzEX9KN9+
	rAGbRNAEzkBPXE7N3qbQedrjTXycuHkADhZunqs6WOUTBQWEYwB82jYGkoKtcO6s78Tw+4mJBaRH1
	B+CqrRU0DUzkLjpGcFU6ZkcKbaYwx2pe/2NGJCx4QrSE9M0xxBZYTokYtTKN3Nue7yBVMHH1srLe3
	ZrJZsZ4hSxNlaex6FsOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjU9l-0002fa-7X; Thu, 11 Jun 2020 20:50:37 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjU9k-0002f7-GS
 for linux-afs@bombadil.infradead.org; Thu, 11 Jun 2020 20:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=WiqAKX8M8YviG7Tbo/GYvrzXUaaZrl2SYDgy+2zqrSA=; b=NxitkO/MtyttPJRSFI8wTHbPs0
 TLoUZcyVvlUbSM8l2RV+yIKgRHYwiNM3dq3tWEK7xhW3bCIpXibGlRXTRJF8mUbegtd8G+dBwjb9H
 awWbJtMlqJDNphb3nGm5ZjOcIYLZ/PkC2cBLVAVvQ+rHJ/sKUPAiI5+Jd7WSeWqZbtsgOVMJJrHi6
 mZU7Ei07Fny+7TmqfAtET5rfqEBJdeQSc1hO1nwU7VeZwDi+wd+JhoRN9hsKXrJYlW2/imcKU6DQ9
 WS7pyfpuIJAWfy4i5pPaha8ixv6u6RbpkY3MbWKkqJjNZnjF1Zi6lL5Re8AcaWnDZmKtmEISuTP0q
 c81A8cSQ==;
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjU9i-0001Zk-2y
 for linux-afs@lists.infradead.org; Thu, 11 Jun 2020 20:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591908629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WiqAKX8M8YviG7Tbo/GYvrzXUaaZrl2SYDgy+2zqrSA=;
 b=c09D4NeW9LYluLqx1+49DKvekcqRkkD1UFsJbSG/YFaVNiqdEr9H6B3d/ER8c+Gj6wMSsY
 oLw5uUhyGOgBu/761SmwOXS/rxwH62nEKzkrj2aQc4k+PEvict8qtMCaOs1sEykCleAxgp
 75t0H4CQNI9AtHUl9XqrijKtqQ9p904=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591908632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WiqAKX8M8YviG7Tbo/GYvrzXUaaZrl2SYDgy+2zqrSA=;
 b=cx4ZlkJ+eoISmx4w0Sh00wZIsEneXLqraQVSpGLMVa7aj7e4uVKl/NFgUoKfbEQ9Nr52FC
 U8TWWD18vRKerRLLuvd1KnS8GUhTlqv/alNw9iRvxmMet9yUP3QseIUImj4WWJI+1HtjMo
 xod5/GBt99bX9vLn/VkOfgUGOLWrPVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Wxgoyl3SPIi3Trf1vTxaBw-1; Thu, 11 Jun 2020 16:50:28 -0400
X-MC-Unique: Wxgoyl3SPIi3Trf1vTxaBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B711683DB79;
 Thu, 11 Jun 2020 20:50:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79E8F7B5FB;
 Thu, 11 Jun 2020 20:50:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Fix afs_store_data() to set mtime in new operation
 descriptor
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Thu, 11 Jun 2020 21:50:24 +0100
Message-ID: <159190862462.3556446.3460202501713546446.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix afs_store_data() so that it sets the mtime in the new operation
descriptor otherwise the mtime on the server gets set to 0 when a write is
stored to the server.

Fixes: e49c7b2f6de7 ("afs: Build an abstraction around an "operation" concept")
Reported-by: Dave Botsch <botsch@cnf.cornell.edu>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/write.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 97bccde3298b..768497f82aee 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -447,6 +447,7 @@ static int afs_store_data(struct address_space *mapping,
 	op->store.last = last;
 	op->store.first_offset = offset;
 	op->store.last_to = to;
+	op->mtime = vnode->vfs_inode.i_mtime;
 	op->ops = &afs_store_data_operation;
 
 try_next_key:



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
