Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F202DEEF
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 15:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEQzzLdqTHRtVctGugCaefVs2HPTO89bR2N/Q6Q04Jc=; b=EeQQDuJaDsHKOS
	2qDDLL5FZToYqOt74tVnsZtmGSv37HXnsgxM9/e7cWYIS9DDlgwitdSMF4S5Eeq9QmjwYhGepQUYQ
	GgX7mDBjaB4bB5x1luAaCbgpdP1Nbnpp3c8ufe0XoJmfmheuhGArhfYAE63KrLGi12268r61ULEjW
	ifVrK2AeZuSky0yx8ZxTgo0NJpIgTNNMGIx+XYa/gjGGZm3fAA6nsHC03cKev4gjYQthee5Mcvr2+
	iV8QE2ZSPlYBz6PUlGKtKCKuc3O4YCT2BP3siBaEW5nZ9u02kAXqCpD+08dhCB+qTsYzqlfE+DS0h
	K2D4TzUmBvny1hvGacFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVz08-0006DI-NC; Wed, 29 May 2019 13:52:20 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVtZz-0008Sf-HZ
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 08:05:00 +0000
Received: by mail-wm1-x343.google.com with SMTP id v19so3761437wmh.0
 for <linux-afs@lists.infradead.org>; Wed, 29 May 2019 01:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=EBIy8akgJJVzGMeoN5L9X2jn2x1GxoKHTkHoU0+i4ZQ=;
 b=HfhL8wqCiookSl50jiJuT1YB5TlSuMeuNrqU2tWcfEUtEQ/AmjA+cvuYkaVQ4gKcHN
 wSRpxcuZF/NNGH2Y5MLanq3MH+ekyD5LIGY1quGY/RW5R5wx60RM2QX8PBTXSjr2f0LE
 GrSfel5vdtBCsk+50onjqOuy0SlHUJmcYWNmZ+DBqkKeGydvzo7ncC0b4i0ZsrazeUrf
 deHnMa1fNBN0eEKOkh+v4Ss0TZu+V2tywk5KUFTt/qlnJ5I7ACVuMx3DbtH06LlW1z78
 GWgSB5/zjVexZBSTTMUPM0xJTUHJ53ZnuNkmkf6Oq1DG3cc4TV4/F0AGW1Mtw4DTfMaA
 KOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EBIy8akgJJVzGMeoN5L9X2jn2x1GxoKHTkHoU0+i4ZQ=;
 b=AEzgjPzyu9iRw12KBe/AN0W2BUIkN8Lq7waj19ahPuvLWY/lIf5+LPgXzjHAnY15eP
 SbDW03XUPZNPPn7DOPvhBub/Z7lQ7yQPNJh6JUKvA4sCZdTfVlxt5ubl3nKReUxMpmv2
 ojxyNmF2Et2F/D3TVrfStddfVyztdPHaBKvBxwgKrAtl7mZVDMs0iL9dMaFjQ4Ae0e8C
 b3WQqpGPxulN4LZS8K//VVl1jC0bS6DtRWZB4/sNpC9m+KVrl1GbavRXMqkxfmp0kI4B
 2F+6sRVTL8C9kaI+vkZ1Bwe/OefiXUcGcJgwCENzxkJ6+tFGdD7oTCTgNG3whwIqy4Cm
 CXQA==
X-Gm-Message-State: APjAAAXePbBfKcOgJZpGviDcoKDB//CPlwU7onkS8BAiQqaUQeXlcZDZ
 x4RaIDcSDYsLCYZdaVIvSWDAyQ==
X-Google-Smtp-Source: APXvYqxVQa+Y+auwZsalqmIXIrSP2DzX25u2YHdLtGqKGkI2wS47Xd0Zk+TI/HfX1YOt5NBkbVB2tg==
X-Received: by 2002:a7b:c8c1:: with SMTP id f1mr5434256wml.159.1559117094718; 
 Wed, 29 May 2019 01:04:54 -0700 (PDT)
Received: from localhost (ip-89-177-126-215.net.upcbroadband.cz.
 [89.177.126.215])
 by smtp.gmail.com with ESMTPSA id u9sm3165755wme.48.2019.05.29.01.04.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 01:04:53 -0700 (PDT)
Date: Wed, 29 May 2019 10:04:52 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/5] [RFC] devlink: Fix uninitialized error code in
 devlink_fmsg_prepare_skb()
Message-ID: <20190529080452.GE2252@nanopsycho>
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-6-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528142424.19626-6-geert@linux-m68k.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_010459_586110_3D2A9176 
X-CRM114-Status: GOOD (  12.98  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:343 listed in]
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
Cc: linux-block@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
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

VHVlLCBNYXkgMjgsIDIwMTkgYXQgMDQ6MjQ6MjRQTSBDRVNULCBnZWVydEBsaW51eC1tNjhrLm9y
ZyB3cm90ZToKPldpdGggZ2NjIDQuMToKPgo+ICAgIG5ldC9jb3JlL2RldmxpbmsuYzogSW4gZnVu
Y3Rpb24g4oCYZGV2bGlua19mbXNnX3ByZXBhcmVfc2ti4oCZOgo+ICAgIG5ldC9jb3JlL2Rldmxp
bmsuYzo0MzI1OiB3YXJuaW5nOiDigJhlcnLigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBp
biB0aGlzIGZ1bmN0aW9uCj4KPkluZGVlZCwgaWYgdGhlIGxpc3QgaGFzIGxlc3MgdGhhbiAqc3Rh
cnQgZW50cmllcywgYW4gdW5pbml0aWFsaXplZCBlcnJvcgo+Y29kZSB3aWxsIGJlIHJldHVybmVk
Lgo+Cj5GaXggdGhpcyBieSBwcmVpbml0aWFsaXppbmcgZXJyIHRvIHplcm8uCj4KPkZpeGVzOiAx
ZGI2NGU4NzMzZjY1MzgxICgiZGV2bGluazogQWRkIGRldmxpbmsgZm9ybWF0dGVkIG1lc3NhZ2Ug
KGZtc2cpIEFQSSIpCj5TaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgo+LS0tCj5JIGRvbid0IGtub3cgaWYgdGhpcyBjYW4gcmVhbGx5IGhhcHBl
biwgYW5kIGlmIHRoaXMgaXMgdGhlIHJpZ2h0IGZpeC4KPlBlcmhhcHMgZXJyIHNob3VsZCBiZSBp
bml0aWFsaXplZCB0byBzb21lIHZhbGlkIGVycm9yIGNvZGUgaW5zdGVhZD8KCjAgaXMgY29ycmVj
dCBoZXJlLgpBY2tlZC1ieTogSmlyaSBQaXJrbyA8amlyaUBtZWxsYW5veC5jb20+CgpUaGFua3Mh
Cgo+LS0tCj4gbmV0L2NvcmUvZGV2bGluay5jIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj5kaWZmIC0tZ2l0IGEvbmV0L2NvcmUvZGV2bGlu
ay5jIGIvbmV0L2NvcmUvZGV2bGluay5jCj5pbmRleCBkNDNiYzUyYjg4NDBkNzZiLi45MTM3N2U0
ZWFlOWE0M2MxIDEwMDY0NAo+LS0tIGEvbmV0L2NvcmUvZGV2bGluay5jCj4rKysgYi9uZXQvY29y
ZS9kZXZsaW5rLmMKPkBAIC00MzIxLDggKzQzMjEsOCBAQCBkZXZsaW5rX2Ztc2dfcHJlcGFyZV9z
a2Ioc3RydWN0IGRldmxpbmtfZm1zZyAqZm1zZywgc3RydWN0IHNrX2J1ZmYgKnNrYiwKPiB7Cj4g
CXN0cnVjdCBkZXZsaW5rX2Ztc2dfaXRlbSAqaXRlbTsKPiAJc3RydWN0IG5sYXR0ciAqZm1zZ19u
bGF0dHI7Cj4rCWludCBlcnIgPSAwOwo+IAlpbnQgaSA9IDA7Cj4tCWludCBlcnI7Cj4gCj4gCWZt
c2dfbmxhdHRyID0gbmxhX25lc3Rfc3RhcnRfbm9mbGFnKHNrYiwgREVWTElOS19BVFRSX0ZNU0cp
Owo+IAlpZiAoIWZtc2dfbmxhdHRyKQo+LS0gCj4yLjE3LjEKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFmcwo=
