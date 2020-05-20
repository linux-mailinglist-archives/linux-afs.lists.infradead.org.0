Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC421DC71E
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 08:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKorLabj4xTbS6LgykUNproVGA5KJhNi0HPrlrFTKCA=; b=Kh/j81uFf9nvC1
	RZaxnwM/x3imtqv2sScsH7dVI14CR/afb+C6779zW0pXgJtJqa8XWEkkQtGKKLwdHy9yVX0Ir4k/L
	yYlXfhnq756icriy9tkxC8pjmdkKgJcCbMNeGUMW1iARNL8S8th5X6pPQRBZQ/ysLvn/gpk92P7y7
	VkWU1a/fHderxF5BRvgsgTyY5fDI3G1SDSsO3FmZTQM6TI+KlbZPLiDgVHpjTvIOnCYQhwcyptXYD
	7ho/W3WcmrDYouVKlYgaLntGLAhg9eMQlMWycy/gVMWdKrEH8ArC8bOfZclfCIsqLvm39KDSeuxT0
	cmHVGrKAYbmbXf8WfUnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbex4-0006IS-NT; Thu, 21 May 2020 06:45:10 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbXhP-0006T5-6l; Wed, 20 May 2020 23:00:33 +0000
Received: by mail-qk1-x744.google.com with SMTP id i5so5367451qkl.12;
 Wed, 20 May 2020 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bxPhNLxEeIp1FyAEAyOXcpXoJGhcJI/9VkWQHjEBJu8=;
 b=ABmm/w5ZxLmgIKDfTHVrUH4+roya8bvoORLSIFi8ftfcLjr/+lUQIQg1vCqbqW2lg9
 Edg16ZlpvA+2Dlf7bVNlBaLPK1ZbW70B9d+eMKWgRWHc1obMDOhnkMACk5lCyH6afilN
 oBX31hIJND3KTy6XaW00DzljepVXjloOTwRxZRLvAQKsNjUgvnW+LRhTtQZ8hzDo3kC9
 nEaiPcTs5/ymUk2QJuXYVy0Cj6FQBr1kL/y4jcDd4Z/5qbXOnV8biHoU/FvLL+veSFMP
 /oXIdwd3BivEoo89WKHE8GPd4JLIstozB1RtSZSt9AsbvQu1QY701U/rpBAvWqVzLnB2
 HhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bxPhNLxEeIp1FyAEAyOXcpXoJGhcJI/9VkWQHjEBJu8=;
 b=K6DPzvEV0BBajukVM29GOiqOOv6OtnCuQ6K5Uo1/WfN5O2zpFaCACOKsMU4Y6unNrX
 MKfbdTHbl2xQs32oXDgZ5leFmeZZ4Nk5wo0nfj8jK/6HvsTP7UZ5Msm3BdfNM5XlVLd2
 CMXK1AH1cid6rI/fK3TS/T5w84GhsMtwhMYS4u3/Pbtq6Oc3H+eFmfNL30kMU3ybiqoa
 EN45t21yIWepjup4vlgKNOi2wv0UyDZ3AgXkBimx9tNdWc/RchOhK27JN5cJCTbjnZJH
 BQf/Y0n+P7xVoUx1YwzaX9kDgSyXsfRhNFXyCYtGKe9CnX+W34NvNa5WBDoeFv9IUhIg
 a5ng==
X-Gm-Message-State: AOAM533Tk1F58AeRSEezIZJGDRF2dLQGp5+DtM4KUuVqavKELJhutUjc
 Ldl+ImeCG9o2XpkPP8cxuAY=
X-Google-Smtp-Source: ABdhPJz4+N4OAMnIZUpFPrMKKpxZ5ipr9THKmBgVoh+NUJRSoyJQeFfxBAyAvgR9uTfieJGBqFR7qw==
X-Received: by 2002:a37:b244:: with SMTP id b65mr7801054qkf.329.1590015629321; 
 Wed, 20 May 2020 16:00:29 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
 by smtp.gmail.com with ESMTPSA id n68sm3102877qkb.58.2020.05.20.16.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 16:00:28 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
 id 889A9C0DAC; Wed, 20 May 2020 20:00:25 -0300 (-03)
Date: Wed, 20 May 2020 20:00:25 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 32/33] net: add a new bind_add method
Message-ID: <20200520230025.GT2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
 <20200520195509.2215098-33-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520195509.2215098-33-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_160031_284127_B464CC73 
X-CRM114-Status: GOOD (  25.25  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:744 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [marcelo.leitner[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Mailman-Approved-At: Wed, 20 May 2020 23:45:09 -0700
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
Cc: Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Jakub Kicinski <kuba@kernel.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, linux-kernel@vger.kernel.org,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, May 20, 2020 at 09:55:08PM +0200, Christoph Hellwig wrote:
> The SCTP protocol allows to bind multiple address to a socket.  That
> feature is currently only exposed as a socket option.  Add a bind_add
> method struct proto that allows to bind additional addresses, and
> switch the dlm code to use the method instead of going through the
> socket option from kernel space.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/dlm/lowcomms.c  |  9 +++------
>  include/net/sock.h |  6 +++++-
>  net/core/sock.c    |  8 ++++++++
>  net/sctp/socket.c  | 23 +++++++++++++++++++++++
>  4 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 9f1c3cdc9d653..3543a8fec9075 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -882,6 +882,7 @@ static void writequeue_entry_complete(struct writequeue_entry *e, int completed)
>  static int sctp_bind_addrs(struct connection *con, uint16_t port)
>  {
>  	struct sockaddr_storage localaddr;
> +	struct sockaddr *addr = (struct sockaddr *)&localaddr;
>  	int i, addr_len, result = 0;
>  
>  	for (i = 0; i < dlm_local_count; i++) {
> @@ -889,13 +890,9 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
>  		make_sockaddr(&localaddr, port, &addr_len);
>  
>  		if (!i)
> -			result = kernel_bind(con->sock,
> -					     (struct sockaddr *)&localaddr,
> -					     addr_len);
> +			result = kernel_bind(con->sock, addr, addr_len);
>  		else
> -			result = kernel_setsockopt(con->sock, SOL_SCTP,
> -						   SCTP_SOCKOPT_BINDX_ADD,
> -						   (char *)&localaddr, addr_len);
> +			result = sock_bind_add(con->sock->sk, addr, addr_len);
>  
>  		if (result < 0) {
>  			log_print("Can't bind to %d addr number %d, %d.\n",
> diff --git a/include/net/sock.h b/include/net/sock.h
> index d994daa418ec2..6e9f713a78607 100644
> --- a/include/net/sock.h
> +++ b/include/net/sock.h
> @@ -1156,7 +1156,9 @@ struct proto {
>  	int			(*sendpage)(struct sock *sk, struct page *page,
>  					int offset, size_t size, int flags);
>  	int			(*bind)(struct sock *sk,
> -					struct sockaddr *uaddr, int addr_len);
> +					struct sockaddr *addr, int addr_len);
> +	int			(*bind_add)(struct sock *sk,
> +					struct sockaddr *addr, int addr_len);
>  
>  	int			(*backlog_rcv) (struct sock *sk,
>  						struct sk_buff *skb);
> @@ -2698,4 +2700,6 @@ void sock_set_reuseaddr(struct sock *sk);
>  void sock_set_reuseport(struct sock *sk);
>  void sock_set_sndtimeo(struct sock *sk, s64 secs);
>  
> +int sock_bind_add(struct sock *sk, struct sockaddr *addr, int addr_len);
> +
>  #endif	/* _SOCK_H */
> diff --git a/net/core/sock.c b/net/core/sock.c
> index 2ca3425b519c0..61ec573221a60 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -3712,3 +3712,11 @@ bool sk_busy_loop_end(void *p, unsigned long start_time)
>  }
>  EXPORT_SYMBOL(sk_busy_loop_end);
>  #endif /* CONFIG_NET_RX_BUSY_POLL */
> +
> +int sock_bind_add(struct sock *sk, struct sockaddr *addr, int addr_len)
> +{
> +	if (!sk->sk_prot->bind_add)
> +		return -EOPNOTSUPP;
> +	return sk->sk_prot->bind_add(sk, addr, addr_len);
> +}
> +EXPORT_SYMBOL(sock_bind_add);
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index 827a9903ee288..8a0b9258f65c0 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -1057,6 +1057,27 @@ static int sctp_setsockopt_bindx(struct sock *sk,
>  	return err;
>  }
>  
> +static int sctp_bind_add(struct sock *sk, struct sockaddr *addr,
> +		int addrlen)
> +{
> +	struct sctp_af *af = sctp_get_af_specific(addr->sa_family);
> +	int err;
> +
> +	if (!af || af->sockaddr_len > addrlen)
> +		return -EINVAL;
> +	err = security_sctp_bind_connect(sk, SCTP_SOCKOPT_BINDX_ADD, addr,
> +			addrlen);

The security_ call above is done today within the sock lock.
I couldn't find any issue through a code review, though, so I'm fine
with leaving it as is. Just highlighting it..

> +	if (err)
> +		return err;
> +
> +	lock_sock(sk);
> +	err = sctp_do_bind(sk, (union sctp_addr *)addr, af->sockaddr_len);
> +	if (!err)
> +		err = sctp_send_asconf_add_ip(sk, addr, 1);

Some problems here.
- addr may contain a list of addresses
- the addresses, then, are not being validated
- sctp_do_bind may fail, on which it requires some undoing
  (like sctp_bindx_add does)
- code duplication with sctp_setsockopt_bindx.

This patch will conflict with David's one,
[PATCH net-next] sctp: Pull the user copies out of the individual sockopt functions.
(I'll finish reviewing it in the sequence)

AFAICT, this patch could reuse/build on his work in there. The goal is
pretty much the same and would avoid the issues above.

This patch could, then, point the new bind_add proto op to the updated
sctp_setsockopt_bindx almost directly.

Question then is: dlm never removes an addr from the bind list. Do we
want to add ops for both? Or one that handles both operations?
Anyhow, having the add operation but not the del seems very weird to
me.

> +	release_sock(sk);
> +	return err;
> +}
> +
>  static int sctp_connect_new_asoc(struct sctp_endpoint *ep,
>  				 const union sctp_addr *daddr,
>  				 const struct sctp_initmsg *init,
> @@ -9625,6 +9646,7 @@ struct proto sctp_prot = {
>  	.sendmsg     =	sctp_sendmsg,
>  	.recvmsg     =	sctp_recvmsg,
>  	.bind        =	sctp_bind,
> +	.bind_add    =  sctp_bind_add,
>  	.backlog_rcv =	sctp_backlog_rcv,
>  	.hash        =	sctp_hash,
>  	.unhash      =	sctp_unhash,
> @@ -9667,6 +9689,7 @@ struct proto sctpv6_prot = {
>  	.sendmsg	= sctp_sendmsg,
>  	.recvmsg	= sctp_recvmsg,
>  	.bind		= sctp_bind,
> +	.bind_add	= sctp_bind_add,
>  	.backlog_rcv	= sctp_backlog_rcv,
>  	.hash		= sctp_hash,
>  	.unhash		= sctp_unhash,
> -- 
> 2.26.2
> 

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
