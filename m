Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC51AF8EF
	for <lists+linux-afs@lfdr.de>; Sun, 19 Apr 2020 11:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VOa19VxcxQIzG4DgHdYRmx0fyfOB3bSOLs8K3wHU4Q=; b=an3ksUxQUAG4et
	akibmJrWrdMev5lv/it9936d96NiiLohrTMnFqMms//1VLhunaoZSTol56s6HQmEJqJ72UW6C62jF
	J/65Ot24q3gemqQ9gp28a9Sbtq/dD5OEFrC2emRW8R6h3t//6MBAtKyZudUU8s2sh8qvwPJvCVkxg
	s0/Nl22UuSo8I7geNamq8Jb6AHsHUfIhtsOgHW/tB6SBZA+UXYftBaH2ecBgQMDiFlTkTLzS/vQbH
	+kG8vj731NuVfkG9NMfS8++lnu/te25zsFWH2lGYvOE6MWXICXR/399/+ERYkNhxDxpotNwFRxA3Q
	v8MB9o2g1Rnlp1TkpCEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ6GH-0001Ap-Tx; Sun, 19 Apr 2020 09:29:13 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPPDm-0002Se-9J
 for linux-afs@lists.infradead.org; Fri, 17 Apr 2020 11:31:48 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4A696ABEF;
 Fri, 17 Apr 2020 11:31:40 +0000 (UTC)
From: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
To: Chuck Lever <chuck.lever@oracle.com>, David Howells <dhowells@redhat.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
In-Reply-To: <8DC44895-E904-4155-B7B8-B109A777F23C@oracle.com>
References: <874ktl2ide.fsf@oldenburg2.str.redhat.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <128769.1587032833@warthog.procyon.org.uk>
 <8DC44895-E904-4155-B7B8-B109A777F23C@oracle.com>
Date: Fri, 17 Apr 2020 13:31:39 +0200
Message-ID: <87sgh22vs4.fsf@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_043146_470301_BF5FD95F 
X-CRM114-Status: GOOD (  14.49  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.15 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Mailman-Approved-At: Sun, 19 Apr 2020 02:29:12 -0700
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
Cc: Florian Weimer <fweimer@redhat.com>, linux-cifs@vger.kernel.org,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Q2h1Y2sgTGV2ZXIgPGNodWNrLmxldmVyQG9yYWNsZS5jb20+IHdyaXRlczoKPiBUaGUgTGludXgg
TkZTIGNsaWVudCB3b24ndCBjb25uZWN0IHRvIGEgbmV3IHNlcnZlciB3aGVuIHRoZSBzZXJ2ZXIn
cwo+IEROUyBpbmZvcm1hdGlvbiBjaGFuZ2VzLiBBIGZyZXNoIG1vdW50IG9wZXJhdGlvbiB3b3Vs
ZCBiZSBuZWVkZWQgZm9yCj4gdGhlIGNsaWVudCB0byByZWNvZ25pemUgYW5kIG1ha2UgdXNlIG9m
IGl0Lgo+Cj4gVGhlcmUgYXJlIG1lY2hhbmlzbXMgaW4gdGhlIE5GU3Y0IHByb3RvY29sIHRvIGNv
bGxlY3Qgc2VydmVyIElQIGFkZHJlc3Nlcwo+IGZyb20gdGhlIHNlcnZlciBpdHNlbGYgKGZzX2xv
Y2F0aW9ucykgYW5kIHRoZW4gdHJ5IHRob3NlIGxvY2F0aW9ucyBpZiB0aGUKPiBjdXJyZW50IHNl
cnZlciBmYWlscyB0byByZXNwb25kLiBCdXQgY3VycmVudGx5IHRoYXQgaXMgbm90IGltcGxlbWVu
dGVkIGluCj4gTGludXggKGFuZCBzZXJ2ZXJzIHdvdWxkIG5lZWQgdG8gYmUgcmVhZHkgdG8gcHJv
dmlkZSB0aGF0IGtpbmQgb2YgdXBkYXRlKS4KCldlIGhhdmUgYSB2ZXJ5IHNpbWlsYXIgc3lzdGVt
IGluIENJRlMuIEZhaWxvdmVyIGNhbiBiZSBoYW5kbGVkIGluIDIgd2F5cwoodGVjaG5pY2FsbHkg
Ym90aCBjYW4gYmUgdXNlZCBhdCB0aGUgc2FtZSB0aW1lKToKCmEpIHdpdGggREZTLCB0aGUgbW91
bnQgY2FuIGhhdmUgYSBsaXN0IG9mIHBvc3NpYmxlIGxvY2F0aW9uIHRvIGNvbm5lY3QKICAgdG8s
IHNvcnQgb2YgbGlrZSBjcm9zcy1zZXJ2ZXIgc3ltbGlua3Mgd2l0aCBtdWx0aXBsZSBwb3NzaWJs
ZQogICB0YXJnZXRzLiBOb3RlIHRoYXQgdGhlIHRhcmdldCB2YWx1ZSB1c2VzIGhvc3RuYW1lcy4K
YikgdGhlIGRvbWFpbiBjb250cm9sZXIgY2FuIG5vdGljZSB0aGUgc2VydmVyIGlzIGRvd24gYW5k
IGF1dG9tYXRpY2FsbHkKICAgc3dpdGNoIHRoZSBzZXJ2ZXIgaG9zdG5hbWUgRE5TIGVudHJ5IHRv
IGEgYmFja3VwIG9uZSB3aXRoIGEgZGlmZmVyZW50IElQLgoKPj4gQ0lGUyBhbHNvIGRvZXNuJ3Qg
bWFrZSBkaXJlY3QgdXNlIG9mIHRoZSBUVEwsIGFuZCBhZ2FpbiB0aGlzIG1heSBiZSBiZWNhdXNl
IGl0Cj4+IHVzZXMgdGhlIHNlcnZlciBhZGRyZXNzIGFzIHBhcnQgb2YgdGhlIHByaW1hcnkga2V5
IGZvciB0aGUgc3VwZXJibG9jayAoc2VlCj4+IGNpZnNfbWF0Y2hfc3VwZXIoKSkuCgpXaGVuIHdl
IHRyeSB0byByZWNvbm5lY3QgYWZ0ZXIgYSBmYWlsdXJlICh1c2luZyAoYSkgb3IganVzdCByZWNv
bm5lY3RpbmcKdG8gc2FtZSBzZXJ2ZXIpIHdlIHJlc29sdmUgdGhlIGhvc3QgYWdhaW4gdG8gdHJ5
IHRvIHVzZSBhbnkgbmV3IElQIChpbgpjYXNlIChiKSBoYXBwZW5lZCkuIFRoaXMgaXMgZG9uZSB2
aWEgdXBjYWxsaW5nIHVzaW5nIHRoZSByZXF1ZXN0X2tleSgpCkFQSS4KClRoZSBjaWZzLnVwY2Fs
bCBwcm9nIChmcm9tIGNpZnMtdXRpbHMpIGNhbGxzIGdldGFkZHJpbmZvKCkgYW5kIHNldHMgYQpr
ZXkgd2l0aCBhIGRlZmF1bHQgVFRMIG9mIDEwbW4gWzJdWzNdIGJ1dCBpZiB0aGUgc3lzdGVtIHVz
ZXMgRE5TIGNhY2hpbmcKdmlhIG5zY2RbMV0gdGhlcmUncyBubyB3YXkgdG8gdGVsbCBob3cgbG9u
ZyB0aGUgb2xkIElQIHdpbGwgcmVtYWluIGluCnVzZS4uLgoKMTogaHR0cHM6Ly9saW51eC5kaWUu
bmV0L21hbi84L25zY2QKMjogaHR0cHM6Ly9naXRodWIuY29tL3BpYXN0cnkvY2lmcy11dGlscy9i
bG9iLzlhOGMyMWFkOWU0NTEwYTgzYTNhNDFmN2EwNGY3NjNhNGZlOWVjMDkvY2lmcy51cGNhbGwu
YyNMNjYKMzogaHR0cHM6Ly9naXRodWIuY29tL3BpYXN0cnkvY2lmcy11dGlscy9ibG9iLzlhOGMy
MWFkOWU0NTEwYTgzYTNhNDFmN2EwNGY3NjNhNGZlOWVjMDkvY2lmcy51cGNhbGwuYyNMNzgzCgpD
aGVlcnMsCi0tIApBdXLDqWxpZW4gQXB0ZWwgLyBTVVNFIExhYnMgU2FtYmEgVGVhbQpHUEc6IDE4
MzkgQ0I1RiA5RjVCIEZCOUIgQUE5NyAgOEM5OSAwM0M4IEE0OUIgNTIxQiBENUQzClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBERQpHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBNYXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWgg
SFJCIDI0NzE2NSAoQUcgTcO8bmNoZW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYWZzCg==
