Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 027CC1D14DD
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 15:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52SkNairwkMrXfy/O4rjuqPyIayFWmiHbmR6xGHfZ8w=; b=qrPh2WNKM4Lb/B
	9wYF5CS1C4iG9YlRRZVc9REuRX+v5am7oDln+4P4mU4fFBw+bAkzOVIdYY8SnhVTk9ea51Eq0MWF8
	m0+UcWTuGv+D7hB1IjkHgK9pdktbrV49cNJHbmrTGFKJ94XAQaQ+d+3Tr8B/rAinPZevyyB5K3Dne
	tthsragsjJBwYSfGtlWs07C3lrbQ3+8RwDDkBkFRe81KD8/nHnP2Zro42UzEyx0kB8xEwCXEeYFZn
	iVatFK9zPYJfa9yAuQ0HAdLNoR98zUJoAlE+jT2/c6QR3nT8DX8GCwxiUdXG7mI/Z4ocxjc2/w6Xs
	cQX1EYhOugTJDUJHdNXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYrR2-0005lr-Gn; Wed, 13 May 2020 13:28:32 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYrGn-0005PO-3B
 for linux-afs@lists.infradead.org; Wed, 13 May 2020 13:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589375876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uvCkRI/K32PIBqaQ7LcOfghe4diMRxEm5e5JsVQlwss=;
 b=dWr+7f/Bdr3hmO1a9/Nn9WhrC/QMSDEs4i0233mHMSoaEzNWDDzoJXZci57z+ycdKwuFQA
 PRIEi0XHd9moOyi8WPRbt/ZOIB5IjTGlbHuog2/Dg5zBdJ/T+uZkZRVjGhc8uniG96zH7L
 JluucYmdOUAJrcdPGnQWq+BIwHyInX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-9T7X1SL4M7u16KqBfljjIQ-1; Wed, 13 May 2020 09:17:52 -0400
X-MC-Unique: 9T7X1SL4M7u16KqBfljjIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53C148014C0;
 Wed, 13 May 2020 13:17:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-59.rdu2.redhat.com
 [10.10.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8A53610F2;
 Wed, 13 May 2020 13:17:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200513062649.2100053-22-hch@lst.de>
References: <20200513062649.2100053-22-hch@lst.de>
 <20200513062649.2100053-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 21/33] ipv4: add ip_sock_set_mtu_discover
MIME-Version: 1.0
Content-ID: <3123897.1589375861.1@warthog.procyon.org.uk>
Date: Wed, 13 May 2020 14:17:41 +0100
Message-ID: <3123898.1589375861@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_061757_218735_B4332002 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.120 listed in wl.mailspike.net]
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
X-Mailman-Approved-At: Wed, 13 May 2020 06:28:31 -0700
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

> +		ip_sock_set_mtu_discover(conn->params.local->socket->sk,
> +				IP_PMTUDISC_DONT);

Um... The socket in question could be an AF_INET6 socket, not an AF_INET4
socket - I presume it will work in that case.  If so:

Reviewed-by: David Howells <dhowells@redhat.com> [rxrpc bits]


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
