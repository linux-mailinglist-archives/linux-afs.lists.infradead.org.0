Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D064D1D201E
	for <lists+linux-afs@lfdr.de>; Wed, 13 May 2020 22:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btaoacF00lclSjhmChIylf5HG0hJAWpK0ZRZG40zd+w=; b=PUD9Xs/Oxcc76M
	qBookYke3dJsXPLE2109TMsN/oIC5lU0YKGBX4IhIBopPIIAeU/BLHsiYO+DBMJjOnJRgSPdbAUHU
	nZdyvxFiPLVH/c+ORVMPRJ95WjMe7+KY16AQdqugBm6ClWq9E+oHKEFTQnOjWVRiAGyZQ9ap4OxzG
	W+h7tTQUnhqkiGeCWXG37P7FZ3OSnr1f5+1ifaPsKHK2O02JRsXv3ha+jYZo+3LczNo37Ko15KtuJ
	fzhJAYlV519GiW7VZ2pvaRnAP859jDZWjnYDJFxI+XvNmsxYV+wzGjvCERQG0xY0tc9S6LKrYy99c
	TW1lyfIBqV2FmuMOS0fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYxtH-00064T-S6; Wed, 13 May 2020 20:22:07 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYvil-00040V-BG; Wed, 13 May 2020 18:03:08 +0000
Received: by mail-qt1-x844.google.com with SMTP id x8so602790qtr.2;
 Wed, 13 May 2020 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3rJSQfC8qhqPgAdT7p7uqG4zYxw0cOP69JvDMu+AmoU=;
 b=rgheQSt1YItEgWJaK+D0bGz+/qHfNOAGsXjdVRWwUQiGqsFIGS1wvoYG+aGTafU+PV
 /Wam8diPaOgVXFRqoqZXtgZpq5ZoS7P+w+jAXFzuJRlWX6AXxlicjH1KtuahsCm7X1oB
 1KM/eHxvJqcmXNEYPF4b+olwDLqfGRmRJKuO8mBihqp1FZjIXqkKRuN4K2fkmkt1KR4y
 BY4TuAPJr9Fm34DqlaEou7vS5F0NmzH1lmiODzJGQ+/eBluPCt8Nwyn9o9iFlcChI8ne
 mr8KP8dnkN8R85f07cGwIMBpujRbjafuA86KSdBGJqLxAx2+yPjgt33/gw2dY8MXvXik
 E3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3rJSQfC8qhqPgAdT7p7uqG4zYxw0cOP69JvDMu+AmoU=;
 b=kheMCKla/0o+LXNg4PGR1PvYquX69ZE/95pYOK/BMrdChgGTYkX6lIY03VBEeSzGq2
 AhlphDa/bPe+WPzH1oaorLgQb8qreVZe7wkk/uCySwS2Nj1YPZXYmOmrnXVLokmVcjB0
 9cwtb5ew1KvJezqWQCnOReIy+CMeSXAH2BGBAGtzhzTjBB/SMyOXruzRHOrCC5wEEp3E
 QvmzLEVH+4H8nlLJ1IJbwzJJmDpLjBhOMgvATNjumdzo3zsLG0YJfA/0XxaEySJ5AcOT
 G1l9aHCIXQ9udjMUCq+omcJsRX2JZneJLkTtgl18amm9OmrlU2r4nZM1cd1yAIVVfzuB
 CEyQ==
X-Gm-Message-State: AOAM532BLm4KN51od2rV3jp8JSHH80CjgIWzYiTt2Dmt5S1WMWpesdiY
 Ep6trGmwQ9EGJiveH+tfNk8=
X-Google-Smtp-Source: ABdhPJxDn2Ym2XNFWojVR75lfnXVzFyakSG9ONLgdWGtZA79aHqlLy1IZQIR41clkG4iLZ4VQYg8Bg==
X-Received: by 2002:ac8:67cf:: with SMTP id r15mr355571qtp.258.1589392985891; 
 Wed, 13 May 2020 11:03:05 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.228])
 by smtp.gmail.com with ESMTPSA id f68sm476350qke.74.2020.05.13.11.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 11:03:05 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
 id 8AE9BC08DA; Wed, 13 May 2020 15:03:02 -0300 (-03)
Date: Wed, 13 May 2020 15:03:02 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
Message-ID: <20200513180302.GC2491@localhost.localdomain>
References: <20200513062649.2100053-1-hch@lst.de>
 <20200513062649.2100053-33-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513062649.2100053-33-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_110307_388910_9826CD3E 
X-CRM114-Status: GOOD (  19.75  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:844 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [marcelo.leitner[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Mailman-Approved-At: Wed, 13 May 2020 13:22:06 -0700
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
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-block@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, linux-kernel@vger.kernel.org,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, May 13, 2020 at 08:26:47AM +0200, Christoph Hellwig wrote:
> Add a helper to directly get the SCTP_PRIMARY_ADDR sockopt from kernel
> space without going through a fake uaccess.

Same comment as on the other dlm/sctp patch.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/dlm/lowcomms.c       | 11 +++-----
>  include/net/sctp/sctp.h |  1 +
>  net/sctp/socket.c       | 57 +++++++++++++++++++++++++----------------
>  3 files changed, 39 insertions(+), 30 deletions(-)
> 
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 6fa45365666a8..46d2d71b62c57 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -855,10 +855,9 @@ static int tcp_accept_from_sock(struct connection *con)
>  static int sctp_accept_from_sock(struct connection *con)
>  {
>  	/* Check that the new node is in the lockspace */
> -	struct sctp_prim prim;
> +	struct sctp_prim prim = { };
>  	int nodeid;
> -	int prim_len, ret;
> -	int addr_len;
> +	int addr_len, ret;
>  	struct connection *newcon;
>  	struct connection *addcon;
>  	struct socket *newsock;
> @@ -876,11 +875,7 @@ static int sctp_accept_from_sock(struct connection *con)
>  	if (ret < 0)
>  		goto accept_err;
>  
> -	memset(&prim, 0, sizeof(struct sctp_prim));
> -	prim_len = sizeof(struct sctp_prim);
> -
> -	ret = kernel_getsockopt(newsock, IPPROTO_SCTP, SCTP_PRIMARY_ADDR,
> -				(char *)&prim, &prim_len);
> +	ret = sctp_sock_get_primary_addr(con->sock->sk, &prim);
>  	if (ret < 0) {
>  		log_print("getsockopt/sctp_primary_addr failed: %d", ret);
>  		goto accept_err;
> diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
> index b505fa082f254..c98b1d14db853 100644
> --- a/include/net/sctp/sctp.h
> +++ b/include/net/sctp/sctp.h
> @@ -618,5 +618,6 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
>  int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
>  		int addrs_size, int op);
>  void sctp_sock_set_nodelay(struct sock *sk, bool val);
> +int sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim);
>  
>  #endif /* __net_sctp_h__ */
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index 64c395f7a86d5..39bf8090dbe1e 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -6411,6 +6411,35 @@ static int sctp_getsockopt_local_addrs(struct sock *sk, int len,
>  	return err;
>  }
>  
> +static int __sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim)
> +{
> +	struct sctp_association *asoc;
> +
> +	asoc = sctp_id2assoc(sk, prim->ssp_assoc_id);
> +	if (!asoc)
> +		return -EINVAL;
> +	if (!asoc->peer.primary_path)
> +		return -ENOTCONN;
> +
> +	memcpy(&prim->ssp_addr, &asoc->peer.primary_path->ipaddr,
> +		asoc->peer.primary_path->af_specific->sockaddr_len);
> +
> +	sctp_get_pf_specific(sk->sk_family)->addr_to_user(sctp_sk(sk),
> +			(union sctp_addr *)&prim->ssp_addr);
> +	return 0;
> +}
> +
> +int sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim)
> +{
> +	int ret;
> +
> +	lock_sock(sk);
> +	ret = __sctp_sock_get_primary_addr(sk, prim);
> +	release_sock(sk);
> +	return ret;
> +}
> +EXPORT_SYMBOL(sctp_sock_get_primary_addr);
> +
>  /* 7.1.10 Set Primary Address (SCTP_PRIMARY_ADDR)
>   *
>   * Requests that the local SCTP stack use the enclosed peer address as
> @@ -6421,35 +6450,19 @@ static int sctp_getsockopt_primary_addr(struct sock *sk, int len,
>  					char __user *optval, int __user *optlen)
>  {
>  	struct sctp_prim prim;
> -	struct sctp_association *asoc;
> -	struct sctp_sock *sp = sctp_sk(sk);
> +	int ret;
>  
>  	if (len < sizeof(struct sctp_prim))
>  		return -EINVAL;
> -
> -	len = sizeof(struct sctp_prim);
> -
> -	if (copy_from_user(&prim, optval, len))
> +	if (copy_from_user(&prim, optval, sizeof(struct sctp_prim)))
>  		return -EFAULT;
>  
> -	asoc = sctp_id2assoc(sk, prim.ssp_assoc_id);
> -	if (!asoc)
> -		return -EINVAL;
> -
> -	if (!asoc->peer.primary_path)
> -		return -ENOTCONN;
> -
> -	memcpy(&prim.ssp_addr, &asoc->peer.primary_path->ipaddr,
> -		asoc->peer.primary_path->af_specific->sockaddr_len);
> -
> -	sctp_get_pf_specific(sk->sk_family)->addr_to_user(sp,
> -			(union sctp_addr *)&prim.ssp_addr);
> +	ret = __sctp_sock_get_primary_addr(sk, &prim);
> +	if (ret)
> +		return ret;
>  
> -	if (put_user(len, optlen))
> +	if (put_user(len, optlen) || copy_to_user(optval, &prim, len))
>  		return -EFAULT;
> -	if (copy_to_user(optval, &prim, len))
> -		return -EFAULT;
> -
>  	return 0;
>  }
>  
> -- 
> 2.26.2
> 

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
