Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A04C25AA
	for <lists+linux-afs@lfdr.de>; Mon, 30 Sep 2019 19:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctlAwCnkFFsrF3BxGKBVKoOaxgz8r9WTlDOQbEWWLro=; b=Pg/8PP1GqP9WnO
	C7oToWuW3KGYigA8OWZxDLMH7rf9oZ1A6km1xzQWqEBITlY/ABWBe3GT1odC4WJokQetgsyaQbiPA
	bSI54YmDb6X5Kq/Y+C7G+JkXL+3bVBDG8O9RKKLD/z0KaL+abCrRWlHSKHPIcohTp/3JFvHIGpX/7
	AG8k8QBZRwiSUviCgyvAVBaVXAPLAs6mpYGAXxFlPNxzlKkjhwkKi7CDTtEGZogt5YD0Z2x8Nc/8H
	sE+SuPVpo9JQcQcOwClVWzlJPYdE1p+dBn1/6/AEFTBv0AKdTXW5+M513zXKQreCjvs2o8WO4FZun
	giL0YGpmXzaLmkygudpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEz8i-0000hx-3F; Mon, 30 Sep 2019 17:07:12 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEz8f-0000hd-Q4
 for linux-afs@lists.infradead.org; Mon, 30 Sep 2019 17:07:10 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E5B149A9;
 Mon, 30 Sep 2019 17:00:58 +0000 (UTC)
Date: Mon, 30 Sep 2019 11:00:57 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] docs: use flexible array members, not zero-length
Message-ID: <20190930110057.1b11d798@lwn.net>
In-Reply-To: <20190928105557.221fb119@heffalump.sk2.org>
References: <20190927142927.27968-1-steve@sk2.org>
 <20190928011639.7c983e77@lwn.net>
 <20190928105557.221fb119@heffalump.sk2.org>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_100709_846651_061464B2 
X-CRM114-Status: UNSURE (   4.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 URIBL_SBL_A Contains URL's A record listed in the Spamhaus SBL
 blocklist [URIs: sk2.org]
 0.6 URIBL_SBL Contains an URL's NS IP listed in the Spamhaus SBL
 blocklist [URIs: sk2.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, bpf@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gU2F0LCAyOCBTZXAgMjAxOSAxMDo1NTo1NyArMDIwMApTdGVwaGVuIEtpdHQgPHN0ZXZlQHNr
Mi5vcmc+IHdyb3RlOgoKPiBXb3VsZG7igJl0IGl0IGJlIGJldHRlciB0byB1cGRhdGUgdGhlIGRv
Y3Mgc2ltdWx0YW5lb3VzbHkgaW4gZWFjaCBwYXRjaCB3aGljaAo+IGZpeGVzIGEgc3RydWN0dXJl
PyBPciBpcyB0aGF0IHVud29ya2FibGUgd2l0aCBjdXJyZW50IGRldmVsb3BtZW50IHByYWN0aWNl
cz8KCkRlZmluaXRlbHkgdXBkYXRlIHRoZSB0d28gdG9nZXRoZXIuICBUaGUgZG9jIGZpeCBzaG91
bGQganVzdCBnbyB0aHJvdWdoCnRoZSBhcHByb3ByaWF0ZSBtYWludGFpbmVyIHdpdGggdGhlIGNv
ZGUgY2hhbmdlLgoKVGhhbmtzLAoKam9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYWZzCg==
