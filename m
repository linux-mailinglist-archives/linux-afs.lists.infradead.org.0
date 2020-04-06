Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E06F819F63E
	for <lists+linux-afs@lfdr.de>; Mon,  6 Apr 2020 15:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87Y7/u0dWTEQlvjMpvlGfuK1io0u7JfSxq9nxQiusfU=; b=sb0Pa2FQiRMliB
	qx9GR/nqSdnpHH4fB+yakacJyfTpGVZ3VG/5vqhsXruOwk7esCFCRQGpLCszfH6Vu840UcArQA6HM
	2zSpT9WSvUMx4dG+wM+rzQyTpD8SCLQdGPbMP4CkiUCrWz9fjTyTQlLRVetBz75x0NTYMHlvsWKzg
	mU+elB8WnJTUxq+dvIdYYMDLG9bN9O7kbzi7oBIaAsTRQ2eEVzTTyI2ClsuBGWUwv2NQuid5PCG7W
	v1MLXKGOLN3eXYOfvVJ7jB7MQaUI41hzcmtyUKBvPZx9zeeKjk4NirG5irn9J9Nsm/H/BvangT9tw
	TLiklZyg3mczWMN/mGhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLRLo-000110-Cb; Mon, 06 Apr 2020 12:59:40 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLRLk-00010T-DL
 for linux-afs@lists.infradead.org; Mon, 06 Apr 2020 12:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586177974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMJULEvWdJ+pf2mENnsxIsFvX6NoAJUdSLGQxiK1P28=;
 b=gURhtCQS6oW3fCbhAnvNg7S5NzaNoD8ipJSlGhnN8BsWaNHmhrtv+uuJE99Yympi076v8W
 Hw9Nb9yb07bCBsMuta007ZGTchSZMOJxCdxgy/YQunhmhIWe8muI9m9pOhnAdOLrgCZdXB
 OCFoAswJreMdP6vjMO4L7tlWcmvuid0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-7btBQkzlMnK4NiwvymFK0A-1; Mon, 06 Apr 2020 08:59:26 -0400
X-MC-Unique: 7btBQkzlMnK4NiwvymFK0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15F6A801E6D;
 Mon,  6 Apr 2020 12:59:25 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com
 [10.10.112.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05739BEA65;
 Mon,  6 Apr 2020 12:59:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <be710f52-ee4d-c1c5-d11e-a39f572e14b4@enea.it>
References: <be710f52-ee4d-c1c5-d11e-a39f572e14b4@enea.it>
 <9253801f-92de-b963-8ea0-296e53e25f88@enea.it>
 <17130f4b238.2752.7e7218444f75578ebec1b7dbb1486319@cnf.cornell.edu>
 <3078968.1585847195@warthog.procyon.org.uk>
To: Giovanni Bracco <giovanni.bracco@enea.it>
Subject: Re: [OpenAFS] 2020 AFS Technologies Workshop Cancelled.. kafs update
MIME-Version: 1.0
Content-ID: <34029.1586177962.1@warthog.procyon.org.uk>
Date: Mon, 06 Apr 2020 13:59:22 +0100
Message-ID: <34030.1586177962@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_055936_528774_2EB9A6B2 
X-CRM114-Status: GOOD (  15.79  )
X-Spam-Score: -0.4 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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

> I have tried for the first time the kafs client on a Fedora 31 and it worked
> really nicely, I am very impressed by how it is simple to have it working. Of
> course I have no be able to make a massive test yet, but it look really
> interesting

There's still the odd bug in there, unfortunately.

> My feeling is that to  put it really in production the main missing points
> are:
> 
> 1) pam module

Yep.  But the systemd folks are doing their best to make this tricky, I
believe...

> 2) user commands, essentially "fs" first of all and also "pts"

Yeah.  I had a chunk of pts, bos and vos implemented in my python client:

	http://git.infradead.org/users/dhowells/kafs-utils.git/shortlog/refs/heads/pythonify

but Python changed the subtlelties of their backend interface and so I've
started the process of rewriting in C:

	http://git.infradead.org/users/dhowells/kafs-utils.git/shortlog/refs/heads/rewrite-in-c

However, I need to fix the server rotation policy in the kernel first so that
I can copy it into kafs-utils.

And there's another issue with implementing the fs tools - and that's that I'm
not allowed to implement pioctl(2) or afs(2), so I have to find other ways of
doing things:

	https://www.infradead.org/~dhowells/kafs/user_interface.html

But the main issue is that, for the most part, I'm the only one working on
them - and that's in addition to my normal job.

> 3) inotify

Implementing inotify/dnotify/fanotify is hard because I can't tell from a
callback what changed - only that something has.  By examining the data
version I can tell whether the contents of the object changed or whether it
was an attribute/ACL change, but then I have to compare the attributes or, if
a directory, the contents, to see which event to generate.

> The bos, vos and backup command can be run on server nodes, which can be
> standard OpenAFS systems, am I right?

The OpenAFS bos, vos and backup commands can be run from the client too, I
think, since they don't require any interaction with the afs kernel module.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
