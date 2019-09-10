Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A21AEAE622
	for <lists+linux-afs@lfdr.de>; Tue, 10 Sep 2019 10:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pekyT8xzYwoLtJMm6JgPcwkCvRcMSp/CaB7NBxAT4QM=; b=msPWkdRO6oM5/j
	voziBp5U7F6RBEGQXgoGHc0CjAp6LfkxRn3PTIG8OF9z3QCjhIMckONgUu95i2W+3byFnag+Mjh3P
	zZ3aIBEsaie9RGSotZL3gV/86ZEgCBfb82c3uTPSvhcgFfHEqaiITz7rs4ysjtPWirOsbTZZOJaMJ
	IhwcJ5ueeovwCFWvq7wVcYqcyRR+SPyxM2osCblG7gWiHLuY3Knw59M0EtIB4DAELVK/6931nj25b
	et35clU5UAqIyQiVkl4YyJ1VHW+GDhfLMRA372JrULW+3VaaLrEqzGoHinzxleND2deqUkYZyViUH
	xKMP8l3neWQ5CqSjm+nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7byl-0000TJ-T7; Tue, 10 Sep 2019 08:58:28 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7byi-0000ST-1s
 for linux-afs@lists.infradead.org; Tue, 10 Sep 2019 08:58:26 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C23715C5;
 Tue, 10 Sep 2019 04:58:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 10 Sep 2019 04:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=N
 wXi/oe0IydEdExqK0+dznaH54PXUdT25LQcXIyjYQk=; b=DoVNlvF2zaTqjn8aU
 /Qr2nxkdAPJ49iWGvvMhQe0phIOLAJw36qs5McE01Kdg+he3Pk//tWJUupGUjKEO
 OvqDQ8FaV8JjM8Ea8Axh083ZYjTLO1kqo4Ott+/fDCJE0TBD0MSPQHfHbVOAPpsk
 YdsHZLBSf/lo2DsTmb+oKFIaeeR6k1OqQh+RETAg8UZQawfW6W4R91qODEGv8wPF
 CABJNaMbU4bl93qb6/0A/PaLu8dnPQA4NItZ+AK9hO3sgl3Wfr02Nog8//UHEdNh
 EoPYNNAlSWcJW5L467ZxHaj0KgGQUDws8PFN0A9vnxZzzPBU+7uqgirPHY9HjCk7
 x+M/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=NwXi/oe0IydEdExqK0+dznaH54PXUdT25LQcXIyjY
 Qk=; b=SbyPuNZqTDqQaGGKp3vFlT/U460sMpUHXJMyb5qDSkJZvWWOBHV+YeX5n
 m7sAuQxMB75WOY4q4UgzTSbn57b8rdRO7s2C3xKs/avs4N/qNI/CF+RBlx+JU+pi
 LGqjmqJnbZUNK1tT5oODMrPHqgCX4UwhziyW+hU5dHRt3BVbTykWCyVIQ2uaO6Ml
 3K/AXarOeHbsvgYnxUferuFeZ5c7ujTMf5+erjPYASfUoLCohKYK3bYnyGyP7MuX
 gtzgl4BZepImZVDuTAu2SGY8ypdbhb86FE4ErSmx9qUXepmynQjsRLeaBuTLEnMu
 qukTe8vr1mlMfBUBZy3/nYiEFPHZA==
X-ME-Sender: <xms:pGV3XUBLT97HoZfsDuzdE0lB8W-oNuPH5YOOJcg5LFDqvwvWYUL6yg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudekkedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefirhgv
 ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinheptghkihdqph
 hrohhjvggtthdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvudefrdeftddrkedr
 uddutdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmne
 cuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:pGV3Xax_g2W__zRRjkWxRwB4r5cScCxm_7OCCwneCfSQVwndVSIl8Q>
 <xmx:pGV3XSnR7Pm4QRV5D7zhskDuyCyfQwzDAg7g1mXcfM4JxsiTdGQJXQ>
 <xmx:pGV3XfHtipx2KlGKN8Eb3pOjUcSzudJqSAxA-htpUYlkl5iqmunxmw>
 <xmx:pWV3XZyuM7kSI2J8Jko8hUDIQC6SFpnXt-6kfUfrjUhWiS4K5iAV3A>
Received: from localhost (110.8.30.213.rev.vodafone.pt [213.30.8.110])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5260B8005A;
 Tue, 10 Sep 2019 04:58:12 -0400 (EDT)
Date: Tue, 10 Sep 2019 09:58:10 +0100
From: Greg KH <greg@kroah.com>
To: Hangbin Liu <haliu@redhat.com>
Subject: Re: =?utf-8?B?4p2MIEZBSUw=?= =?utf-8?Q?=3A?= Stable queue: queue-5.2
Message-ID: <20190910085810.GA3593@kroah.com>
References: <cki.77A5953448.UY7ROQ6BKT@redhat.com>
 <20190910081956.GG22496@dhcp-12-139.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910081956.GG22496@dhcp-12-139.nay.redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_015824_139023_EFD15648 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [64.147.123.24 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: netdev@vger.kernel.org, Linux Stable maillist <stable@vger.kernel.org>,
 linux-afs@lists.infradead.org, David Howells <dhowells@redhat.com>,
 CKI Project <cki-project@redhat.com>, Xiumei Mu <xmu@redhat.com>,
 Jan Stancek <jstancek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDQ6MTk6NTZQTSArMDgwMCwgSGFuZ2JpbiBMaXUgd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDg6MzY6MTRBTSAtMDQwMCwgQ0tJIFByb2pl
Y3Qgd3JvdGU6Cj4gPiAKPiA+IEhlbGxvLAo+ID4gCj4gPiBXZSByYW4gYXV0b21hdGVkIHRlc3Rz
IG9uIGEgcGF0Y2hzZXQgdGhhdCB3YXMgcHJvcG9zZWQgZm9yIG1lcmdpbmcgaW50byB0aGlzCj4g
PiBrZXJuZWwgdHJlZS4gVGhlIHBhdGNoZXMgd2VyZSBhcHBsaWVkIHRvOgo+ID4gCj4gPiAgICAg
ICAgS2VybmVsIHJlcG86IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3N0YWJsZS9saW51eC5naXQKPiA+ICAgICAgICAgICAgIENvbW1pdDogZjdkNWIzZGM0
NzkyIC0gTGludXggNS4yLjEwCj4gPiAKPiA+IFRoZSByZXN1bHRzIG9mIHRoZXNlIGF1dG9tYXRl
ZCB0ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCj4gPiAKPiA+ICAgICBPdmVyYWxsIHJlc3VsdDog
RkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiA+ICAgICAgICAgICAgICBNZXJnZTogT0sKPiA+
ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiA+ICAgICAgICAgICAgICBUZXN0czogRkFJTEVECj4g
PiAKPiA+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxlcywgYW5kIGxvZ3MgYXJlIGF2
YWlsYWJsZSBmb3IgZG93bmxvYWQgaGVyZToKPiA+IAo+ID4gICBodHRwczovL2FydGlmYWN0cy5j
a2ktcHJvamVjdC5vcmcvcGlwZWxpbmVzLzEyODUxOQo+ID4gCj4gPiAKPiA+IAo+ID4gT25lIG9y
IG1vcmUga2VybmVsIHRlc3RzIGZhaWxlZDoKPiA+IAo+ID4gICB4ODZfNjQ6Cj4gPiAgICAg4p2M
IE5ldHdvcmtpbmcgc29ja2V0OiBmdXp6Cj4gCj4gU29ycnksIG1heWJlIHRoZSBpbmZvIGlzIGEg
bGl0dGxlIGxhdGUsIEkganVzdCBmb3VuZCB0aGUgY2FsbCB0cmFjZXMgZm9yIHRoaXMKPiBmYWls
dXJlLgoKQW5kIHRoaXMgaXMgbm8gbG9uZ2VyIGZhaWxpbmc/CgpXaGF0IGlzIHRoZSAiZnV6eiIg
dGVzdD8KCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYWZzCg==
