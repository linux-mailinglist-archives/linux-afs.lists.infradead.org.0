Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C63BC1E8A8F
	for <lists+linux-afs@lfdr.de>; Sat, 30 May 2020 00:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfj//cB9CQsoMbiJZ9jeV0wKCqNvtFmHD/inQ80pSxM=; b=qUoFOxmVdCufWv
	1MXe4pIpGb6qW22YK+4VMMqOK4ei6YtE/duh9v4QIL/EdfEY5LCtCwqy9aPN67EfBZnq7wZFju/qQ
	PI0PJQSZAY3tIewPsy+bc1dQmrayKj8sYu1df8rzsfxdS5DXOfWIeUGz0gflsZtFeL9EtH+M9WzGw
	XS+3J3pp+/YZlirK7hNI/NY7npmLdqTPvqk13J5EbPOjsEDoO78h+S/xhjEN0jNdXTLmFS6CJY5pN
	BFJJd5tIyTEfscZjzzBbVmYd232SGFGCn/jF6ClWRDjGlfjc8goNNth06K5go8jRaf0A7bj+8z/o+
	31qbXy6UAH2ZsyAN8RZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jen3A-0001NN-Km; Fri, 29 May 2020 22:00:24 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jen37-0001M9-Ou
 for linux-afs@lists.infradead.org; Fri, 29 May 2020 22:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590789620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZj1hG47vKjeF+F917Yc6ZUOleHAcqUJyjRf7Wzg1YQ=;
 b=cxC8V3Cnvv4ey/mcGQLrHuZ1mltNsM0PaS2MEoRULDJKCSvVO9lxIKZkycqS1GbkgS1FPJ
 XTjQaSuGyUHsOULkKXBw3fQLHx5hrR75oaDlow2GeQ723DQKgKa47rzBGO8bq2PsaMKq0w
 3AN9A5Cpk93/CUmXrkseWWPB85iyuAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-OPaxZCHPPua7Dev79u-PPw-1; Fri, 29 May 2020 18:00:19 -0400
X-MC-Unique: OPaxZCHPPua7Dev79u-PPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 016D5800D24;
 Fri, 29 May 2020 22:00:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 337CE5EE0E;
 Fri, 29 May 2020 22:00:17 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 02/27] rxrpc: Map the EACCES error produced by some ICMP6 to
 EHOSTUNREACH
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Fri, 29 May 2020 23:00:16 +0100
Message-ID: <159078961633.679399.6049692176688342256.stgit@warthog.procyon.org.uk>
In-Reply-To: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_150021_880020_FB9E91D6 
X-CRM114-Status: GOOD (  10.63  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Map the EACCES error that is produced by some ICMP6 packets to EHOSTUNREACH
when we get them as EACCES has other meanings within a filesystem context.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 net/rxrpc/peer_event.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/rxrpc/peer_event.c b/net/rxrpc/peer_event.c
index b1449d971883..112e490ebbcd 100644
--- a/net/rxrpc/peer_event.c
+++ b/net/rxrpc/peer_event.c
@@ -271,6 +271,9 @@ static void rxrpc_store_error(struct rxrpc_peer *peer,
 		break;
 
 	case SO_EE_ORIGIN_ICMP6:
+		if (err == EACCES)
+			err = EHOSTUNREACH;
+		/* Fall through */
 	default:
 		_proto("Rx Received error report { orig=%u }", ee->ee_origin);
 		break;



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
