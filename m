Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C652CA81
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 17:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgW8ryKt3J4/aItA0WTw6MvRVy3duCANHR1xnRyPrxE=; b=XctNxKYdXMJ8hU
	8t5VcEb7GEhPYox/wGs44Ht+KiGq0tARf53LWt6Bg2cRy5bgD2tT21Ui4uQMMqu2w1sZCWtNTWis7
	JiaAXAozP2sarAzX3rA9rkST8vaC04/MOXyPosu5Uhf6xEyo50YxIMRCuxHJs82Ceh87IvGbHjCbg
	djqi05niJtSozjJ7Kg8l4Mz3DJXttb2mS65izXJ3Qo6Mx5CBbjekWYAtKIEYBOg4oF/UR+oaVuAhU
	WhC0+HW/22ekf/7pBwX4lAPTCsiAOlNPQoOAtT7qaJQz0xUqhanbTObSaUQqEQQw4NRqcOGCSro2U
	djk8ytJMAqAihQ5oT3tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeFW-0004Yf-6S; Tue, 28 May 2019 15:42:50 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVeFO-0004X7-Vw
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 15:42:48 +0000
Received: by mail-ed1-x541.google.com with SMTP id s19so4291506edq.7
 for <linux-afs@lists.infradead.org>; Tue, 28 May 2019 08:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qeekGI+uXQy3jlEv+N7GO97qVs9m18isKX3ghrVsYNg=;
 b=BTxm2JN4TnZY5oEIAoAuBlUzwOpA0fyAfDXZy5d0jtPqAmRgGbeuWhtxJZr0h9LN1E
 s1P2f3XKDDvGy1o+LQWaU65kn5WNVoQqA/I3y1Ca/1152RmednbWHuttXBYLUFkYByvg
 sOFq9xhZCzsG/md6F2JpwpIi4g1panvaJ3JMNnde48voptkpmy4Z8mmwvEUEd+rkPpiH
 1eHhqEWZO9Ah3PY+/Nxjn1SM3XOFdvQCIXS7WZN5EVgk5rq2GKCaberchbEmQzZSDT2i
 ixIqEDqbdeSpo+6lLo+j6SxZUCV42jjvCmzEbOAzc42x1G35yMwVPpE2b6pNAnYfg5qw
 OL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qeekGI+uXQy3jlEv+N7GO97qVs9m18isKX3ghrVsYNg=;
 b=HIn54i0WohlMrIY9f3y/FHkoSFagIwhIE7hNdCGt6INfvAbtrbg18FP/rpM1PGzhor
 hpPxoPzoAzR/KTeeLOn/6Aj1WCENv/j9x3NxGDsQ3vzYhcG4CJ/615PW/PVizbOG6dpi
 7ulCOLKF77lhri7k2bGZdSvGsz4vtsVOjmJJ/D7A3gB6s2xtYu6hUJIuS0ghtUD/7uhS
 rCjSFeJJ53CnmmnM6KHIdyaEAIzCew95ZotR65azqnsV/784AmFbwryyRT56b0BqdAva
 PzLmxOaMdKyrzsTahVmMIDmEx7M33Uvy9iDmJfYe7YrUMVwJzQb50NCvaOM3V0KyXgpr
 SrfQ==
X-Gm-Message-State: APjAAAUgs/1q1D2f0k+HQXZ8wKAsichfzsc3IpnjHo/cZQQFQJHN0r3U
 5I92eeAmtkU2XSntiY67gPTU36jY+GQqVoZQWvE=
X-Google-Smtp-Source: APXvYqzK5ecXGBnnhHqTBpPNezM4AvVoE3btCq3oudOjiiLkpzhZIdIWfnUH5yuztayDSkpXA7Sl31CoDbjf0TWHoA4=
X-Received: by 2002:a17:906:f48:: with SMTP id
 h8mr58704847ejj.142.1559058153169; 
 Tue, 28 May 2019 08:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190527165413.GA26714@embeddedor>
In-Reply-To: <20190527165413.GA26714@embeddedor>
From: Marc Dionne <marc.c.dionne@gmail.com>
Date: Tue, 28 May 2019 12:42:21 -0300
Message-ID: <CAB9dFdtT0p+Sg5=qt=Te9FEkASXcH=ZQZRHyN1UQ3nYkDLHMpQ@mail.gmail.com>
Subject: Re: [PATCH] afs: Fix logically dead code in afs_update_cell
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_084243_027502_C9F83556 
X-CRM114-Status: GOOD (  17.12  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:541 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (marc.c.dionne[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, May 27, 2019 at 1:54 PM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> Fix logically dead code in switch statement.
>
> Notice that *ret* is updated with -ENOMEM before the switch statement
> at 395:
>
> 395                 switch (ret) {
> 396                 case -ENODATA:
> 397                 case -EDESTADDRREQ:
> 398                         vllist->status = DNS_LOOKUP_GOT_NOT_FOUND;
> 399                         break;
> 400                 case -EAGAIN:
> 401                 case -ECONNREFUSED:
> 402                         vllist->status = DNS_LOOKUP_GOT_TEMP_FAILURE;
> 403                         break;
> 404                 default:
> 405                         vllist->status = DNS_LOOKUP_GOT_LOCAL_FAILURE;
> 406                         break;
> 407                 }
>
> hence, the code in the switch (except for the default case) makes
> no sense and is logically dead.
>
> Fix this by removing the *ret* assignment at 390:
>
> 390     ret = -ENOMEM;
>
> which is apparently wrong.
>
> Addresses-Coverity-ID: 1445439 ("Logically dead code")
> Fixes: d5c32c89b208 ("afs: Fix cell DNS lookup")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  fs/afs/cell.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/afs/cell.c b/fs/afs/cell.c
> index 9c3b07ba2222..980de60bf060 100644
> --- a/fs/afs/cell.c
> +++ b/fs/afs/cell.c
> @@ -387,7 +387,6 @@ static int afs_update_cell(struct afs_cell *cell)
>                 if (ret == -ENOMEM)
>                         goto out_wake;
>
> -               ret = -ENOMEM;
>                 vllist = afs_alloc_vlserver_list(0);
>                 if (!vllist)
>                         goto out_wake;

Looks like the intention here was to return -ENOMEM when
afs_alloc_vlserver_list fails, which would mean that the fix should
move the assignment within if (!vllist), rather than just removing it.
Although it might be fine to just return the error that came from
afs_dns_query instead, as you do in this patch.

Marc

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
