Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E81D81F0438
	for <lists+linux-afs@lfdr.de>; Sat,  6 Jun 2020 03:59:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuG6FCOAXWAW+w2rK2w9YwXF+VquTYsdkYTzKVhIEfM=; b=kZXbc7PcCTHc7B
	yB2h5mCuUX2oAf7Vb2nodSYO/v0ljPAdN9K45hHD3EifD1xWVRmpDhO0AsfvuHvSzCWNrva59xHf9
	suG5Qui0rLsFCBxnAfl+fOxlO89t2FVFGmHB+HtUP83EX1yUNolsm1fcrAeXwMS2ess6BVp7P5bWz
	4rzAqvgOaEWrBKSLBR1zPrN5A7EP97IS1GMuun+xjdy5eptzMhvn7+kiqLKSNicbHIY1VprJMJkOV
	ODqg5tzkEO0i5uQ67l+6nXgLWGkgbPQQr+fw4LSGUbtlau+BlgbjnYlSuUqSe4MVjOlTU4O5sUJR4
	peYvvcCBWbw5phx0JxaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhO6t-0005pn-CM; Sat, 06 Jun 2020 01:58:59 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhO6q-0005p7-MP
 for linux-afs@lists.infradead.org; Sat, 06 Jun 2020 01:58:58 +0000
Received: by mail-pg1-x544.google.com with SMTP id o6so6011346pgh.2
 for <linux-afs@lists.infradead.org>; Fri, 05 Jun 2020 18:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ubiyZ733CfEJjdLHhaoOsVA1qzS8di3dJmbcr/gH2uM=;
 b=cAQW8ecDYpX05sVWOHMBk1sbV5DXDbFHVqcQUUOEWATk8Z077CtX6sGKmDYPmCQo0j
 cWwStNFFXcL5bGQ5XRO2g4V/CRmVQxBRaFMK96+FjTNOA4HtICtpU1S+KzQYWjz+6hS/
 l+X7QQX1smTeSTPqjUrYKWb3GMIRmesyECBZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ubiyZ733CfEJjdLHhaoOsVA1qzS8di3dJmbcr/gH2uM=;
 b=GCP3W4GePIz210mibiXnb9aJ7SslAiX6UPs/fg1P9ojHVFwECyUBNO7ry3CZqdg9Tt
 N0PajOSgqsDAPvKc3/sTcpau0IhcvS4xROUdOayGfHtDTYSf1hV8B+4OXlijaEZKfX6Z
 icR0wVuhNw1XyOXxSnFrZT54E6EgBmJaiYrQBGI6mjKXCG4sT4p2mO1oh22CPvpYMrk3
 5Pw/GL/DcK/69hGD/X3AzUGQgb+C54MXsK/WQxpJvuyjoSOXvfnipPfar4NnQ821ZXSD
 IIB/eaYtI5SbPGL2bFr/XWRJeGclMpR88xuehv6OtDWvFQb4r2YbYVuuYALqYEJY68I1
 /Xfw==
X-Gm-Message-State: AOAM530WuUAzlf94j/Zko/JeGEX0WvZfSVCkw7BZFrRvUDmIPr7pzrEL
 A7DD+k4leyLtHoh4TKPzoXDRHA==
X-Google-Smtp-Source: ABdhPJyeGr9iCUKxjFBLcQwcqAStcKGLhCd1nJ9DaQgFhqK2lIGzXeCTkSGZWy0vIFqUT4/Fcwv0Dw==
X-Received: by 2002:aa7:8bd0:: with SMTP id s16mr12878768pfd.80.1591408733436; 
 Fri, 05 Jun 2020 18:58:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y136sm787864pfg.55.2020.06.05.18.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 18:58:52 -0700 (PDT)
Date: Fri, 5 Jun 2020 18:58:51 -0700
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 18/27] afs: Detect cell aliases 1 - Cells with root volumes
Message-ID: <202006051849.746915FD@keescook>
References: <159078959973.679399.15496997680826127470.stgit@warthog.procyon.org.uk>
 <159078973503.679399.3701716594246594498.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159078973503.679399.3701716594246594498.stgit@warthog.procyon.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_185856_760621_242C09B2 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:544 listed in]
 [list.dnswl.org]
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, May 29, 2020 at 11:02:15PM +0100, David Howells wrote:
> +static struct afs_volume *afs_sample_volume(struct afs_cell *cell, struct key *key,
> +					    const char *name, unsigned int namelen)
> +{
> +	struct afs_volume *volume;
> +	struct afs_fs_context fc = {
> +		.type		= 0, /* Explicitly leave it to the VLDB */
> +		.volnamesz	= namelen,
> +		.volname	= name,
> +		.net		= cell->net,
> +		.cell		= cell,
> +		.key		= key, /* This might need to be something */
> +	};
> +
> +	volume = afs_create_volume(&fc);
> +	_leave(" = %px", volume);
> +	return volume;
> +}

This really doesn't seem like a justified[1] place for %px. (Even if
_leavel() is debug-only, all the rest of _leave() uses are %p.)

> +	default:
> +		BUG();

And nothing should add BUG() to new code[2].

-Kees

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#p-format-specifier
[2] https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bug-on

-- 
Kees Cook

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
