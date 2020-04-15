Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 174321A9939
	for <lists+linux-afs@lfdr.de>; Wed, 15 Apr 2020 11:47:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rjs79YttT3gp3rfW1ByTqYeirjGPXcOydRnce/6PPQ=; b=VxsKqd65SJunD+
	O3uRmUaGVnG33Mt9K3ypia6FpgNAeYIKgfP8rBfZAuW1pYxF/eEb/AgoGsfAGYg2i+0TEiwP2seSw
	TY/Lmpvkw3GeTUfcxI7BqmV/rO6oEuOlzf1Pymurg3L4xaN8qt06+k/s+Q7MC9PUtSW6ShhXFIPCo
	MkS7KVNaB/ulBCUUB2J46IBycbEX0kk1AHtd4uvlBmOdMwp1v4t6mE5/mEH9BR+8EkoyVrw+xZufF
	vSLcekaEeK5S1fNBS6fL9pURr8zhPWuahY/mRMEOOTKsUxkiKgbX4E4T3pGq3cWPy/V9h58LBhR4W
	bQuzWrniHBmyIctOoDsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOedG-0005nJ-TV; Wed, 15 Apr 2020 09:46:58 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOedE-0002lw-MR
 for linux-afs@lists.infradead.org; Wed, 15 Apr 2020 09:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586943878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKa8snlnDryG0vgt7Fg/rdv6w9fg6r4FpdXiLIxnEdE=;
 b=AdhJXXlV/+qPI1sD24Ht8F67XLwlJBO5HQHLMOEXl2ug8Qj+ge/0Fw+OxjeIrnmVu1EnW6
 6K9bcJGYaLfSkrByAVS/QRHEnDxo+i+W6q/PZKxvKQx4YuCiIEoG46uMs5PdsSuiYbcg+p
 N/0+J5XZqnKr7z8D01qVHjzsu0OueB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-olUJzS60OsClk0RUhQWf4A-1; Wed, 15 Apr 2020 05:44:34 -0400
X-MC-Unique: olUJzS60OsClk0RUhQWf4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 216EB800D5C;
 Wed, 15 Apr 2020 09:44:33 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-114-61.ams2.redhat.com
 [10.36.114.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E8D72B479;
 Wed, 15 Apr 2020 09:44:30 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
References: <3865908.1586874010@warthog.procyon.org.uk>
Date: Wed, 15 Apr 2020 11:44:29 +0200
In-Reply-To: <3865908.1586874010@warthog.procyon.org.uk> (David Howells's
 message of "Tue, 14 Apr 2020 15:20:10 +0100")
Message-ID: <874ktl2ide.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_024656_806887_5AE144C7 
X-CRM114-Status: GOOD (  18.11  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

KiBEYXZpZCBIb3dlbGxzOgoKPiBTaW5jZSBrZXkuZG5zX3Jlc29sdmVyIGlzbid0IGdpdmVuIGEg
VFRMIGZvciB0aGUgYWRkcmVzcyBpbmZvcm1hdGlvbiBvYnRhaW5lZAo+IGZvciBnZXRhZGRyaW5m
bygpLCBubyBleHBpcnkgaXMgc2V0IG9uIGRuc19yZXNvbHZlciBrZXlzIGluIHRoZSBrZXJuZWwg
Zm9yCj4gTkZTLCBDSUZTIG9yIENlcGguICBBRlMgZ2V0cyBvbmUgaWYgaXQgbG9va3MgdXAgYSBj
ZWxsIFNSViBvciBBRlNEQiByZWNvcmQKPiBiZWNhdXNlIHRoYXQgaXMgbG9va2VkIHVwIGluIHRo
ZSBETlMgZGlyZWN0bHksIGJ1dCBpdCBkb2Vzbid0IGxvb2sgdXAgQSBvcgo+IEFBQUEgcmVjb3Jk
cywgc28gZG9lc24ndCBnZXQgYW4gZXhwaXJ5IGZvciB0aGUgYWRkcmVzc2VzIHRoZW1zZWx2ZXMu
Cj4KPiBJJ3ZlIHByZXZpb3VzbHkgYXNrZWQgdGhlIGxpYmMgZm9sa3MgaWYgdGhlcmUncyBhIHdh
eSB0byBnZXQgdGhpcyBpbmZvcm1hdGlvbgo+IGV4cG9zZWQgaW4gc3RydWN0IGFkZHJpbmZvLCBi
dXQgSSBkb24ndCB0aGluayB0aGF0IGVuZGVkIHVwIGdvaW5nIGFueXdoZXJlIC0KPiBhbmQsIGlu
IGFueSBjYXNlLCB3b3VsZCB0YWtlIGEgZmV3IHllYXJzIHRvIHdvcmsgdGhyb3VnaCB0aGUgc3lz
dGVtLgo+Cj4gRm9yIHRoZSBtb21lbnQsIEkgdGhpbmsgSSBzaG91bGQgcHV0IGEgZGVmYXVsdCBv
biBhbnkgZG5zX3Jlc29sdmVyIGtleXMgYW5kCj4gaGF2ZSBpdCBhcHBsaWVkIGVpdGhlciBieSB0
aGUga2VybmVsIChjb25maWd1cmFibGUgd2l0aCBhIC9wcm9jL3N5cy8gc2V0dGluZykKPiBvciBi
eSB0aGUga2V5LmRuZl9yZXNvbHZlciBwcm9ncmFtIChjb25maWd1cmFibGUgd2l0aCBhbiAvZXRj
IGZpbGUpLgo+Cj4gQW55IHN1Z2dlc3Rpb24gYXMgdG8gdGhlIHByZWZlcnJlZCBkZWZhdWx0IFRU
TD8gIDEwIG1pbnV0ZXM/CgpZb3UgY2FuIGdldCB0aGUgcmVhbCBUVEwgaWYgeW91IGRvIGEgRE5T
IHJlc29sdXRpb24gb24gdGhlIG5hbWUgYW5kCm1hdGNoIHRoZSBhZGRyZXNzZXMgYWdhaW5zdCB3
aGF0IHlvdSBnZXQgb3V0IG9mIHRoZSBOU1MgZnVuY3Rpb25zLiAgSWYKdGhleSBtYXRjaCwgeW91
IGNhbiB1c2UgdGhlIFRUTCBmcm9tIEROUy4gIEhhY2tpc2gsIGJ1dCBpdCBkb2VzIGdpdmUgeW91
Cipzb21lKiBUVEwgdmFsdWUuCgpUaGUgcXVlc3Rpb24gcmVtYWlucyB3aGF0IHRoZSBleHBlY3Rl
ZCBpbXBhY3Qgb2YgVFRMIGV4cGlyeSBpcy4gIFdpbGwKdGhlIGtlcm5lbCBqdXN0IHBlcmZvcm0g
YSBuZXcgRE5TIHF1ZXJ5IGlmIGl0IG5lZWRzIG9uZT8gIE9yIHdvdWxkIHlvdQpleHBlY3QgdGhh
dCAoc2F5KSB0aGUgTkZTIGNsaWVudCByZWNoZWNrcyB0aGUgYWRkcmVzc2VzIGFmdGVyIFRUTCBl
eHBpcnkKYW5kIGlmIHRoZXkgY2hhbmdlLCByZWNvbm5lY3QgdG8gYSBuZXcgTkZTIHNlcnZlcj8K
CklmIGEgVFRMIGV4cGlyYXRpb24gZG9lcyBub3QgdHJpZ2dlciBhbnl0aGluZywgdGhhbiBpdCBz
ZWVtcyBwdXJlbHkgYW4Kb3B0aW1pemF0aW9uIHRvIGF2b2lkIGtlcm5lbCDihpIgdXNlcnNwYWNl
IGNhbGxiYWNrcy4gIEkgdGhpbmsgeW91IGNhbiBkbwp3aXRoIGEgdmVyeSBzaG9ydCBUVEwgaW4g
dGhpcyBjYXNlLCBvbiB0aGUgb3JkZXIgb2Ygc2Vjb25kcyAob3Igbm8KY2FjaGluZyBhdCBhbGwp
LgoKTmVnYXRpdmUgY2FjaGluZyBpcyBhbHNvIHdvcnRoeSBvZiBjb25zaWRlcmF0aW9uIGFuZCBj
YW4gYmUgY29uc2lkZXJhYmx5Cm1vcmUgdHJpY2t5LgoKVGhhbmtzLApGbG9yaWFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFmcwo=
