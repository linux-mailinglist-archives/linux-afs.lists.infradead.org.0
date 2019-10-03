Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559CCA5A3
	for <lists+linux-afs@lfdr.de>; Thu,  3 Oct 2019 18:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1tHffFCX8iTVGsZWyk4cPfmNN3APupojxOhiMvCrUhY=; b=YujYUjsPZxb0yE
	ZNAbAbmLDm+FPwWs8bIoQnGEZH5uU+b5sbpJc94UgjVJ/+MBXVElk1aa8EhptQmm5vxmb3B/l40bh
	EkbASoabAjryvVVIFNa7iHMZ3hfL8N2imtfwVK5voflLjh/JDUdEocTLyVzew15YmDl0BcO/GOVJX
	zdSTdVwt+ZkL6wLArl7zMDWei8ahfwFX6wBdmfPWbGfrZFJElbDJjolsO8H8swW02V7UI5uKxD+WJ
	DmUGHM1XlaYdmsJUGeVqr2bNKAyrEmdFgUVXpBCclT1w4TCVOi7ohWW113fIqIF17+aRYGz7eGW7D
	WLCnX/s2KcN0eILyU9sA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iG4Dj-0008Fz-Nt; Thu, 03 Oct 2019 16:44:51 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iG4Dg-0008EX-HI
 for linux-afs@lists.infradead.org; Thu, 03 Oct 2019 16:44:50 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7447E8830A;
 Thu,  3 Oct 2019 16:44:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D3AD5D9E1;
 Thu,  3 Oct 2019 16:44:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net] rxrpc: Fix rxrpc_recvmsg tracepoint
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 03 Oct 2019 17:44:44 +0100
Message-ID: <157012108434.20904.8998254800982940866.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 03 Oct 2019 16:44:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_094448_598766_B0A3BB82 
X-CRM114-Status: GOOD (  13.64  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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

Fix the rxrpc_recvmsg tracepoint to handle being called with a NULL call
parameter.

Fixes: a25e21f0bcd2 ("rxrpc, afs: Use debug_ids rather than pointers in traces")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/trace/events/rxrpc.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index a13a62db3565..edc5c887a44c 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -1068,7 +1068,7 @@ TRACE_EVENT(rxrpc_recvmsg,
 			     ),
 
 	    TP_fast_assign(
-		    __entry->call = call->debug_id;
+		    __entry->call = call ? call->debug_id : 0;
 		    __entry->why = why;
 		    __entry->seq = seq;
 		    __entry->offset = offset;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
