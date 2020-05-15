Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7B1D5465
	for <lists+linux-afs@lfdr.de>; Fri, 15 May 2020 17:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pc471GY0TafWtESdMcBJ0SQf+OfIFUpwneeG/Fdwukk=; b=sR5otZw9zd1Xlk
	O6DN2OPH/O46S++sZ6cQ9qeQ53vQ6NgUzaS9wi8d8cpDR+/+QDezLywXFdvwjgZZ8K3tQtJVpppYy
	WpqTeMy6pCuR594dsMlBcZ/M8Ssxg3s7TduGXSDGZAzKuCsAX1FEhrMPBwGlSTPSmw7pEpI5AOmYB
	3DM8foYB2mH61sbsOT9TPakMKGxxsLU0JxV4lcvCLQRu3n2VnCJojIgJOM3XJ/Awjy6uBUj+5jzMx
	J15JdWvYhRNU0/EsTfb3EFWyQCP+dh5scrSfzHFju64OGIOhkglOQtd05FNZn6qEEJIbqngTI7Ucp
	OvxVMIV8rSVMpD/Zu6wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZcC6-0003Re-P6; Fri, 15 May 2020 15:24:14 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZc2W-0002WM-V0
 for linux-afs@lists.infradead.org; Fri, 15 May 2020 15:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589555657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jFShFTg902A0q2PIFAj13bBAo+TkoHxdtSFzmSJaQc=;
 b=B8PkO8cLVVph/pN4dd3OZCiD6m3ovZaGaJOWfBZ+StZadTXIGXXz6Kc8OJqI4xXgRdbDLF
 gpI19S0HgO2Wop0X+9LiGznCSklVw/JiTjRedmd7OXpuIr+1pQSS/84mQvJWYxZmtVbL5A
 NMYg5s8AC5X1Mq9UFaQ7HCAfDCjKjCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-LQVTQu0OPIyPDmXCi0pv9g-1; Fri, 15 May 2020 11:14:13 -0400
X-MC-Unique: LQVTQu0OPIyPDmXCi0pv9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03A5684B8A0;
 Fri, 15 May 2020 15:14:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
 [10.10.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D912F76E64;
 Fri, 15 May 2020 15:13:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200514102919.GA12680@lst.de>
References: <20200514102919.GA12680@lst.de>
 <20200513062649.2100053-30-hch@lst.de> <20200513062649.2100053-1-hch@lst.de>
 <3123534.1589375587@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 29/33] rxrpc_sock_set_min_security_level
MIME-Version: 1.0
Content-ID: <128581.1589555639.1@warthog.procyon.org.uk>
Date: Fri, 15 May 2020 16:13:59 +0100
Message-ID: <128582.1589555639@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_081421_077041_9D36614F 
X-CRM114-Status: GOOD (  14.53  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Fri, 15 May 2020 08:24:13 -0700
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
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-block@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Christoph Hellwig <hch@lst.de> wrote:

> > Looks good - but you do need to add this to Documentation/networking/rxrpc.txt
> > also, thanks.
> 
> That file doesn't exist, instead we now have a
> cumentation/networking/rxrpc.rst in weird markup.

Yeah - that's only in net/next thus far.

> Where do you want this to be added, and with what text?  Remember I don't
> really know what this thing does, I just provide a shortcut.

The document itself describes what each rxrpc sockopt does.  Just look for
RXRPC_MIN_SECURITY_LEVEL in there;-)

Anyway, see the attached.  This also fixes a couple of errors in the doc that
I noticed.

David
---
diff --git a/Documentation/networking/rxrpc.rst b/Documentation/networking/rxrpc.rst
index 5ad35113d0f4..68552b92dc44 100644
--- a/Documentation/networking/rxrpc.rst
+++ b/Documentation/networking/rxrpc.rst
@@ -477,7 +477,7 @@ AF_RXRPC sockets support a few socket options at the SOL_RXRPC level:
 	 Encrypted checksum plus packet padded and first eight bytes of packet
 	 encrypted - which includes the actual packet length.
 
-     (c) RXRPC_SECURITY_ENCRYPTED
+     (c) RXRPC_SECURITY_ENCRYPT
 
 	 Encrypted checksum plus entire packet padded and encrypted, including
 	 actual packet length.
@@ -578,7 +578,7 @@ A client would issue an operation by:
      This issues a request_key() to get the key representing the security
      context.  The minimum security level can be set::
 
-	unsigned int sec = RXRPC_SECURITY_ENCRYPTED;
+	unsigned int sec = RXRPC_SECURITY_ENCRYPT;
 	setsockopt(client, SOL_RXRPC, RXRPC_MIN_SECURITY_LEVEL,
 		   &sec, sizeof(sec));
 
@@ -1090,6 +1090,15 @@ The kernel interface functions are as follows:
      jiffies).  In the event of the timeout occurring, the call will be
      aborted and -ETIME or -ETIMEDOUT will be returned.
 
+ (#) Apply the RXRPC_MIN_SECURITY_LEVEL sockopt to a socket from within in the
+     kernel::
+
+       int rxrpc_sock_set_min_security_level(struct sock *sk,
+					     unsigned int val);
+
+     This specifies the minimum security level required for calls on this
+     socket.
+
 
 Configurable Parameters
 =======================
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 7dfcbd58da85..e313dae01674 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -57,7 +57,7 @@ int afs_open_socket(struct afs_net *net)
 	srx.transport.sin6.sin6_port	= htons(AFS_CM_PORT);
 
 	ret = rxrpc_sock_set_min_security_level(socket->sk,
-			RXRPC_SECURITY_ENCRYPT);
+						RXRPC_SECURITY_ENCRYPT);
 	if (ret < 0)
 		goto error_2;
 

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
