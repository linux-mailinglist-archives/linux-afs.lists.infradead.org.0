Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A11D9924
	for <lists+linux-afs@lfdr.de>; Tue, 19 May 2020 16:15:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5EqHGfvPJPMX7EY/98IWQGy2A4nM7+MdqhuE9/9P2Y=; b=dRoyu2QfQXHsHk
	2jAipDD4ViAxHo73SHmfU/XlUZMVX4GamWcLfYoRHHcAunqoRePDAirYWvZJqCQxn2yX76E+avgAy
	6KWuQ3AEMm3hShEljwT+5vPLZutoqDOa3QOBfdOVjp2VRt5GYGWvvZtV893uivIc/71YUlCrRwEMT
	iBKdSuzUxWM5a9MZ2JURzxxin70Jzg9NAVODw/d3tZaWLnyT76HhhSlIEoHFMfePcdFFHU/2f93xD
	RS1g8KyUhP97VUoOwjeKYmNiU7rkt3ZF+Hx6b8WGw7XswH6FSPtg5CuqD3q7nU314pO8rIIzPOVuw
	lg7vCj8/FDG5xEKLbI+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb30z-0007nX-Gh; Tue, 19 May 2020 14:14:41 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb30v-0007mJ-Io
 for linux-afs@lists.infradead.org; Tue, 19 May 2020 14:14:39 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 60BCF5C017F;
 Tue, 19 May 2020 10:14:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 19 May 2020 10:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
 h=date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-type:in-reply-to; s=fm1; bh=hYBcgBqOCeKWIW
 T6lyT3Fnq62Afy3RmHDbcoDL9n+Nc=; b=NZOP9fm7wiMY+tKdhSUaB4Kp/QTlZR
 3jsnrq5zaZ+AfRdsG6VrvZlrIK9Rw7JtFBKfhzvJnesTToavSJ6LnBB2yoCUsHkb
 yFKFJp/RPaMykXJzxZa/nVI+E87adFVxxHZqym6scwDnZ/Ho/mmPJer/2QPCDcwA
 qkqi0OLzg4RD/AV55rx9h6w4iEimNKkoHqixjvp8CwbGOId+s5ArcwqkF6ZDvRbj
 9E+vImfeBC8UyavCARKSlo0AxMz8BwRXFHuoTtYGtrg04b/EvpNq1ivIM/291r2j
 ebynirC1kt5sbLw6bqNhYb36IuZywDGkfFMeR/B9FFDnAGR372YHtIZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hYBcgBqOCeKWIWT6lyT3Fnq62Afy3RmHDbcoDL9n+Nc=; b=WGcDY7gO
 1AR8xJVGffl+l77H0LAwf4O4IP810PmP8osqBe2rP531tyDvbdTIBw77uQRlMe3l
 7m4SYZswyMS+ggjQ5yvcjTu43Nxa4KaB3W3GpmG5AfBpqfwbZ4PPtMfEBNlAeAT2
 6DVVu77YudVgfiq3VJzk8n14nV20AR5j0/uacynN1/gn8kpnL+Lr5MI5Meezm/7A
 VCkr8dVOUXKof0cSz8F2zbsAHWys4bQOX/vVm26JjzGjPi5ie54Mx/1KgzhnSR+d
 qRRYvx4Up5oLb/OQ76iAqMj90JaKDTtgcVo2+rlya+XBvkkbThjjwcHi9Fv/VXmp
 3qQoOcuph1O/xQ==
X-ME-Sender: <xms:yenDXvb9KqDLHaA_UIveB621QJOjHIBXDOYgnbIYGcICM1jDkiJ3dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhrfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghn
 uceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrth
 htvghrnhepjedtvdffheetgfektdehvefgieelgeefheejvdehtdduieetgedtfedtleev
 vdffnecukfhppeeiledrvddtgedrudeikedrvdeffeenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:yenDXuZBN41PDSOAuYkZrNRcRpEIXkgaNGSnm7xaMVKBPRoLRggyKA>
 <xmx:yenDXh8LJPHn2xwx23Fps3tItldSlzZhrQ_0srMZpn3cXs4qwy9kKQ>
 <xmx:yenDXloCznXAzroGdz3NNV1SVsz3j9vbaqkPMU1Yjn_MiL76QTQb3A>
 <xmx:yunDXnAEnxsO_mjyY3ba1Q2Lb3qM8gCynBTi3Lw1cnPLLfbOporKuw>
Received: from localhost (cpe-69-204-168-233.nycap.res.rr.com [69.204.168.233])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7E24328005D;
 Tue, 19 May 2020 10:14:33 -0400 (EDT)
Date: Tue, 19 May 2020 10:14:32 -0400
From: Ben Boeckel <me@benboeckel.net>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] dns: Apply a default TTL to records obtained from
 getaddrinfo()
Message-ID: <20200519141432.GA2949457@erythro.dev.benboeckel.internal>
References: <20200518155148.GA2595638@erythro.dev.benboeckel.internal>
 <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
 <1080378.1589895580@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1080378.1589895580@warthog.procyon.org.uk>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_071437_787331_15663D7F 
X-CRM114-Status: GOOD (  30.99  )
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [66.111.4.27 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [66.111.4.27 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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

On Tue, May 19, 2020 at 14:39:40 +0100, David Howells wrote:
> Ben Boeckel <me@benboeckel.net> wrote:
> > Is there precedent for this config file format?
> 
> Okay, I can change it to:
> 
> 	default_ttl = <number-of-seconds>
> 
> and strip spaces all over the place.

Thanks. This is at least a subset of other formats with specs that
aren't bigger than XML :) .

> > But no trailing whitespace is allowed?
> 
> Yes...  See a few lines above:
> 
> 		while (p > buf && isspace(p[-1]))
> 			p--;
> 		*p = 0;

Ah, I missed that. The `-1` should have clued me in. It's a pity there's
not a `strrspn` or the like, but alas.

> > The valid range should be mentioned in the docs (basically that 0 is not
> > allowed and has no special meaning (it could mean leaving off the TTL as
> > previously done)).
> 
> I suppose - that's mainly to make sure I'm not passing an invalid value to the
> syscall.

Leaving 0 as invalid is fine, I'm more worried about documenting the
semantics that are implemented.

> > Forwards compatibility is hard with such behavior. Is there any reason
> > this can't be a warning?
> 
> I can downgrade it to a warning.  I'm not sure that there's any problem here,
> but I have met circumstances before where it is the wrong thing to ignore an
> explicit option that you don't support rather than giving an error.

It's hard to know for sure, true. However, as existing instances
silently ignore this file missing as well, one cannot expect that a
customization here is not being ignored today. I think it's mainly going
to be distributions and/or "devops" folks tweaking this value. Hopefully
they have policies in place for syncing their versions and
configurations up.

> > There's no mention of the leading whitespace support or comments here.
> > Does the file deserve its own manpage?
> 
> Um.  I'm not sure.  Quite possibly there should at least be a stub file with a
> .so directive in it.

That'd be sufficient. It'd show up in `apropos` then at least. I see you
have a full manpage now though, so that's even better.

> diff --git a/key.dns_resolver.c b/key.dns_resolver.c
> index 4ac27d30..c241eda3 100644
> --- a/key.dns_resolver.c
> +++ b/key.dns_resolver.c
> @@ -46,10 +46,13 @@ static const char key_type[] = "dns_resolver";
>  static const char a_query_type[] = "a";
>  static const char aaaa_query_type[] = "aaaa";
>  static const char afsdb_query_type[] = "afsdb";
> +static const char *config_file = "/etc/keyutils/key.dns_resolver.conf";
> +static bool config_specified = false;
>  key_serial_t key;
>  static int verbose;
>  int debug_mode;
>  unsigned mask = INET_ALL;
> +unsigned int key_expiry = 10 * 60;
>  
>  
>  /*
> @@ -105,6 +108,23 @@ void _error(const char *fmt, ...)
>  	va_end(va);
>  }
>  
> +/*
> + * Pring a warning to stderr or the syslog

Typo. `Print`

> + */
> +void warning(const char *fmt, ...)
> +{
> +	va_list va;
> +
> +	va_start(va, fmt);
> +	if (isatty(2)) {
> +		vfprintf(stderr, fmt, va);
> +		fputc('\n', stderr);
> +	} else {
> +		vsyslog(LOG_WARNING, fmt, va);
> +	}
> +	va_end(va);
> +}
> +
>  /*
>   * Print status information
>   */
> @@ -272,6 +292,7 @@ void dump_payload(void)
>  	}
>  
>  	info("The key instantiation data is '%s'", buf);
> +	info("The expiry time is %us", key_expiry);
>  	free(buf);
>  }
>  
> @@ -412,6 +433,9 @@ int dns_query_a_or_aaaa(const char *hostname, char *options)
>  
>  	/* load the key with data key */
>  	if (!debug_mode) {
> +		ret = keyctl_set_timeout(key, key_expiry);
> +		if (ret == -1)
> +			error("%s: keyctl_set_timeout: %m", __func__);
>  		ret = keyctl_instantiate_iov(key, payload, payload_index, 0);
>  		if (ret == -1)
>  			error("%s: keyctl_instantiate: %m", __func__);
> @@ -420,6 +444,145 @@ int dns_query_a_or_aaaa(const char *hostname, char *options)
>  	exit(0);
>  }
>  
> +/*
> + * Read the config file.
> + */
> +static void read_config(void)
> +{
> +	FILE *f;
> +	char buf[4096], *b, *p, *k, *v;
> +	unsigned int line = 0, u;
> +	int n;
> +
> +	printf("READ CONFIG %s\n", config_file);

Thanks. This looks much more rigorous than before.

> +			while (*b) {
> +				if (esc) {
> +					esc = false;
> +					*p++ = *b++;

This probably wants to verify that an escapable character is being
escaped. Right now `\n` will be `n` rather than ASCII NL.

> diff --git a/man/key.dns_resolver.conf.5 b/man/key.dns_resolver.conf.5
> new file mode 100644
> index 00000000..03d04049
> --- /dev/null
> +++ b/man/key.dns_resolver.conf.5
> @@ -0,0 +1,48 @@
> +.\" -*- nroff -*-
> +.\" Copyright (C) 2020 Red Hat, Inc. All Rights Reserved.
> +.\" Written by David Howells (dhowells@redhat.com)
> +.\"
> +.\" This program is free software; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License
> +.\" as published by the Free Software Foundation; either version
> +.\" 2 of the License, or (at your option) any later version.
> +.\"
> +.TH KEY.DNS_RESOLVER.CONF 5 "18 May 2020" Linux "Linux Key Management Utilities"
> +.SH NAME
> +key.dns_resolver.conf \- Kernel DNS resolver config
> +.SH DESCRIPTION
> +This file is used by the key.dns_resolver(5) program to set parameters.
> +Unless otherwise overridden with the \fB\-c\fR flag, the program reads:
> +.IP
> +/etc/key.dns_resolver.conf
> +.P
> +Configuration options are given in \fBkey[=value]\fR form, where \fBvalue\fR is
> +optional.  If present, the value may be surrounded by a pair of single ('') or
> +double quotes ("") which will be stripped off.  The special characters in the
> +value may be escaped with a backslash to turn them into ordinary characters.
> +.P
> +Lines beginning with a '#' are considered comments and ignored.  A '#' symbol
> +anywhere after the '=' makes the rest of the line into a comment unless the '#'
> +is inside a quoted section or is escaped.
> +.P
> +Leading and trailing spaces and spaces around the '=' symbol will be stripped
> +off.
> +.P
> +Available options include:
> +.TP
> +.B default_ttl=<number>
> +The number of seconds to set as the expiration on a cached record.  This will
> +be overridden if the program manages to retrieve TTL information along with
> +the addresses (if, for example, it accesses the DNS directly).  The default is
> +600 seconds.  The value must be in the range 1 to INT_MAX.
> +.P
> +The file can also include comments beginning with a '#' character unless
> +otherwise suppressed by being inside a quoted value or being escaped with a
> +backslash.
> +
> +.SH FILES
> +.ul
> +/etc/key.dns_resolver.conf
> +.ul 0
> +.SH SEE ALSO
> +\fBkey.dns_resolver\fR(8)

This looks good enough docs to me.

Thanks,

--Ben

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
