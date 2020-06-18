Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6961FF6AE
	for <lists+linux-afs@lfdr.de>; Thu, 18 Jun 2020 17:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Ub23lLTX1jfNZ96F8c/TFSNZP0RhM/vZIcsL1allcs=; b=fezG9Rgi/BRMAJ
	eAIi1OuTFf0R3H0fE8VEyEQ2/VuZ3tfDxZGO5Cu5m6UVHVkkPDA994CfhRFDs7vqWQgvHibMALAz5
	jUxdANnGK2znQU7q5MoSWOAV07V/ujTgHEQ0uAKMvd+ENA1Y5nS1e5xjUIYLnmZMWK2RUnDHzx5iv
	Q6DIvuiVqdKxDP+9SlYxOBF5q6LSmUqkUIEF7pjna6p9WxTBaF/yJOEu5CrlFcfc5GxuEwBw4Y5zP
	63joVqT3mi2aFeCZNneV6/gBPicqU6LKQxI1LOiOc93zzVblFBiFdjqWvPEhrNGBWHg2ox+DRuyHu
	l+de4cUwHXqJaAc7YzDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlwT3-0003Ka-6m; Thu, 18 Jun 2020 15:28:41 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlwSz-0003Ig-69
 for linux-afs@lists.infradead.org; Thu, 18 Jun 2020 15:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592494113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ik3Sc0dqYbZERvPTdZFX/K0/LVYuaVKpGHzF6y9Mc+o=;
 b=LgRjCtWd88OXcHBsbnqcvnEZpLWgUIZok8GPG2gCifhO6hiXeoeKmT7UBwZIO9GaJR/1yN
 sSCVOdF+xMWHlGStcc8V3Xk6TaFZdIXIXVhK9rGIEL9LJ9QcScWC7Y7FF9ObXNAAZkooCA
 jo3CZx5G8CG7255r4A7gmNL3I7kCwzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-NnnemwM3MIiYpOPXvZJD3w-1; Thu, 18 Jun 2020 11:28:25 -0400
X-MC-Unique: NnnemwM3MIiYpOPXvZJD3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB1901005513
 for <linux-afs@lists.infradead.org>; Thu, 18 Jun 2020 15:28:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BD7660CD0;
 Thu, 18 Jun 2020 15:28:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Subject: kafs-client-0.5 released
MIME-Version: 1.0
Content-ID: <1429387.1592494103.1@warthog.procyon.org.uk>
Date: Thu, 18 Jun 2020 16:28:23 +0100
Message-ID: <1429388.1592494103@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_082837_300016_687D6D79 
X-CRM114-Status: UNSURE (   6.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: dhowells@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

v0.5 of kafs-client has been released.

This makes the following changes:

 (*) Adds a Developer's Certificate of Origin.

 (*) Fixes in kafs-dns and kafs-preload.

 (*) Manual pages for kafs-dns and kafs-preload.

 (*) Renames etc.conf to client.conf as that's the name with which it is
     installed.

The sources can be found here:

	http://git.infradead.org/users/dhowells/kafs-client.git
	tag v0.5

or here:

	https://www.infradead.org/~dhowells/kafs/kafs-client-0.5.tar.bz2

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
