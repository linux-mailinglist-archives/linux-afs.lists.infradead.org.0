Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF52CB19
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 18:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCFVQOPo7+DrN71SEFEP25tbJjh7fYpQNWhG0/WeWgk=; b=H6j45osBVOojlk
	10voLiHxmTmljfc3zBp2z68RJCB9uj77PhtJYryy1qFtbchxSfyFCnffc3XiWnsXLUl1+GWQzW9gE
	Mx7CJFVBF2QK3Soppa71J35EWTZz37yW++gPHrEGAkz9KJ1U2oc0IbNDkk/nl8B4a3E1k3Bm8E76Z
	lVZaSOSNGI7msMof9uS7ROQLUNZJzU05JN9AFTl+OG9P1dIJ/E0R1zJJdO4AkjdRrS1FAAJT2hb6J
	qVEjrxG5i86qz4z7tnOyBXDjTRo2OTkKgr5L/BMNUwDS0ntvHnvFt/Q2mPWqofD2r7mh/6k1KebGE
	Y262PSxIhIO/3dymzCnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeea-0002CH-Lc; Tue, 28 May 2019 16:08:44 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVd1z-0003We-TO
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 14:24:50 +0000
Received: from ramsan ([84.194.111.163])
 by baptiste.telenet-ops.be with bizsmtp
 id HqQS2000C3XaVaC01qQSFC; Tue, 28 May 2019 16:24:42 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058N-5X; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057W-3p; Tue, 28 May 2019 16:24:26 +0200
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
Subject: [PATCH 4/5] ALSA: fireface: Use ULL suffixes for 64-bit constants
Date: Tue, 28 May 2019 16:24:23 +0200
Message-Id: <20190528142424.19626-5-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_072448_103735_DDE0DC74 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [2a02:1800:120:4:0:0:f00:13 listed in]
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

V2l0aCBnY2MgNC4xOgoKICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxh
dHRlci5jOiBJbiBmdW5jdGlvbiDigJhsYXR0ZXJfc3dpdGNoX2ZldGNoaW5nX21vZGXigJk6CiAg
ICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90b2NvbC1sYXR0ZXIuYzo5Nzogd2Fybmlu
ZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQogICAg
c291bmQvZmlyZXdpcmUvZmlyZWZhY2UvZmYtcHJvdG9jb2wtbGF0dGVyLmM6IEluIGZ1bmN0aW9u
IOKAmGxhdHRlcl9iZWdpbl9zZXNzaW9u4oCZOgogICAgc291bmQvZmlyZXdpcmUvZmlyZWZhY2Uv
ZmYtcHJvdG9jb2wtbGF0dGVyLmM6MTcwOiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRv
byBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCiAgICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9m
Zi1wcm90b2NvbC1sYXR0ZXIuYzoxOTc6IHdhcm5pbmc6IGludGVnZXIgY29uc3RhbnQgaXMgdG9v
IGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUKICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2Zm
LXByb3RvY29sLWxhdHRlci5jOjIwNTogd2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28g
bGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQogICAgc291bmQvZmlyZXdpcmUvZmlyZWZhY2UvZmYt
cHJvdG9jb2wtbGF0dGVyLmM6IEluIGZ1bmN0aW9uIOKAmGxhdHRlcl9maW5pc2hfc2Vzc2lvbuKA
mToKICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jOjIxNDog
d2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlw
ZQoKRml4IHRoaXMgYnkgYWRkaW5nIHRoZSBtaXNzaW5nICJVTEwiIHN1ZmZpeGVzLgpBZGQgdGhl
IHNhbWUgc3VmZml4IHRvIHRoZSBsYXN0IGNvbnN0YW50LCB0byBtYWludGFpbiBjb25zaXN0ZW5j
eS4KCkZpeGVzOiBmZDFjYzlkZTY0YzJjYTZjICgiQUxTQTogZmlyZWZhY2U6IGFkZCBzdXBwb3J0
IGZvciBGaXJlZmFjZSBVQ1giKQpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3Rv
Y29sLWxhdHRlci5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9maXJld2lyZS9maXJlZmFj
ZS9mZi1wcm90b2NvbC1sYXR0ZXIuYyBiL3NvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3Rv
Y29sLWxhdHRlci5jCmluZGV4IGM4MjM2ZmY4OWI3ZmI5ZGUuLmIzMGQwMmQzNTliMWQyMWIgMTAw
NjQ0Ci0tLSBhL3NvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jCisr
KyBiL3NvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jCkBAIC05LDEx
ICs5LDExIEBACiAKICNpbmNsdWRlICJmZi5oIgogCi0jZGVmaW5lIExBVFRFUl9TVEYJCTB4ZmZm
ZjAwMDAwMDA0Ci0jZGVmaW5lIExBVFRFUl9JU09DX0NIQU5ORUxTCTB4ZmZmZjAwMDAwMDA4Ci0j
ZGVmaW5lIExBVFRFUl9JU09DX1NUQVJUCTB4ZmZmZjAwMDAwMDBjCi0jZGVmaW5lIExBVFRFUl9G
RVRDSF9NT0RFCTB4ZmZmZjAwMDAwMDEwCi0jZGVmaW5lIExBVFRFUl9TWU5DX1NUQVRVUwkweDAw
MDA4MDFjMDAwMAorI2RlZmluZSBMQVRURVJfU1RGCQkweGZmZmYwMDAwMDAwNFVMTAorI2RlZmlu
ZSBMQVRURVJfSVNPQ19DSEFOTkVMUwkweGZmZmYwMDAwMDAwOFVMTAorI2RlZmluZSBMQVRURVJf
SVNPQ19TVEFSVAkweGZmZmYwMDAwMDAwY1VMTAorI2RlZmluZSBMQVRURVJfRkVUQ0hfTU9ERQkw
eGZmZmYwMDAwMDAxMFVMTAorI2RlZmluZSBMQVRURVJfU1lOQ19TVEFUVVMJMHgwMDAwODAxYzAw
MDBVTEwKIAogc3RhdGljIGludCBwYXJzZV9jbG9ja19iaXRzKHUzMiBkYXRhLCB1bnNpZ25lZCBp
bnQgKnJhdGUsCiAJCQkgICAgZW51bSBzbmRfZmZfY2xvY2tfc3JjICpzcmMpCi0tIAoyLjE3LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
ZnMgbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYWZzCg==
