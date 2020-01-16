Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C556B13EDD4
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 19:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cAWgQ0zjVYpUTvyX2aiD8NJXuVj+5xqolSCAF5crlQ=; b=XqA/NvjSrpav5T
	qcBK0IVfhScKq+2aNb/FMQW0tavyJjOaf2L/bTXI67OdAKQgNNVtR1dgsQFcCS1q5qnVb8FlPu79z
	c55r1PXFOgyG/ZV5zFGAkvJbPLCYGWtuF6OgdSagglacxEcqQinZnN0x51l7OUSXR8qxNFNEkW485
	guiPc6BfX4D+GV+6MT3OP6LPY1uaahWTWF4th7XKzDOlU3pTXpQvTFmEkKf6Zk6gvnCa/SLiKg2+T
	ry0r4EMdV7gCR924g08/tDIJztxgwhglt/K8ckfSGE4K1d549RYkPW0/uWgOCkjs6iTtdIBx/9ZtY
	YcE1n+2V0QfZ7usKuJZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is9WY-0003mY-Qv; Thu, 16 Jan 2020 18:05:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8wJ-0005cz-93
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:28:19 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B414246D7;
 Thu, 16 Jan 2020 17:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195694;
 bh=tMVDp8rNj4vWf/qGzy/RdOINQJk3zZMVBehdyYEx/7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IOXRZErkKRRC+8vGQ6gGEHeBXfpaCCsmg+5JluXkOB3gTrvil2fYjAqoNzL0qproB
 5hzUUQ6KVekNgoszaKPoToOC/Igy6DMZMZ5xBGy9URSdQmI/dIbwKOjH3EU89J/Rnu
 n3fC5dTsuSsqHbOUsXFNQdLfOXPwFNWCfsRoZRLc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 244/371] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
Date: Thu, 16 Jan 2020 12:21:56 -0500
Message-Id: <20200116172403.18149-187-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_092815_466051_CA658A13 
X-CRM114-Status: GOOD (  10.85  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, David Howells <dhowells@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

RnJvbTogRGF2aWQgSG93ZWxscyA8ZGhvd2VsbHNAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IDM0MjdiZWI2Mzc1ZDA0ZTk2MjdjNjczNDM4NzJlNzkzNDFhNjg0ZWEgXQoKV2l0aCBnY2Mg
NC4xOgoKICAgIG5ldC9yeHJwYy9vdXRwdXQuYzogSW4gZnVuY3Rpb24g4oCYcnhycGNfc2VuZF9k
YXRhX3BhY2tldOKAmToKICAgIG5ldC9yeHJwYy9vdXRwdXQuYzozMzg6IHdhcm5pbmc6IOKAmHJl
dOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24KCkluZGVlZCwg
aWYgdGhlIGZpcnN0IGp1bXAgdG8gdGhlIHNlbmRfZnJhZ21lbnRhYmxlIGxhYmVsIGlzIG1hZGUs
IGFuZAp0aGUgYWRkcmVzcyBmYW1pbHkgaXMgbm90IGhhbmRsZWQgaW4gdGhlIHN3aXRjaCgpIHN0
YXRlbWVudCwgcmV0IHdpbGwgYmUKdXNlZCB1bmluaXRpYWxpemVkLgoKRml4IHRoaXMgYnkgQlVH
KCknaW5nIGFzIGlzIGRvbmUgaW4gb3RoZXIgcGxhY2VzIGluIHJ4cnBjIHdoZXJlIGludGVybmFs
CnN1cHBvcnQgZm9yIGZ1dHVyZSBhZGRyZXNzIGZhbWlsaWVzIHdpbGwgbmVlZCBhZGRpbmcuICBJ
dCBzaG91bGQgbm90IGJlCnBvc3NpYmxlIHRvIHJlYWNoIHRoaXMgbm9ybWFsbHkgYXMgdGhlIGFk
ZHJlc3MgZmFtaWxpZXMgYXJlIGNoZWNrZWQKdXAtZnJvbnQuCgpGaXhlczogNWE5MjRiODk1MWY4
MzViNSAoInJ4cnBjOiBEb24ndCBzdG9yZSB0aGUgcnhycGMgaGVhZGVyIGluIHRoZSBUeCBxdWV1
ZSBza19idWZmcyIpClJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRoYXQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+
ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBuZXQv
cnhycGMvb3V0cHV0LmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL25ldC9yeHJwYy9vdXRwdXQuYyBiL25ldC9yeHJwYy9vdXRwdXQuYwppbmRl
eCA1YjY3Y2I1ZDQ3ZjAuLmVkZGRiYWNmMzNiYyAxMDA2NDQKLS0tIGEvbmV0L3J4cnBjL291dHB1
dC5jCisrKyBiL25ldC9yeHJwYy9vdXRwdXQuYwpAQCAtNDA0LDYgKzQwNCw5IEBAIGludCByeHJw
Y19zZW5kX2RhdGFfcGFja2V0KHN0cnVjdCByeHJwY19jYWxsICpjYWxsLCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiLAogCQl9CiAJCWJyZWFrOwogI2VuZGlmCisKKwlkZWZhdWx0OgorCQlCVUcoKTsKIAl9
CiAKIAl1cF93cml0ZSgmY29ubi0+cGFyYW1zLmxvY2FsLT5kZWZyYWdfc2VtKTsKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hZnMK
