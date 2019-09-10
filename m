Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EA62FAE72E
	for <lists+linux-afs@lfdr.de>; Tue, 10 Sep 2019 11:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gsu7EMKcnqpvq+kuePKD8IyA68QT4qjj0tqFDgbHWVw=; b=EYFhf3dl7jMpuC
	oQOxCct7qPH06JrH85fJ78BCG5HE4465N1D2NsXOfNj3j492RgnWrCGnWdoNq2zcpliiGn581ith9
	B7+KmjqngeRe/9HNZQynzzw50DPja/jZaUHtClcDcCN544ojtHOi/tnIJ54X54V71pC2QRA6UwVPK
	wHWnDVndduHBefI5Ya5WWlLxGijrHfmfw7tMF26qIR2p/rI431/q4ud6LZii3j2kOha9P5lto4HlT
	Ul+d3MjVHDCtTLoWu/7YNhugLxAsDr/T4KlzpE7na26SDhgGrPPv56cx1rfl3KB3Ok+wrIou6ULoD
	t1NiYjNuHLOhsUH+nDaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7cda-000115-7Y; Tue, 10 Sep 2019 09:40:38 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7cdX-00010a-3d
 for linux-afs@lists.infradead.org; Tue, 10 Sep 2019 09:40:36 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B69F39B286;
 Tue, 10 Sep 2019 09:40:34 +0000 (UTC)
Received: from dhcp-12-139.nay.redhat.com (dhcp-12-139.nay.redhat.com
 [10.66.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 394B75D9D6;
 Tue, 10 Sep 2019 09:40:28 +0000 (UTC)
Date: Tue, 10 Sep 2019 17:40:25 +0800
From: Hangbin Liu <haliu@redhat.com>
To: Greg KH <greg@kroah.com>
Subject: Re: =?utf-8?B?4p2MIEZBSUw=?= =?utf-8?Q?=3A?= Stable queue: queue-5.2
Message-ID: <20190910094025.GM22496@dhcp-12-139.nay.redhat.com>
References: <cki.77A5953448.UY7ROQ6BKT@redhat.com>
 <20190910081956.GG22496@dhcp-12-139.nay.redhat.com>
 <20190910085810.GA3593@kroah.com>
 <20190910093021.GK22496@dhcp-12-139.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910093021.GK22496@dhcp-12-139.nay.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 10 Sep 2019 09:40:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_024035_170634_C42381D1 
X-CRM114-Status: GOOD (  16.52  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 Linux Stable maillist <stable@vger.kernel.org>, linux-afs@lists.infradead.org,
 David Howells <dhowells@redhat.com>, CKI Project <cki-project@redhat.com>,
 Xiumei Mu <xmu@redhat.com>, Jan Stancek <jstancek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDU6MzA6MjFQTSArMDgwMCwgSGFuZ2JpbiBMaXUgd3Jv
dGU6Cj4gWGl1bWVpIE11IGFsc28gZm9yd2FyZGVkIG1lIGEgbWFpbC4gSXQgbG9va3MgU2FzaGEg
aGFzIGZpeGVkIHNvbWV0aGluZy4KPiBCdXQgSSBkb24ndCBrbm93IHRoZSBkZXRhaWxzLgoKT2gs
IEkgY2hlY2tlZCB0aGF0IHRocmVhZC4gSXQncyB0aGUgc2FtZSBpc3N1ZS4gU28gU2FzaGEgc2hv
dWxkIGhhcyBmaXhlZCBpdC4gSQpqdXN0IHdvbmRlciB0aGUgY29tbWl0IGlkIG5vdy4KClRoYW5r
cwpIYW5nYmluCj4gCj4gLS0tLS0gRm9yd2FyZGVkIE1lc3NhZ2UgLS0tLS0KPiA+IEZyb206ICJT
YXNoYSBMZXZpbiIgPHNhc2hhbEBrZXJuZWwub3JnPgo+ID4gVG86ICJHcmVnIEtIIiA8Z3JlZ0Br
cm9haC5jb20+Cj4gPiBDYzogIk1ham9yIEhheWRlbiIgPG1ham9yQG1odHgubmV0PiwgIkNLSSBQ
cm9qZWN0IiA8Y2tpLXByb2plY3RAcmVkaGF0LmNvbT4sICJMaW51eCBTdGFibGUgbWFpbGxpc3Qi
Cj4gPiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4sICJZaSBaaGFuZyIgPHlpLnpoYW5nQHJlZGhh
dC5jb20+LCAiWGl1bWVpIE11IiA8eG11QHJlZGhhdC5jb20+LCAiSGFuZ2JpbiBMaXUiCj4gPiA8
aGFsaXVAcmVkaGF0LmNvbT4sICJZaW5nIFh1IiA8eWlueHVAcmVkaGF0LmNvbT4KPiA+IFNlbnQ6
IFdlZG5lc2RheSwgQXVndXN0IDI4LCAyMDE5IDI6MjU6MzYgQU0KPiA+IFN1YmplY3Q6IFJlOiDi
nYwgRkFJTDogVGVzdCByZXBvcnQgZm9yIGtlcm5lbCA1LjIuMTEtcmMxLTlmNjMxNzEuY2tpIChz
dGFibGUpCj4gPgo+ID4gT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDc6MDU6MThQTSArMDIwMCwg
R3JlZyBLSCB3cm90ZToKPiA+ID5PbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAwOTozNTozMEFNIC0w
NTAwLCBNYWpvciBIYXlkZW4gd3JvdGU6Cj4gPiA+PiBPbiA4LzI3LzE5IDc6MzEgQU0sIENLSSBQ
cm9qZWN0IHdyb3RlOgo+ID4gPj4gPiAgIHg4Nl82NDoKPiA+ID4+ID4gICAgICAgSG9zdCAyOgo+
ID4gPj4gPiAgICAgICAgICDinYwgTmV0d29ya2luZyBzb2NrZXQ6IGZ1enogWzldCj4gPiA+PiA+
ICAgICAgICAgIOKdjCBOZXR3b3JraW5nIHNjdHAtYXV0aDogc29ja29wdHMgdGVzdCBbMTBdCj4g
PiA+Pgo+ID4gPj4gSXQgbG9va3MgbGlrZSB0aGVyZSB3YXMgYW4gb29wcyB3aGVuIHRoZXNlIHRl
c3RzIHJhbiBvbiA1LjIuMTEtcmMxIGFuZCB0aGUKPiA+ID4+IGxhc3Qgc2V0IG9mIHBhdGNoZXMg
aW4gc3RhYmxlLXF1ZXVlOgo+ID4gPgo+ID4gPkNhbiB5b3UgYmlzZWN0Pwo+ID4KPiA+IEkgdGhp
bmsgSSd2ZSBmaXhlZCBpdCwgbGV0J3Mgc2VlIHdoYXQgaGFwcGVucyBuZXh0IHJ1bi4KPiA+Cj4g
PiAtLQo+ID4gVGhhbmtzLAo+ID4gU2FzaGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
