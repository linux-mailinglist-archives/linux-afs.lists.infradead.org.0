Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B651A8C24
	for <lists+linux-afs@lfdr.de>; Tue, 14 Apr 2020 22:17:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nihWUAW7mczMtXwvSgQ3ETyj/h6EGhNxXmJBZownyA=; b=QHIUyLe4ylRzoO
	uwfhvGfdbdOh3pBMuXJCQTy7ez5vN44z3K/jrk2TCPqJuevZe3ZZMptCYe7rHR0Tgr/NFCx1ANKDg
	kw8sGRmje3ZNGBsc1M8tDjDxA2hHgSCDka7gNlgPMQrCDAihlhy3of54ky0b3CFxAJYgfH6w0NnJL
	mVvnbiQ2u8r0Bn/TL12r6F9E35xwO9bjyE9k8aQsyB3gII166fa3HHAQQbjgQEkPXxjoVxTNG8tgy
	0Lo7FMg56Mrq6AO6XIcBsjmAv+wyTnkAaHqn9yQ/fR1Nf3hq5R8le7OtKvyYNHNUsxzQXGtVIY4Mw
	MriPFEAxN0POusQIJVbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORzd-0002Aa-V6; Tue, 14 Apr 2020 20:17:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORyb-0000s9-NP
 for linux-afs@lists.infradead.org; Tue, 14 Apr 2020 20:16:14 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CF082074D;
 Tue, 14 Apr 2020 20:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586895367;
 bh=4W3gIsYx8mNRm7hQccmDcfI7rVeS0PCbsqaEor2jO1A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=C4uL/J0pV22/gMFfSQyw7mxFz8RSAoHxrbABKat2YAnbqmLdyT1HH96qxNFf6MwZe
 lIYaRIqET3RZlaHuohQThMMnmG3sDfVZdwqkNMQvxZC4N7NbE8Z0K7NUQ1pCA/ZW6r
 0z3amCpYG+5IOToFbZUiDdjckJlO8mLeqbvDwegw=
Message-ID: <e751977dac616d93806d98f4ad3ce144bb1eb244.camel@kernel.org>
Subject: Re: What's a good default TTL for DNS keys in the kernel
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org, 
 linux-cifs@vger.kernel.org, linux-afs@lists.infradead.org, 
 ceph-devel@vger.kernel.org
Date: Tue, 14 Apr 2020 16:16:05 -0400
In-Reply-To: <3865908.1586874010@warthog.procyon.org.uk>
References: <3865908.1586874010@warthog.procyon.org.uk>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_131609_865937_FE04ECBD 
X-CRM114-Status: GOOD (  14.89  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: fweimer@redhat.com, netdev@vger.kernel.org, keyrings@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, 2020-04-14 at 15:20 +0100, David Howells wrote:
> Since key.dns_resolver isn't given a TTL for the address information obtained
> for getaddrinfo(), no expiry is set on dns_resolver keys in the kernel for
> NFS, CIFS or Ceph.  AFS gets one if it looks up a cell SRV or AFSDB record
> because that is looked up in the DNS directly, but it doesn't look up A or
> AAAA records, so doesn't get an expiry for the addresses themselves.
> 
> I've previously asked the libc folks if there's a way to get this information
> exposed in struct addrinfo, but I don't think that ended up going anywhere -
> and, in any case, would take a few years to work through the system.
> 
> For the moment, I think I should put a default on any dns_resolver keys and
> have it applied either by the kernel (configurable with a /proc/sys/ setting)
> or by the key.dnf_resolver program (configurable with an /etc file).
> 
> Any suggestion as to the preferred default TTL?  10 minutes?
> 

Typical DNS TTL values are on the order of a day but it can vary widely.
There's really no correct answer for this, since you have no way to tell
how long the entry has been sitting in the DNS server's cache before you
queried for it.

So, you're probably down to just finding some value that doesn't hammer
the DNS server too much, but that allows you to get new entries in a
reasonable amount of time.

10 mins sounds like a reasonable default to me.
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
