Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C040C12AFDE
	for <lists+linux-afs@lfdr.de>; Fri, 27 Dec 2019 01:06:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqf3tf/7gAy0xPpFFoc2ckmDdcyPVuCJ5743Ahl0DAo=; b=FFTYjJ6c7te4GF
	7u0MnfNSJHi7tMRotYtl3PwdfDiClqvTBiv5HIHe162cJ7Chms71s1FZzLFgZXieEgTvQzg/5DJfN
	rbz6hO8j2imOlVpD+d8aT6CZCC0Fy2K1KKOrLgPnsxyPMcpWFINYzZ71uNPieeWjJLW8Gt778DLxu
	pNYPTOD7lkTiKtG48DMAd+FY1/MI2ZQUhKdudl+az2iPwIGEfUSbZ7i2u1kFm1nB7EKV0e/g1m7Hh
	1AjxwSmzVGyY9blNDtrXuEnEGUJzbPoOAsnVnjgnih6zyKt8nTgN74zffh3pzkd4iBRvSwfMX9b4I
	Z0MWU/Vot3UEtq4kurrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikd9T-000684-Oq; Fri, 27 Dec 2019 00:06:47 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikd9R-00067e-BC
 for linux-afs@lists.infradead.org; Fri, 27 Dec 2019 00:06:46 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1ikd9G-0002gt-Vv; Fri, 27 Dec 2019 00:06:35 +0000
Date: Fri, 27 Dec 2019 00:06:34 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH] afs: Fix compile warning in afs_dynroot_lookup()
Message-ID: <20191227000634.GS4203@ZenIV.linux.org.uk>
References: <1576761291-30121-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576761291-30121-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_160645_384472_7B0D6015 
X-CRM114-Status: GOOD (  13.86  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.92.253.2 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.92.253.2 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMDk6MTQ6NTFQTSArMDgwMCwgVGllemh1IFlhbmcgd3Jv
dGU6Cj4gRml4IHRoZSBmb2xsb3dpbmcgY29tcGlsZSB3YXJuaW5nOgo+IAo+ICAgQ0MgICAgICBm
cy9hZnMvZHlucm9vdC5vCj4gZnMvYWZzL2R5bnJvb3QuYzogSW4gZnVuY3Rpb24g4oCYYWZzX2R5
bnJvb3RfbG9va3Vw4oCZOgo+IGZzL2Fmcy9keW5yb290LmM6MTE3OjY6IHdhcm5pbmc6IOKAmGxl
buKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XbWF5YmUt
dW5pbml0aWFsaXplZF0KPiAgIHJldCA9IGxvb2t1cF9vbmVfbGVuKG5hbWUsIGRlbnRyeS0+ZF9w
YXJlbnQsIGxlbik7Cj4gICAgICAgXgo+IGZzL2Fmcy9keW5yb290LmM6OTE6Njogbm90ZTog4oCY
bGVu4oCZIHdhcyBkZWNsYXJlZCBoZXJlCj4gICBpbnQgbGVuOwo+ICAgICAgIF4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpodUBsb29uZ3Nvbi5jbj4KPiAtLS0KPiAg
ZnMvYWZzL2R5bnJvb3QuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2Fmcy9keW5yb290LmMgYi9mcy9h
ZnMvZHlucm9vdC5jCj4gaW5kZXggNzUwMzg5OS4uMzAzZjcxMiAxMDA2NDQKPiAtLS0gYS9mcy9h
ZnMvZHlucm9vdC5jCj4gKysrIGIvZnMvYWZzL2R5bnJvb3QuYwo+IEBAIC04OCw3ICs4OCw3IEBA
IHN0YXRpYyBzdHJ1Y3QgZGVudHJ5ICphZnNfbG9va3VwX2F0Y2VsbChzdHJ1Y3QgZGVudHJ5ICpk
ZW50cnkpCj4gIAlzdHJ1Y3QgZGVudHJ5ICpyZXQ7Cj4gIAl1bnNpZ25lZCBpbnQgc2VxID0gMDsK
PiAgCWNoYXIgKm5hbWU7Cj4gLQlpbnQgbGVuOwo+ICsJaW50IGxlbiA9IDA7Cj4gIAo+ICAJaWYg
KCFuZXQtPndzX2NlbGwpCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7CgpOQUsuICBUaGlz
IGlzIHJlYWxseSwgcmVhbGx5IHdyb25nIC0gcGFzc2luZyB6ZXJvIHRvIGxvb2t1cF9vbmVfbGVu
KCkgaXMKYWx3YXlzIGEgYnVnLiAgSXQncyBub3QgYW55IGJldHRlciB0aGFuIHVuZGVmaW5lZCB2
YWx1ZTsgaWYgd2UgKmNhbioKZ2V0IHRvIGxvb2t1cF9vbmVfbGVuKCkgY2FsbCB3aXRob3V0IG90
aGVyIGFzc2lnbm1lbnRzIHRvIGxlbiwgd2UKYXJlIGZ1Y2tlZC4KCkFzIGl0IHdlcmUsIGl0J3Mg
YSBmYWxzZSBwb3NpdGl2ZSAtIHdlIGhhdmUKICAgICAgICAgICAgICAgIGlmIChjZWxsKSB7CiAg
ICAgICAgICAgICAgICAgICAgICAgIGxlbiA9IGNlbGwtPm5hbWVfbGVuOwogICAgICAgICAgICAg
ICAgICAgICAgICBtZW1jcHkobmFtZSwgY2VsbC0+bmFtZSwgbGVuICsgMSk7CiAgICAgICAgICAg
ICAgICB9CnVwc3RyZWFtIG9mCiAgICAgICAgaWYgKCFjZWxsKQogICAgICAgICAgICAgICAgZ290
byBvdXRfbjsKCiAgICAgICAgcmV0ID0gbG9va3VwX29uZV9sZW4obmFtZSwgZGVudHJ5LT5kX3Bh
cmVudCwgbGVuKTsKc28gd2UgY2FuJ3QgcmVhY2ggdGhlIGNhbGwgb2YgbG9va3VwX29uZV9sZW4o
KSB3aXRob3V0IGhhdmluZwpoaXQgdGhlIGFzc2lnbm1lbnQgdG8gbGVuLgoKQlRXLCB3aGF0IGd1
YXJhbnRlZXMgdGhhdCBjZWxsLT5uYW1lIHdvbid0IGJlICJAY2VsbCI/ICBUaGUKdGhpbmdzIHdv
dWxkIGdldCByYXRoZXIgaW50ZXJlc3RpbmcgaW4gdGhhdCBjYXNlLi4uICBUaGUgc2FtZQpmb3Ig
bmV0LT5zeXNuYW1lcyBpbiBhZnNfbG9va3VwX2F0c3lzKCkgLSB3aGF0IG1ha2VzIHN1cmUKd2Ug
d29uJ3Qgc2VlICJAc3lzIiBhbW9uZyB0aG9zZT8gIERhdmlkPwoKV2hpbGUgd2UgYXJlIGF0IGl0
LAogICAgICAgIGQgPSBkX3NwbGljZV9hbGlhcyhpbm9kZSwgZGVudHJ5KTsKICAgICAgICBpZiAo
IUlTX0VSUl9PUl9OVUxMKGQpKSB7CiAgICAgICAgICAgICAgICBkLT5kX2ZzZGF0YSA9IGRlbnRy
eS0+ZF9mc2RhdGE7CiAgICAgICAgICAgICAgICB0cmFjZV9hZnNfbG9va3VwKGR2bm9kZSwgJmQt
PmRfbmFtZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5vZGUgPyBBRlNfRlNf
SShpbm9kZSkgOiBOVUxMKTsKICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAgICAgdHJhY2Vf
YWZzX2xvb2t1cChkdm5vZGUsICZkZW50cnktPmRfbmFtZSwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgSVNfRVJSX09SX05VTEwoaW5vZGUpID8gTlVMTAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA6IEFGU19GU19JKGlub2RlKSk7CiAgICAgICAgfQppcyBfdmVyeV8g
c3VzcGljaW91cy1sb29raW5nIC0gZF9zcGxpY2VfYWxpYXMoKSBjb25zdW1lcwphbiBpbm9kZSBy
ZWZlcmVuY2UsIGFuZCBpZiBpdCBlbmRzIHVwIGZhaWxpbmcgb24gbm9uLUVSUl9QVFIoKQppbm9k
ZSwgdGhlIGlub2RlIHdpbGwgYmUgZHJvcHBlZCBieSB0aGUgdGltZSBpdCByZXR1cm5zLgpJT1cs
IHRoYXQgQUZTX0ZTX0koaW5vZGUpIGluIHRoZSBzZWNvbmQgYnJhbmNoIGNhbiBibG9vZHkKd2Vs
bCBwb2ludCB0byBhbHJlYWR5IGZyZWVkIG1lbW9yeS4gIFRyYWNlcG9pbnRzOiBKdXN0IFNheSBO
by4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYWZzIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFmcwo=
