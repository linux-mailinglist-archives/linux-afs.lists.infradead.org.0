Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7001FECDC
	for <lists+linux-afs@lfdr.de>; Thu, 18 Jun 2020 09:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nH/tfMXd/FS3Z5eBvfZ/wcf+rS7VyMoTnAuGadhju5k=; b=CSxdm921838iSC
	ssQE5UsS/LjHxuwBnIY3Vsum15+XrUdqyC6bQKXlVtEHvNAi1tKRieb23KlwdW0CjNqT4FFnissgc
	aovLda8keaygCOllht63I8fgrggBDagFdnkM+KQ8FfyB2ogLV1czgk9WCFpUjCfxUJvSOpmZhLwTr
	kIEZ8VNg4/x3mfi3zItzOti4xnzmYqtbEIEShis3WaImntoFPslaQ8wgcxeEaKAK7pMkLYaINSBXG
	ajvAEtlazV4Qn8A9o1tmyPIgWevbVicIUJvF5ZDAhUquzytq4MmWOcbuIXZC8nWbqaQbOHIQCgM9R
	bkIvgMI7y3C5iP1gZfUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlpJe-0005E8-LH; Thu, 18 Jun 2020 07:50:30 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlpJc-0005Cp-B3
 for linux-afs@lists.infradead.org; Thu, 18 Jun 2020 07:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592466627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2A/jxBVRlCvpxw6KvcEULNQ+siheljXGsGau8ZdJbAc=;
 b=djXs8GFyMjHPVQyyx6TdshGLJCt7iL5zqgKaOiGZrRKbYxQBCb19aRMHdxhVURXQypoJ8C
 n+8JsCP/yj9yOGK6PzpFKZmHTwOh/R3bWqw1X9d5DZmVgfTPc19PoernBlFMXA0LxoWkTT
 4N/HUdBR6bcqxzcetmiYu8QZiM0OitY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-hj4D8fq7McKLaUjgsK-eBQ-1; Thu, 18 Jun 2020 03:50:25 -0400
X-MC-Unique: hj4D8fq7McKLaUjgsK-eBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2BC98018A2;
 Thu, 18 Jun 2020 07:50:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6E961C4;
 Thu, 18 Jun 2020 07:50:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 1/3] rxrpc: Fix trace string
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 18 Jun 2020 08:50:22 +0100
Message-ID: <159246662205.1229328.12018907148087778303.stgit@warthog.procyon.org.uk>
In-Reply-To: <159246661514.1229328.4419873299996950969.stgit@warthog.procyon.org.uk>
References: <159246661514.1229328.4419873299996950969.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_005028_462758_612873D2 
X-CRM114-Status: GOOD (  11.93  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
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

The trace symbol printer (__print_symbolic()) ignores symbols that map to
an empty string and prints the hex value instead.

Fix the symbol for rxrpc_cong_no_change to " -" instead of "" to avoid
this.

Fixes: b54a134a7de4 ("rxrpc: Fix handling of enums-to-string translation in tracing")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/trace/events/rxrpc.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/trace/events/rxrpc.h b/include/trace/events/rxrpc.h
index ba9efdc848f9..059b6e45a028 100644
--- a/include/trace/events/rxrpc.h
+++ b/include/trace/events/rxrpc.h
@@ -400,7 +400,7 @@ enum rxrpc_tx_point {
 	EM(rxrpc_cong_begin_retransmission,	" Retrans") \
 	EM(rxrpc_cong_cleared_nacks,		" Cleared") \
 	EM(rxrpc_cong_new_low_nack,		" NewLowN") \
-	EM(rxrpc_cong_no_change,		"") \
+	EM(rxrpc_cong_no_change,		" -") \
 	EM(rxrpc_cong_progress,			" Progres") \
 	EM(rxrpc_cong_retransmit_again,		" ReTxAgn") \
 	EM(rxrpc_cong_rtt_window_end,		" RttWinE") \



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
