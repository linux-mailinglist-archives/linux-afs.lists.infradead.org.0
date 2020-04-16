Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC2E1AC1F5
	for <lists+linux-afs@lfdr.de>; Thu, 16 Apr 2020 15:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w75/BZecUWTuAVm+sDi5Q476ppRSnTkolEsCAh8aNDU=; b=PZZuCE2Le/yEU1
	1mEXGcFtZfEvmJjuhBF6aXs1fgJ8LYLG/2z7LXRoL61v9J185+cboeNTxQ+IkDPuFrLffm1vM6+mZ
	LSrCJEoGX6w4A43cYZjWwzFZWaMtsPHUT8KjNfBbt2Gnt5jZoe9I4ZajfIfz4Y9b1TvcXfsOLOmYU
	XPOAHN6BMbkdRT0W6YEUVK16ss8IWkXNvVw1WobO0v80rp8TYkPnOyk5PBG4eJJqmVyDjDLGP9rsD
	YvfJOqdpSxF8iV1LaTCUinbk8yb07hGeUuMmFmbpWJFvP2zUB6VEQ1iR05Zq0hEiCqAoCMADrOnEi
	wuxSGci/4m5FPyd03epw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP49S-0006YJ-MU; Thu, 16 Apr 2020 13:01:54 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP49P-0006Q8-Dq
 for linux-afs@lists.infradead.org; Thu, 16 Apr 2020 13:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587042106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eu6b6HDAloa0ypWgaxME9iI3u+iDHWfSGslG1thqHSI=;
 b=CrgntKjq2ddR6K/On7+2pCuCjd5xXKsLsEzkCp2rqHytjHnWPHShT8kfr6X1XVcO1DYPRu
 S7SqDQ7aYAcGu0LXADo+ZBLGHVbCGfSoBiqBMYrfnAgSWGkx1gXgRjHFWl7h19syeB7E3n
 0bYxBQrPYjnrtP4g3dF2SNToyYuTolA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-hChMLAzGMqqPJHzgmWdWww-1; Thu, 16 Apr 2020 09:01:43 -0400
X-MC-Unique: hChMLAzGMqqPJHzgmWdWww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7B32802564;
 Thu, 16 Apr 2020 13:01:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C45B75DA89;
 Thu, 16 Apr 2020 13:01:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <87v9lzu3cx.fsf@oldenburg2.str.redhat.com>
References: <87v9lzu3cx.fsf@oldenburg2.str.redhat.com>
 <874ktl2ide.fsf@oldenburg2.str.redhat.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <128769.1587032833@warthog.procyon.org.uk>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
MIME-Version: 1.0
Content-ID: <142354.1587042098.1@warthog.procyon.org.uk>
Date: Thu, 16 Apr 2020 14:01:38 +0100
Message-ID: <142355.1587042098@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_060151_548308_7A9E22E0 
X-CRM114-Status: GOOD (  22.46  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 keyrings@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Florian Weimer <fweimer@redhat.com> wrote:

> > Florian Weimer <fweimer@redhat.com> wrote:
> >
> >> You can get the real TTL if you do a DNS resolution on the name and
> >> match the addresses against what you get out of the NSS functions.  If
> >> they match, you can use the TTL from DNS.  Hackish, but it does give you
> >> *some* TTL value.
> >
> > I guess I'd have to do that in parallel.
> 
> Not necessary.  You can do the getaddrinfo lookup first and then perform
> the query.

That means that the latency of both is added together and causes the first
mount to take longer - though as long as you have a local DNS cache, that's
fine.

> > AFS keeps track of the expiration on the record and will issue a new lookup
> > when the data expires, but NFS doesn't make use of this information.
> 
> And it will switch servers at that point?  Or only if the existing
> server association fails/times out?

AFS will switch servers at the next operation if the server list changes.  And
if the current op tries to access an old server and gets bounced, this should
trigger an immediate reevaluation.  It also regularly probes the servers and
interfaces it knows about to find which one's accessible and which has the
best response and can switch servers on that basis also.

I should also note that AFS deletes the dns_resolver key after reading it and
maintains the expiry information in its internal structs.

Note also that in AFS this only applies to locating the Volume Location
servers (which is a layer of abstraction that hides which server(s) a volume
resides on and what their addresses are).  The VL service is queried to find
out where file servers are (giving you their addresses itself so you don't
need to access the DNS there).

> > The keyring subsystem will itself dispose of dns_resolver keys that
> > expire and request_key() will only upcall again if the key has
> > expired.
> 
> What's are higher-level effects of that?

If the record never expires (the current case), the address lookup in the
kernel (dns_query()) will always return the same address until someone
manually evicts it.

Otherwise, once the record expires, the kernel will just upcall again.

> I'm still not convinced that the kernel *needs* accurate TTL
> information.  The benefit from upcall avoidance likely vanishes quickly
> after the in-kernel TTL increases beyond 5 or so.  That's just my guess,
> though.

You might be right - certainly for NFS and CIFS where the address ascribed to
a superblock is hard to change as it partly defines the superblock.  Change
the address and your superblock in now a different thing as far as the VFS is
concerned.

This makes fscache indexing tricky for NFS.  How do you define a superblock?
Is it address?  Is it hostname?  What happens if one or the other changes?
What happens if there are two or more addresses (say ipv4 and ipv6 addrs)?

AFS defined some abstractions for this: the cell name and the volume ID
number.  The physical location of the volume doesn't matter - and the volume
can even be moved around whilst in use.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
