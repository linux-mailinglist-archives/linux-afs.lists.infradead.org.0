Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D89882DEEB
	for <lists+linux-afs@lfdr.de>; Wed, 29 May 2019 15:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IAAfOTDsrncCuLck60mJ+b5aavqA5sFpTMMTiBuRhU=; b=KETZzqsYfYCEgd
	ahXHrKMP3GbSiQNIMLWj3GX31KwsufkbLJCSewwvUUqJsmMosTzPr85ZI9Xu5l5/CF7EFkzAVWc86
	RGbPUtuYarwCdiWdUs7r8UEWXf6Itua2bwfMkYVqjzUaWTC5coq1DtXIOBJItq4YJmmheFzmlZe+q
	I7B/Sn3X8XMx1Srw6fzzE+Hg9oTaZuoMJEpOSuZR/4VYc9DObbS6BvhxCmFRKXeAXnLgVEIcpkEH8
	xBVhmttFQpI5uIqFWQldRjIda9p6Fx24ax5HdpGMPcU8StmBjpVytdqnaxV6l0/9sawInmATbbzY9
	IWUmd7qnzBlDwzRi+U0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVz09-0006EY-VQ; Wed, 29 May 2019 13:52:21 +0000
Received: from mail-qt1-f193.google.com ([209.85.160.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVwvU-0003ey-Pa
 for linux-afs@lists.infradead.org; Wed, 29 May 2019 11:39:26 +0000
Received: by mail-qt1-f193.google.com with SMTP id u12so2079689qth.3
 for <linux-afs@lists.infradead.org>; Wed, 29 May 2019 04:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9E0nYfWPs7a74TGtkChwlvLkwZ7IjxPSqPdyj4RozG4=;
 b=dtJ3TCMtHVtM0CyA7Qcrc4QrP+5ZLdJxOPpsyMFzUeNrYQFMobC4+VhmYCm1S6VbsA
 15Y6TzV5RpH31t8SQ8FV5neisetpaylTTcbn4c3h2dC/So4Tmqyosn/vAFODmclfoAWW
 Z2A9DN0f4XfLP6uSbTEyTb7scARlaabf9gk7ggGWxMujxCT+3q8ktbvx49BJRkvgRZic
 ctvrnxnlNpRcAlhvP+FjjOOJV5+OkwBvHQeuWt45hN06pYd47eqyWzNr4MUkm6VSRwBd
 m8XJbEFPa77+kbo6sk+LDIJjXYX+0MO40FS5ZJSI6ZlL5zc3fKAaz3+A16gLO6ZKnRU3
 NbGg==
X-Gm-Message-State: APjAAAWTEikls7ElGjH1zm3pfl6sM3fciujBOlK740TOP3t58BSXMlfM
 VQIPK2fMY80av6ZGpJHNkCqzSnFQOXOn3ekPEfg=
X-Google-Smtp-Source: APXvYqz0EPhnldcISbzSfPUtTKsPXrltcC2TURmwXZayJpn/3MgULMOLoAS863/SSr+U9BaN4sQZRsVuLkMYuNUzw/c=
X-Received: by 2002:ac8:2433:: with SMTP id c48mr87599176qtc.18.1559129962985; 
 Wed, 29 May 2019 04:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-4-geert@linux-m68k.org>
In-Reply-To: <20190528142424.19626-4-geert@linux-m68k.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 May 2019 13:39:06 +0200
Message-ID: <CAK8P3a3yPBOfw+GhTXGXZzr3wdz1yA3kKZGqqWYnW6+TzXm_PQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] net: sched: pie: Use ULL suffix for 64-bit constant
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_043924_825915_571FB7B8 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: 0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.193 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (arndbergmann[at]gmail.com)
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgNDoyNCBQTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IFdpdGggZ2NjIDQuMSwgd2hlbiBjb21waWxpbmcg
Zm9yIGEgMzItYml0IHBsYXRmb3JtOgo+Cj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6IEluIGZ1
bmN0aW9uIOKAmGRyb3BfZWFybHnigJk6Cj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTE2OiB3
YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBl
Cj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTM4OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50
IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGll
LmM6MTQ0OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9u
Z+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MTQ3OiB3YXJuaW5nOiBpbnRlZ2Vy
IGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hl
ZC9zY2hfcGllLmM6IEluIGZ1bmN0aW9uIOKAmHBpZV9xZGlzY19lbnF1ZXVl4oCZOgo+ICAgICBu
ZXQvc2NoZWQvc2NoX3BpZS5jOjE3Mzogd2FybmluZzogaW50ZWdlciBjb25zdGFudCBpcyB0b28g
bGFyZ2UgZm9yIOKAmGxvbmfigJkgdHlwZQo+ICAgICBuZXQvc2NoZWQvc2NoX3BpZS5jOiBJbiBm
dW5jdGlvbiDigJhjYWxjdWxhdGVfcHJvYmFiaWxpdHnigJk6Cj4gICAgIG5ldC9zY2hlZC9zY2hf
cGllLmM6MzcxOiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCY
bG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MzcyOiB3YXJuaW5nOiBpbnRl
Z2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9z
Y2hlZC9zY2hfcGllLmM6Mzc3OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJn
ZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6MzgyOiB3YXJu
aW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4g
ICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6Mzk3OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlz
IHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6
Mzk4OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KA
mSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6Mzk5OiB3YXJuaW5nOiBpbnRlZ2VyIGNv
bnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9z
Y2hfcGllLmM6NDA3OiB3YXJuaW5nOiBpbnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig
4oCYbG9uZ+KAmSB0eXBlCj4gICAgIG5ldC9zY2hlZC9zY2hfcGllLmM6NDE0OiB3YXJuaW5nOiBp
bnRlZ2VyIGNvbnN0YW50IGlzIHRvbyBsYXJnZSBmb3Ig4oCYbG9uZ+KAmSB0eXBlCj4KPiBGaXgg
dGhpcyBieSBhZGRpbmcgdGhlIG1pc3NpbmcgIlVMTCIgc3VmZml4Lgo+Cj4gRml4ZXM6IDNmN2Fl
NWYzZGM1Mjk1YWMgKCJuZXQ6IHNjaGVkOiBwaWU6IGFkZCBtb3JlIGNhc2VzIHRvIGF1dG8tdHVu
ZSBhbHBoYSBhbmQgYmV0YSIpCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4KCkkgY3JlYXRlZCBwYXRjaGVzIGZvciBhbGwgaW5zdGFuY2Vz
IG9mIHRoaXMgaXNzdWUgYXQgc29tZSBwb2ludCBpbiB0aGUgcGFzdCwKYnV0IGRpZCBub3Qgc2Vu
ZCB0aG9zZSBhcyB3ZSByYWlzZWQgdGhlIG1pbmltdW0gY29tcGlsZXIgdmVyc2lvbiB0byBvbmUK
dGhhdCBoYW5kbGVzIHRoaXMgaW4gdGhlIGV4cGVjdGVkIHdheSB3aXRob3V0IGEgd2FybmluZy4K
Ck1heWJlIHlvdSBjYW4ganVzdCBpZ25vcmUgdGhlc2UgYXMgd2VsbD8KCiAgICAgIEFybmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hZnMK
