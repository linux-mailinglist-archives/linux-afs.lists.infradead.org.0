Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210319C79C
	for <lists+linux-afs@lfdr.de>; Thu,  2 Apr 2020 19:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GG7nBjvUXedgzpQDya11EV83mG9ERtfZNGbpX+x7/f4=; b=BWbeokqa0/stYw
	FQhpepo6JxG7v3fQzL1L+4uaP8eeFoeSAvRq5evTd+/ajH7SY4U8qrkifyI/4FpRyEHGSVglAqcLM
	wOqge95C52EnHZb9P+HYB+8jAhzbEHO9059Er4wmdwddkaMVYqUqEKCEDe6zZ6dOYKQI+pgoQE7c7
	VE/enmrJpox/WQcbArvXaZoBO4hqAFmwOI1IJjHct4SGXCk/U4qwvqnRVNlMYOxUgwLEiG5DVvlZh
	94OB/jmD/J8IuAk2/VrvpKPdZI/aBzKibylqyWQCiWdsE+Pg8rIZjzSpcHgVOs0oFJbukIrClvyGs
	lLyqIdtQtNZBf1HfSKGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK3Iq-0008JS-3M; Thu, 02 Apr 2020 17:06:52 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK3In-0008IC-3t
 for linux-afs@lists.infradead.org; Thu, 02 Apr 2020 17:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585847206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJb6uZJgdKJm8npDisVxJE//2+VYmxNNrmtlLlv34B4=;
 b=bGWU3PSOuMjhJ7UzcJuHh2DD+sKGDvgBuoYAZvn2XWAZZqsYklMvW+pn4ctKn3Npe9egjW
 to2dGGPReLY4+M13FQ7ZOZz7XS5w+jflrsr7RfpijAaB3nkXUqU7RNGhOZyN23BPFTdAz5
 6daFAxv2Q8OhzbJ93FfrHHMEpEEPJqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-r2LQqvGmNUGGTEYfUkkGSQ-1; Thu, 02 Apr 2020 13:06:39 -0400
X-MC-Unique: r2LQqvGmNUGGTEYfUkkGSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E5721005509;
 Thu,  2 Apr 2020 17:06:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-243.ams2.redhat.com
 [10.36.114.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01EC048;
 Thu,  2 Apr 2020 17:06:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <9253801f-92de-b963-8ea0-296e53e25f88@enea.it>
References: <9253801f-92de-b963-8ea0-296e53e25f88@enea.it>
 <17130f4b238.2752.7e7218444f75578ebec1b7dbb1486319@cnf.cornell.edu>
To: Giovanni Bracco <giovanni.bracco@enea.it>
Subject: Re: [OpenAFS] 2020 AFS Technologies Workshop Cancelled.. some update
 anyway?
MIME-Version: 1.0
Content-ID: <3078967.1585847195.1@warthog.procyon.org.uk>
Date: Thu, 02 Apr 2020 18:06:35 +0100
Message-ID: <3078968.1585847195@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_100649_262096_023F7D90 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: openafs-announce@openafs.org, dhowells@redhat.com, openafs-info@openafs.org,
 openafs-devel@openafs.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Giovanni Bracco <giovanni.bracco@enea.it> wrote:

> In the present complicate situation, it would be nice to have some news about
> the latest development both of OpenAFS and kafs

The status of kafs can be found at:

	https://www.infradead.org/~dhowells/kafs/todo.html

There is now a filesystem-afs subpackage that provides the /afs mountpoint as
part of the filesystem package in Fedora and others.  I'm trying to get it
into the LSB also.

There is now a kafs-client package in Fedora and others that provides
configuration, systemd services and DNS upcall handling plus an aklog.

I'm currently rewriting the operation handling in kafs to improve fileserver
failover and rotation and so that I can support asynchronous I/O.

I'm also rewriting local filesystem caching in Linux (fscache) to:

  - Use async direct I/O to the backing filesystem (which is a lot faster)
  - Not use bmap to track contents (which isn't guaranteed with extents)
  - Be lazy about metadata writeback (reducing metadata ops)
  - Provide better handling of versioned files (eg. directories)
  - Use of larger I/O granules on the network (256K rather than PAGE_SIZE)
  - Code simplification (3-4000 LoC removed)

All in all, it's looking a *lot* faster.  I also have on my radar for fscache:

  - Moving culling into the kernel
  - Better indexing support
  - Disconnected operation support

For kafs-utils (which provides the command suite), I've started rewriting that
in C because the Python language subtleties keep changing and breaking it.
Also I've been asked for a C/C++ version so that Python libraries are not
required.  The plan now is to put a swig interface on top of it.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
