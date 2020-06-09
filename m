Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C831F4082
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 18:19:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWXpvrOvtdc/Plv4YtPtsqz8L4LQH2/EQKSeBnu7Aek=; b=t54HV+5joxbTPJ
	FboQaIhObLuhxx5+5qF7X5eMCUQV0idVjlwOgj7OcZIwWcYkqJd+tocrwRfxSDfigdMqCcRikFOvQ
	dUCFj63TvyBeQ8X64rHEe64y2Z4wlsTsmejLDc7H2DMwTWao3ZqwsuJOJ3bTib4siOFYZTCNA/axb
	eJTMRgLQcmhGIEr22/60tccsbVr+vib+yFdh+5Z8fV0EPICkMD2nbntKsuyiKZyd0BZbVmJxgrh24
	6S5xf5JrKNxPCBtInfY5++fcX8t1Zn5Tnh8Bg+OxYPbrHkhuNHKY3Ihhg005Xzppjnq7kRyWY4yuz
	dnYCSMEcNOVIRGKPB4Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigxj-0003GU-Kw; Tue, 09 Jun 2020 16:18:55 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigxg-0003GC-M9
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 16:18:53 +0000
Received: by mail-pl1-x641.google.com with SMTP id t7so8237956plr.0
 for <linux-afs@lists.infradead.org>; Tue, 09 Jun 2020 09:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ztrSjb9Hc0jDPbsrcCP9Go/9i0R+UcDFFdl7eZx/r6Q=;
 b=Wt0DGBGICEfKEaimVAhmarg/KGSjFyRO5TzqXO6XNLncSbl4O/fYj7iUOCtswpKzN+
 HevAzRySRopFcCSeXweK5e1PBXobSPbw5nH2EJMegFAuKaGoY8E1mOIVxh2aev2COv0t
 kmR/gG4ejJZ4/WNjHaoSiU7wu9Cj80+IT+LS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ztrSjb9Hc0jDPbsrcCP9Go/9i0R+UcDFFdl7eZx/r6Q=;
 b=L9oaq9mE3EMRFr28OG289f1aJ5zc4c05lt7eoZ1rzLtGAEPqJHaowT5ASnusypbwyL
 205JtR0wFW8tkVnvJiAaXVSQcwaOwO7+LssFm/eLZaE6B1HvgGa4gyZ3PXqUdYl4SyZ3
 IrfbifGbC/8ENTOmKDXgxlM0rv7pfczGnWw9oi5/MFw0ZG/hw/xQM5/nqHeFVQ7x+Gq/
 4/7VxnFGg6dJ2tlLnjiWZhcyC0xXC6ru2EJlmNoHx2YIQnE19EtqIzNSGgY2ZiM6u7oZ
 6BHVk5XxYx6fulIz7yY8vKE5kEMZcWPiXWoxxc2eDQXoeNlt7YqvKxiO2unfIkmwFfrB
 N/iQ==
X-Gm-Message-State: AOAM531OELkIrfIwFXfJm8inZasdQxIZ5e7G0TgHCStqk0xQRBLb6gko
 WX1Y2FMZsX3NLDQe6bLpGhl+JkS60SG0+Q==
X-Google-Smtp-Source: ABdhPJzjmSmb72TVgOWLhqsjL+dd4r5fyjx7ZveMTCvaUG5Lp8LN8tzhQDJ3aYIZ5V3XnrmyX+A/dg==
X-Received: by 2002:a17:902:aa92:: with SMTP id
 d18mr4086799plr.127.1591719530249; 
 Tue, 09 Jun 2020 09:18:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h3sm3136722pje.28.2020.06.09.09.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 09:18:49 -0700 (PDT)
Date: Tue, 9 Jun 2020 09:18:48 -0700
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 4/6] afs: Fix debugging statements with %px to be %p
Message-ID: <202006090918.58395776C@keescook>
References: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
 <159171921360.3038039.10494245358653942664.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159171921360.3038039.10494245358653942664.stgit@warthog.procyon.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_091852_739848_52687DD6 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:641 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, Jun 09, 2020 at 05:13:33PM +0100, David Howells wrote:
> Fix a couple of %px to be %x in debugging statements.
> 
> Fixes: e49c7b2f6de7 ("afs: Build an abstraction around an "operation" concept")
> Fixes: 8a070a964877 ("afs: Detect cell aliases 1 - Cells with root volumes")
> Reported-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: David Howells <dhowells@redhat.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

-- 
Kees Cook

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
