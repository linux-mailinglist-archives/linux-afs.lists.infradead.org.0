Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE02CB18
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 18:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FW0R8lEakFCiYMF3UlKwUakIVwepsX3rlYlyYw6fcU0=; b=q3ZW2ahV6ObkHK
	CBC+4vm8NXTju3aG8qdioGs96xoHHCkep+9Cg2IVloXv9S340YegheOONDJGuASiqg+oo6ruVJte5
	hgfDWkLI9+GgyW+GeUF+lTxN++e1+pLOrzkR+LRvPYrRqYiFE2anYZirFjpGqcO0ggj6EzuNbM/sl
	YYMhT7NUmXvOYW88YqDUEznERoF3vZTtghhVYLrnS3ljFSKi9qG8e/B9MYLsW/yyeFUccurU6KILS
	ydiasXz7zkigzZ7CtNaSNWU8uxCCoAII3B5nCBtPdPjEn0MO6RTCbM3HFb8QmS3hCYnGiLStYnEWs
	ubjRGUm8RgYeC1hGondw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeea-0002CY-Un; Tue, 28 May 2019 16:08:44 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVd20-0003Wg-Px
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 14:24:50 +0000
Received: from ramsan ([84.194.111.163]) by laurent.telenet-ops.be with bizsmtp
 id HqQS200083XaVaC01qQSAl; Tue, 28 May 2019 16:24:41 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058L-4Z; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057S-2y; Tue, 28 May 2019 16:24:26 +0200
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
Subject: [PATCH 3/5] net: sched: pie: Use ULL suffix for 64-bit constant
Date: Tue, 28 May 2019 16:24:22 +0200
Message-Id: <20190528142424.19626-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_072449_000911_249876B9 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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

V2l0aCBnY2MgNC4xLCB3aGVuIGNvbXBpbGluZyBmb3IgYSAzMi1iaXQgcGxhdGZvcm06CgogICAg
bmV0L3NjaGVkL3NjaF9waWUuYzogSW4gZnVuY3Rpb24g4oCYZHJvcF9lYXJseeKAmToKICAgIG5l
dC9zY2hlZC9zY2hfcGllLmM6MTE2OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBs
YXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCiAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOjEzODogd2Fy
bmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQog
ICAgbmV0L3NjaGVkL3NjaF9waWUuYzoxNDQ6IHdhcm5pbmc6IGludGVnZXIgY29uc3RhbnQgaXMg
dG9vIGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUKICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTQ3
OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0
eXBlCiAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOiBJbiBmdW5jdGlvbiDigJhwaWVfcWRpc2NfZW5x
dWV1ZeKAmToKICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTczOiB3YXJuaW5nOiBpbnRlZ2VyIGNv
bnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCiAgICBuZXQvc2NoZWQvc2No
X3BpZS5jOiBJbiBmdW5jdGlvbiDigJhjYWxjdWxhdGVfcHJvYmFiaWxpdHnigJk6CiAgICBuZXQv
c2NoZWQvc2NoX3BpZS5jOjM3MTogd2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFy
Z2UgZm9yIOKAmGxvbmfigJkgdHlwZQogICAgbmV0L3NjaGVkL3NjaF9waWUuYzozNzI6IHdhcm5p
bmc6IGludGVnZXIgY29uc3RhbnQgaXMgdG9vIGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUKICAg
IG5ldC9zY2hlZC9zY2hfcGllLmM6Mzc3OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRv
byBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCiAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOjM4Mjog
d2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlw
ZQogICAgbmV0L3NjaGVkL3NjaF9waWUuYzozOTc6IHdhcm5pbmc6IGludGVnZXIgY29uc3RhbnQg
aXMgdG9vIGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUKICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6
Mzk4OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KA
mSB0eXBlCiAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOjM5OTogd2FybmluZzogaW50ZWdlciBjb25z
dGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQogICAgbmV0L3NjaGVkL3NjaF9w
aWUuYzo0MDc6IHdhcm5pbmc6IGludGVnZXIgY29uc3RhbnQgaXMgdG9vIGxhcmdlIGZvciDigJhs
b25n4oCZIHR5cGUKICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6NDE0OiB3YXJuaW5nOiBpbnRlZ2Vy
IGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCgpGaXggdGhpcyBieSBh
ZGRpbmcgdGhlIG1pc3NpbmcgIlVMTCIgc3VmZml4LgoKRml4ZXM6IDNmN2FlNWYzZGM1Mjk1YWMg
KCJuZXQ6IHNjaGVkOiBwaWU6IGFkZCBtb3JlIGNhc2VzIHRvIGF1dG8tdHVuZSBhbHBoYSBhbmQg
YmV0YSIpClNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+Ci0tLQogbmV0L3NjaGVkL3NjaF9waWUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL25ldC9zY2hlZC9zY2hf
cGllLmMgYi9uZXQvc2NoZWQvc2NoX3BpZS5jCmluZGV4IDhmYTEyOWQzOTQzZTMyYWQuLmYzNDI0
ODMzZTZhN2NkM2IgMTAwNjQ0Ci0tLSBhL25ldC9zY2hlZC9zY2hfcGllLmMKKysrIGIvbmV0L3Nj
aGVkL3NjaF9waWUuYwpAQCAtMzEsNyArMzEsNyBAQAogCiAjZGVmaW5lIFFVRVVFX1RIUkVTSE9M
RCAxNjM4NAogI2RlZmluZSBEUUNPVU5UX0lOVkFMSUQgLTEKLSNkZWZpbmUgTUFYX1BST0IgMHhm
ZmZmZmZmZmZmZmZmZmZmCisjZGVmaW5lIE1BWF9QUk9CIDB4ZmZmZmZmZmZmZmZmZmZmZlVMTAog
I2RlZmluZSBQSUVfU0NBTEUgOAogCiAvKiBwYXJhbWV0ZXJzIHVzZWQgKi8KLS0gCjIuMTcuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFm
cyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hZnMK
