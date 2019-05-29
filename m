Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DA45E2DEEC
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 15:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ltAHtwmSpBxoTV4Lg4bNyLkejWSt2E3uvIEdMunetwM=; b=ZjDhoM6gM72mbRqqGdCIJoVkS
	oxplVs8bTCFw81WT5b2evGSKaO+a4oMw6dleBsHi2UQwU0bIWy9MrliiH/DykGK+GPMeItKPvrrCR
	lkzrsMYpwVDGrKACgL5KuAooCVGn4ETnOzXSc+hQrKkZglZvt0Dkn8CAPWw1rQzK0uMTlDuOnah/q
	FN3XS6rFjp9Ay1IjBWSWkBxCbi+vW7LVfZqRz7THmq31DZT3e398k2fke2IhhHM0xmcsGEMwObw0c
	DyHcftOsxpi8oJrV2ow66W/yONS5F13UGE/zk/4APpkjiXo0+KslCpW/P0ziWITKUvK8vUP+H39h+
	pdjQhw81w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVz08-0006DR-V1; Wed, 29 May 2019 13:52:20 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVtdN-0002Sn-UH
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 08:08:32 +0000
Received: by mail-ed1-x543.google.com with SMTP id b8so2286448edm.11
 for <linux-afs@lists.infradead.org>; Wed, 29 May 2019 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X55S31ao8CfYMehdctXfzJQFFMsU0ZFkppGUTIESvkI=;
 b=DvHdwxZbhyi3JQ17yrFCBVFILG9oxWRqQorXQBbfNMQbnN8YbiVPExbIjs05xuS6s4
 RrvSJHQYAs3QQ+qJk+dZfwVfVVvY+qXkg81SmYNRsZBDBf08Yof2IdKKDkQz21dEy6vm
 L+WXv2nKXsarLezipgqpzLvOPptiHdm7b5gV8jZKlwcVrkXmwf20nNW8i2JmlutHBAn5
 eSQfFQ+Fbv51uy1DIA3WxzijQ4vpMgbugqlk4yAec5p5VRJU8RtVGQRKfcpotEOKIY0d
 k9rsY0qQqW+3hNX/G+FgxYjVDC/mO884jyhyXyIXfMA9+5aUwTsqTA98ncrDK344QAuw
 7mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X55S31ao8CfYMehdctXfzJQFFMsU0ZFkppGUTIESvkI=;
 b=DslT1dPdRdmWfKzNqhv/K1h+HXl9kRWkovVImHV+iMP/QgyGDSP38nE83VlDM6SlZQ
 eIsCU3zcZz+XqjOZOcF1cirU8Nk/kVBrAWRY+kMgdIVaEVPakbYzhMA/Hdk0xn6gsByE
 kXzbfiiU8VFCWQWX4lon5K6AullijcSnOJ0RxaR3WzkQy7YrnZKrIvInbB8pCShRH2pJ
 PprEQg1sLA7A6bghG6dlnruLZSJ+gx/SZ75U0oYNrbMGKwdzUXbmpCIExB8rI3R/uaJb
 BkYWimQnqXPAl0Eea8ps6Qh6imSsuGPR026Z+uHGvH1Up0RRk+GqY47vwcnyeMPBYRIu
 IK1w==
X-Gm-Message-State: APjAAAXmlQDry9WGkhuvxxCsjSJkKKmDB/oY89Oh0OMGGiFrd9CbD+/U
 VIlyj6zwl0T05DTmMTdC2XloDg==
X-Google-Smtp-Source: APXvYqyxDyVCDea9bDd1l2EC8hcbEtDWlZ8Dk3yuHbGVJvqjuySoL1bR38CeVbp+JazIYUXhPBHnlQ==
X-Received: by 2002:a17:906:6d3:: with SMTP id
 v19mr69214570ejb.46.1559117307851; 
 Wed, 29 May 2019 01:08:27 -0700 (PDT)
Received: from [192.168.0.36] (2-111-91-225-cable.dk.customer.tdc.net.
 [2.111.91.225])
 by smtp.googlemail.com with ESMTPSA id p18sm792916ejr.61.2019.05.29.01.08.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 01:08:27 -0700 (PDT)
Subject: Re: [PATCH 1/5] lightnvm: Fix uninitialized pointer in
 nvm_remove_tgt()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Igor Konopko <igor.j.konopko@intel.com>, David Howells
 <dhowells@redhat.com>, "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Eran Ben Elisha <eranbe@mellanox.com>, Jiri Pirko <jiri@mellanox.com>,
 "David S . Miller" <davem@davemloft.net>, Jamal Hadi Salim
 <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-2-geert@linux-m68k.org>
From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>
Message-ID: <4b666e32-04b6-228a-691d-0745fa48a57f@lightnvm.io>
Date: Wed, 29 May 2019 10:08:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190528142424.19626-2-geert@linux-m68k.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_010830_119572_299E5437 
X-CRM114-Status: GOOD (  19.22  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:543 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: linux-block@vger.kernel.org, netdev@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gNS8yOC8xOSA0OjI0IFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gV2l0aCBnY2Mg
NC4xOgo+IAo+ICAgICAgZHJpdmVycy9saWdodG52bS9jb3JlLmM6IEluIGZ1bmN0aW9uIOKAmG52
bV9yZW1vdmVfdGd04oCZOgo+ICAgICAgZHJpdmVycy9saWdodG52bS9jb3JlLmM6NTEwOiB3YXJu
aW5nOiDigJh04oCZIGlzIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uCj4gCj4g
SW5kZWVkLCBpZiBubyBOVk0gZGV2aWNlcyBoYXZlIGJlZW4gcmVnaXN0ZXJlZCwgdCB3aWxsIGJl
IGFuCj4gdW5pbml0aWFsaXplZCBwb2ludGVyLCBhbmQgbWF5IGJlIGRlcmVmZXJlbmNlZCBsYXRl
ci4gIEEgY2FsbCB0bwo+IG52bV9yZW1vdmVfdGd0KCkgY2FuIGJlIHRyaWdnZXJlZCBmcm9tIHVz
ZXJzcGFjZSBieSBpc3N1aW5nIHRoZQo+IE5WTV9ERVZfUkVNT1ZFIGlvY3RsIG9uIHRoZSBsaWdo
dG52bSBjb250cm9sIGRldmljZS4KPiAKPiBGaXggdGhpcyBieSBwcmVpbml0aWFsaXppbmcgdCB0
byBOVUxMLgo+IAo+IEZpeGVzOiA4NDNmMmVkYmRkZTA4NWI0ICgibGlnaHRudm06IGRvIG5vdCBy
ZW1vdmUgaW5zdGFuY2UgdW5kZXIgZ2xvYmFsIGxvY2siKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gLS0tCj4gICBkcml2ZXJzL2xp
Z2h0bnZtL2NvcmUuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYyBi
L2RyaXZlcnMvbGlnaHRudm0vY29yZS5jCj4gaW5kZXggMGRmNzQ1NDgzMmVmZTA4Mi4uYWEwMTdm
NDhlYjhjNTg4YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2xpZ2h0bnZtL2NvcmUuYwo+ICsrKyBi
L2RyaXZlcnMvbGlnaHRudm0vY29yZS5jCj4gQEAgLTQ5Miw3ICs0OTIsNyBAQCBzdGF0aWMgdm9p
ZCBfX252bV9yZW1vdmVfdGFyZ2V0KHN0cnVjdCBudm1fdGFyZ2V0ICp0LCBib29sIGdyYWNlZnVs
KQo+ICAgICovCj4gICBzdGF0aWMgaW50IG52bV9yZW1vdmVfdGd0KHN0cnVjdCBudm1faW9jdGxf
cmVtb3ZlICpyZW1vdmUpCj4gICB7Cj4gLQlzdHJ1Y3QgbnZtX3RhcmdldCAqdDsKPiArCXN0cnVj
dCBudm1fdGFyZ2V0ICp0ID0gTlVMTDsKPiAgIAlzdHJ1Y3QgbnZtX2RldiAqZGV2Owo+ICAgCj4g
ICAJZG93bl9yZWFkKCZudm1fbG9jayk7Cj4gCgpUaGFua3MgR2VlcnQuIFdvdWxkIHlvdSBsaWtl
IG1lIHRvIGNhcnJ5IHRoZSBwYXRjaD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
