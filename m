Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5BAE6FC
	for <lists+linux-afs@lfdr.de>; Tue, 10 Sep 2019 11:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuGENBJ2v08aqZ93fxRA0M9QZfYGrSqJ4IVQw6UyD0Q=; b=cO/WxYwNB0WgAc
	Qk6+zce7LUnuaDJOuCjOn2InHKt8wqhYAamB/qgINHOu8Htb59F3gzunnlyY5mBY/5z1lv4bc0k+H
	vrrvU9HDVHqgh6KVAjA2MH5qDqydnQZxtjW0v2Cb1RO1T8pTdPzvOYoos3iXdzRhKDnwQanNnNI/g
	YCRCAwrzmBS/BzTr6bNn0qt9xpnrsr8sruksXiyVib11Fza3KbXVlmT6SUu8ge2YDgFhlr3zKaz6P
	6eaRFx6yfk8Rl60nnXwj5vmbEDRyNdFAYwWayzu7piQzX+ie8HTWrT/KQlqVLfnPBl5fc17+GZRVC
	d5emflBCTHpAB8+2qSeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7cTs-0005n1-AA; Tue, 10 Sep 2019 09:30:36 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7cTo-0005mc-4w
 for linux-afs@lists.infradead.org; Tue, 10 Sep 2019 09:30:34 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 28F8F3090FF4;
 Tue, 10 Sep 2019 09:30:31 +0000 (UTC)
Received: from dhcp-12-139.nay.redhat.com (dhcp-12-139.nay.redhat.com
 [10.66.12.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5BB41001B01;
 Tue, 10 Sep 2019 09:30:25 +0000 (UTC)
Date: Tue, 10 Sep 2019 17:30:22 +0800
From: Hangbin Liu <haliu@redhat.com>
To: Greg KH <greg@kroah.com>
Subject: Re: =?utf-8?B?4p2MIEZBSUw=?= =?utf-8?Q?=3A?= Stable queue: queue-5.2
Message-ID: <20190910093021.GK22496@dhcp-12-139.nay.redhat.com>
References: <cki.77A5953448.UY7ROQ6BKT@redhat.com>
 <20190910081956.GG22496@dhcp-12-139.nay.redhat.com>
 <20190910085810.GA3593@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910085810.GA3593@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 10 Sep 2019 09:30:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_023032_231445_1C8B710A 
X-CRM114-Status: GOOD (  20.61  )
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

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDk6NTg6MTBBTSArMDEwMCwgR3JlZyBLSCB3cm90ZToK
PiBPbiBUdWUsIFNlcCAxMCwgMjAxOSBhdCAwNDoxOTo1NlBNICswODAwLCBIYW5nYmluIExpdSB3
cm90ZToKPiA+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDA4OjM2OjE0QU0gLTA0MDAsIENLSSBQ
cm9qZWN0IHdyb3RlOgo+ID4gPiAKPiA+ID4gSGVsbG8sCj4gPiA+IAo+ID4gPiBXZSByYW4gYXV0
b21hdGVkIHRlc3RzIG9uIGEgcGF0Y2hzZXQgdGhhdCB3YXMgcHJvcG9zZWQgZm9yIG1lcmdpbmcg
aW50byB0aGlzCj4gPiA+IGtlcm5lbCB0cmVlLiBUaGUgcGF0Y2hlcyB3ZXJlIGFwcGxpZWQgdG86
Cj4gPiA+IAo+ID4gPiAgICAgICAgS2VybmVsIHJlcG86IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQKPiA+ID4gICAgICAgICAg
ICAgQ29tbWl0OiBmN2Q1YjNkYzQ3OTIgLSBMaW51eCA1LjIuMTAKPiA+ID4gCj4gPiA+IFRoZSBy
ZXN1bHRzIG9mIHRoZXNlIGF1dG9tYXRlZCB0ZXN0cyBhcmUgcHJvdmlkZWQgYmVsb3cuCj4gPiA+
IAo+ID4gPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4g
PiA+ICAgICAgICAgICAgICBNZXJnZTogT0sKPiA+ID4gICAgICAgICAgICBDb21waWxlOiBPSwo+
ID4gPiAgICAgICAgICAgICAgVGVzdHM6IEZBSUxFRAo+ID4gPiAKPiA+ID4gQWxsIGtlcm5lbCBi
aW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9h
ZCBoZXJlOgo+ID4gPiAKPiA+ID4gICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcv
cGlwZWxpbmVzLzEyODUxOQo+ID4gPiAKPiA+ID4gCj4gPiA+IAo+ID4gPiBPbmUgb3IgbW9yZSBr
ZXJuZWwgdGVzdHMgZmFpbGVkOgo+ID4gPiAKPiA+ID4gICB4ODZfNjQ6Cj4gPiA+ICAgICDinYwg
TmV0d29ya2luZyBzb2NrZXQ6IGZ1enoKPiA+IAo+ID4gU29ycnksIG1heWJlIHRoZSBpbmZvIGlz
IGEgbGl0dGxlIGxhdGUsIEkganVzdCBmb3VuZCB0aGUgY2FsbCB0cmFjZXMgZm9yIHRoaXMKPiA+
IGZhaWx1cmUuCj4gCj4gQW5kIHRoaXMgaXMgbm8gbG9uZ2VyIGZhaWxpbmc/CgpJIGhhdmVuJ3Qg
c2VlbiB0aGlzIGlzc3VlIGxhdGVyLiBCdXQgeW91IGtub3csIHRoaXMgd2FzIHRyaWdnZXJlZCBi
eSBhIGZ1enogdGVzdCwKbm90IHN1cmUgaWYgdGhlIGJhZCBjb2RlIHN0aWxsIGV4aXN0cy4KPiAK
PiBXaGF0IGlzIHRoZSAiZnV6eiIgdGVzdD8KCkl0J3MganVzdCBhIHNvY2tldCB0ZXN0IHRoYXQg
Y3JlYXRlIGFsbCBraW5kcyBvZiBkb21haW5zL3R5cGVzL3Byb3RvY29scyBhbmQgZG8Kc29tZSB7
c2V0LGdldH1zb2Nrb3B0IGZvciBUQ1AvVURQL1NDVFAKaHR0cHM6Ly9naXRodWIuY29tL0NLSS1w
cm9qZWN0L3Rlc3RzLWJlYWtlci9ibG9iL21hc3Rlci9uZXR3b3JraW5nL3NvY2tldC9mdXp6L3Nv
Y2tldC5jI0wxNTUKClhpdW1laSBNdSBhbHNvIGZvcndhcmRlZCBtZSBhIG1haWwuIEl0IGxvb2tz
IFNhc2hhIGhhcyBmaXhlZCBzb21ldGhpbmcuCkJ1dCBJIGRvbid0IGtub3cgdGhlIGRldGFpbHMu
CgotLS0tLSBGb3J3YXJkZWQgTWVzc2FnZSAtLS0tLQo+IEZyb206ICJTYXNoYSBMZXZpbiIgPHNh
c2hhbEBrZXJuZWwub3JnPgo+IFRvOiAiR3JlZyBLSCIgPGdyZWdAa3JvYWguY29tPgo+IENjOiAi
TWFqb3IgSGF5ZGVuIiA8bWFqb3JAbWh0eC5uZXQ+LCAiQ0tJIFByb2plY3QiIDxja2ktcHJvamVj
dEByZWRoYXQuY29tPiwgIkxpbnV4IFN0YWJsZSBtYWlsbGlzdCIKPiA8c3RhYmxlQHZnZXIua2Vy
bmVsLm9yZz4sICJZaSBaaGFuZyIgPHlpLnpoYW5nQHJlZGhhdC5jb20+LCAiWGl1bWVpIE11IiA8
eG11QHJlZGhhdC5jb20+LCAiSGFuZ2JpbiBMaXUiCj4gPGhhbGl1QHJlZGhhdC5jb20+LCAiWWlu
ZyBYdSIgPHlpbnh1QHJlZGhhdC5jb20+Cj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjgsIDIw
MTkgMjoyNTozNiBBTQo+IFN1YmplY3Q6IFJlOiDinYwgRkFJTDogVGVzdCByZXBvcnQgZm9yIGtl
cm5lbCA1LjIuMTEtcmMxLTlmNjMxNzEuY2tpIChzdGFibGUpCj4KPiBPbiBUdWUsIEF1ZyAyNywg
MjAxOSBhdCAwNzowNToxOFBNICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+ID5PbiBUdWUsIEF1ZyAy
NywgMjAxOSBhdCAwOTozNTozMEFNIC0wNTAwLCBNYWpvciBIYXlkZW4gd3JvdGU6Cj4gPj4gT24g
OC8yNy8xOSA3OjMxIEFNLCBDS0kgUHJvamVjdCB3cm90ZToKPiA+PiA+ICAgeDg2XzY0Ogo+ID4+
ID4gICAgICAgSG9zdCAyOgo+ID4+ID4gICAgICAgICAg4p2MIE5ldHdvcmtpbmcgc29ja2V0OiBm
dXp6IFs5XQo+ID4+ID4gICAgICAgICAg4p2MIE5ldHdvcmtpbmcgc2N0cC1hdXRoOiBzb2Nrb3B0
cyB0ZXN0IFsxMF0KPiA+Pgo+ID4+IEl0IGxvb2tzIGxpa2UgdGhlcmUgd2FzIGFuIG9vcHMgd2hl
biB0aGVzZSB0ZXN0cyByYW4gb24gNS4yLjExLXJjMSBhbmQgdGhlCj4gPj4gbGFzdCBzZXQgb2Yg
cGF0Y2hlcyBpbiBzdGFibGUtcXVldWU6Cj4gPgo+ID5DYW4geW91IGJpc2VjdD8KPgo+IEkgdGhp
bmsgSSd2ZSBmaXhlZCBpdCwgbGV0J3Mgc2VlIHdoYXQgaGFwcGVucyBuZXh0IHJ1bi4KPgo+IC0t
Cj4gVGhhbmtzLAo+IFNhc2hhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYWZzCg==
