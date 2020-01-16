Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B213F0AF
	for <lists+linux-afs@lfdr.de>; Thu, 16 Jan 2020 19:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlu+P604XDS6osQ9oIsmzjzExslWbM0Lmf5sY063DrM=; b=XmTceCqJVhsXqT
	CQbKE5kNqsSPV6urMsmfwSOi4jXvJg7eLcyHijx4ZF+JlZZtKZzHV2g2cI+SxNgdqLb4cqDAuY4aV
	92AtfXWwXY6Y8SyF2UeYGXNNYjRPo4RKhfgbh+E3wy9IqL5eXj0U7sDTk0aM+fCOn0M6sFCrm4eir
	ugqnJfka5/OR2cv8Y2TgvpsDNbKeAklFQ8BbemFdLBSX6LGbNLQ3Ybm2HHrwyJqOI9/hzqC/ijXuN
	l2og2YwHUOrtmUBrX2Ht2XMJaenkDL8vSrS6q25NpO55GJpAtLMoG+PtAo75Ume/WzZJ8d7j/Mvc/
	mtp2V+SDMZ41yQwz3Qmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is9ne-0008Py-Iu; Thu, 16 Jan 2020 18:23:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is97N-00083i-Mr
 for linux-afs@lists.infradead.org; Thu, 16 Jan 2020 17:40:00 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 246122471F;
 Thu, 16 Jan 2020 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579196381;
 bh=HGhx/zmL8/C/mfUQHP9jB2DLzEnwQZgZWd7IWiSc1eo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XqCp7b8mNJ/MgMyXnwu+sLrw5E868dxJh7fQlXWcGrJvQBi2vwUhHaeazTVq0M3rs
 3pa2y3kJkCKqERsfEAVJIJvCqszsQEIiKAiIacAn30KHGRRUmd8p86M1A2UYIp3NuA
 cozM5Bh1YujEUGzU4PBYOHNqFOjBHU86hklaROBs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 164/251] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
Date: Thu, 16 Jan 2020 12:35:13 -0500
Message-Id: <20200116173641.22137-124-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173641.22137-1-sashal@kernel.org>
References: <20200116173641.22137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_093941_801478_586A695B 
X-CRM114-Status: GOOD (  10.75  )
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
eCA1OWQzMjg2MDMzMTIuLjY0Mzg5ZjQ5M2JiMiAxMDA2NDQKLS0tIGEvbmV0L3J4cnBjL291dHB1
dC5jCisrKyBiL25ldC9yeHJwYy9vdXRwdXQuYwpAQCAtNDAwLDYgKzQwMCw5IEBAIGludCByeHJw
Y19zZW5kX2RhdGFfcGFja2V0KHN0cnVjdCByeHJwY19jYWxsICpjYWxsLCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiLAogCQl9CiAJCWJyZWFrOwogI2VuZGlmCisKKwlkZWZhdWx0OgorCQlCVUcoKTsKIAl9
CiAKIAl1cF93cml0ZSgmY29ubi0+cGFyYW1zLmxvY2FsLT5kZWZyYWdfc2VtKTsKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hZnMK
