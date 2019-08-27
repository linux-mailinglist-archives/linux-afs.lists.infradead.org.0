Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E11769E878
	for <lists+linux-afs@lfdr.de>; Tue, 27 Aug 2019 14:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq4WZCdnnT5Z48sPNfFmxdB5kbPN6oFUuFW2fDUyUvo=; b=QGkCRwW8WXa/fb
	y4Su0Wjl6NiYR58vIzauk3fjzIQRvHiOmYxFqYw2oCsKafG0LJC+ONb8FKwpqNjfSZVjGcTKbWIXO
	9wP6pT+kH07k72Y8JcrHlKj35FKoySAJK5FFWUDAnrnkjjkguWZLs7CRMHPVMzwrFJYt/aSgAaiOI
	7Wxm6lv9wW+ez6g9soLk+bCK4SxgRTpYQtNOLZJ1XAXsqIUHxExGGOaeILFuSW4ul1qX3hhJu8GAu
	vY5Zv030z50b9ZYswGX0MVVS99WLsN1UCFVl8E/Ifd5d0mZSWpU2zf8vOV8EpRtl35ZdM6oX2Hz2a
	JEI1K4PPRUj8F4DGk2Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2b28-000328-B6; Tue, 27 Aug 2019 12:57:12 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2b25-00031P-G1
 for linux-afs@lists.infradead.org; Tue, 27 Aug 2019 12:57:10 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ED55910F23EB;
 Tue, 27 Aug 2019 12:57:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 856E8104B4ED;
 Tue, 27 Aug 2019 12:57:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190824.143533.1547411490171696760.davem@davemloft.net>
References: <20190824.143533.1547411490171696760.davem@davemloft.net>
 <156647679816.11606.13713532963081370001.stgit@warthog.procyon.org.uk>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net] rxrpc: Fix lack of conn cleanup when local endpoint
 is cleaned up
MIME-Version: 1.0
Content-ID: <23573.1566910624.1@warthog.procyon.org.uk>
Date: Tue, 27 Aug 2019 13:57:04 +0100
Message-ID: <23574.1566910624@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Tue, 27 Aug 2019 12:57:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_055709_556946_8832824B 
X-CRM114-Status: GOOD (  11.02  )
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

David Miller <davem@davemloft.net> wrote:

> Once you've removed the entries from the globally visible idle_client_comms
> list, and put them on the local garbage list, they cannot be seen in any way
> by external threads of control outside of this function.

Yeah, I think you're right.  I was thinking that it might race with
rxrpc_discard_expired_client_conns() but that takes the locks too, so it
shouldn't.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
