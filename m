Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3086331173
	for <lists+linux-afs@lfdr.de>; Fri, 31 May 2019 17:38:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jtyk5+A9FUTP5YMdlStiRCCa8k4DzARGDoJSRNLksHY=; b=dfQ0pG0+ZzwPjs
	3qE8RmiUvpaTjE7RWsfuoX+lwOdQUqZmQmGlDV1lgnT283FH7iCKb8xS3QuuMwUy7aMhNTFgb9Dk/
	kZoBLv3Fj5aFY1Z4f31KytJqAfwrWoEJDct5V9+zDquNxhnmfL66fZJZOsV5FbgA2Vebj0L4UZwMu
	dvSfhF0htD9B+ZjNDivEaWDtDIcWrdm+GqMs01LT1gi0F7UihMEDcDYotXRPaNgEG4fYqK4tbisuJ
	DcUvX90ry7IpVFhoCGHhdcG7d5UHAuvqDd08o/Cgi6lGcb2kQS0j+fhBKE3UH1xav6mlP3hXi70lk
	HNV9keAyZnv6ssQLuDVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWjcD-0000Br-Nt; Fri, 31 May 2019 15:38:45 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWjcB-0000BW-LP
 for linux-afs@lists.infradead.org; Fri, 31 May 2019 15:38:44 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 20FC130C1E3A;
 Fri, 31 May 2019 15:38:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEBCB7C5E1;
 Fri, 31 May 2019 15:38:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190531122214.18616-2-fw@strlen.de>
References: <20190531122214.18616-2-fw@strlen.de>
 <20190531122214.18616-1-fw@strlen.de>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH net-next v2 1/7] afs: do not send list of client addresses
MIME-Version: 1.0
Content-ID: <10843.1559317119.1@warthog.procyon.org.uk>
Date: Fri, 31 May 2019 16:38:39 +0100
Message-ID: <10847.1559317119@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 31 May 2019 15:38:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_083843_722478_B356194B 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Florian Westphal <fw@strlen.de> wrote:

> David Howell says:

"Howells"

Apart from that:

Tested-by: David Howells <dhowells@redhat.com>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
