Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B31AAF6
	for <lists+linux-afs@lfdr.de>; Sun, 12 May 2019 08:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWe7Nw1tT2U0g/OXvYgB43cTaG4GrIBoxa/Lk5arthA=; b=U+ytfJgwNnd8DO
	K8MBBIeQeeXlyboH3fBW0+yjd1t5TjIilC12uqpjfODs8sTMaeidQ2mK4korylRrMQAEV8jNpZg9B
	wUjhz22MVWlQBLjm6v0pC3rJOc+c0dVJFAdyOBMcv4C9iptOWl1jkY5UkuQAGPiZ2RIWQ95Z1hxdf
	/18zYL+snrEvJzQRs6CG7kPv0mytvbUzt337qKyx100+zFMfmGthetNHHvd9MUaDkQU1pjeNwpuli
	9tIkr2YhJvho2++x6U/zcF9LVPGvZWYqyl97M8g37DCUmgVY894GdTD8xOd3AlFOY+qqYtZQcjZjs
	WKj25J9ZHEGrqc+KAjdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPiRF-0008Ut-P8; Sun, 12 May 2019 06:58:25 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPiRD-0008UZ-8i
 for linux-afs@lists.infradead.org; Sun, 12 May 2019 06:58:24 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA7D410C6F;
 Sun, 12 May 2019 06:58:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 191076144;
 Sun, 12 May 2019 06:58:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <78c8bd33-7430-40b9-6c2c-6e8a7b9a2c85@auristor.com>
References: <78c8bd33-7430-40b9-6c2c-6e8a7b9a2c85@auristor.com>
 <20190511123603.3265-1-colin.king@canonical.com>
 <eb1862ebb97f41dcdf85abbea43a22d51ec94c9c.camel@perches.com>
To: Jeffrey Altman <jaltman@auristor.com>
Subject: Re: [PATCH] afs: remove redundant assignment to variable ret
MIME-Version: 1.0
Content-ID: <26926.1557644301.1@warthog.procyon.org.uk>
Date: Sun, 12 May 2019 07:58:21 +0100
Message-ID: <26927.1557644301@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Sun, 12 May 2019 06:58:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_235823_325055_572A9542 
X-CRM114-Status: GOOD (  11.12  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Jeffrey Altman <jaltman@auristor.com> wrote:

> One more issue is that (acl->size == 0) is an invalid value as
> the buffer pointed to by acl->data is a NUL terminated C-String.
> 
> David, what error do you wish to return for the fileserver returning
> and invalid ACL?

I'm tempted to leave that to userspace to deal with - at least for
afs_xattr_get_acl().

Possibly, however, afs_xattr_set_acl() should give an error if you try and
submit that.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
