Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3845A1EA3F8
	for <lists+linux-afs@lfdr.de>; Mon,  1 Jun 2020 14:35:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:MIME-Version:Subject:To
	:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JeqfpAtUVyN7VchJedfzE6ESuLK6E84QLX4FaTnn6w=; b=OOAVIEmyIRsN/o
	3ypBiFyIkL9KqqoApAPJhUm0KicYgPE/BXSjrVBRJ8Hke2xcuVKh+Advr/UvKK5L9zsI1lPHdgLe1
	BloyAldMaF2Rag4boUgwGPmzT3cfwk2V/9/MU/XvshUF1geeXeQvExL0NwzwpRogqr4EQJkvtefwx
	g4+3ux6nAwnszroKQ5J6lKBbP09PRU7ZcvDfy5sHJW3K2xsU7aZAuBcoPPozJHK1eUFkmokH0PF+o
	wksG8QN0Svcg47VwiXukqn98SllQ6B+MmmrM9wAopNVAEN8e1pEXMIsYBYCzha38HYKwO/WH8FYPQ
	MksFRIu0bauUr/j4wXuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfjet-0002yo-4g; Mon, 01 Jun 2020 12:35:15 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfjeq-0002yK-UQ
 for linux-afs@lists.infradead.org; Mon, 01 Jun 2020 12:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591014911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wBls6dso9hCO4rI4kYDinlWW4RbCZK4JGwW4cnToAWE=;
 b=d0Ym41jTalEbJT/iSHrOWvklwN24WteDcrhcxImV4oFbix3eX+RmrCVjVDanZXxLOEIKzl
 t5t3aOMIV+cTpTfHl1L2OIEHNhGzEcR3u1ERHyJVFPvjzTt7/Xd5WOp2DonJ/2Q3WL5ZQP
 NZQWRHRaKrM1ib3l9VwEqvelBb4vXlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-9eo9lp6gNlu9Yo_iflGRGg-1; Mon, 01 Jun 2020 08:35:07 -0400
X-MC-Unique: 9eo9lp6gNlu9Yo_iflGRGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E338005AA;
 Mon,  1 Jun 2020 12:35:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 819432DE93;
 Mon,  1 Jun 2020 12:35:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <d8e5aa79-3f83-a5de-5aa8-7bd4a287646e@web.de>
References: <d8e5aa79-3f83-a5de-5aa8-7bd4a287646e@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] afs: Fix memory leak in afs_put_sysnames()
MIME-Version: 1.0
Date: Mon, 01 Jun 2020 13:35:01 +0100
Message-ID: <1306563.1591014901@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_053513_062210_F1AE2454 
X-CRM114-Status: UNSURE (   9.54  )
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
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
Cc: Yi Zhang <yi.zhang@huawei.com>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

TWFya3VzIEVsZnJpbmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4gd3JvdGU6Cgo+ID4gc3lzbmFt
ZXMgc2hvdWxkIGJlIGZyZWVkIGFmdGVyIHJlZmNudCBiZWluZyBkZWNyZWFzZWQgdG8gemVybyBp
bgo+ID4gYWZzX3B1dF9zeXNuYW1lcygpLgo+IAo+ICogSSBzdWdnZXN0IHRvIHVzZSB0aGUgd29y
ZGluZyDigJxyZWZlcmVuY2UgY291bnRlcuKAnS4KCkNhbiB5b3UgdXNlIEFTQ0lJIHF1b3RlcyBw
bGVhc2U/ICBOb3QgYWxsIGZvbnRzIGNvbnRhaW4gdGhlc2UgcXVvdGVzLCBhbmQKb2NjYXNpb25h
bGx5IHRoZXkgZ290IGNvcGllZCBpbnRvIGNvbW1pdCBtZXNzYWdlcy4KCj4gKiBXaGVyZSBkaWQg
eW91IG5vdGljZSBhIOKAnG1lbW9yeSBsZWFr4oCdIGhlcmU/CgpIZSBzYWlkICJzeXNuYW1lcyBz
aG91bGQgYmUgZnJlZWQgYWZ0ZXIgcmVmY250IGJlaW5nIGRlY3JlYXNlZCB0byB6ZXJvIGluCmFm
c19wdXRfc3lzbmFtZXMoKSIuCgo+ICogV2lsbCB0aGUgdGFnIOKAnEZpeGVz4oCdIGJlY29tZSBy
ZWxldmFudCBmb3IgdGhlIGNvbW1pdCBtZXNzYWdlPwoKSXQgaXMgdGhlIGNvcnJlY3QgdGFnLgoK
RGF2aWQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hZnMgbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYWZzCg==
