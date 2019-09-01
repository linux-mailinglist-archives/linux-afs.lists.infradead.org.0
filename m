Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCFA480F
	for <lists+linux-afs@lfdr.de>; Sun,  1 Sep 2019 09:15:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUTRZgGlzuh+fUsC/Utj/fHyT1oaWkND8u/U8dVd+Nk=; b=hBzKvdAnX8ZlnA
	7h1zIaRganxMrFQ8aOUSVDFVE5fPrQ56ot9JFyJPUkg8k/mbgLgeDy0tJRP9rQI4k6WHl24rOTREs
	Lch09jWa3mCuAdiIOQmqSnwRWeblzTvW7a8FFlZ5D8JBCNTWSMjI2CSU8oM2XC8m6+tuuTVmNku9b
	jpTDxyGtM+lyTP9JKP5XAfIrB/6vO8mBB3zQIX5Ytl1atfs+niR0Q+PHdAtJpLQLVUMuSRsGrC2RN
	cYDX+NyTnivCZx17MAqMLEZA6z22WBUMqoARKNwNsqIAPjut9/jfR2a0cO1F+PifknIj3UVTF/xmW
	qriPvVkbWLsKtbIiaWGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4K4k-0006ZW-Jh; Sun, 01 Sep 2019 07:15:03 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4K4h-0006ZA-4F
 for linux-afs@lists.infradead.org; Sun, 01 Sep 2019 07:15:00 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB10F189DAD1;
 Sun,  1 Sep 2019 07:14:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41D0A19C70;
 Sun,  1 Sep 2019 07:14:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190901020519.2392-1-hdanton@sina.com>
References: <20190901020519.2392-1-hdanton@sina.com>
 <20190831135906.6028-1-hdanton@sina.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH net] rxrpc: Fix lack of conn cleanup when local endpoint
 is cleaned up [ver #2]
MIME-Version: 1.0
Content-ID: <14575.1567322096.1@warthog.procyon.org.uk>
Date: Sun, 01 Sep 2019 08:14:56 +0100
Message-ID: <14576.1567322096@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Sun, 01 Sep 2019 07:14:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_001459_248841_416589E8 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 marc.dionne@auristor.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hillf Danton <hdanton@sina.com> wrote:

> > It's certainly possible that that can happen.  The reaper is per
> > network-namespace.
> > 
> > conn->params.local holds a ref on the local endpoint.
> > 
> Then local endpoint can not become dead without connection reaper
> running first, because of the ref held by connection. When it is
> dead, however, there is no need to run reaper directly (rather than
> through a workqueue).

The reaper is per-net_ns, not per-local.  There may be more than one local
endpoint in a net_ns and they share the list of service connections.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
