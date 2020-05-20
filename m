Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8541DC237
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 00:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDbglIHkzARcK9cXceAbN9613f1ZBSfVjVooAR1TNQk=; b=r5WqmAwRS7H1gW
	1lwpC7aWhhJzVwAMr27ImhDxetMOu5l2e6Ym5QtTRfPJUdA5e+GIUygtI8P6qhQHE6GAlKns2wAas
	peADpYX2LwuzjEyCokGXbDRXf/HBojsGyP25FNaVZp51xFzUNj2LabPQ0GlAGzHsMDwA0R/ThqzpW
	V95jG5QMuql2moa23Syx730PLEB9dUuiS08P8udY3HYb0iBS6GE2UIzbNvXA+cI5rYXXpFb6zoeOb
	uL2NKYkd6X4WAHvTJf/mSSI01rEqW89SuNu87InV/HXBkZu3VS09Dx5E4237HwOFAprYJkP5/3jCn
	MR0BD7S5zLFHXWEW0z4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXLi-0008OP-5v; Wed, 20 May 2020 22:38:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbQK1-0007Y8-I8
 for linux-afs@lists.infradead.org; Wed, 20 May 2020 15:07:54 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A08D2054F;
 Wed, 20 May 2020 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589987272;
 bh=8VBA9kFdjdfRlKPEK46ZtWpmUq8WEwLqJ2P0szY8vsc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=voKh9N8h0YWJaND3rq5MWEC8Rwr72Xt5vuNq4vxv3cM7Rz1qfbpYifGnlVTc3C3NH
 MzFn2Gm9/+GWRTFQAtI9aWJ3zn3CV3ZGdBlFlx3SOhGxKiDn1SK/zmDBpIgGtlYTZK
 HB+enmZ/sw8Bh5MCBehK5tFyI5XLFC7AIqKhiD0o=
Message-ID: <ed3d0ebdeabe53c6cfc0c6fd185dc50f4055a0e6.camel@kernel.org>
Subject: Re: [PATCH] dns: Apply a default TTL to records obtained from
 getaddrinfo()
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, me@benboeckel.net, fweimer@redhat.com
Date: Wed, 20 May 2020 11:07:50 -0400
In-Reply-To: <1512927.1589904409@warthog.procyon.org.uk>
References: <20200519141432.GA2949457@erythro.dev.benboeckel.internal>
 <20200518155148.GA2595638@erythro.dev.benboeckel.internal>
 <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
 <1080378.1589895580@warthog.procyon.org.uk>
 <1512927.1589904409@warthog.procyon.org.uk>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_080753_643627_005B2D01 
X-CRM114-Status: GOOD (  15.99  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Wed, 20 May 2020 15:38:04 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, 2020-05-19 at 17:06 +0100, David Howells wrote:
> Okay, how about this incremental change, then?  If fixes the typo, only prints
> the "READ CONFIG" line in verbose mode, filters escape chars in the config
> file and reduces the expiration time to 5s.
> 
> David
> ---
> diff --git a/key.dns_resolver.c b/key.dns_resolver.c
> index c241eda3..7a7ec424 100644
> --- a/key.dns_resolver.c
> +++ b/key.dns_resolver.c
> @@ -52,7 +52,7 @@ key_serial_t key;
>  static int verbose;
>  int debug_mode;
>  unsigned mask = INET_ALL;
> -unsigned int key_expiry = 10 * 60;
> +unsigned int key_expiry = 5;
>  
>  
>  /*
> @@ -109,7 +109,7 @@ void _error(const char *fmt, ...)
>  }
>  
>  /*
> - * Pring a warning to stderr or the syslog
> + * Print a warning to stderr or the syslog
>   */
>  void warning(const char *fmt, ...)
>  {
> @@ -454,7 +454,7 @@ static void read_config(void)
>  	unsigned int line = 0, u;
>  	int n;
>  
> -	printf("READ CONFIG %s\n", config_file);
> +	info("READ CONFIG %s", config_file);
>  
>  	f = fopen(config_file, "r");
>  	if (!f) {
> @@ -514,6 +514,16 @@ static void read_config(void)
>  			v = p = b;
>  			while (*b) {
>  				if (esc) {
> +					switch (*b) {
> +					case ' ':
> +					case '\t':
> +					case '"':
> +					case '\'':
> +					case '\\':
> +						break;
> +					default:
> +						goto invalid_escape_char;
> +					}
>  					esc = false;
>  					*p++ = *b++;
>  					continue;
> @@ -563,6 +573,8 @@ static void read_config(void)
>  
>  missing_value:
>  	error("%s:%u: %s: Missing value", config_file, line, k);
> +invalid_escape_char:
> +	error("%s:%u: %s: Invalid char in escape", config_file, line, k);
>  post_quote_data:
>  	error("%s:%u: %s: Data after closing quote", config_file, line, k);
>  bad_value:
> diff --git a/man/key.dns_resolver.conf.5 b/man/key.dns_resolver.conf.5
> index 03d04049..c944ad55 100644
> --- a/man/key.dns_resolver.conf.5
> +++ b/man/key.dns_resolver.conf.5
> @@ -34,7 +34,7 @@ Available options include:
>  The number of seconds to set as the expiration on a cached record.  This will
>  be overridden if the program manages to retrieve TTL information along with
>  the addresses (if, for example, it accesses the DNS directly).  The default is
> -600 seconds.  The value must be in the range 1 to INT_MAX.
> +5 seconds.  The value must be in the range 1 to INT_MAX.
>  .P
>  The file can also include comments beginning with a '#' character unless
>  otherwise suppressed by being inside a quoted value or being escaped with a
> 

This looks good to me.

Reviewed-by: Jeff Layton <jlayton@kernel.org>


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
