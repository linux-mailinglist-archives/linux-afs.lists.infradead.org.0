Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAFD5D6A2
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jul 2019 21:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGlOmFtOd2OPAScqvn8mBSn2SnMUbXw3DoVWAePbOrc=; b=BtkbE3BS8VLsgj
	j0Tz8nRk29WmCXh3yaKjzgrSE9MBeif7rVZDX7FKVgZA7fL3YXT6d5NJ4P1J1H/CoOlGQCwyCcSMg
	BR6zsEB+DLBcPu43si9tUpGFXtLkoIM6yHzzoeWwE4K7G59jx3ucuNan0AYIcS6j4ngRRK4eV0fFW
	2/9tn/9CnTaDKIyoFfJ6LiAD+SORAjGHp2A9fHlStSsSmqZzr1UHHpmKeqGHH3Z3MlzcSxTatu20a
	vLe3EymO5ucAnjXApBbsdAkg7JCKUeLmsMfZW9u9WyeyIcHg4TtNPmlg6WydVbC9n/6pPzkvJcmHP
	Uad/TIF0DEuBfHpDtAAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiOA5-0005Zn-Ga; Tue, 02 Jul 2019 19:09:53 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiOA2-0005ZO-Kh
 for linux-afs@lists.infradead.org; Tue, 02 Jul 2019 19:09:51 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C045F13AEC9F2;
 Tue,  2 Jul 2019 12:09:45 -0700 (PDT)
Date: Tue, 02 Jul 2019 12:09:45 -0700 (PDT)
Message-Id: <20190702.120945.2105185642385395522.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net-next] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
From: David Miller <davem@davemloft.net>
In-Reply-To: <156207932870.853.14700731055154895417.stgit@warthog.procyon.org.uk>
References: <156207932870.853.14700731055154895417.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 02 Jul 2019 12:09:46 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_120950_682177_DE85CEDF 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: netdev@vger.kernel.org, geert@linux-m68k.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso8859-7"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

RnJvbTogRGF2aWQgSG93ZWxscyA8ZGhvd2VsbHNAcmVkaGF0LmNvbT4NCkRhdGU6IFR1ZSwgMDIg
SnVsIDIwMTkgMTU6NTU6MjggKzAxMDANCg0KPiBXaXRoIGdjYyA0LjE6DQo+IA0KPiAgICAgbmV0
L3J4cnBjL291dHB1dC5jOiBJbiBmdW5jdGlvbiChcnhycGNfc2VuZF9kYXRhX3BhY2tldKI6DQo+
ICAgICBuZXQvcnhycGMvb3V0cHV0LmM6MzM4OiB3YXJuaW5nOiChcmV0oiBtYXkgYmUgdXNlZCB1
bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24NCj4gDQo+IEluZGVlZCwgaWYgdGhlIGZpcnN0
IGp1bXAgdG8gdGhlIHNlbmRfZnJhZ21lbnRhYmxlIGxhYmVsIGlzIG1hZGUsIGFuZA0KPiB0aGUg
YWRkcmVzcyBmYW1pbHkgaXMgbm90IGhhbmRsZWQgaW4gdGhlIHN3aXRjaCgpIHN0YXRlbWVudCwg
cmV0IHdpbGwgYmUNCj4gdXNlZCB1bmluaXRpYWxpemVkLg0KPiANCj4gRml4IHRoaXMgYnkgQlVH
KCknaW5nIGFzIGlzIGRvbmUgaW4gb3RoZXIgcGxhY2VzIGluIHJ4cnBjIHdoZXJlIGludGVybmFs
DQo+IHN1cHBvcnQgZm9yIGZ1dHVyZSBhZGRyZXNzIGZhbWlsaWVzIHdpbGwgbmVlZCBhZGRpbmcu
ICBJdCBzaG91bGQgbm90IGJlDQo+IHBvc3NpYmxlIHRvIHJlYWNoIHRoaXMgbm9ybWFsbHkgYXMg
dGhlIGFkZHJlc3MgZmFtaWxpZXMgYXJlIGNoZWNrZWQNCj4gdXAtZnJvbnQuDQo+IA0KPiBGaXhl
czogNWE5MjRiODk1MWY4MzViNSAoInJ4cnBjOiBEb24ndCBzdG9yZSB0aGUgcnhycGMgaGVhZGVy
IGluIHRoZSBUeCBxdWV1ZSBza19idWZmcyIpDQo+IFJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIb3dl
bGxzIDxkaG93ZWxsc0ByZWRoYXQuY29tPg0KDQpBcHBsaWVkLCB0aGFua3MgRGF2aWQuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYWZzCg==
