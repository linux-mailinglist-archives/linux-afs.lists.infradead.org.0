Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 110321FECDD
	for <lists+linux-afs@lfdr.de>; Thu, 18 Jun 2020 09:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDyjXK9HpVlIY/UaCA4TvYJf32GEfWLhosUQ6se0Jr8=; b=Nr1C1NeRCpCHNZ
	wrFIoOS+NJRdaWSG33StIS+Z+erWm9SRnQkoInx7+mUG58oASB1iRzt/ydBN0lcgCFuw6tSfFAOnC
	HuZg1dCKi5R+eICUCJ9qSMmcU4OIktHfygOdtP2wrqT2SpMT2WNvnZ6t+uKbBSIsVYwgf65bMmFLZ
	ZItn0QRoMso5xqKKe5AOhNiDRG9zi1Vf6eALC0xftmvm3B4h95GYeiG368fwKGcsZyB4OkPDxnvcR
	EQYmnfDG3t/iX2bSDJ7+FvjIT9EyqlUECPsFxu+HbHYoYm+iEPHLkv8+wj4yxn32VIDd1UKAEbT/x
	Soj5rBS91f9PjuiahurA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlpJs-0005IE-7w; Thu, 18 Jun 2020 07:50:44 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlpJp-0005HZ-AY
 for linux-afs@lists.infradead.org; Thu, 18 Jun 2020 07:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592466640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mNDAD09ZF11gVKKLJQ7tphenyVSu5+EHhncfG5s2V8=;
 b=i30QONqYY+dk2yx/XsX0vvi1FfM9MIThEX+3VatL2RORJcX6XRKbPpabkUmCJvejYc4r/3
 hvpylH8eWrjTRSsuupQZv+JFyJHHYClEU2wsJc9LdmU7kyGGZl9MQ6vfttAWnhL3HwkSyp
 IiW8b/JPZbLwQOacis2SFw1rWM+z358=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-5bX6ePhfN2KccolsBVOJlA-1; Thu, 18 Jun 2020 03:50:38 -0400
X-MC-Unique: 5bX6ePhfN2KccolsBVOJlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 363C31800D42;
 Thu, 18 Jun 2020 07:50:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 684D160BF3;
 Thu, 18 Jun 2020 07:50:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 3/3] rxrpc: Fix afs large storage transmission performance
 drop
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Thu, 18 Jun 2020 08:50:35 +0100
Message-ID: <159246663560.1229328.1476552302291944463.stgit@warthog.procyon.org.uk>
In-Reply-To: <159246661514.1229328.4419873299996950969.stgit@warthog.procyon.org.uk>
References: <159246661514.1229328.4419873299996950969.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_005041_437024_9BAE5D81 
X-CRM114-Status: GOOD (  14.30  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
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
 [207.211.31.81 listed in wl.mailspike.net]
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

Commit 2ad6691d988c, which moved the modification of the status annotation
for a packet in the Tx buffer prior to the retransmission moved the state
clearance, but managed to lose the bit that set it to UNACK.

Consequently, if a retransmission occurs, the packet is accidentally
changed to the ACK state (ie. 0) by masking it off, which means that the
packet isn't counted towards the tally of newly-ACK'd packets if it gets
hard-ACK'd.  This then prevents the congestion control algorithm from
recovering properly.

Fix by reinstating the change of state to UNACK.

Spotted by the generic/460 xfstest.

Fixes: 2ad6691d988c ("rxrpc: Fix race between incoming ACK parser and retransmitter")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/call_event.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/call_event.c b/net/rxrpc/call_event.c
index aa1c8eee6557..6be2672a65ea 100644
--- a/net/rxrpc/call_event.c
+++ b/net/rxrpc/call_event.c
@@ -253,7 +253,7 @@ static void rxrpc_resend(struct rxrpc_call *call, unsigned long now_j)
 		 * confuse things
 		 */
 		annotation &= ~RXRPC_TX_ANNO_MASK;
-		annotation |= RXRPC_TX_ANNO_RESENT;
+		annotation |= RXRPC_TX_ANNO_UNACK | RXRPC_TX_ANNO_RESENT;
 		call->rxtx_annotations[ix] = annotation;
 
 		skb = call->rxtx_buffer[ix];



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
