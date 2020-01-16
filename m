Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724413E873
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 18:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gl2gl53f+vge45QRPuPcGUFSdCH0hWkh/n7yO8+bsYo=; b=C5wdsq5ybYEIrw
	0ClIzOmaCzsCvNMqbAV5Q0hblOI2gkCRsWB5VlUNBoTQaoQCHZd7AWv3jzTS+dlc6oQHesTvYqir8
	TFIGz5FL8+tYkvzTsIIZudefMthf0NRBTgS0BNK0Ob2bUIr0r/okQP73YxTUh1s6tox9LK1gOVI59
	Bd8soIK1SvL9xO2gMUSN685BpkD8panWrrlzEidDGxcWrl3bz525zMzCO9ojzoD6MPXvAUeuUdaT/
	i+ZLQccGa1RFoJ+c+nUFWozXajvhAxr1jSA3c+mKAQgnhXGr5mGqfQMi67gWDFYyfkuNUExKVEhID
	CKxPpKonv0Wa8Dz1Y+QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is90Q-0001we-SQ; Thu, 16 Jan 2020 17:32:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8e6-00020G-IH
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:09:32 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A00C24694;
 Thu, 16 Jan 2020 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194565;
 bh=LhOSRmKm4uP3chQZOSrM41PFKG+C1PjndW0AUBoxZMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SlynQfjRVAp3SOGNm6A9xuZT63nyISnldytOC/R3yQF8woy2GWeHHAT256CFaHLGv
 8crI3xLcY8eJnc8+1umZ4IiCGRWaNoMbjlooROiOPvmCqaoK+yJwidQyYJNHxprDRR
 rYRs8MbaUzVs9yxTm7cwkW/oiNu6kAHBY3fIevss=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 444/671] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
Date: Thu, 16 Jan 2020 12:01:22 -0500
Message-Id: <20200116170509.12787-181-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090926_662049_8188CDE4 
X-CRM114-Status: GOOD (  10.66  )
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
eCAzNDVkYzFjNWZlNzIuLjMxZTQ3Y2ZiM2U2OCAxMDA2NDQKLS0tIGEvbmV0L3J4cnBjL291dHB1
dC5jCisrKyBiL25ldC9yeHJwYy9vdXRwdXQuYwpAQCAtNTI0LDYgKzUyNCw5IEBAIGludCByeHJw
Y19zZW5kX2RhdGFfcGFja2V0KHN0cnVjdCByeHJwY19jYWxsICpjYWxsLCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiLAogCQl9CiAJCWJyZWFrOwogI2VuZGlmCisKKwlkZWZhdWx0OgorCQlCVUcoKTsKIAl9
CiAKIAlpZiAocmV0IDwgMCkKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
