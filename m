Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AB4D1FB
	for <lists+linux-afs@lfdr.de>; Thu, 20 Jun 2019 17:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmF4t427n+y9zQ4HaJ4XF4fm63ymEQmN3SxwQrgaYSc=; b=MnwlqIBA+pNA2b
	1wgzsftyrUJId95JNaoDHUdXDF93ty7QzGh0WtnJqV0JyDrENB6+ScoFYCmom/gtKfLn111d/4gh/
	16hgMRFwHS5rfcODuLKxCaC7mJoQmBMeD3uuFxZZ8pakQiUM5qCs3LhRVcB48kzYWqYbUNTlDIYqX
	DPzkLpl1hsV4O5ayvOf6miko/w/3Hiwg/yxzm0iB/H6W+sRrdTusSVTNAE0e1L4hJbv6gLdI3RZfb
	8M1iidUgsI0sNWBMPp629c9mXKQGxodFJM3l1QP8VPkVD56CYPS0SwNgV6S5CG3WtDDptxU0al46W
	kkjaDZWC4okAgC6FNCzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdyrb-0000Af-8A; Thu, 20 Jun 2019 15:20:35 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyrO-0008V2-0q
 for linux-afs@lists.infradead.org; Thu, 20 Jun 2019 15:20:24 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1A3053003D44;
 Thu, 20 Jun 2019 15:20:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEA7619C5B;
 Thu, 20 Jun 2019 15:20:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1560320237-14367-1-git-send-email-liuzhengyuan@kylinos.cn>
References: <1560320237-14367-1-git-send-email-liuzhengyuan@kylinos.cn>
To: Zhengyuan Liu <liuzhengyuan@kylinos.cn>
Subject: Re: [PATCH 1/2] fs/afs: use struct_size() in kzalloc()
MIME-Version: 1.0
Content-ID: <17849.1561044008.1@warthog.procyon.org.uk>
Date: Thu, 20 Jun 2019 16:20:08 +0100
Message-ID: <17850.1561044008@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 20 Jun 2019 15:20:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_082022_100282_EC7C7A18 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Zhengyuan Liu <liuzhengyuan@kylinos.cn> wrote:

> As Gustavo said in other patches doing the same replace, we can now
> use the new struct_size() helper to avoid leaving these open-coded and
> prone to type mistake.
> 
> Signed-off-by: Zhengyuan Liu <liuzhengyuan@kylinos.cn>

I've applied this to my branch.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
