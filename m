Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A67CD2CB16
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 18:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEO5FJcw5F2AA+gPmTP2878PZhUNdW594D2Wu+9F3WM=; b=HfGsULr7+hT+lY
	LCWtPq42QNjJew8f7cvVB1uFY+nAesXjnAMkEp9ODOPQNy70KPvg/vKWGbelhB60NRThI7SnVCpsS
	5HwXksDUzNO7LnqIvYthv4peFKPagOJC4Ek/LYsfFmP7jMRHo0wWc89/M/x9Him9uNfQcxN35fQ4N
	9vBmsUnh2UGxscOXiTrMFT3vSaYyH5c8w1MNw9Bt0RZjUivk5+u2XzvPTbCj7JLnc9h904wliH0vS
	e0Bh02rVBsrybDXFOvUMRErxKAKP/o5QBa1XEEHK2HI56XAT4wS+JTD0DCGJV0yabGuouOi40uX76
	i63WIDjhzLJO4E/x2wXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeeZ-0002BD-LP; Tue, 28 May 2019 16:08:43 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVd1z-0003Wi-E9
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 14:24:49 +0000
Received: from ramsan ([84.194.111.163]) by albert.telenet-ops.be with bizsmtp
 id HqQS2000E3XaVaC06qQSub; Tue, 28 May 2019 16:24:41 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058P-7H; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057Z-4f; Tue, 28 May 2019 16:24:26 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Igor Konopko <igor.j.konopko@intel.com>,
 David Howells <dhowells@redhat.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Eran Ben Elisha <eranbe@mellanox.com>, Matias Bjorling <mb@lightnvm.io>,
 Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 5/5] [RFC] devlink: Fix uninitialized error code in
 devlink_fmsg_prepare_skb()
Date: Tue, 28 May 2019 16:24:24 +0200
Message-Id: <20190528142424.19626-6-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_072447_646421_8C6DB9CF 
X-CRM114-Status: GOOD (  10.69  )
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [2a02:1800:110:4:0:0:f00:1a listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Tue, 28 May 2019 09:08:42 -0700
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

V2l0aCBnY2MgNC4xOgoKICAgIG5ldC9jb3JlL2RldmxpbmsuYzogSW4gZnVuY3Rpb24g4oCYZGV2
bGlua19mbXNnX3ByZXBhcmVfc2ti4oCZOgogICAgbmV0L2NvcmUvZGV2bGluay5jOjQzMjU6IHdh
cm5pbmc6IOKAmGVycuKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rp
b24KCkluZGVlZCwgaWYgdGhlIGxpc3QgaGFzIGxlc3MgdGhhbiAqc3RhcnQgZW50cmllcywgYW4g
dW5pbml0aWFsaXplZCBlcnJvcgpjb2RlIHdpbGwgYmUgcmV0dXJuZWQuCgpGaXggdGhpcyBieSBw
cmVpbml0aWFsaXppbmcgZXJyIHRvIHplcm8uCgpGaXhlczogMWRiNjRlODczM2Y2NTM4MSAoImRl
dmxpbms6IEFkZCBkZXZsaW5rIGZvcm1hdHRlZCBtZXNzYWdlIChmbXNnKSBBUEkiKQpTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KSSBk
b24ndCBrbm93IGlmIHRoaXMgY2FuIHJlYWxseSBoYXBwZW4sIGFuZCBpZiB0aGlzIGlzIHRoZSBy
aWdodCBmaXguClBlcmhhcHMgZXJyIHNob3VsZCBiZSBpbml0aWFsaXplZCB0byBzb21lIHZhbGlk
IGVycm9yIGNvZGUgaW5zdGVhZD8KLS0tCiBuZXQvY29yZS9kZXZsaW5rLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9u
ZXQvY29yZS9kZXZsaW5rLmMgYi9uZXQvY29yZS9kZXZsaW5rLmMKaW5kZXggZDQzYmM1MmI4ODQw
ZDc2Yi4uOTEzNzdlNGVhZTlhNDNjMSAxMDA2NDQKLS0tIGEvbmV0L2NvcmUvZGV2bGluay5jCisr
KyBiL25ldC9jb3JlL2RldmxpbmsuYwpAQCAtNDMyMSw4ICs0MzIxLDggQEAgZGV2bGlua19mbXNn
X3ByZXBhcmVfc2tiKHN0cnVjdCBkZXZsaW5rX2Ztc2cgKmZtc2csIHN0cnVjdCBza19idWZmICpz
a2IsCiB7CiAJc3RydWN0IGRldmxpbmtfZm1zZ19pdGVtICppdGVtOwogCXN0cnVjdCBubGF0dHIg
KmZtc2dfbmxhdHRyOworCWludCBlcnIgPSAwOwogCWludCBpID0gMDsKLQlpbnQgZXJyOwogCiAJ
Zm1zZ19ubGF0dHIgPSBubGFfbmVzdF9zdGFydF9ub2ZsYWcoc2tiLCBERVZMSU5LX0FUVFJfRk1T
Ryk7CiAJaWYgKCFmbXNnX25sYXR0cikKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
