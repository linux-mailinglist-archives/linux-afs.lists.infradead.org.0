Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D893B17484D
	for <lists+linux-afs@lfdr.de>; Sat, 29 Feb 2020 18:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kI5H4vD/kOfOtkSgjalA2HDeABrJt6/AITzkGND1I5g=; b=n3ORh/Wx7BwgQd+jsNXHiRNKb
	15aWjOPWwrXUv/yZ8w1IAVHaI1q/GH6jgx4QFaHf7AeGG+ukioet4wgmx58fYjSnZwBj/qxkn3UzN
	OwiUQvyCdri/1ESB8jqI4LMaBUcYcwUWlGW1o+7sI/B11JIAct+urBNdR2btPSyTIchvdJzUYNClz
	3zYqixnfwvA5dsnnHoe/uUK2v9CcA25PevHpdl9TU+9df2KYxkoKaWu4U5IY1AAXdu8FepnDRkPG2
	WrnLCiUul57S3Ud3F5/uKCZK+RSs3KT2ChLOVq4MDrPITME+BTsuk1OKVw5Z0QYHycePN0HAf+uU+
	/CA0hw/Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j85aV-00021A-Rc; Sat, 29 Feb 2020 17:07:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j85aU-00020s-WB
 for linux-afs@bombadil.infradead.org; Sat, 29 Feb 2020 17:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=iu46PwLbk5B2QTgsWC8icPjlP64Cpyu2W3XfJU5unJ0=; b=Ydl0JC4fMRJOnG7yquGVXgL44C
 z+P0BvS/D5fv0YEqUm+uxL/HPNRQ83/TFnlUL473h30R6LItkBTqpgy6gnGTNQAOCCB+oNkTk6pfM
 IGUFP+aDdUKHKse81wRZCOYx35fFWIqGNxYJiMtQDUg6D3moJb9SG8yFcop+o/UvW+xQLUFNxcc4G
 xH6UEnNKlIAEKkZgSjqiUSRlM9Sox8+s3KcQ9XP1h9a4Dh2Qm4UDghaHQ5tNWC85+sR4dqN6bAO33
 H3l+RypeO69PdJJNX40WTtVlerqxV+28eMzBPG6yOl5CuBG6Uzvfuygzpt7enTHOBZN9C0IhjbLHi
 6saM9HJw==;
Received: from oroville.ca-zephyr.org ([166.84.7.202]
 helo=portola.ca-zephyr.org)
 by casper.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j85aR-0006Lk-0Z
 for linux-afs@lists.infradead.org; Sat, 29 Feb 2020 17:07:37 +0000
Received: from webmail.ca-zephyr.org (shelter-3.ca-zephyr.org [50.247.112.108])
 by portola.ca-zephyr.org (Postfix) with ESMTP id 5448A4001D;
 Sat, 29 Feb 2020 12:07:30 -0500 (EST)
MIME-Version: 1.0
Date: Sat, 29 Feb 2020 09:07:02 -0800
From: Bill MacAllister <bill@ca-zephyr.org>
To: Jeffrey Eric Altman <jaltman@auristor.com>
Subject: Re: [PATCH] Add debian build package
In-Reply-To: <005EF5A0-4D79-4355-9DD3-DEDF0FA68326@auristor.com>
References: <20200229092155.23965-1-olsonse@umich.edu>
 <005EF5A0-4D79-4355-9DD3-DEDF0FA68326@auristor.com>
Message-ID: <5176a0ceacc80e2ac54b0865cd58b8b4@ca-zephyr.org>
X-Sender: bill@ca-zephyr.org
User-Agent: Roundcube Webmail/1.3.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_170735_274907_3A1FE43C 
X-CRM114-Status: GOOD (  18.06  )
X-Spam-Score: -1.6 (-)
X-Spam-Report: SpamAssassin version 3.4.3 on casper.infradead.org summary:
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.3 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
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
Cc: David Howells <dhowells@redhat.com>, Bill MacAllister <mac@ca-zephyr.org>,
 linux-afs@lists.infradead.org, "Spencer E. Olson" <olsonse@umich.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gMjAyMC0wMi0yOSAwNDoyMiwgSmVmZnJleSBFcmljIEFsdG1hbiB3cm90ZToKPj4gT24gRmVi
IDI5LCAyMDIwLCBhdCA0OjIzIEFNLCBTcGVuY2VyIEUuIE9sc29uIDxvbHNvbnNlQHVtaWNoLmVk
dT4gCj4+IHdyb3RlOgo+PiAKPj4g77u/U2lnbmVkLW9mZi1ieTogU3BlbmNlciBFLiBPbHNvbiA8
b2xzb25zZUB1bWljaC5lZHU+Cj4+IC0tLQo+PiAKPj4gVGhpcyBwYXRjaCBhZGRzIGRlYmlhbiBw
YWNrYWdpbmcgdG8ga2Fmcy1jbGllbnQuICBUaGlzIHBhdGNoIGFsc28gCj4+IGluY2x1ZGVzIGFu
Cj4+IGF1dG8tY2hhbmdlbG9nIGdlbmVyYXRvciB0aGF0IGNyZWF0ZXMgdGhlIGNoYW5nZWxvZyBy
ZXF1aXJlZCBpbiB0aGUgCj4+IHByb3Blcgo+PiBmb3JtYXQgZm9yIGRlYmlhbiBwYWNrYWdlcy4g
IFRoaXMgZ2VuZXJhdG9yIHRha2VzIHRoZSBjaGFuZ2Vsb2cgCj4+IGNvbnRlbnQgZGlyZWN0bHkK
Pj4gZnJvbSB0aGUgZ2l0IGxvZyAoYXMgc3VjaCwgaXQgd291bGQgYmUgY2hhbGxlbmdpbmcgdG8g
cHJvcGVybHkgYnVpbGQgCj4+IHRoaXMgZGViaWFuCj4+IHBhY2thZ2Ugd2l0aG91dCB0aGUgZ2l0
IHJlcG9zaXRvcnkgcHJlc2VudCkuCj4+IAo+IAo+IEhpIFNwZW5jZXIsCj4gCj4gVGhhbmtzIGZv
ciB0aGUgbXVjaCBuZWVkZWQgY29udHJpYnV0aW9uLgo+IAo+IElzIHRoaXMgcGF0Y2ggaWRlbnRp
Y2FsIHRvIHRoZSBvbmUgaW4gZ2l0aHViLmNvbS9PbHNvbuKAmXMva2Fmcy1jbGllbnQvID8KPiAK
PiBJZiBzbywgQmlsbCBNYWNBbGxpc3RlciBoYXMgYSBudW1iZXIgb2YgY2hhbmdlcyB0byBpdCBm
cm9tIGhpcyB3b3JrCj4gZHVyaW5nIHRoZSByZWNlbnQgaGFja2F0aG9uIGF0IFZhdWx0LiAgSeKA
mXZlIGNj4oCZZCBCaWxsIG9uIHRoaXMgcmVwbHkuCj4gCj4gSmVmZnJleSBBbHRtYW4KClNwZW5j
ZXIsCgpJIGhhZCBiZWVuIHdvcmtpbmcgb24gY3JlYXRpbmcgYSBwYWNrYWdlIGZvciBrYWZzIGFu
ZCBoYWQgbm90IGdvdHRlbgp2ZXJ5IGZhci4gSSBoYWQgY3JlYXRlZCBmcm9tIERhdmlkJ3Mgc291
cmNlIGFuZCB3YXMgdHJ5aW5nIHRvIGdldCBhCmRlYmlhbiBwYWNrYWdlIHRoYXQgd291bGQgYnVp
bGQuIFdoZW4gSmVmZiB0b2xkIG1lIG9mIHlvdXIgd29yayBJanVzdApyZXBsYWNlZCBteSBkZWJp
YW4gZGlyZWN0b3J5IHdpdGggeW91cnMuIFRoZSByZXN1bHRhbnQgcGFja2FnZSBidWlsdAppbWFn
ZXMsIGJ1dCBkaWQgbm90IHJlc3VsdCBpbiBhIGNvbXBsZXRlIHBhY2thZ2UuIE15IGNoYW5nZXMg
YXJlIG1vc3RseQp0byB0aGUgaW5zdGFsbCBmaWxlcyBpbiB0aGUgZGViaWFuIGRpcmVjdG9yeS4g
VGhlIGN1cnJlbnQgd29yayBpcyAKYXZhaWxhYmxlCmF0IGdpdEBnaXRodWIuY29tOndobS9rYWZz
LWNsaWVudC5naXQgYW5kIG15IGN1cnJlbnQgYnVpbGQgYnJhbmNoIGlzIGluCm1hc3Rlci1vbHNv
bnNlLgoKVGhlIHBhY2thZ2UgYnVpbGRzIGFuZCBpbnN0YWxscy4gSXQgaXMgcG9zc2libGUgdG8g
YWtsb2cta2FmcywgYnV0IEkKYW0gbm90IGFibGUgdG8gYWNjZXNzIEFGUyBjZWxscyB5ZXQuIEkg
YW0gdGVzdGluZyBvbiBEZWJpYW4gYnVsbHNleWUKYW5kIGJ1c3Rlci4gSSBhbSBnZXR0aW5nIHRo
ZSBzYW1lIGVycm9yIG9uIGJvdGggc3lzdGVtczoKCiQgbHMgL2Fmcy9jcy5zdGFuZm9yZC5lZHUK
bHM6IGNhbm5vdCBvcGVuIGRpcmVjdG9yeSAnL2Fmcy9jcy5zdGFuZm9yZC5lZHUnOiBEZXN0aW5h
dGlvbiBhZGRyZXNzIApyZXF1aXJlZAoKWW91ciB3b3JrIG1hZGUgbXkgcHJvZ3Jlc3MgcG9zc2li
bGUuIFRoYW5rcyBhIGxvdCBmb3Igc2hhcmluZyBpdC4gT25jZQp3ZSBnZXQgYSB3b3JraW5nIHBh
Y2thZ2UgSSB3aWxsIHNlZSB0aGF0IGl0IGdldHMgcHVzaGVkIGludG8gRGViaWFuLgoKQmlsbAoK
LS0gCkJpbGwgTWFjQWxsaXN0ZXIgPGJpbGxAY2EtemVwaHlyLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
