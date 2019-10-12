Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AFAD4F3C
	for <lists+linux-afs@lfdr.de>; Sat, 12 Oct 2019 13:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R+xFF9/75PtSGIyohyxEEpb4/sIVfayOR97oggkGHI=; b=mkmlviyoAS5eqf
	tSmTojJqU91Tu+ReB40vY+FteHtA9B9IrJPVTbd4pNzHF9THGuADfWTHj4GoteA1OQSwuJvvTJten
	M6jpGZ7zWRMXi39NnxMR5f6WGbnhOo3rNYQYJM2NNgLAOtkoJquaTV6D0Tgx4iDNWoOp1mBrnvXuX
	HbZwiyWOz2ZIjZ+2vZ9hXYaxE7WCzZYCNGHqVbqQf2p9dZtghmE2pVy25RVdgEWxI/uryz+kPtRux
	Ocm+7VAkkm+59SKFXfNo0Y7QVxt4TD84okGBOrc649ktO2W10lrRSl087NNsd7J7Z+Q2+s9yCJ4Lz
	Z6RF7OEL+i8osFPLliOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJFDy-00072B-8D; Sat, 12 Oct 2019 11:06:14 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJFDv-00071e-Gk
 for linux-afs@lists.infradead.org; Sat, 12 Oct 2019 11:06:12 +0000
Received: by mail-pl1-x641.google.com with SMTP id w8so5681163plq.5
 for <linux-afs@lists.infradead.org>; Sat, 12 Oct 2019 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b35Ed/9iBBnm16JltqLPFC1hR6kvSZ6NR0s4StD621s=;
 b=Mnot09YNCMIrjLeZoj3eHMWwG/oNPnDYe36oOvVR4bLt1an75r1pejQVnwosgYcdDC
 D81RHP8k1w/WoBA6/MjQ14Rt9zGrdZCrh157sbbxCDxvWNyISBkz42sxiCtmsFhLgtGF
 /9IBPERa08PnBBfUPpf+x8STt3/nZwYQL6wF0QII/DQQFqiwAfxtwVtvtujH9WIkEehG
 rkHOZq4jE9UpYmQKOjoL8QTKCB9VVBEBkkEt7jmlNeF0r2pvLsc+XTZ9yEliX6Nnb2jz
 pWEt0Xekr+k24nRtBcSvnWHuPgmwOsxohZ/qFzdC402sRNCU8wDpGvEJiWuia/Ysn0hi
 SwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b35Ed/9iBBnm16JltqLPFC1hR6kvSZ6NR0s4StD621s=;
 b=rJjd1OW2q9+xt+UGLXBB82p1T9z0Aak0wBsPymbt0aCAZY0Lprmpx7VJqUGyOFR0HQ
 HqIKtV0ZGyqcTjsrr5XsIIMxP3xZVvrDYkUbv9DEZ6QYamAo3eZ+oPcNRI7M0FBe3jeA
 1NliM7TglDtE5hbKqQlbH8v6RA8kW9D/ZmZTLwYIeTChvvf0nMFrQxzjrvyTTkbqqynt
 ecIFI1ZmSHAzDZSD+GJL2+QZioPIZCndZZKxlXLqGOALU5C7ZcrjOjwZxV8AnD5/FewB
 2O98rDW62PAHii0q9FIW6qOhKra2Ekt2TuLajspjLbkhnmovzV1xl7S/18lc87/HNani
 BE0g==
X-Gm-Message-State: APjAAAUXzuj7KM6FrvM56rp12FOLw5wdOaN6DRx/7UmASrj5lKD2aNlV
 KHmwDxNJQDMcfPfEJ2wA0Dw=
X-Google-Smtp-Source: APXvYqzI/Dkq4rDjnCb+lKTdis8BUFpR5tyFOSG4JhvYrFH8f/bBFAllmFQax2jVlE1IWOdwNIPm5Q==
X-Received: by 2002:a17:902:a584:: with SMTP id
 az4mr19186745plb.74.1570878370004; 
 Sat, 12 Oct 2019 04:06:10 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-70.hsd1.ca.comcast.net.
 [73.241.150.70])
 by smtp.gmail.com with ESMTPSA id l21sm11721302pgm.55.2019.10.12.04.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Oct 2019 04:06:09 -0700 (PDT)
Subject: Re: [PATCH net] rxrpc: Fix possible NULL pointer access in ICMP
 handling
To: Eric Dumazet <eric.dumazet@gmail.com>, David Howells
 <dhowells@redhat.com>, netdev@vger.kernel.org
References: <157071915431.29197.5055122258964729288.stgit@warthog.procyon.org.uk>
 <bf358fc5-c0e1-070f-b073-1675e3d13fd8@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <bbf115d1-8197-426c-cbe8-bd1f5cff2041@gmail.com>
Date: Sat, 12 Oct 2019 04:06:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bf358fc5-c0e1-070f-b073-1675e3d13fd8@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_040611_582074_EF5BCD60 
X-CRM114-Status: GOOD (  12.20  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:641 listed in]
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



On 10/12/19 3:49 AM, Eric Dumazet wrote:

> 
> Okay, but we also need this.
> 
> diff --git a/net/rxrpc/peer_event.c b/net/rxrpc/peer_event.c
> index c97ebdc043e44525eaecdd54bc447c1895bdca74..38db10e61f7a5cb50f9ee036b5e16ec284e723ac 100644
> --- a/net/rxrpc/peer_event.c
> +++ b/net/rxrpc/peer_event.c
> @@ -145,9 +145,9 @@ static void rxrpc_adjust_mtu(struct rxrpc_peer *peer, struct sock_exterr_skb *se
>   */
>  void rxrpc_error_report(struct sock *sk)
>  {
> +       struct rxrpc_local *local = rcu_dereference_sk_user_data(sk);
>         struct sock_exterr_skb *serr;
>         struct sockaddr_rxrpc srx;
> -       struct rxrpc_local *local = sk->sk_user_data;
>         struct rxrpc_peer *peer;
>         struct sk_buff *skb;
> 

I will psubmit the patch later once David pushes his net tree, since I do not know yet
the sha1 of your patch (to provide a proper Fixes: tag)

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
