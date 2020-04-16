Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7851ABDFA
	for <lists+linux-afs@lfdr.de>; Thu, 16 Apr 2020 12:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHphpz7YkvnlOG78IDITX/IWnOvFNe5Ok5Jny+LRpT4=; b=ZEPzmvSccGLHj0
	FMiIjw3IBCFqpfHRoMa5VJtL+lvLs6+CXErZK9TiKdHNGJ2x4QjH0H1CCNS2c60I77qTpdEpOXkxq
	cIVqjewMQq5dlbszKfxFrB+inhTq6f19SW9DVW8dulgYpQvxoiSYJENazqxTL/gq7AEuDqqEwAu7d
	rQ7sxwVKeqi3aW/f4RuLWgQqMYLiBpbTIvTnVlYZzZC7LqbpXnQ74WqRfWm3MnuhzI44pZGZ37rG0
	GQ6rEqKDYNQEo8FS1ZU2JgXGlP7uEjlVd52m+gypwMIxj8ZoN3HHKXd5q5vNpYzPqBhh8GQdkS6Se
	hx0TxzvZegjggGco4l5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP1qC-0005RR-0l; Thu, 16 Apr 2020 10:33:52 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1q8-0005Qg-Tw
 for linux-afs@lists.infradead.org; Thu, 16 Apr 2020 10:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587033223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wSOHFT9tJQ3WMUJpzqJBLiS8QZ3BM+HLY6292xvXFZM=;
 b=YFa3SGe+y8ZrY+OOMKdO3vhCjM0lutMWPmNTpAgQLNNqcHPrzas+LDah35q8TTpA+TvrNh
 ON4b4riWhj9Cxszwf4rmUlzgy3hTktAE/RIq9ibBhPScncMaKRIotBjN85VibTngSeQc48
 GM16k2gHi+44w+HVcQ6Om9GMI6V6QF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-mRLDz9gnN72cnltf895Q4Q-1; Thu, 16 Apr 2020 06:33:39 -0400
X-MC-Unique: mRLDz9gnN72cnltf895Q4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26B2513F9;
 Thu, 16 Apr 2020 10:33:38 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-114-61.ams2.redhat.com
 [10.36.114.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 178D194B40;
 Thu, 16 Apr 2020 10:33:35 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
References: <874ktl2ide.fsf@oldenburg2.str.redhat.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <128769.1587032833@warthog.procyon.org.uk>
Date: Thu, 16 Apr 2020 12:33:34 +0200
In-Reply-To: <128769.1587032833@warthog.procyon.org.uk> (David Howells's
 message of "Thu, 16 Apr 2020 11:27:13 +0100")
Message-ID: <87v9lzu3cx.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_033349_044651_31DA0E1E 
X-CRM114-Status: GOOD (  17.31  )
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
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

* David Howells:

> Florian Weimer <fweimer@redhat.com> wrote:
>
>> You can get the real TTL if you do a DNS resolution on the name and
>> match the addresses against what you get out of the NSS functions.  If
>> they match, you can use the TTL from DNS.  Hackish, but it does give you
>> *some* TTL value.
>
> I guess I'd have to do that in parallel.

Not necessary.  You can do the getaddrinfo lookup first and then perform
the query.

> Would calling something like res_mkquery() use local DNS caching?

Yes (but res_mkquery builds a packet, it does not send it).

>> The question remains what the expected impact of TTL expiry is.  Will
>> the kernel just perform a new DNS query if it needs one?  Or would you
>> expect that (say) the NFS client rechecks the addresses after TTL expiry
>> and if they change, reconnect to a new NFS server?
>
> It depends on the filesystem.
>
> AFS keeps track of the expiration on the record and will issue a new lookup
> when the data expires, but NFS doesn't make use of this information.

And it will switch servers at that point?  Or only if the existing
server association fails/times out?

> The keyring subsystem will itself dispose of dns_resolver keys that
> expire and request_key() will only upcall again if the key has
> expired.

What's are higher-level effects of that?

I'm still not convinced that the kernel *needs* accurate TTL
information.  The benefit from upcall avoidance likely vanishes quickly
after the in-kernel TTL increases beyond 5 or so.  That's just my guess,
though.

Thanks,
Florian


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
