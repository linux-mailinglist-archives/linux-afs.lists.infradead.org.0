Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8F814ED43
	for <lists+linux-afs@lfdr.de>; Fri, 31 Jan 2020 14:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MSQWgP66wYd5XlejMpOnAE2wO1RvoIKzTOzvmCRAow=; b=psVMaDvhS49Fbe
	GPqhz6T0WMnFPUyKZ7J1CyCBOI+Bt/hdVMEAMP1Deyc91rUc89Kvlb0t4iPvnTe5My1bljuGfP3Zu
	OPhG+HFqw51zqOeDQFwESq3w6MP+A65v1cjWBZGPwZotU3atgZP0PYEM+cHhBXkOlAF2SmvYC4YHQ
	jlA2+rRbTVcMmjlkxfk7nkCCop/8jqW+5CRwhV6sr/GbWaELkHcivv3QkAd2pbBhHA5NtS/XS14s+
	NCdLRBcsFudjob+9+dZDO7o8axtrhXdzcu6Zf+wbyr9wsS4IwkB9DFb+bCeUKAYLFQathrkhtUH1a
	xHo69KYmSJwWao8IDBcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixWMd-0003gu-7H; Fri, 31 Jan 2020 13:29:39 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixWMa-0003fA-79
 for linux-afs@lists.infradead.org; Fri, 31 Jan 2020 13:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580477374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msjRtC1pX9Pk5JuskCNfQ4Q9BGD/mZ+2JEztPjK1Kes=;
 b=SQ1CbeF7i5xfumaZs1rpRT7cyaqs7I5rznE3VSRZhx0u0kq2RddCgZK6JYMEADGzutRJJE
 erqeMZzqKToXMHGn4wfd8e1qy3iwp7haPLZZihZZDalbXHruzDGALXK/2dPfLRIblWxz2r
 kN6WyZQKqxH1btFckYTIEYRj3KYeJUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-onSpNYe-PS6HmUncdvLtSA-1; Fri, 31 Jan 2020 08:29:32 -0500
X-MC-Unique: onSpNYe-PS6HmUncdvLtSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BE5B107ACC5;
 Fri, 31 Jan 2020 13:29:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com
 [10.10.120.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF7B188858;
 Fri, 31 Jan 2020 13:29:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net 2/4] rxrpc: Fix insufficient receive notification
 generation
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Fri, 31 Jan 2020 13:29:29 +0000
Message-ID: <158047736987.133127.18071443288095328152.stgit@warthog.procyon.org.uk>
In-Reply-To: <158047735578.133127.17728061182258449164.stgit@warthog.procyon.org.uk>
References: <158047735578.133127.17728061182258449164.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_052936_355847_68810FA7 
X-CRM114-Status: GOOD (  12.61  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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

In rxrpc_input_data(), rxrpc_notify_socket() is called if the base sequence
number of the packet is immediately following the hard-ack point at the end
of the function.  However, this isn't sufficient, since the recvmsg side
may have been advancing the window and then overrun the position in which
we're adding - at which point rx_hard_ack >= seq0 and no notification is
generated.

Fix this by always generating a notification at the end of the input
function.

Without this, a long call may stall, possibly indefinitely.

Fixes: 248f219cb8bc ("rxrpc: Rewrite the data and ack handling code")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/input.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/input.c b/net/rxrpc/input.c
index 96d54e5bf7bc..ef10fbf71b15 100644
--- a/net/rxrpc/input.c
+++ b/net/rxrpc/input.c
@@ -599,10 +599,8 @@ static void rxrpc_input_data(struct rxrpc_call *call, struct sk_buff *skb)
 				  false, true,
 				  rxrpc_propose_ack_input_data);
 
-	if (seq0 == READ_ONCE(call->rx_hard_ack) + 1) {
-		trace_rxrpc_notify_socket(call->debug_id, serial);
-		rxrpc_notify_socket(call);
-	}
+	trace_rxrpc_notify_socket(call->debug_id, serial);
+	rxrpc_notify_socket(call);
 
 unlock:
 	spin_unlock(&call->input_lock);



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
