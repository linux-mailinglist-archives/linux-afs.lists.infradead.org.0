Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF72DEE9
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 15:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjzzjPsNeyMmsPUky8mnBiycjlp8+HuGnEisx7DquLQ=; b=hr897nnQs6SVhT
	BmVSJebeQb43Zwsxx/JbK+WNP9MrGlGZAp9+hgz0lBdIBSi1WpUV4SHj+OiZwBXtmlIn6nhE1sjig
	vBkdbIFMMaB23HDoESLXKoxYt0cOWb4N/FyAGlafx9lCWVLadMG0RMLOky+TkJKEHE9+BUsxaK2Ao
	cjp2gsmxPl5hw0SaA31ahYfM4I37yaJkq2wF3WDv9TKEV+OW+CdIppphZ3k7tOd57NhCfZlGH5hhC
	ak4kNb/5rCrHhtknSwTppAYk657VHZiH9A2Y/m0oLHI75oD+PTpp4sr0Wt+P5aTmSBTGFYEsQi25x
	u4x1pDN60wpQG3piN+5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVz09-0006Dg-4y; Wed, 29 May 2019 13:52:21 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVthl-00042I-6B
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 08:13:03 +0000
Received: by mail-lj1-f195.google.com with SMTP id o13so1509823lji.5
 for <linux-afs@lists.infradead.org>; Wed, 29 May 2019 01:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a0don3TTA7MOPbrbjinj58BbWNizus2TjnpcpEnZ6h0=;
 b=Ki88xMmAVjQi4cvlYLCoJ/pxmWifkAQzcBps4ZaquabldhrD8K4UuvOg3y6jMjwUKI
 a0t2pS9mJNdCIEJst8n7QiQqbUA68mkywjgYBBsWYqNq1JEHRMab415CKhIqk336micu
 CWnzVlZbMXQnw9Xef+9j2nPePN0shjHvWpg8KgA9V7jJYZ3mtpmhqQ5Nt0zYL18enf4v
 HO9EV9vt7pz3gK7X/m5jnxjpLuM1bkQsr7nXpmLwsyMfavbua1oU8+wl4+EYi7eIA146
 Zq29tiRiG0q4aOdLF0+0MvhJm6QfaR+O4mrhGDLOM07ubOqTKGWH/AaDgN/9g6qcCU82
 d6cA==
X-Gm-Message-State: APjAAAVvy6A+rBWJZ6mpXE3MmPcO4OICMZmtll9PaW06xjUwabX+S9jd
 FJPV4y4Xo/WpWtyMrG4mJOHG6e0HShIRDu4JKa0=
X-Google-Smtp-Source: APXvYqz+i9F0zk6NyMyWBavDhJq5T11k3LBK2MrgZ55YQ542TgvrWEs81N68J92wCzTKGRLDj79yXuvelmq9XTmatnU=
X-Received: by 2002:a05:651c:150:: with SMTP id
 c16mr67589499ljd.65.1559117578478; 
 Wed, 29 May 2019 01:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-2-geert@linux-m68k.org>
 <4b666e32-04b6-228a-691d-0745fa48a57f@lightnvm.io>
In-Reply-To: <4b666e32-04b6-228a-691d-0745fa48a57f@lightnvm.io>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2019 10:12:45 +0200
Message-ID: <CAMuHMdVtM9NWSXbWE=XKOt3fiQdjWaDvLiYdXbbri-buDn7jpg@mail.gmail.com>
Subject: Re: [PATCH 1/5] lightnvm: Fix uninitialized pointer in
 nvm_remove_tgt()
To: =?UTF-8?Q?Matias_Bj=C3=B8rling?= <mb@lightnvm.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_011301_230332_D32FDCEE 
X-CRM114-Status: GOOD (  17.72  )
X-Spam-Score: -0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.195 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (geert.uytterhoeven[at]gmail.com)
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
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
Cc: linux-block@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 David Howells <dhowells@redhat.com>, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Jaroslav Kysela <perex@perex.cz>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

SGkgTWF0aWFzLAoKT24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTA6MDggQU0gTWF0aWFzIEJqw7hy
bGluZyA8bWJAbGlnaHRudm0uaW8+IHdyb3RlOgo+IE9uIDUvMjgvMTkgNDoyNCBQTSwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gV2l0aCBnY2MgNC4xOgo+ID4KPiA+ICAgICAgZHJpdmVy
cy9saWdodG52bS9jb3JlLmM6IEluIGZ1bmN0aW9uIOKAmG52bV9yZW1vdmVfdGd04oCZOgo+ID4g
ICAgICBkcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYzo1MTA6IHdhcm5pbmc6IOKAmHTigJkgaXMgdXNl
ZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24KPiA+Cj4gPiBJbmRlZWQsIGlmIG5vIE5W
TSBkZXZpY2VzIGhhdmUgYmVlbiByZWdpc3RlcmVkLCB0IHdpbGwgYmUgYW4KPiA+IHVuaW5pdGlh
bGl6ZWQgcG9pbnRlciwgYW5kIG1heSBiZSBkZXJlZmVyZW5jZWQgbGF0ZXIuICBBIGNhbGwgdG8K
PiA+IG52bV9yZW1vdmVfdGd0KCkgY2FuIGJlIHRyaWdnZXJlZCBmcm9tIHVzZXJzcGFjZSBieSBp
c3N1aW5nIHRoZQo+ID4gTlZNX0RFVl9SRU1PVkUgaW9jdGwgb24gdGhlIGxpZ2h0bnZtIGNvbnRy
b2wgZGV2aWNlLgo+ID4KPiA+IEZpeCB0aGlzIGJ5IHByZWluaXRpYWxpemluZyB0IHRvIE5VTEwu
Cj4gPgo+ID4gRml4ZXM6IDg0M2YyZWRiZGRlMDg1YjQgKCJsaWdodG52bTogZG8gbm90IHJlbW92
ZSBpbnN0YW5jZSB1bmRlciBnbG9iYWwgbG9jayIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
bGlnaHRudm0vY29yZS5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9saWdodG52bS9j
b3JlLmMgYi9kcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYwo+ID4gaW5kZXggMGRmNzQ1NDgzMmVmZTA4
Mi4uYWEwMTdmNDhlYjhjNTg4YyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbGlnaHRudm0vY29y
ZS5jCj4gPiArKysgYi9kcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYwo+ID4gQEAgLTQ5Miw3ICs0OTIs
NyBAQCBzdGF0aWMgdm9pZCBfX252bV9yZW1vdmVfdGFyZ2V0KHN0cnVjdCBudm1fdGFyZ2V0ICp0
LCBib29sIGdyYWNlZnVsKQo+ID4gICAgKi8KPiA+ICAgc3RhdGljIGludCBudm1fcmVtb3ZlX3Rn
dChzdHJ1Y3QgbnZtX2lvY3RsX3JlbW92ZSAqcmVtb3ZlKQo+ID4gICB7Cj4gPiAtICAgICBzdHJ1
Y3QgbnZtX3RhcmdldCAqdDsKPiA+ICsgICAgIHN0cnVjdCBudm1fdGFyZ2V0ICp0ID0gTlVMTDsK
PiA+ICAgICAgIHN0cnVjdCBudm1fZGV2ICpkZXY7Cj4gPgo+ID4gICAgICAgZG93bl9yZWFkKCZu
dm1fbG9jayk7Cj4gPgo+Cj4gVGhhbmtzIEdlZXJ0LiBXb3VsZCB5b3UgbGlrZSBtZSB0byBjYXJy
eSB0aGUgcGF0Y2g/CgpZZXMgcGxlYXNlLiBUaGFua3MhCgpHcntvZXRqZSxlZXRpbmd9cywKCiAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoK
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
