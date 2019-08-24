Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C79C07F
	for <lists+linux-afs@lfdr.de>; Sat, 24 Aug 2019 23:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4sgfFSFnM7NKHkNYhR/yHOefE8gk5bdUnQmyxS/VP4=; b=QXfSu5uxybZJFv
	yneDOyS7CMOrAe3JvR+pBjJ6K6x7NKnwK1xAXXVp7k+RlYpImphWPwjwseWfi/RlqNdku0QHVag8a
	OyZliqOudQF5nIQ0AdZIX56Rwvdi116Jqg682gQ1ksNkmyRTCHkO95/tY8PW6DnF65N/1WTdvcoEO
	sc+DvkQQ7C7m6hpresObKHsNG12xCbUqb1X5ACbukBu/IKCQ0OMF1dOBE9QOrnjJ1VGWascmCtUJf
	/4UzV5n4NEPyZIaqG/P14uPn8RzFP/9QzFPXhsq3lhtyONd2AwHb/EDHP0V+eCNST69TfyuXGynU/
	vxZoLzkviOeJ6jg/lr/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1dhC-0007SY-D4; Sat, 24 Aug 2019 21:35:38 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1dh9-0007SH-0p
 for linux-afs@lists.infradead.org; Sat, 24 Aug 2019 21:35:36 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 23F5115253B18;
 Sat, 24 Aug 2019 14:35:34 -0700 (PDT)
Date: Sat, 24 Aug 2019 14:35:33 -0700 (PDT)
Message-Id: <20190824.143533.1547411490171696760.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net] rxrpc: Fix lack of conn cleanup when local
 endpoint is cleaned up
From: David Miller <davem@davemloft.net>
In-Reply-To: <156647679816.11606.13713532963081370001.stgit@warthog.procyon.org.uk>
References: <156647679816.11606.13713532963081370001.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 24 Aug 2019 14:35:34 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_143535_059433_FD98D8D6 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Cc: marc.dionne@auristor.com, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Thu, 22 Aug 2019 13:26:38 +0100

> +	spin_lock(&rxnet->client_conn_cache_lock);
> +	nr_active = rxnet->nr_active_client_conns;
> +
> +	list_for_each_entry_safe(conn, tmp, &rxnet->idle_client_conns,
> +				 cache_link) {
> +		if (conn->params.local == local) {
> +			ASSERTCMP(conn->cache_state, ==, RXRPC_CONN_CLIENT_IDLE);
> +
> +			trace_rxrpc_client(conn, -1, rxrpc_client_discard);
> +			if (!test_and_clear_bit(RXRPC_CONN_EXPOSED, &conn->flags))
> +				BUG();
> +			conn->cache_state = RXRPC_CONN_CLIENT_INACTIVE;
> +			list_move(&conn->cache_link, &graveyard);
> +			nr_active--;
> +		}
> +	}
> +
> +	rxnet->nr_active_client_conns = nr_active;
> +	spin_unlock(&rxnet->client_conn_cache_lock);
> +	ASSERTCMP(nr_active, >=, 0);
> +
> +	spin_lock(&rxnet->client_conn_cache_lock);
> +	while (!list_empty(&graveyard)) {
> +		conn = list_entry(graveyard.next,
> +				  struct rxrpc_connection, cache_link);
> +		list_del_init(&conn->cache_link);
> +		spin_unlock(&rxnet->client_conn_cache_lock);
> +
> +		rxrpc_put_connection(conn);
> +
> +		spin_lock(&rxnet->client_conn_cache_lock);
> +	}
> +	spin_unlock(&rxnet->client_conn_cache_lock);
> +
> +	_leave(" [culled]");

Once you've removed the entries from the globally visible idle_client_comms
list, and put them on the local garbage list, they cannot be seen in any way
by external threads of control outside of this function.

Therefore, you don't need to take the client_conn_cache_lock at all in the
second while loop.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
