Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 572F32CB1B
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 18:08:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vw8pVNn4BfavCov3KsnEf/Jq7CrmQ+ZxiLdfhYws/bM=; b=epLgE66DKA755r
	XM39zCJMzYzqT8rlSaljlrjPbnpNGVbsIcWE0rUeDA6lFMLouWoWlt/Yt5cL6qM07VmMMBxBi7Ztm
	2kwkVvaKrXYJbxSjdaPwgwDl1kFrbS46SNp5DlpDqOG7WxFBDzr/xen3P/PZ0yQWeAyWezh2p4SD0
	4fahFUWOvbkvKowEzifnTydP3wHpInWCVGZgyQulC/aIbMNoGn4Cuoy2+r/UEYy3p6tnWn33cmodr
	Wx2qVPybpWg4rntVG5dyOBdZZ5uzAasHQvoVBZ6Ewc/5IhXXVpuupnk0ecMUeA7DXl68Kmm0CERGw
	9rg/fAV+r1iHIL4r1hEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeeZ-0002BS-R2; Tue, 28 May 2019 16:08:43 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVd1z-0003Wa-Bs
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 14:24:49 +0000
Received: from ramsan ([84.194.111.163]) by xavier.telenet-ops.be with bizsmtp
 id HqQS2000L3XaVaC01qQSyd; Tue, 28 May 2019 16:24:42 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058J-3j; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057Q-26; Tue, 28 May 2019 16:24:26 +0200
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
Subject: [PATCH 2/5] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
Date: Tue, 28 May 2019 16:24:21 +0200
Message-Id: <20190528142424.19626-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528142424.19626-1-geert@linux-m68k.org>
References: <20190528142424.19626-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_072447_565908_DEEB0750 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [2a02:1800:120:4:0:0:f00:14 listed in]
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

V2l0aCBnY2MgNC4xOgoKICAgIG5ldC9yeHJwYy9vdXRwdXQuYzogSW4gZnVuY3Rpb24g4oCYcnhy
cGNfc2VuZF9kYXRhX3BhY2tldOKAmToKICAgIG5ldC9yeHJwYy9vdXRwdXQuYzozMzg6IHdhcm5p
bmc6IOKAmHJldOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24K
CkluZGVlZCwgaWYgdGhlIGZpcnN0IGp1bXAgdG8gdGhlIHNlbmRfZnJhZ21lbnRhYmxlIGxhYmVs
IGlzIG1hZGUsIGFuZAp0aGUgYWRkcmVzcyBmYW1pbHkgaXMgbm90IGhhbmRsZWQgaW4gdGhlIHN3
aXRjaCgpIHN0YXRlbWVudCwgcmV0IHdpbGwgYmUKdXNlZCB1bmluaXRpYWxpemVkLgoKRml4IHRo
aXMgYnkgaW5pdGlhbGl6aW5nIGVyciB0byB6ZXJvIGJlZm9yZSB0aGUganVtcCwgbGlrZSBpcyBh
bHJlYWR5CmRvbmUgZm9yIHRoZSBqdW1wIHRvIHRoZSBkb25lIGxhYmVsLgoKRml4ZXM6IDVhOTI0
Yjg5NTFmODM1YjUgKCJyeHJwYzogRG9uJ3Qgc3RvcmUgdGhlIHJ4cnBjIGhlYWRlciBpbiB0aGUg
VHggcXVldWUgc2tfYnVmZnMiKQpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KV2hpbGUgdGhpcyBpcyBub3QgYSByZWFsIGZhbHNlLXBv
c2l0aXZlLCBJIGJlbGlldmUgaXQgY2Fubm90IGNhdXNlIGhhcm0KaW4gcHJhY3RpY2UsIGFzIEFG
X1JYUlBDIGNhbm5vdCBiZSB1c2VkIHdpdGggb3RoZXIgdHJhbnNwb3J0IGZhbWlsaWVzCnRoYW4g
SVB2NCBhbmQgSVB2Ni4KLS0tCiBuZXQvcnhycGMvb3V0cHV0LmMgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9uZXQv
cnhycGMvb3V0cHV0LmMgYi9uZXQvcnhycGMvb3V0cHV0LmMKaW5kZXggMDA0Yzc2MmMyZThkMDYz
Yy4uMTQ3M2Q3NzRkNjcxMDBjNSAxMDA2NDQKLS0tIGEvbmV0L3J4cnBjL291dHB1dC5jCisrKyBi
L25ldC9yeHJwYy9vdXRwdXQuYwpAQCAtNDAzLDggKzQwMywxMCBAQCBpbnQgcnhycGNfc2VuZF9k
YXRhX3BhY2tldChzdHJ1Y3QgcnhycGNfY2FsbCAqY2FsbCwgc3RydWN0IHNrX2J1ZmYgKnNrYiwK
IAogCS8qIHNlbmQgdGhlIHBhY2tldCB3aXRoIHRoZSBkb24ndCBmcmFnbWVudCBiaXQgc2V0IGlm
IHdlIGN1cnJlbnRseQogCSAqIHRoaW5rIGl0J3Mgc21hbGwgZW5vdWdoICovCi0JaWYgKGlvdlsx
XS5pb3ZfbGVuID49IGNhbGwtPnBlZXItPm1heGRhdGEpCisJaWYgKGlvdlsxXS5pb3ZfbGVuID49
IGNhbGwtPnBlZXItPm1heGRhdGEpIHsKKwkJcmV0ID0gMDsKIAkJZ290byBzZW5kX2ZyYWdtZW50
YWJsZTsKKwl9CiAKIAlkb3duX3JlYWQoJmNvbm4tPnBhcmFtcy5sb2NhbC0+ZGVmcmFnX3NlbSk7
CiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
