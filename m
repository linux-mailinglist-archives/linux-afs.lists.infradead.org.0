Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D864D751A6
	for <lists+linux-afs@lfdr.de>; Thu, 25 Jul 2019 16:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=murvEq9PNRTVl4vnZg2OuzJA7shsn+x+MTkp8mVSvtQ=; b=AekHOMgPFx9hIE
	3c9/FQ4zDQjqk5Fw18yTIzHlbDoNB6wxJzo80s4ya7rxLwHJp9jlBx2+ECTJlotshk3UZdjS3Pk0m
	XwwwIlIst7MYzvCmw/09nS85ka0lDNXB2kw2AneJwSYQ4imjKDQ8ceWVqiC0H3flPPShYKEEBjYor
	mOe+K5kz091Uga4nuVs+qrRmHVWvHxe1aBg6YdGLPWVPu4Dxaoz3K9rpubQHoLd50zZMigNwPnQo6
	Pnd5Sagl8QPmCdxzvJAHFKpTKI4+IwPwrRVppg0OIsUgfl24/v8PjAM4+S92AYNDEWnggiZJkvreN
	cS8w2CSR1J27CS/sFENg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqezz-0006TI-4n; Thu, 25 Jul 2019 14:45:39 +0000
Received: from mail-qk1-f196.google.com ([209.85.222.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqeyT-00048w-3Q
 for linux-afs@lists.infradead.org; Thu, 25 Jul 2019 14:44:06 +0000
Received: by mail-qk1-f196.google.com with SMTP id t8so36605805qkt.1
 for <linux-afs@lists.infradead.org>; Thu, 25 Jul 2019 07:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=funkA3SMKZCSiaNaKD/uWvlPYKWjK7kWFho0OBB3Ohw=;
 b=N7yvmVyGaMOGIn7mbTa/3VEfR7A3W9C8WSnnfy45wceKyzQn77SoyWgCmDHN/V6APD
 YApjQJeazMQBjOHS3DD/2yJSaqyYtyB6rGzZBl8/HLO//K78hi5NUVvZYBxvzx77KHHW
 WfyK/CXWORm0O0+psN37TgCcSucBOcBI6XdsbWAJeZpTFCY5rlaewW/LbwBVl9fr3o+G
 dm12OmZNeptpQzyHeqwQrp3EZUHCIxjAhu9lwNyi27DeMa4mlUGZeYzcHpfaDbyX/sKf
 xsh3jPmRGjOpn/V/Ge7COBE6wmbvMLPIvs4wQq5Il0e3zxOScaBToDDz4zozNIWyDmON
 IEbg==
X-Gm-Message-State: APjAAAVyf4am3qJdK5pQ4OnWu1tazFVPtHbAGnIdu+BoxEPVzuwxHHlo
 xgqCmtGiYRV0ieVmHSWcg8o8Hpve63y069QdSnk=
X-Google-Smtp-Source: APXvYqwLK6uX7FbbnLqPq6Bqf5v0pn5uNhnqfNQ8BRbrxD0d/isKagxy52S93HxU9iP1qyG+bsfu3S54dO/9sB5hleE=
X-Received: by 2002:a37:76c5:: with SMTP id
 r188mr58280759qkc.394.1564065843402; 
 Thu, 25 Jul 2019 07:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <156406148519.15479.13870345028835442313.stgit@warthog.procyon.org.uk>
In-Reply-To: <156406148519.15479.13870345028835442313.stgit@warthog.procyon.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Jul 2019 16:43:47 +0200
Message-ID: <CAK8P3a23gnvxA3PcvFy5wadNGoCPRH7PUEY_dqJ+bk3uH5=t+g@mail.gmail.com>
Subject: Re: [RFC PATCH] rxrpc: Fix -Wframe-larger-than= warnings from
 on-stack crypto
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_074405_204720_1D90E579 
X-CRM114-Status: GOOD (  12.43  )
X-Spam-Score: 0.3 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.196 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (arndbergmann[at]gmail.com)
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
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
Cc: "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 linux-afs@lists.infradead.org, Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, Jul 25, 2019 at 3:31 PM David Howells <dhowells@redhat.com> wrote:
>
> rxkad sometimes triggers a warning about oversized stack frames when
> building with clang for a 32-bit architecture:
>
> net/rxrpc/rxkad.c:243:12: error: stack frame size of 1088 bytes in function 'rxkad_secure_packet' [-Werror,-Wframe-larger-than=]
> net/rxrpc/rxkad.c:501:12: error: stack frame size of 1088 bytes in function 'rxkad_verify_packet' [-Werror,-Wframe-larger-than=]
>
> The problem is the combination of SYNC_SKCIPHER_REQUEST_ON_STACK() in
> rxkad_verify_packet()/rxkad_secure_packet() with the relatively large
> scatterlist in rxkad_verify_packet_1()/rxkad_secure_packet_encrypt().
>
> The warning does not show up when using gcc, which does not inline the
> functions as aggressively, but the problem is still the same.
>
> Allocate the cipher buffers from the slab instead, caching the allocated
> packet crypto request memory used for DATA packet crypto in the rxrpc_call
> struct.
>
> Fixes: 17926a79320a ("[AF_RXRPC]: Provide secure RxRPC sockets for use by userspace and kernel both")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Herbert Xu <herbert@gondor.apana.org.au>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
