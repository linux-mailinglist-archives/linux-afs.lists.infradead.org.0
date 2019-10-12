Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 49026D4F27
	for <lists+linux-afs@lfdr.de>; Sat, 12 Oct 2019 12:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ic3bY1HcT76XU+qSlz3C78InMN929EO76lr8bMy7sUc=; b=Va6RRlz4So2qLB
	kHS2KvxpHFOzXRdlVsgLsU4wVJQAtJZQuVJpcTrwX2ImNMFjeiKvYHLAxYCeuDzgaU7k5ZRnru48k
	h14ce2qCyypxwJexR8L9YBDu4WyQwaWhoDIN027Ll6LD6Jh4no0H8ZEnQfDJNZbhEmujkLmT//Yvf
	C11nHRiiVsxxc1tuUgwyVKl/yF5chMjtYBxnLGGSPa0gpW8JLUvP3vQLk/oRpmZEXgWOCqHnRxS6Z
	TFEZmD01j3pVWDhEALB1ofXyowB7ZBc7CLA3GLc5xmmFrLqP9duoZBDYyUDR5O43GeAchRzcKG5O1
	B5gbtvujYxLVJ/8z5H6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJEyC-0000xY-Lg; Sat, 12 Oct 2019 10:49:56 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJEy9-0000x9-0S
 for linux-afs@lists.infradead.org; Sat, 12 Oct 2019 10:49:55 +0000
Received: by mail-pf1-x442.google.com with SMTP id q12so7579951pff.9
 for <linux-afs@lists.infradead.org>; Sat, 12 Oct 2019 03:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CKzoOCBU83sCPMzDHQyLdCwFveOeVbaB4oF2R1VkE+g=;
 b=KgOcuv9jDFFNxf+p412p8nmsabm/ErZulfUN/6WDBFh1gOrzdsKrJV9QAG5QvvvMbD
 y2/t7CpcC1Z919okSMP5RYZmCFjh9wjIzWhKT8CIp2lbNoFiPlxDRHn4icjOei7AI6AS
 nb+hBd800PwNmNmEdjfh+msh5gvl2pGuXWMxQB6uz0dY2xclEEbl8s1PfydFBvbg3Kog
 TpnQwUj8W6SAGGu6mYRbXa9pSWTlvFh/TdG3xyQSmThhah7S+wWgiVLWzhn0ejR4TSN8
 JbJbDsgHd3xUIvt81kahtyvDznC8q53H8qN/gQoy6il6iTEtVDYKKv95X20eY9hKhR/8
 15pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CKzoOCBU83sCPMzDHQyLdCwFveOeVbaB4oF2R1VkE+g=;
 b=BsoVZTwWE2+UQbBuKu7nlISsVKLEzzaoLqFLh3hNWHzLJzGX1tJv4WHLgsw8lTebmp
 s7XYiN1VjsAeYsM/DOus0Mfie7UTWGOSP0KyDyowJL9NU7vMAAJL+avCk9U0k6bdAJm2
 A7q+MgZSjjCuAmkKU+Y4yp89KmONLv9lpEOdYQc9DBfw5ZLgPCHL9+psoVsd246EDSLV
 x7e+o44WM3xCFK74+CvwE6mK5CcQ6gehpv0wgypu/RctirqnR5rk3/7THWMgwST4k2Ds
 R7udb34TohGNU3cSnpqu1ScoWZPaWTZ+WynRpoq4TvUBCuV6HukKnoOkuLZHlGctxDYI
 tIdQ==
X-Gm-Message-State: APjAAAXPdYgvLWm9yuFJaP42NSUKFSm+n4htvGxZAbrGq7HTrvuysWoQ
 pDn+s2luqKgt09/Y6novqMg=
X-Google-Smtp-Source: APXvYqxILWzISNg6tqGfCZGkW4J7WabpBjmDAyQH1CFw01hJKKc9jt60XV+2zxOHQE3JdRAvN5HWpw==
X-Received: by 2002:a17:90a:eac4:: with SMTP id
 ev4mr23392197pjb.97.1570877391979; 
 Sat, 12 Oct 2019 03:49:51 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-70.hsd1.ca.comcast.net.
 [73.241.150.70])
 by smtp.gmail.com with ESMTPSA id g4sm10817681pfo.33.2019.10.12.03.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Oct 2019 03:49:50 -0700 (PDT)
Subject: Re: [PATCH net] rxrpc: Fix possible NULL pointer access in ICMP
 handling
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
References: <157071915431.29197.5055122258964729288.stgit@warthog.procyon.org.uk>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <bf358fc5-c0e1-070f-b073-1675e3d13fd8@gmail.com>
Date: Sat, 12 Oct 2019 03:49:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <157071915431.29197.5055122258964729288.stgit@warthog.procyon.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_034953_075972_E446D19B 
X-CRM114-Status: GOOD (  19.08  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:442 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (eric.dumazet[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org



On 10/10/19 7:52 AM, David Howells wrote:
> If an ICMP packet comes in on the UDP socket backing an AF_RXRPC socket as
> the UDP socket is being shut down, rxrpc_error_report() may get called to
> deal with it after sk_user_data on the UDP socket has been cleared, leading
> to a NULL pointer access when this local endpoint record gets accessed.
> 
> Fix this by just returning immediately if sk_user_data was NULL.
> 
> The oops looks like the following:
> 
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> ...
> RIP: 0010:rxrpc_error_report+0x1bd/0x6a9
> ...
> Call Trace:
>  ? sock_queue_err_skb+0xbd/0xde
>  ? __udp4_lib_err+0x313/0x34d
>  __udp4_lib_err+0x313/0x34d
>  icmp_unreach+0x1ee/0x207
>  icmp_rcv+0x25b/0x28f
>  ip_protocol_deliver_rcu+0x95/0x10e
>  ip_local_deliver+0xe9/0x148
>  __netif_receive_skb_one_core+0x52/0x6e
>  process_backlog+0xdc/0x177
>  net_rx_action+0xf9/0x270
>  __do_softirq+0x1b6/0x39a
>  ? smpboot_register_percpu_thread+0xce/0xce
>  run_ksoftirqd+0x1d/0x42
>  smpboot_thread_fn+0x19e/0x1b3
>  kthread+0xf1/0xf6
>  ? kthread_delayed_work_timer_fn+0x83/0x83
>  ret_from_fork+0x24/0x30
> 
> Fixes: 17926a79320a ("[AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both")
> Reported-by: syzbot+611164843bd48cc2190c@syzkaller.appspotmail.com
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 
>  net/rxrpc/peer_event.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/rxrpc/peer_event.c b/net/rxrpc/peer_event.c
> index c97ebdc043e4..61451281d74a 100644
> --- a/net/rxrpc/peer_event.c
> +++ b/net/rxrpc/peer_event.c
> @@ -151,6 +151,9 @@ void rxrpc_error_report(struct sock *sk)
>  	struct rxrpc_peer *peer;
>  	struct sk_buff *skb;
>  
> +	if (unlikely(!local))
> +		return;
> +
>  	_enter("%p{%d}", sk, local->debug_id);
>  
>  	/* Clear the outstanding error value on the socket so that it doesn't
> 

Okay, but we also need this.

diff --git a/net/rxrpc/peer_event.c b/net/rxrpc/peer_event.c
index c97ebdc043e44525eaecdd54bc447c1895bdca74..38db10e61f7a5cb50f9ee036b5e16ec284e723ac 100644
--- a/net/rxrpc/peer_event.c
+++ b/net/rxrpc/peer_event.c
@@ -145,9 +145,9 @@ static void rxrpc_adjust_mtu(struct rxrpc_peer *peer, struct sock_exterr_skb *se
  */
 void rxrpc_error_report(struct sock *sk)
 {
+       struct rxrpc_local *local = rcu_dereference_sk_user_data(sk);
        struct sock_exterr_skb *serr;
        struct sockaddr_rxrpc srx;
-       struct rxrpc_local *local = sk->sk_user_data;
        struct rxrpc_peer *peer;
        struct sk_buff *skb;


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
