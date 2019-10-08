Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F95CF091
	for <lists+linux-afs@lfdr.de>; Tue,  8 Oct 2019 03:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lhqe6KKzy4YdXHYE0ES5JNZuZ8dX9sMhF0Knhpihv1Q=; b=lKCmx8+rQsyaLj
	895qEdBt4xsxtIjbYyL3aae6utmB0SXenxEefFOMGeLtY0zRLGnpJFXzYYYXCq3I5r82KCwhj5M3M
	HldwB9TIDsGsZZ2n4RNyb3iSYpIqGgGnSOyHJbfjU+pDewShXTfTSbkPE9oPqzwV7jgtv4SEU91ve
	zGeDAniUflstF4S++T4SXwowFz/RRLk+iJ2QVl0bMvAJ38nYOfRLp7CFVmAtBdGI64t7DCHzLt7zo
	tT62Sz+bO4kcH/hlzw1HBwNME3woCNhM8HFQ+/tutEjOhSu2rKjemAmoe9haRkvWmRTKZ2hiTbJW6
	nGA+qlihJCKMd7cTf1YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHePV-0003ha-M2; Tue, 08 Oct 2019 01:35:33 +0000
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
 by bombadil.infradead.org with smtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHePR-0003ge-Vs
 for linux-afs@lists.infradead.org; Tue, 08 Oct 2019 01:35:32 +0000
Received: from unknown (HELO localhost.localdomain)([222.130.246.252])
 by sina.com with ESMTP
 id 5D9BE7D2000101A8; Tue, 8 Oct 2019 09:35:16 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 120451628756
From: Hillf Danton <hdanton@sina.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net 5/6] rxrpc: rxrpc_peer needs to hold a ref on the
 rxrpc_local record
Date: Tue,  8 Oct 2019 09:35:05 +0800
Message-Id: <20191008013505.10728-1-hdanton@sina.com>
In-Reply-To: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
References: <157044333551.32635.10133219357337058780.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_183530_224426_094E3979 
X-CRM114-Status: GOOD (  14.91  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (hdanton[at]sina.com)
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
Cc: net <netdev@vger.kernel.org>, Hillf Danton <hdanton@sina.com>,
 afs <linux-afs@lists.infradead.org>, linux <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


On Mon, 07 Oct 2019 11:16:12 +0100 David Howells wrote:
>
> The rxrpc_peer record needs to hold a reference on the rxrpc_local record
> it points as the peer is used as a base to access information in the
> rxrpc_local record.
> 
> This can cause problems in __rxrpc_put_peer(), where we need the network
> namespace pointer, and in rxrpc_send_keepalive(), where we need to access
> the UDP socket, leading to symptoms like:
> 
>     BUG: KASAN: use-after-free in __rxrpc_put_peer net/rxrpc/peer_object.c:411
>     [inline]
>     BUG: KASAN: use-after-free in rxrpc_put_peer+0x685/0x6a0
>     net/rxrpc/peer_object.c:435
>     Read of size 8 at addr ffff888097ec0058 by task syz-executor823/24216
> 
> Fix this by taking a ref on the local record for the peer record.
> 
> Fixes: ace45bec6d77 ("rxrpc: Fix firewall route keepalive")
> Fixes: 2baec2c3f854 ("rxrpc: Support network namespacing")
> Reported-by: syzbot+b9be979c55f2bea8ed30@syzkaller.appspotmail.com
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---

Acked-by: Hillf Danton <hdanton@sina.com>

> 
>  net/rxrpc/peer_object.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/net/rxrpc/peer_object.c b/net/rxrpc/peer_object.c
> index b700b7ecaa3d..64830d8c1fdb 100644
> --- a/net/rxrpc/peer_object.c
> +++ b/net/rxrpc/peer_object.c
> @@ -216,7 +216,7 @@ struct rxrpc_peer *rxrpc_alloc_peer(struct rxrpc_local *local, gfp_t gfp)
>  	peer = kzalloc(sizeof(struct rxrpc_peer), gfp);
>  	if (peer) {
>  		atomic_set(&peer->usage, 1);
> -		peer->local = local;
> +		peer->local = rxrpc_get_local(local);
>  		INIT_HLIST_HEAD(&peer->error_targets);
>  		peer->service_conns = RB_ROOT;
>  		seqlock_init(&peer->service_conn_lock);
> @@ -307,7 +307,6 @@ void rxrpc_new_incoming_peer(struct rxrpc_sock *rx, struct rxrpc_local *local,
>  	unsigned long hash_key;
>  
>  	hash_key = rxrpc_peer_hash_key(local, &peer->srx);
> -	peer->local = local;
>  	rxrpc_init_peer(rx, peer, hash_key);
>  
>  	spin_lock(&rxnet->peer_hash_lock);
> @@ -417,6 +416,7 @@ static void __rxrpc_put_peer(struct rxrpc_peer *peer)
>  	list_del_init(&peer->keepalive_link);
>  	spin_unlock_bh(&rxnet->peer_hash_lock);
>  
> +	rxrpc_put_local(peer->local);
>  	kfree_rcu(peer, rcu);
>  }
>  
> @@ -453,6 +453,7 @@ void rxrpc_put_peer_locked(struct rxrpc_peer *peer)
>  	if (n == 0) {
>  		hash_del_rcu(&peer->hash_link);
>  		list_del_init(&peer->keepalive_link);
> +		rxrpc_put_local(peer->local);
>  		kfree_rcu(peer, rcu);
>  	}
>  }


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
