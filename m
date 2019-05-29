Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BDB2DEEA
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 15:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7U9DSan5euYcGnMdQQy8XSqs+hnTYMOCk2qotj03ZGY=; b=ZqwuEfb4Mj/hjG
	bCCPrmcuPPy2m5RBmy3LUt0YwqKTyz7lhWvBCMEGQRoGr01/s925uCGCQqH262h4Sk5NnrEldcUjq
	+9naFw56bygqdtkoKlj9b/9CopIY3a84pR+5BmZc7zHg9smMUFvTiKT/rAIKlaT+GjJMdtTLZFsPJ
	ejHs0ngmsFhZyhjY7g94rDYqJ52krskPiGYiuVFoWYm95bjrdq21cv3z0nhJHnVkr9P86Fez/j9tF
	6sEixQkdGob+xxCzr4TgB320mU5O5qJLGuLGpC9FzyNWyRZYvUxh6Oo3MkS3oJgqc94uMvL8fcJMZ
	Gu+lDXDmU0tbdH+gND0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVz0A-0006FR-GR; Wed, 29 May 2019 13:52:22 +0000
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVx5u-00085e-Fw
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 11:50:12 +0000
Received: by mail-qk1-f193.google.com with SMTP id c70so1179669qkg.7
 for <linux-afs@lists.infradead.org>; Wed, 29 May 2019 04:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XHkHtWbVB+TvovZz7oPuGTHVIANZlI/EFu3bjVNoQjY=;
 b=toMTo/aw5zhoSQmpHNUTcqgUWuhOa77r6ozF+hzid3hDqdhy6cf/jouxWE13iKvVlz
 3dUGrPF6dDSzXV2j7+beTtIN/tAPi1w8IQlyMh4ENVqJJyWTplboDZ7G57rkldJrzEPg
 8/em4CwwrvhQObdvxugusuvnAdbFLc0TUcQixlYO4LY/BVqgotxVBKNalrv/wE3NJmbP
 Ce1kh9n4NvXdi+3OrNqIU47f+mCJ5IN3GSb8gXvs4j6NxWtP7gataioAmG6pGOayIlRG
 G5XaRTXk7H5uo0ZryiOn/+PWLB+ot2nLbXDEeTnGJ8+FJF6PATopzZpYCHzvmiwgmIz9
 aOng==
X-Gm-Message-State: APjAAAWpFWqvLiMh3zlZMgoC5DvqP5cv1u9OFGz1jAR2lm1kSIK1+qKl
 9jWbkFQ76gxux1TPD9CVfbsAwjnHrE93gh25J9c=
X-Google-Smtp-Source: APXvYqwIv+NsvZQNU3e96RUtDw8gxMBWuYuQiiajDZ8QFDNiZsSZdie+JkLoe/OtQ843s/6drkk2QB+tL4D41jq4Vho=
X-Received: by 2002:a37:bb85:: with SMTP id
 l127mr27919584qkf.285.1559130609026; 
 Wed, 29 May 2019 04:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-3-geert@linux-m68k.org>
In-Reply-To: <20190528142424.19626-3-geert@linux-m68k.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 May 2019 13:49:52 +0200
Message-ID: <CAK8P3a1wTED5Aet_9AjY9VFFrutkV2xK6C13vroTLd0vpcoo9w@mail.gmail.com>
Subject: Re: [PATCH 2/5] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_045010_536574_B7D256BA 
X-CRM114-Status: GOOD (  19.29  )
X-Spam-Score: -0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.193 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (arndbergmann[at]gmail.com)
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
Cc: linux-block <linux-block@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Networking <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>,
 Jamal Hadi Salim <jhs@mojatatu.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 David Howells <dhowells@redhat.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNDoyNCBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IFdpdGggZ2NjIDQuMToKPgo+ICAgICBuZXQvcnhy
cGMvb3V0cHV0LmM6IEluIGZ1bmN0aW9uIOKAmHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXTigJk6Cj4g
ICAgIG5ldC9yeHJwYy9vdXRwdXQuYzozMzg6IHdhcm5pbmc6IOKAmHJldOKAmSBtYXkgYmUgdXNl
ZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24KPgo+IEluZGVlZCwgaWYgdGhlIGZpcnN0
IGp1bXAgdG8gdGhlIHNlbmRfZnJhZ21lbnRhYmxlIGxhYmVsIGlzIG1hZGUsIGFuZAo+IHRoZSBh
ZGRyZXNzIGZhbWlseSBpcyBub3QgaGFuZGxlZCBpbiB0aGUgc3dpdGNoKCkgc3RhdGVtZW50LCBy
ZXQgd2lsbCBiZQo+IHVzZWQgdW5pbml0aWFsaXplZC4KPgo+IEZpeCB0aGlzIGJ5IGluaXRpYWxp
emluZyBlcnIgdG8gemVybyBiZWZvcmUgdGhlIGp1bXAsIGxpa2UgaXMgYWxyZWFkeQo+IGRvbmUg
Zm9yIHRoZSBqdW1wIHRvIHRoZSBkb25lIGxhYmVsLgo+Cj4gRml4ZXM6IDVhOTI0Yjg5NTFmODM1
YjUgKCJyeHJwYzogRG9uJ3Qgc3RvcmUgdGhlIHJ4cnBjIGhlYWRlciBpbiB0aGUgVHggcXVldWUg
c2tfYnVmZnMiKQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+Cj4gLS0tCj4gV2hpbGUgdGhpcyBpcyBub3QgYSByZWFsIGZhbHNlLXBvc2l0
aXZlLCBJIGJlbGlldmUgaXQgY2Fubm90IGNhdXNlIGhhcm0KPiBpbiBwcmFjdGljZSwgYXMgQUZf
UlhSUEMgY2Fubm90IGJlIHVzZWQgd2l0aCBvdGhlciB0cmFuc3BvcnQgZmFtaWxpZXMKPiB0aGFu
IElQdjQgYW5kIElQdjYuCgpUaGlzIGxvb2tzIGxpa2UgYSB2YXJpYW50IG9mIHRoZSBpbmZhbW91
cyBidWcKaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTg1MDEK
CldoYXQgSSBkb24ndCB1bmRlcnN0YW5kIGlzIHdoeSBjbGFuZyBmYWlscyB0byB3YXJuIGFib3V0
IGl0IHdpdGgKLVdzb21ldGltZXMtdW5pbml0aWFsaXplZC4KKGNjIGNsYW5nLWJ1aWx0LWxpbnV4
IG1haWxpbmcgbGlzdCkuCgogICAgICBBcm5kCgo+ICBuZXQvcnhycGMvb3V0cHV0LmMgfCA0ICsr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL25ldC9yeHJwYy9vdXRwdXQuYyBiL25ldC9yeHJwYy9vdXRwdXQuYwo+IGlu
ZGV4IDAwNGM3NjJjMmU4ZDA2M2MuLjE0NzNkNzc0ZDY3MTAwYzUgMTAwNjQ0Cj4gLS0tIGEvbmV0
L3J4cnBjL291dHB1dC5jCj4gKysrIGIvbmV0L3J4cnBjL291dHB1dC5jCj4gQEAgLTQwMyw4ICs0
MDMsMTAgQEAgaW50IHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXQoc3RydWN0IHJ4cnBjX2NhbGwgKmNh
bGwsIHN0cnVjdCBza19idWZmICpza2IsCj4KPiAgICAgICAgIC8qIHNlbmQgdGhlIHBhY2tldCB3
aXRoIHRoZSBkb24ndCBmcmFnbWVudCBiaXQgc2V0IGlmIHdlIGN1cnJlbnRseQo+ICAgICAgICAg
ICogdGhpbmsgaXQncyBzbWFsbCBlbm91Z2ggKi8KPiAtICAgICAgIGlmIChpb3ZbMV0uaW92X2xl
biA+PSBjYWxsLT5wZWVyLT5tYXhkYXRhKQo+ICsgICAgICAgaWYgKGlvdlsxXS5pb3ZfbGVuID49
IGNhbGwtPnBlZXItPm1heGRhdGEpIHsKPiArICAgICAgICAgICAgICAgcmV0ID0gMDsKPiAgICAg
ICAgICAgICAgICAgZ290byBzZW5kX2ZyYWdtZW50YWJsZTsKPiArICAgICAgIH0KPgo+ICAgICAg
ICAgZG93bl9yZWFkKCZjb25uLT5wYXJhbXMubG9jYWwtPmRlZnJhZ19zZW0pOwo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YWZzCg==
