Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E22DEEE
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 15:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmxqn2NFFGdqUTxmw7mENHscn3ZtZO3PvVcjYLa0h70=; b=bW5AZRY8UTm/ox
	ga1NnX4iA3OPYv7aalIHaTbGAGmrw3HOMAFnwXHEc6OQ0j7mNNkQqFpG4cubOeIZPiKUlKP0WSmV4
	KZ00DtnwW49eSHHyX43njcEZ+H8TlQpcZqe+Xs8O5fqKKX+KzxWDx7RDcKDb9Yzk21WcHC5g3Splx
	YP7nGdSqh7016Mh3XcN97ZiHJ9oWBUR+iiKWKLPVrM1pLoAhy5NtG/WFI5RknPdTgANjhP8Vcv17D
	TNqMjN3a8ZjSLM1sbbz88ZGuP1DvR5o6pQ1VQnJ09yqC+bvzij/yjKdcZebqALL/zqZSm8NLABmD0
	nVwGD6cXRFIOG38e0KHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVz09-0006Du-Ft; Wed, 29 May 2019 13:52:21 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVvLA-0002Ar-61
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 09:57:49 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A37261B2A;
 Wed, 29 May 2019 05:57:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 May 2019 05:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=U
 v/IO1lpsMhYefZCZE7IzUSu7PAH6TRG1LbnuRgviM4=; b=mn/7Y1LZeF5WEZX9C
 kyxZtrcWF3ULGfrAWaVTCu5SVtlugVE3VqZmjWKq6xRLw16HfohMo8gWCyfoiTDU
 8ddDr3hcah8IDP6Hys4o8IC2EdotB5aWhP8EraoIMIJh7rSxM+BKMMZLl9NkVZnK
 u8d8d3Tq/d+bMYPb6BDrLZqiB9tpWxyCpNDdk+W8+YDBdrWfUs98RZG9TU53K7Dz
 JzBTbjFIf3kdd64Cj3KvVjOeVIk0m+zXZwZfm3VO+qvQIqvJ5VIncx8ff7FI9cB1
 yNg71nTx/SLC0V1NRLStXOGxLLLNq2SftFdwZcoJwvxVzm0f9yJ9xJHcvbMQXOqS
 f9JWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Uv/IO1lpsMhYefZCZE7IzUSu7PAH6TRG1LbnuRgvi
 M4=; b=XISi7eb0l5udJyx94Grx8xbNBu9uDmTspw9Ab8MZI6lurhPep2RI+RxCG
 ZQTte0gx97SzC5lbqL/OsmzePdtwqlKhCnCKwx+J0wQH/g8awSkdq4a1owukWtLA
 pSl7na4swI9Jn5vGwVD9JNDTU+FqQo7zHiwOYrXVPzhmvKU0bhF2leedTKJqnsWJ
 ZtZ3NyH7sqtqulHulH6p8cFT/inzGk9BoRibxUJQCqYn7HfABDtSJ4wgJtcE93Dn
 ubSwIKAl5IYPjRHsfy/9y3A9uQnHlGjBxilfoFBwIobYLPZxf0MeJIy/dpZ66Cd6
 VespO6do/dcNZaF/vdhqkw+ACdFLw==
X-ME-Sender: <xms:k1fuXLxZbQcc-ANNiTUK7UBI2sL_vR5WZupSdrUc2A253Dtx8L_3pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvjedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefvrghk
 rghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
 drjhhpqeenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhho
 mhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:k1fuXDqJLSpSTXkTZTciZs27YxisYeoGB6fGIVbV6inmjPgmkZdzug>
 <xmx:k1fuXDzlPHfLKSKrwsKOVVoZfcm6NUzgWaAMmPe5QrZQEgSnVBAz3g>
 <xmx:k1fuXCurnFtFsjwzcDFGDUTFxiwmFbRMHUebTfAZecsGB5BQqUsLjQ>
 <xmx:lVfuXHp1xBd2evfpTHfjZBexRzt3oLWMlb8KBbQqAvRZxYLnnEZERg>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59261380084;
 Wed, 29 May 2019 05:57:34 -0400 (EDT)
Date: Wed, 29 May 2019 18:57:31 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/5] ALSA: fireface: Use ULL suffixes for 64-bit constants
Message-ID: <20190529095730.GA7089@workstation>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Igor Konopko <igor.j.konopko@intel.com>,
 David Howells <dhowells@redhat.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Eran Ben Elisha <eranbe@mellanox.com>,
 Matias Bjorling <mb@lightnvm.io>, Jiri Pirko <jiri@mellanox.com>,
 "David S . Miller" <davem@davemloft.net>,
 Jamal Hadi Salim <jhs@mojatatu.com>,
 Cong Wang <xiyou.wangcong@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-block@vger.kernel.org, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-5-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528142424.19626-5-geert@linux-m68k.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_025748_469678_62D51536 
X-CRM114-Status: GOOD (  11.50  )
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [66.111.4.229 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Mailman-Approved-At: Wed, 29 May 2019 06:52:19 -0700
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
 Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>,
 Jamal Hadi Salim <jhs@mojatatu.com>, "David S . Miller" <davem@davemloft.net>,
 David Howells <dhowells@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Jaroslav Kysela <perex@perex.cz>,
 Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

SGksCgpPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNDoyNDoyM1BNICswMjAwLCBHZWVydCBVeXR0
ZXJob2V2ZW4gd3JvdGU6Cj4gV2l0aCBnY2MgNC4xOgo+IAo+ICAgICBzb3VuZC9maXJld2lyZS9m
aXJlZmFjZS9mZi1wcm90b2NvbC1sYXR0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbGF0dGVyX3N3aXRj
aF9mZXRjaGluZ19tb2Rl4oCZOgo+ICAgICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90
b2NvbC1sYXR0ZXIuYzo5Nzogd2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2Ug
Zm9yIOKAmGxvbmfigJkgdHlwZQo+ICAgICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90
b2NvbC1sYXR0ZXIuYzogSW4gZnVuY3Rpb24g4oCYbGF0dGVyX2JlZ2luX3Nlc3Npb27igJk6Cj4g
ICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jOjE3MDogd2Fy
bmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQo+
ICAgICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90b2NvbC1sYXR0ZXIuYzoxOTc6IHdh
cm5pbmc6IGludGVnZXIgY29uc3RhbnQgaXMgdG9vIGxhcmdlIGZvciDigJhsb25n4oCZIHR5cGUK
PiAgICAgc291bmQvZmlyZXdpcmUvZmlyZWZhY2UvZmYtcHJvdG9jb2wtbGF0dGVyLmM6MjA1OiB3
YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBl
Cj4gICAgIHNvdW5kL2ZpcmV3aXJlL2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jOiBJbiBm
dW5jdGlvbiDigJhsYXR0ZXJfZmluaXNoX3Nlc3Npb27igJk6Cj4gICAgIHNvdW5kL2ZpcmV3aXJl
L2ZpcmVmYWNlL2ZmLXByb3RvY29sLWxhdHRlci5jOjIxNDogd2FybmluZzogaW50ZWdlciBjb25z
dGFudCBpcyB0b28gbGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQo+IAo+IEZpeCB0aGlzIGJ5IGFk
ZGluZyB0aGUgbWlzc2luZyAiVUxMIiBzdWZmaXhlcy4KPiBBZGQgdGhlIHNhbWUgc3VmZml4IHRv
IHRoZSBsYXN0IGNvbnN0YW50LCB0byBtYWludGFpbiBjb25zaXN0ZW5jeS4KPiAKPiBGaXhlczog
ZmQxY2M5ZGU2NGMyY2E2YyAoIkFMU0E6IGZpcmVmYWNlOiBhZGQgc3VwcG9ydCBmb3IgRmlyZWZh
Y2UgVUNYIikKPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPgo+IC0tLQo+ICBzb3VuZC9maXJld2lyZS9maXJlZmFjZS9mZi1wcm90b2NvbC1s
YXR0ZXIuYyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKClRoYW5rcyBmb3IgeW91ciBjYXJlLgoKUmV2aWV3ZWQtYnk6IFRh
a2FzaGkgU2FrYW1vdG8gPG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPgoKPiBkaWZmIC0tZ2l0IGEv
c291bmQvZmlyZXdpcmUvZmlyZWZhY2UvZmYtcHJvdG9jb2wtbGF0dGVyLmMgYi9zb3VuZC9maXJl
d2lyZS9maXJlZmFjZS9mZi1wcm90b2NvbC1sYXR0ZXIuYwo+IGluZGV4IGM4MjM2ZmY4OWI3ZmI5
ZGUuLmIzMGQwMmQzNTliMWQyMWIgMTAwNjQ0Cj4gLS0tIGEvc291bmQvZmlyZXdpcmUvZmlyZWZh
Y2UvZmYtcHJvdG9jb2wtbGF0dGVyLmMKPiArKysgYi9zb3VuZC9maXJld2lyZS9maXJlZmFjZS9m
Zi1wcm90b2NvbC1sYXR0ZXIuYwo+IEBAIC05LDExICs5LDExIEBACj4gIAo+ICAjaW5jbHVkZSAi
ZmYuaCIKPiAgCj4gLSNkZWZpbmUgTEFUVEVSX1NURgkJMHhmZmZmMDAwMDAwMDQKPiAtI2RlZmlu
ZSBMQVRURVJfSVNPQ19DSEFOTkVMUwkweGZmZmYwMDAwMDAwOAo+IC0jZGVmaW5lIExBVFRFUl9J
U09DX1NUQVJUCTB4ZmZmZjAwMDAwMDBjCj4gLSNkZWZpbmUgTEFUVEVSX0ZFVENIX01PREUJMHhm
ZmZmMDAwMDAwMTAKPiAtI2RlZmluZSBMQVRURVJfU1lOQ19TVEFUVVMJMHgwMDAwODAxYzAwMDAK
PiArI2RlZmluZSBMQVRURVJfU1RGCQkweGZmZmYwMDAwMDAwNFVMTAo+ICsjZGVmaW5lIExBVFRF
Ul9JU09DX0NIQU5ORUxTCTB4ZmZmZjAwMDAwMDA4VUxMCj4gKyNkZWZpbmUgTEFUVEVSX0lTT0Nf
U1RBUlQJMHhmZmZmMDAwMDAwMGNVTEwKPiArI2RlZmluZSBMQVRURVJfRkVUQ0hfTU9ERQkweGZm
ZmYwMDAwMDAxMFVMTAo+ICsjZGVmaW5lIExBVFRFUl9TWU5DX1NUQVRVUwkweDAwMDA4MDFjMDAw
MFVMTAo+ICAKPiAgc3RhdGljIGludCBwYXJzZV9jbG9ja19iaXRzKHUzMiBkYXRhLCB1bnNpZ25l
ZCBpbnQgKnJhdGUsCj4gIAkJCSAgICBlbnVtIHNuZF9mZl9jbG9ja19zcmMgKnNyYykKPiAtLSAK
PiAyLjE3LjEKPiAKCgpSZWdhcmRzCgpUYWthc2hpIFNha2Ftb3RvCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYWZzCg==
