Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C301F4088
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 18:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8pdr2skMoqaRLBcpZR0ab6YQVtjh7SmoUoyBHYIPEM=; b=GLH5phCTJ2A2O+
	S5HTgxGB9aCKC15r9a4EPaJyuw3sXsdjwYa0IuB3EjvJ4EboM8cbtLqiKbIf4X0FwjW2APZMeVG21
	JY5QCMUdgJuZq4BOdZ7wyUbKfvRa8Nmr5Sk5Z4WVSFvksjCu9BYPwTIW9rUs1zLkE2hzNba7dPB7D
	jg5DOCsd65kPzwlotEDtMgULDF3Ta1HVdeOYo5qwR+aHV7G32Uh4QVxNI3T72kCUHqk9BRou4HnK8
	vXT1ZP03WaeHz/uwBIeHr14xqZfJ46bxsYYPamIcbDw2aJ7SYPPkCeYotn9NaD24jnbLoqxAMK5m9
	bYxdg6f2X0QMVLhVFadA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigy9-0003K7-UX; Tue, 09 Jun 2020 16:19:21 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigy7-0003Jf-RU
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 16:19:21 +0000
Received: by mail-pg1-x544.google.com with SMTP id r10so10497006pgv.8
 for <linux-afs@lists.infradead.org>; Tue, 09 Jun 2020 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ueyMjrt+cVmVw+FUtBmPoU2yNggdKKN+3InYLsTempU=;
 b=RZa4k0gdX/BrdYRuu5UbU3mCtRg5M7tITfvtIafMhGK1/7W6JOMfDwmDndeL2mMC31
 yNzF44u98E7F1ppN0a4sYDU8qBATLfUt2Vty8tAEUAUccnACIfrgaxemDDEGfchcknaB
 393Rn4PtQDLfi9We9ITW6jDW26mZCgdYJxzh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ueyMjrt+cVmVw+FUtBmPoU2yNggdKKN+3InYLsTempU=;
 b=R+9FZGzIW2upRCU3H11fZCRLFcFmJd1Fyf2LDonEJ5812FOc5KCrEC0ldGYD7dX95/
 lwS1e3H5BWjyHoTkz4/YMjn3ZYt0NY85+vc9S2U0eQZglhb9m9FOJLGmuHHOMCXIqjyl
 6xQ+Oi3KpszbZgziAveoLYshjovvH8BA7MbL+JPNcUNW9suFoCydxiBK0HVR+rDmafLv
 ifNIqTMXpGrndQGVH0yQH1/ChlRFKL9VdHpsHlT9a2y+vpYZz5QBaraX8OWZzQ4XO6Jn
 TZHaxLbARHFni6ZPQUqQVqdGJdGgt9W+oF26Lj1ab379aCwf5u3P6EswarGrte1yds55
 R95A==
X-Gm-Message-State: AOAM533zk2tSARAaweZPRaO0oCCiq3aGdnYJmWBEixO6zsG6qDDi53h+
 XoU9CMDg8mLoXOx9COjzS80lrdZ38NVyRg==
X-Google-Smtp-Source: ABdhPJzE6yGQaAHR9+5KrWHmMMPB2+bwupzZamf+a74907NKzb6ugUkxgWCFch7ofwWEXhGReam42Q==
X-Received: by 2002:a63:cc12:: with SMTP id x18mr24710834pgf.140.1591719558589; 
 Tue, 09 Jun 2020 09:19:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j2sm10367405pfb.73.2020.06.09.09.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 09:19:17 -0700 (PDT)
Date: Tue, 9 Jun 2020 09:19:16 -0700
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 3/6] afs: Fix use of BUG()
Message-ID: <202006090919.3FAC6C7A@keescook>
References: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
 <159171920664.3038039.18059422273265286162.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159171920664.3038039.18059422273265286162.stgit@warthog.procyon.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_091919_891508_E01CD32D 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:544 listed in]
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

On Tue, Jun 09, 2020 at 05:13:26PM +0100, David Howells wrote:
> Fix afs_compare_addrs() to use WARN_ON(1) instead of BUG() and return 1
> (ie. srx_a > srx_b).
> 
> There's no point trying to put actual error handling in as this should not
> occur unless a new transport address type is allowed by AFS.  And even if
> it does, in this particular case, it'll just never match unknown types of
> addresses.  This BUG() was more of a 'you need to add a case here'
> indicator.
> 
> Reported-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: David Howells <dhowells@redhat.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

-- 
Kees Cook

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
