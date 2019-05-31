Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11D30CF6
	for <lists+linux-afs@lfdr.de>; Fri, 31 May 2019 12:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:MIME-Version:Subject:To
	:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQa1IOTZgOaZ+alTkvdfm8dEKHxujDo7kivC5vaPKtI=; b=Vxv7UVT/Sz7QpS
	oby9Kbp71EKYhsZuCljEv8NxKANtMhbv3rf4Zf4MSDbNCvcsxhJpTK3up8MobdmmWfm/C88I8Nzlt
	ZibulmUFaxDsgN97gMirLSqkIHQFT0y6YogsMBQ4n3FWnWosePM6Fr1jwaUR+0X9hGxmiNumtYmYU
	5SEDAcprLtA2Ymwn2H+yegOJvOZ04Fndp0xBENiJ42N0E0mouO0FjspL7iOmo/LofdvVjrMDtJXpA
	NWyYU7K6vavFugfIVsyuxj/HXEO/XtrPJUFmq9XKpAjU6p//obRPU6SnWeK+k/SoAIunTPvbe6z+d
	+mZAA5oX93hCKCGYwGzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWfEC-0005dt-Tc; Fri, 31 May 2019 10:57:40 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWesh-0007hY-9T
 for linux-afs@lists.infradead.org; Fri, 31 May 2019 10:35:28 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1845730C1B98;
 Fri, 31 May 2019 10:34:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 586D5600C7;
 Fri, 31 May 2019 10:34:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190528142424.19626-3-geert@linux-m68k.org>
References: <20190528142424.19626-3-geert@linux-m68k.org>
 <20190528142424.19626-1-geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
MIME-Version: 1.0
Date: Fri, 31 May 2019 11:34:44 +0100
Message-ID: <15499.1559298884@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 31 May 2019 10:35:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190531_033527_349878_0C7FCB60 
X-CRM114-Status: GOOD (  12.54  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Fri, 31 May 2019 03:57:39 -0700
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
Cc: linux-block@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, dhowells@redhat.com,
 Jiri Pirko <jiri@mellanox.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Joe Perches <joe@perches.com>, "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Jaroslav Kysela <perex@perex.cz>,
 Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

CkhpIEdlZXJ0LAoKSGVyZSdzIG15IHRha2Ugb24gdGhlIHBhdGNoLgoKRGF2aWQKLS0tCnJ4cnBj
OiBGaXggdW5pbml0aWFsaXplZCBlcnJvciBjb2RlIGluIHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXQo
KSAgICAKICAgIApXaXRoIGdjYyA0LjE6CgogICAgbmV0L3J4cnBjL291dHB1dC5jOiBJbiBmdW5j
dGlvbiDigJhyeHJwY19zZW5kX2RhdGFfcGFja2V04oCZOgogICAgbmV0L3J4cnBjL291dHB1dC5j
OjMzODogd2FybmluZzog4oCYcmV04oCZIG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhp
cyBmdW5jdGlvbgoKSW5kZWVkLCBpZiB0aGUgZmlyc3QganVtcCB0byB0aGUgc2VuZF9mcmFnbWVu
dGFibGUgbGFiZWwgaXMgbWFkZSwgYW5kCnRoZSBhZGRyZXNzIGZhbWlseSBpcyBub3QgaGFuZGxl
ZCBpbiB0aGUgc3dpdGNoKCkgc3RhdGVtZW50LCByZXQgd2lsbCBiZQp1c2VkIHVuaW5pdGlhbGl6
ZWQuCgpGaXggdGhpcyBieSBCVUcoKSdpbmcgYXMgaXMgZG9uZSBpbiBvdGhlciBwbGFjZXMgaW4g
cnhycGMgd2hlcmUgaW50ZXJuYWwKc3VwcG9ydCBmb3IgZnV0dXJlIGFkZHJlc3MgZmFtaWxpZXMg
d2lsbCBuZWVkIGFkZGluZy4gIEl0IHNob3VsZCBub3QgYmUKcG9zc2libGUgdG8gcmVhY2ggdGhp
cyBub3JtYWxseSBhcyB0aGUgYWRkcmVzcyBmYW1pbGllcyBhcmUgY2hlY2tlZAp1cC1mcm9udC4K
CkZpeGVzOiA1YTkyNGI4OTUxZjgzNWI1ICgicnhycGM6IERvbid0IHN0b3JlIHRoZSByeHJwYyBo
ZWFkZXIgaW4gdGhlIFR4IHF1ZXVlIHNrX2J1ZmZzIikKUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEhvd2Vs
bHMgPGRob3dlbGxzQHJlZGhhdC5jb20+Ci0tLQpkaWZmIC0tZ2l0IGEvbmV0L3J4cnBjL291dHB1
dC5jIGIvbmV0L3J4cnBjL291dHB1dC5jCmluZGV4IDAwNGM3NjJjMmU4ZC4uNmYyYjRmYjRiMGFh
IDEwMDY0NAotLS0gYS9uZXQvcnhycGMvb3V0cHV0LmMKKysrIGIvbmV0L3J4cnBjL291dHB1dC5j
CkBAIC01MjMsNiArNTIzLDkgQEAgaW50IHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXQoc3RydWN0IHJ4
cnBjX2NhbGwgKmNhbGwsIHN0cnVjdCBza19idWZmICpza2IsCiAJCX0KIAkJYnJlYWs7CiAjZW5k
aWYKKworCWRlZmF1bHQ6CisJCUJVRygpOwogCX0KIAogCWlmIChyZXQgPCAwKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFm
cwo=
