Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FED34026
	for <lists+linux-afs@lfdr.de>; Tue,  4 Jun 2019 09:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjfScP6T0cks4MDbYXXRJ9hMgDKsRBHutCEB198oLDw=; b=QX7+3tRCHzY9Uv
	Tcv5kaa0An2yipu+HrDyHxGlP4NaCjFlzUx/dx6BOzxvJpd/ybMMYOed/n59jK5Dp1Rfzj2KexvU1
	OOaDvbZV+PZdwvTKkmaWE4O48ocM8BFfBloJ9VZ/UuJNlNxMtHHpGgosSwXLIOKXQdBjDK3MFpB4K
	UA8GPwnu53ilAOfokevyNtnwKiTBmuxftT5XolIVhxxkFJWZAzbe7s5XNgQJRW/oicayuCEu9l8y+
	U9cRBL8SmO6o6fVTq7JsqH/74umqB873xeyZFxYdErhvm3zsPHLh2tICPDa+VX9KVlMfDW6Eidd3r
	Mn8bO1qVvP33AGRYFx/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY3uv-0002MJ-It; Tue, 04 Jun 2019 07:31:33 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY3hS-0004Jx-OS
 for linux-afs@lists.infradead.org; Tue, 04 Jun 2019 07:17:40 +0000
Received: by mail-lj1-f196.google.com with SMTP id i21so4078557ljj.3
 for <linux-afs@lists.infradead.org>; Tue, 04 Jun 2019 00:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uXFhS7Fhht2cVxXQgdevMCQkg9IO5A4+7VWwz6q4IHQ=;
 b=cgPz356E/i7B5hUb8dUGWlDfwuv4pe4EmJSrb7TkXcKymm9qdgSexS0qnhXQh7Usda
 4hmzDIMPj+pP3Vfbi1WgA4adQZKhjseri9L6ioy+F6WgbG8Cal4nonw/Ty39hLCvekLk
 hKvGniFBGX6NNjCD3eWaO8Po4ppeJ+mrBq5ZvdrT2VG6SRcioO177UQPtP/DjVG1RWAq
 XbFuwqDaL7sIj81YOZYnZ5z54+piERL9zviYf2fmU0sdDDg360NdxcpwVpSaISRsh61c
 EZLmtXb04g3G0LfZcQbHtqvXviMmJRrTylHhwM+B2eW6UoniZ4NdhwduXzemEhyFCm0o
 aIgA==
X-Gm-Message-State: APjAAAVYi82xSIqKPafjk5FYw0NmsCcmdEnRZAGwjDcqnYOkeyaRVIam
 u2d6dJj+P1SwB8gZkpq+26NJCwFceGZV6UwWWjw=
X-Google-Smtp-Source: APXvYqyyZ2LjfsWzKbQvADxUxY+XiY/8hXkqr4Kstn7jTiKw8xfdZP/KjDVpKZALARnI7yGQkBB7ySKrnAGa0wizxpk=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr4591585ljg.65.1559632655971;
 Tue, 04 Jun 2019 00:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-3-geert@linux-m68k.org>
 <15499.1559298884@warthog.procyon.org.uk>
In-Reply-To: <15499.1559298884@warthog.procyon.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2019 09:17:23 +0200
Message-ID: <CAMuHMdX57DKCMpLXdtZPE-w0esUNVv9-SwYjmT5=m+u9ryAiHQ@mail.gmail.com>
Subject: Re: [PATCH] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_001738_796406_F5D28B78 
X-CRM114-Status: GOOD (  17.24  )
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (geert.uytterhoeven[at]gmail.com)
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Mailman-Approved-At: Tue, 04 Jun 2019 00:31:32 -0700
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, linux-block@vger.kernel.org,
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

SGkgRGF2aWQsCgpPbiBGcmksIE1heSAzMSwgMjAxOSBhdCAxMjozNSBQTSBEYXZpZCBIb3dlbGxz
IDxkaG93ZWxsc0ByZWRoYXQuY29tPiB3cm90ZToKPiBIZXJlJ3MgbXkgdGFrZSBvbiB0aGUgcGF0
Y2guCj4KPiBEYXZpZAo+IC0tLQo+IHJ4cnBjOiBGaXggdW5pbml0aWFsaXplZCBlcnJvciBjb2Rl
IGluIHJ4cnBjX3NlbmRfZGF0YV9wYWNrZXQoKQo+Cj4gV2l0aCBnY2MgNC4xOgo+Cj4gICAgIG5l
dC9yeHJwYy9vdXRwdXQuYzogSW4gZnVuY3Rpb24g4oCYcnhycGNfc2VuZF9kYXRhX3BhY2tldOKA
mToKPiAgICAgbmV0L3J4cnBjL291dHB1dC5jOjMzODogd2FybmluZzog4oCYcmV04oCZIG1heSBi
ZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbgo+Cj4gSW5kZWVkLCBpZiB0aGUg
Zmlyc3QganVtcCB0byB0aGUgc2VuZF9mcmFnbWVudGFibGUgbGFiZWwgaXMgbWFkZSwgYW5kCj4g
dGhlIGFkZHJlc3MgZmFtaWx5IGlzIG5vdCBoYW5kbGVkIGluIHRoZSBzd2l0Y2goKSBzdGF0ZW1l
bnQsIHJldCB3aWxsIGJlCj4gdXNlZCB1bmluaXRpYWxpemVkLgo+Cj4gRml4IHRoaXMgYnkgQlVH
KCknaW5nIGFzIGlzIGRvbmUgaW4gb3RoZXIgcGxhY2VzIGluIHJ4cnBjIHdoZXJlIGludGVybmFs
Cj4gc3VwcG9ydCBmb3IgZnV0dXJlIGFkZHJlc3MgZmFtaWxpZXMgd2lsbCBuZWVkIGFkZGluZy4g
IEl0IHNob3VsZCBub3QgYmUKPiBwb3NzaWJsZSB0byByZWFjaCB0aGlzIG5vcm1hbGx5IGFzIHRo
ZSBhZGRyZXNzIGZhbWlsaWVzIGFyZSBjaGVja2VkCj4gdXAtZnJvbnQuCj4KPiBGaXhlczogNWE5
MjRiODk1MWY4MzViNSAoInJ4cnBjOiBEb24ndCBzdG9yZSB0aGUgcnhycGMgaGVhZGVyIGluIHRo
ZSBUeCBxdWV1ZSBza19idWZmcyIpCj4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSG93ZWxscyA8ZGhv
d2VsbHNAcmVkaGF0LmNvbT4KCkknbSBub3Qgc3VjaCBhIGJpZyBmYW4gb2YgQlVHKCksIHNvIEkn
ZCBnbyBmb3IgcmV0ID0gLUVBRk5PU1VQUE9SVCwgYnV0IGdpdmVuCnJ4cnBjIGlzIGFscmVhZHkg
ZnVsbCBvZiBCVUcoKSBjYWxscywgSSBndWVzcyBpdCBpcyBhbiBhY2NlcHRhYmxlIHNvbHV0aW9u
LgoKPiAtLS0KPiBkaWZmIC0tZ2l0IGEvbmV0L3J4cnBjL291dHB1dC5jIGIvbmV0L3J4cnBjL291
dHB1dC5jCj4gaW5kZXggMDA0Yzc2MmMyZThkLi42ZjJiNGZiNGIwYWEgMTAwNjQ0Cj4gLS0tIGEv
bmV0L3J4cnBjL291dHB1dC5jCj4gKysrIGIvbmV0L3J4cnBjL291dHB1dC5jCj4gQEAgLTUyMyw2
ICs1MjMsOSBAQCBpbnQgcnhycGNfc2VuZF9kYXRhX3BhY2tldChzdHJ1Y3QgcnhycGNfY2FsbCAq
Y2FsbCwgc3RydWN0IHNrX2J1ZmYgKnNrYiwKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgI2VuZGlmCj4gKwo+ICsgICAgICAgZGVmYXVsdDoKPiArICAgICAg
ICAgICAgICAgQlVHKCk7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmIChyZXQgPCAwKQoKR3J7
b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMg
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYWZzCg==
