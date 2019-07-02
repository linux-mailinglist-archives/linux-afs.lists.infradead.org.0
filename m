Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E830F5D22E
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jul 2019 16:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S4mKedhmx9ee6wu6B0I5Bvm2B7ldEckKUVoOzlAPasE=; b=a4OYzkDYLlEqtU
	PkSLHNxAyi0l5jzNbkkyPTCc9+tVRVb0wdhqGbqmwYGYU77Gqb26CG0smIjvCAo3VpzVmuPAByVA9
	yygsFK49wBVtfTfzFlK1N7F6MfrvkXxBAJHJu4U+MztJzbvYcnPwXppnRuvwA8dbExIOkxBgIwq/O
	I1CrW/IiQbXHgHS+S1NOePh9AUnw/C45rVDHy8g9Z7HdobZNpJAm5q7Z/bQVbDNK5fuLMGwfjtyh9
	s5nKM6JDJV/cWSQ8zAIRAhIDaheuIZ1uEx1DdoCEpcd2l7D9M7JDCQxstXd0bHMnXSVY9sVJHQDIK
	NbDZIuzj0NH1r5mSEMKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiKC7-0005YA-Ef; Tue, 02 Jul 2019 14:55:43 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiKC3-0005PN-Q8
 for linux-afs@lists.infradead.org; Tue, 02 Jul 2019 14:55:41 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8E914307D85A;
 Tue,  2 Jul 2019 14:55:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-219.rdu2.redhat.com
 [10.10.120.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89D1217CE2;
 Tue,  2 Jul 2019 14:55:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH net-next] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Tue, 02 Jul 2019 15:55:28 +0100
Message-ID: <156207932870.853.14700731055154895417.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 02 Jul 2019 14:55:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_075539_867795_F7DCFC01 
X-CRM114-Status: GOOD (  12.80  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
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
Cc: dhowells@redhat.com, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

V2l0aCBnY2MgNC4xOgoKICAgIG5ldC9yeHJwYy9vdXRwdXQuYzogSW4gZnVuY3Rpb24g4oCYcnhy
cGNfc2VuZF9kYXRhX3BhY2tldOKAmToKICAgIG5ldC9yeHJwYy9vdXRwdXQuYzozMzg6IHdhcm5p
bmc6IOKAmHJldOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24K
CkluZGVlZCwgaWYgdGhlIGZpcnN0IGp1bXAgdG8gdGhlIHNlbmRfZnJhZ21lbnRhYmxlIGxhYmVs
IGlzIG1hZGUsIGFuZAp0aGUgYWRkcmVzcyBmYW1pbHkgaXMgbm90IGhhbmRsZWQgaW4gdGhlIHN3
aXRjaCgpIHN0YXRlbWVudCwgcmV0IHdpbGwgYmUKdXNlZCB1bmluaXRpYWxpemVkLgoKRml4IHRo
aXMgYnkgQlVHKCknaW5nIGFzIGlzIGRvbmUgaW4gb3RoZXIgcGxhY2VzIGluIHJ4cnBjIHdoZXJl
IGludGVybmFsCnN1cHBvcnQgZm9yIGZ1dHVyZSBhZGRyZXNzIGZhbWlsaWVzIHdpbGwgbmVlZCBh
ZGRpbmcuICBJdCBzaG91bGQgbm90IGJlCnBvc3NpYmxlIHRvIHJlYWNoIHRoaXMgbm9ybWFsbHkg
YXMgdGhlIGFkZHJlc3MgZmFtaWxpZXMgYXJlIGNoZWNrZWQKdXAtZnJvbnQuCgpGaXhlczogNWE5
MjRiODk1MWY4MzViNSAoInJ4cnBjOiBEb24ndCBzdG9yZSB0aGUgcnhycGMgaGVhZGVyIGluIHRo
ZSBUeCBxdWV1ZSBza19idWZmcyIpClJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxs
c0ByZWRoYXQuY29tPgotLS0KCiBuZXQvcnhycGMvb3V0cHV0LmMgfCAgICAzICsrKwogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL25ldC9yeHJwYy9vdXRwdXQu
YyBiL25ldC9yeHJwYy9vdXRwdXQuYwppbmRleCBhMGI2YWJmYmQyNzcuLjk0OGUzZmUyNDllYyAx
MDA2NDQKLS0tIGEvbmV0L3J4cnBjL291dHB1dC5jCisrKyBiL25ldC9yeHJwYy9vdXRwdXQuYwpA
QCAtNTE5LDYgKzUxOSw5IEBAIGludCByeHJwY19zZW5kX2RhdGFfcGFja2V0KHN0cnVjdCByeHJw
Y19jYWxsICpjYWxsLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCQl9CiAJCWJyZWFrOwogI2VuZGlm
CisKKwlkZWZhdWx0OgorCQlCVUcoKTsKIAl9CiAKIAlpZiAocmV0IDwgMCkKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYWZz
Cg==
