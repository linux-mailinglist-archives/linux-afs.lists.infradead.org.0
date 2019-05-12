Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6B1AE09
	for <lists+linux-afs@lfdr.de>; Sun, 12 May 2019 22:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKvyFwHoAUyshsQepe2qIHiWwfi8UqxKgEEDpkl9ZbI=; b=ksR6KOIOM3ubi4
	bAvQ+Wz/w+X4az3ZUy7DALcnIauXQxpOLAkkLXbgZ29+5OGBDAzZ/2rA2e8HJu0mC1lCVVwa71dtY
	YwbwzGO15kciRJqxngP+d+PM9gcxyism8AsBDllW69jEs4cCp2qNTL+wMQovvQBhUr2ozPcgJ89Ll
	m/ht9tOMpB8HyrMtZ7zCeOmh4XyrSrSrG0qUuUup4CCLp9mxtlyAUYrQN5Ff1JUn2PgJa1HEwuHoP
	Yfc6wjdRGYelfMEf6wkvv9Kpobkg/WAAmfQ/+pH9G1+89ew2OUM16hAb0Y3oOy7Ga7GD/kVZJluCv
	l7tLnKL5OujRSUcRxhBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPujv-0002AF-QV; Sun, 12 May 2019 20:06:31 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPujs-00029V-W7
 for linux-afs@lists.infradead.org; Sun, 12 May 2019 20:06:30 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B0E0230821C0;
 Sun, 12 May 2019 20:06:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-61.rdu2.redhat.com
 [10.10.120.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C646A19C65;
 Sun, 12 May 2019 20:06:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <5CD8697B.6010004@bfs.de>
References: <5CD8697B.6010004@bfs.de> <5CD844B0.5060206@bfs.de>
 <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk>
 <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk>
 <31808.1557684645@warthog.procyon.org.uk>
To: wharms@bfs.de
Subject: Re: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an
 error value
MIME-Version: 1.0
Content-ID: <6818.1557691584.1@warthog.procyon.org.uk>
Date: Sun, 12 May 2019 21:06:24 +0100
Message-ID: <6819.1557691584@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Sun, 12 May 2019 20:06:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_130629_053540_C19109FC 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, joe@perches.com, colin.king@canonical.com,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

walter harms <wharms@bfs.de> wrote:

> Sorry, you misunderstood me, my fault, i did not see that size is unsigned.
> NTL i do not think size=0 is useful.

Allow me to quote from the getxattr manpage:

       If size is specified as zero, these calls return the  current  size  of
       the  named extended attribute (and leave value unchanged).  This can be
       used to determine the size of the buffer that should be supplied  in  a
       subsequent  call.   [...]

> while you are there:
>   flags |= YFS_ACL_WANT_ACL is always flags = YFS_ACL_WANT_ACL;
> since flags is 0 at this point.
> IMHO that sould be moved to the strcmp() section.

Why?  It makes the strcmp() section more complicated and means I now either
have to cache flags in a variable or do the allocation of yacl first.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
