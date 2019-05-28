Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9532CB1A
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 18:08:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZrd2nhlB80QQBXr0X388exQ+BJmBKwudlgwPBRWE08=; b=q5v5GuL7tLzuxf
	QtqmPaq8ROvvow5Gic4YcsIWdK4YdsKVjBmc9LsAYxpJ5y/Ldh+7KmI/WoMFtjyrDmX8fhDvt5OXk
	Du6uCKjUMvbx+u/mtmMoh/9NpS4dUSNuhUQFEmQQpe8lrt+/AAtJs3XWkA3QIlCnTw3qyZSH9kx+N
	ZlCdHwsnL91N405zSvgr5Dps6t2/H+SuAzCowm5SbB19NKfpV/OamZBCWSJ2wINUJAA8mZcPu6guk
	uNhLbwGLpeftxxL7CklDM/IkkT5tJxUvTmK7b0hvsYr3N7cGWwBNw7kkUJgSRgNaRIN8JF0zzKrxD
	ozX+1pxgpM2yPoy5B+YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeea-0002C0-BC; Tue, 28 May 2019 16:08:44 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVd20-0003Wf-QW
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 14:24:50 +0000
Received: from ramsan ([84.194.111.163]) by laurent.telenet-ops.be with bizsmtp
 id HqQS200073XaVaC01qQSAk; Tue, 28 May 2019 16:24:41 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058G-2v; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057O-1L; Tue, 28 May 2019 16:24:26 +0200
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
Subject: [PATCH 1/5] lightnvm: Fix uninitialized pointer in nvm_remove_tgt()
Date: Tue, 28 May 2019 16:24:20 +0200
Message-Id: <20190528142424.19626-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_072449_009623_7E0FBB80 
X-CRM114-Status: GOOD (  10.55  )
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [2a02:1800:110:4:0:0:f00:19 listed in]
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

V2l0aCBnY2MgNC4xOgoKICAgIGRyaXZlcnMvbGlnaHRudm0vY29yZS5jOiBJbiBmdW5jdGlvbiDi
gJhudm1fcmVtb3ZlX3RndOKAmToKICAgIGRyaXZlcnMvbGlnaHRudm0vY29yZS5jOjUxMDogd2Fy
bmluZzog4oCYdOKAmSBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgoKSW5k
ZWVkLCBpZiBubyBOVk0gZGV2aWNlcyBoYXZlIGJlZW4gcmVnaXN0ZXJlZCwgdCB3aWxsIGJlIGFu
CnVuaW5pdGlhbGl6ZWQgcG9pbnRlciwgYW5kIG1heSBiZSBkZXJlZmVyZW5jZWQgbGF0ZXIuICBB
IGNhbGwgdG8KbnZtX3JlbW92ZV90Z3QoKSBjYW4gYmUgdHJpZ2dlcmVkIGZyb20gdXNlcnNwYWNl
IGJ5IGlzc3VpbmcgdGhlCk5WTV9ERVZfUkVNT1ZFIGlvY3RsIG9uIHRoZSBsaWdodG52bSBjb250
cm9sIGRldmljZS4KCkZpeCB0aGlzIGJ5IHByZWluaXRpYWxpemluZyB0IHRvIE5VTEwuCgpGaXhl
czogODQzZjJlZGJkZGUwODViNCAoImxpZ2h0bnZtOiBkbyBub3QgcmVtb3ZlIGluc3RhbmNlIHVu
ZGVyIGdsb2JhbCBsb2NrIikKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4KLS0tCiBkcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbGlnaHRudm0vY29yZS5jIGIvZHJpdmVycy9saWdodG52bS9jb3JlLmMKaW5kZXgg
MGRmNzQ1NDgzMmVmZTA4Mi4uYWEwMTdmNDhlYjhjNTg4YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9s
aWdodG52bS9jb3JlLmMKKysrIGIvZHJpdmVycy9saWdodG52bS9jb3JlLmMKQEAgLTQ5Miw3ICs0
OTIsNyBAQCBzdGF0aWMgdm9pZCBfX252bV9yZW1vdmVfdGFyZ2V0KHN0cnVjdCBudm1fdGFyZ2V0
ICp0LCBib29sIGdyYWNlZnVsKQogICovCiBzdGF0aWMgaW50IG52bV9yZW1vdmVfdGd0KHN0cnVj
dCBudm1faW9jdGxfcmVtb3ZlICpyZW1vdmUpCiB7Ci0Jc3RydWN0IG52bV90YXJnZXQgKnQ7CisJ
c3RydWN0IG52bV90YXJnZXQgKnQgPSBOVUxMOwogCXN0cnVjdCBudm1fZGV2ICpkZXY7CiAKIAlk
b3duX3JlYWQoJm52bV9sb2NrKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
