Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 898A31D7D67
	for <lists+linux-afs@lfdr.de>; Mon, 18 May 2020 17:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NxGc0ZHtsHPKT4yyBPxyz5cC/PcqP7d8KrOkOo82BQ=; b=G/gAyQnX0RuLkG
	fYJChOS9krfceAcuRhcHLeZq8Ds5Vd0ZqzinW3dEylNIwz9sLWvSm2q9tguSWPIAsoZQS443tQEJP
	QaH01W21FC254X4S2tAqDCF3HZRhiZv18wKiQ+rO+VKdBgBPuluvRXrZgOGXCuMB1NpDvOaSoUxWN
	KEEwHc7dECmHHK21u1cA7kF2ipy2dnfNpr0APmfJP9o7DMC1rDa2WLBEjwAQ8u9iY0MwacKhakBKR
	W7wRytM7YY5j+0PSXBpSb6a0XE680eQxopA9bsbRKPcpiD8a45CjuFFkSEnJvmmLWsWmWc0NSU3mS
	ufvvjlByg4yitMRYS4xA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jai3b-0006CY-C6; Mon, 18 May 2020 15:51:59 +0000
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jai3Y-0006B8-Ch
 for linux-afs@lists.infradead.org; Mon, 18 May 2020 15:51:57 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 5654D846;
 Mon, 18 May 2020 11:51:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 18 May 2020 11:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
 h=date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-type:in-reply-to; s=fm1; bh=/k6Uxefv5KR5De
 o3sESOUjXzq3bRzNHWL0Vw3jNx8TM=; b=NuHvEljJ+d74MxbNbt0IcdDN9xc84T
 EHDdvqt6RshgLbRFK11KxarFQSg70p+Yxu84qM7lnNczEPSpda/54k4frRshT1R+
 mnvd5x6t3qobpjBelcWkpRa220yT/HRfma6Uo7cne5YZd9kg2UskjsSamJs1sH8/
 JA8PHE6IGQsj7w5iehy6XA6qqldh2z8dIDZ8tMH6dCoTen95zf4fyT3AoBX/H2TP
 fCEdNzyqF8ix2q6KA+CadEgziyKc7NsWnwou7E8pez7bukRDTTksrMlIu43yMg50
 xPfJuXBPHqLh1kUt3LS0y7vRAi5+geDedxdo18mrnN3LYqPx+no2BH3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/k6Uxefv5KR5Deo3sESOUjXzq3bRzNHWL0Vw3jNx8TM=; b=2Dsh/SQK
 jh0rMCyIN1dsj3q/pvM29qDgAKEEn8qBwoQ96CGb8MnYpgoslHQ2lqii4qza6FOO
 fQ4zj69L+Huv3c0qwZSv16LSAKj70prQQVwTH4TmAbaPDalmNBXEKRebbpubvS5y
 s1HNJ7FuOsaSS9hmClcDd7exNhAR1r+2e6pYalGRVDSqLkYQb+zqsT6JLPjA4HK1
 7voixJCaR5FeomBF3To98M0vSKj4GFyl4xhBX6GtzU6JcjslkY4KGUXI/JkL+QGL
 FuaE5Uz9vF/urYEUQfXhcJO52sQ5zE9dQawtHWClo9AA9nyBQlBfdyoGgVjzwvxI
 3lGaBlAV/65V8g==
X-ME-Sender: <xms:Fa_CXqMd_B97yruaVQXL4CFEm8jLzuxkrixrkxh8qou0A-fq4XGR9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhrfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghn
 uceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrth
 htvghrnhepjedtvdffheetgfektdehvefgieelgeefheejvdehtdduieetgedtfedtleev
 vdffnecukfhppeeiledrvddtgedrudeikedrvdeffeenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:Fa_CXo8sMxWTUWmv33PUjhTxoMuKU7rvHqc7EWQ3INq8FFxQT8gMCA>
 <xmx:Fa_CXhTLBg6uuY7B0m3xh1NPwmYx5ciDsH2XpqWXAyxcwKgI56REtg>
 <xmx:Fa_CXqvbq-ZBzOBW1yy4gEEI5foZBb09cHJZ5ra5EvuEcWddAG6ugQ>
 <xmx:Fa_CXvFsXzihHcpc90fzRH_BtU5FWd7GCiMfwYd9AqDrbQI68lNZ0A>
Received: from localhost (cpe-69-204-168-233.nycap.res.rr.com [69.204.168.233])
 by mail.messagingengine.com (Postfix) with ESMTPA id 77A3730663FD;
 Mon, 18 May 2020 11:51:49 -0400 (EDT)
Date: Mon, 18 May 2020 11:51:48 -0400
From: Ben Boeckel <me@benboeckel.net>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] dns: Apply a default TTL to records obtained from
 getaddrinfo()
Message-ID: <20200518155148.GA2595638@erythro.dev.benboeckel.internal>
References: <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_085156_614352_ADB39063 
X-CRM114-Status: GOOD (  20.05  )
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [64.147.123.21 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [64.147.123.21 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Reply-To: me@benboeckel.net
Cc: fweimer@redhat.com, linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, May 18, 2020 at 15:22:45 +0100, David Howells wrote:
> Address records obtained from getaddrinfo() don't come with any TTL
> information, even if they're obtained from the DNS, with the result that
> key.dns_resolver upcall program doesn't set an expiry time on dns_resolver
> records unless they include a component obtained directly from the DNS,
> such as an SRV or AFSDB record.
> 
> Fix this to apply a default TTL of 10mins in the event that we haven't got
> one.  This can be configured in /etc/keyutils/key.dns_resolver.conf by
> adding the line:
> 
> 	default_ttl: <number-of-seconds>
> 
> to the file.

Is there precedent for this config file format? It looks like possible
YAML, but this patch doesn't mention that anywhere. Is there a good
reason to not be using an existing format (ini, toml, json, shell-alike,
anything)? I have no preference for anything other than a format that
already exists out there. Maybe one that supports comments too so that
these settings can have context associated with them in real
deployments (which effectively rules out json)?

> +	while (fgets(buf, sizeof(buf) - 1, f)) {
> +		line++;
> +		if (buf[0] == '#')
> +			continue;

So it does support comments...

> +		p = strchr(buf, '\n');
> +		if (!p)
> +			error("%s:%u: line missing newline or too long", config_file, line);
> +		while (p > buf && isspace(p[-1]))
> +			p--;
> +		*p = 0;
> +
> +		if (strncmp(buf, "default_ttl:", 12) == 0) {
> +			p = buf + 12;
> +			while (isspace(*p))
> +				p++;

...but not if it starts with whitespace. So if one does indent the
`default_ttl` setting for whatever reason, the comment is stuck at the
first column.

> +			if (sscanf(p, "%u%n", &u, &n) != 1)
> +				error("%s:%u: default_ttl: Bad value",
> +				      config_file, line);
> +			if (p[n])
> +				error("%s:%u: default_ttl: Extra data supplied",
> +				      config_file, line);

But no trailing whitespace is allowed?

> +			if (u < 1 || u > INT_MAX)
> +				error("%s:%u: default_ttl: Out of range",
> +				      config_file, line);

The valid range should be mentioned in the docs (basically that 0 is not
allowed and has no special meaning (it could mean leaving off the TTL as
previously done)).

> +			key_expiry = u;
> +		} else {
> +			error("%s:%u: Unknown option", config_file, line);

Forwards compatibility is hard with such behavior. Is there any reason
this can't be a warning?

> @@ -24,6 +26,21 @@ It can be called in debugging mode to test its functionality by passing a
>  \fB\-D\fR flag on the command line.  For this to work, the key description and
>  the callout information must be supplied.  Verbosity can be increased by
>  supplying one or more \fB\-v\fR flags.
> +.P
> +A configuration file can be supplied to adjust various parameters.  The file
> +is looked for at:
> +.IP
> +/etc/keyutils/key.dns_resolver.conf
> +.P
> +unless otherwise specified with the \fB\-c\fR flag.
> +.P
> +Configuration options include:
> +.TP
> +.B default_ttl: <number>
> +The number of seconds to set as the expiration on a cached record.  This will
> +be overridden if the program manages to retrieve TTL information along with
> +the addresses (if, for example, it accesses the DNS directly).  The default is
> +600 seconds.

There's no mention of the leading whitespace support or comments here.
Does the file deserve its own manpage?

--Ben

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
