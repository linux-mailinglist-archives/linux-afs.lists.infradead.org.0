Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334B17497D
	for <lists+linux-afs@lfdr.de>; Sat, 29 Feb 2020 22:08:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version
	:References:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwUQkVFppdj15fOIuYmPj8Leznw7cd7ofPXt8jP4CU0=; b=EcfUMFNIfnNOWk
	C7lvEvW0VRUDWl6xtAgTrTWNxgbkLPVtrFwKRjvBgk8kOT4qVtdon3WYciv8LVQVbzFHMd3HVUL6C
	pW90dskH26yaabumrE7fCOxxbgXGyIWOVqw7e1NR0A+CsqAD2dSWFodn7abfHz1E5Qk7Hr1jk8Ue0
	aneo1fOyoLxW9fQAl3MpoesoRz0sHgu6kJCWL5tOu9dIV+3M5HUVQYzIALWdg1O3LCWN0IjCt6uCM
	+Msy0lfQO5aTgIbscllFAD/THozYiB5PgbzAwtf1juk56n3TNpeq7B1Ps8Fpi17RFpcY3dsS0Z6ae
	aFUpSj0QC4AGtZ+ExVQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j89Kk-0008JG-DS; Sat, 29 Feb 2020 21:07:38 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j89Kh-0008Ih-3r
 for linux-afs@lists.infradead.org; Sat, 29 Feb 2020 21:07:36 +0000
Received: by mail-ot1-x341.google.com with SMTP id v19so5997544ote.8
 for <linux-afs@lists.infradead.org>; Sat, 29 Feb 2020 13:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=date:in-reply-to:references:mime-version:content-transfer-encoding
 :subject:to:cc:from:message-id;
 bh=XhnpUp2t5BYr+vjQteFX6IVYdMEHfcGesAMX6AlMCt0=;
 b=QDfwxIWSPhJiOqJ0SPMMwbW0SontgVp9orPFhcNaGOzAvLjIrBfL3NYkxLIOaDKMPw
 8wglTJ/nxWSG6viqMqcL1WtcaRenzlhe6e5QEZWee0g+iWk+kGGYMmfKIsqtfN88Oebw
 DjsH3a9N2yYJgpOmUgcoyh3QyBc5dXjaM5rdfrDgYPWEMdPU7coK0YEyqKm4AFT8aUY+
 GQ2KULGNE0iRbDnlZvfOtKhVsEO/7EjqUdYBTTS4ctegXB6h7W7AmEDG3T+1HxWV5S+6
 u4+wXTyjt6FDnYuH0X/DeP4jsp6iqRVSd3eKoIiTQZY5V8O4I9Slif1E77owpcwGvy4R
 u33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=XhnpUp2t5BYr+vjQteFX6IVYdMEHfcGesAMX6AlMCt0=;
 b=Z6VG/FUjGiWlvHhp9qHNVHPX/sQ82rxEXvVdN6oNVUfkjmbUgpitRIGDFqAL1y0vgN
 w8p4WOPs4dNVpeq2JG/CjhoPR94n7qoKrf/A9wHUDdi4VDnIVi7rC9Kh+4PWjGbJwnOS
 YAtoLJmZsY2IEwdLhNSctPavvFFU65HMNuAois9fyWxbQdNEP8hBkEbDlgXL4XfGM95F
 qPeQIvTS3TPF0v11wFSW9n0+ErcH/b6d/z/DwMHmES/bf9m//D0LCOIagXlya4PgdCFa
 e/bEfGTJeXdYYs3VepgXG187+QCBe0v0emYteT/8nI/8N0weJzLCds+UHsdl9c7apYjU
 kOUw==
X-Gm-Message-State: APjAAAWVgEYTA1/9pFLH019aeOQqYHOez2WURWuJmCuVoHkp662A5Etv
 /HG8z43LgomBm602K1doa6e2aA==
X-Google-Smtp-Source: APXvYqzC7fRJyy2EXwP2wCKRRZu8U6D5af7cFngzj0erHbhS9IHC1uGqgO4z10UHFyQyVL3x/t1HaA==
X-Received: by 2002:a9d:3df6:: with SMTP id l109mr7868865otc.284.1583010451794; 
 Sat, 29 Feb 2020 13:07:31 -0800 (PST)
Received: from ?IPv6:2607:fb90:c821:e071:5a64:daf:e14:fce3?
 ([2607:fb90:c821:e071:5a64:daf:e14:fce3])
 by smtp.gmail.com with ESMTPSA id i13sm4576867oik.7.2020.02.29.13.07.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Feb 2020 13:07:31 -0800 (PST)
Date: Sat, 29 Feb 2020 14:07:28 -0700
In-Reply-To: <5176a0ceacc80e2ac54b0865cd58b8b4@ca-zephyr.org>
References: <20200229092155.23965-1-olsonse@umich.edu>
 <005EF5A0-4D79-4355-9DD3-DEDF0FA68326@auristor.com>
 <5176a0ceacc80e2ac54b0865cd58b8b4@ca-zephyr.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Add debian build package
To: Bill MacAllister <bill@ca-zephyr.org>,
 Jeffrey Eric Altman <jaltman@auristor.com>
From: Spencer E Olson <olsonse@umich.edu>
Message-ID: <77828951-2056-45B9-B52E-85AC43B62CBD@umich.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_130735_215528_137E1DB3 
X-CRM114-Status: GOOD (  14.05  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:341 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
 linux-afs@lists.infradead.org, Spencer Olson <olsonse@umich.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gRmVicnVhcnkgMjksIDIwMjAgMTA6MDc6MDIgQU0gTVNULCBCaWxsIE1hY0FsbGlzdGVyIDxi
aWxsQGNhLXplcGh5ci5vcmc+IHdyb3RlOgo+T24gMjAyMC0wMi0yOSAwNDoyMiwgSmVmZnJleSBF
cmljIEFsdG1hbiB3cm90ZToKPj4+IE9uIEZlYiAyOSwgMjAyMCwgYXQgNDoyMyBBTSwgU3BlbmNl
ciBFLiBPbHNvbiA8b2xzb25zZUB1bWljaC5lZHU+IAo+Pj4gd3JvdGU6Cj4+PiAKPj4+IO+7v1Np
Z25lZC1vZmYtYnk6IFNwZW5jZXIgRS4gT2xzb24gPG9sc29uc2VAdW1pY2guZWR1Pgo+Pj4gLS0t
Cj4+PiAKPj4+IFRoaXMgcGF0Y2ggYWRkcyBkZWJpYW4gcGFja2FnaW5nIHRvIGthZnMtY2xpZW50
LiAgVGhpcyBwYXRjaCBhbHNvIAo+Pj4gaW5jbHVkZXMgYW4KPj4+IGF1dG8tY2hhbmdlbG9nIGdl
bmVyYXRvciB0aGF0IGNyZWF0ZXMgdGhlIGNoYW5nZWxvZyByZXF1aXJlZCBpbiB0aGUgCj4+PiBw
cm9wZXIKPj4+IGZvcm1hdCBmb3IgZGViaWFuIHBhY2thZ2VzLiAgVGhpcyBnZW5lcmF0b3IgdGFr
ZXMgdGhlIGNoYW5nZWxvZyAKPj4+IGNvbnRlbnQgZGlyZWN0bHkKPj4+IGZyb20gdGhlIGdpdCBs
b2cgKGFzIHN1Y2gsIGl0IHdvdWxkIGJlIGNoYWxsZW5naW5nIHRvIHByb3Blcmx5IGJ1aWxkCj4K
Pj4+IHRoaXMgZGViaWFuCj4+PiBwYWNrYWdlIHdpdGhvdXQgdGhlIGdpdCByZXBvc2l0b3J5IHBy
ZXNlbnQpLgo+Pj4gCj4+IAo+PiBIaSBTcGVuY2VyLAo+PiAKPj4gVGhhbmtzIGZvciB0aGUgbXVj
aCBuZWVkZWQgY29udHJpYnV0aW9uLgo+PiAKPj4gSXMgdGhpcyBwYXRjaCBpZGVudGljYWwgdG8g
dGhlIG9uZSBpbiBnaXRodWIuY29tL09sc29u4oCZcy9rYWZzLWNsaWVudC8KPj8KPj4gCj4+IElm
IHNvLCBCaWxsIE1hY0FsbGlzdGVyIGhhcyBhIG51bWJlciBvZiBjaGFuZ2VzIHRvIGl0IGZyb20g
aGlzIHdvcmsKPj4gZHVyaW5nIHRoZSByZWNlbnQgaGFja2F0aG9uIGF0IFZhdWx0LiAgSeKAmXZl
IGNj4oCZZCBCaWxsIG9uIHRoaXMgcmVwbHkuCj4+IAo+PiBKZWZmcmV5IEFsdG1hbgo+Cj5TcGVu
Y2VyLAo+Cj5JIGhhZCBiZWVuIHdvcmtpbmcgb24gY3JlYXRpbmcgYSBwYWNrYWdlIGZvciBrYWZz
IGFuZCBoYWQgbm90IGdvdHRlbgo+dmVyeSBmYXIuIEkgaGFkIGNyZWF0ZWQgZnJvbSBEYXZpZCdz
IHNvdXJjZSBhbmQgd2FzIHRyeWluZyB0byBnZXQgYQo+ZGViaWFuIHBhY2thZ2UgdGhhdCB3b3Vs
ZCBidWlsZC4gV2hlbiBKZWZmIHRvbGQgbWUgb2YgeW91ciB3b3JrIElqdXN0Cj5yZXBsYWNlZCBt
eSBkZWJpYW4gZGlyZWN0b3J5IHdpdGggeW91cnMuIFRoZSByZXN1bHRhbnQgcGFja2FnZSBidWls
dAo+aW1hZ2VzLCBidXQgZGlkIG5vdCByZXN1bHQgaW4gYSBjb21wbGV0ZSBwYWNrYWdlLiBNeSBj
aGFuZ2VzIGFyZSBtb3N0bHkKPnRvIHRoZSBpbnN0YWxsIGZpbGVzIGluIHRoZSBkZWJpYW4gZGly
ZWN0b3J5LiBUaGUgY3VycmVudCB3b3JrIGlzIAo+YXZhaWxhYmxlCj5hdCBnaXRAZ2l0aHViLmNv
bTp3aG0va2Fmcy1jbGllbnQuZ2l0IGFuZCBteSBjdXJyZW50IGJ1aWxkIGJyYW5jaCBpcyBpbgo+
bWFzdGVyLW9sc29uc2UuCj4KPlRoZSBwYWNrYWdlIGJ1aWxkcyBhbmQgaW5zdGFsbHMuIEl0IGlz
IHBvc3NpYmxlIHRvIGFrbG9nLWthZnMsIGJ1dCBJCj5hbSBub3QgYWJsZSB0byBhY2Nlc3MgQUZT
IGNlbGxzIHlldC4gSSBhbSB0ZXN0aW5nIG9uIERlYmlhbiBidWxsc2V5ZQo+YW5kIGJ1c3Rlci4g
SSBhbSBnZXR0aW5nIHRoZSBzYW1lIGVycm9yIG9uIGJvdGggc3lzdGVtczoKPgo+JCBscyAvYWZz
L2NzLnN0YW5mb3JkLmVkdQo+bHM6IGNhbm5vdCBvcGVuIGRpcmVjdG9yeSAnL2Fmcy9jcy5zdGFu
Zm9yZC5lZHUnOiBEZXN0aW5hdGlvbiBhZGRyZXNzIAo+cmVxdWlyZWQKPgo+WW91ciB3b3JrIG1h
ZGUgbXkgcHJvZ3Jlc3MgcG9zc2libGUuIFRoYW5rcyBhIGxvdCBmb3Igc2hhcmluZyBpdC4gT25j
ZQo+d2UgZ2V0IGEgd29ya2luZyBwYWNrYWdlIEkgd2lsbCBzZWUgdGhhdCBpdCBnZXRzIHB1c2hl
ZCBpbnRvIERlYmlhbi4KPgo+QmlsbAoKVHJ5aW5nIGFnYWluIHdpdGggYSBiZXR0ZXIgZW1haWwg
Y2xpZW50Li4uCgpOb3QgYSBwcm9ibGVtLsKgIEluIGFueSBjYXNlLCB0aGUgZXJyb3IgdGhhdCB5
b3UgYXJlIHNlZWluZyBpcyB0aGUgc2FtZSBlcnJvciB0aGF0IEkgYW0gc2VlaW5nLsKgIEkgaGFk
bid0IGJlZW4gdXNpbmcga2FmcyBmb3Igc29tZSB0aW1lLCBzbyBJIGNhbid0IHRlbGwgd2hlbiB0
aGlzIHN0YXJ0ZWQuwqAgSSd2ZSB0cmllZCB1c2luZyB0aGUgZHluIG1vdW50IG9wdGlvbiwgbW91
bnRpbmcgdGhlIHJvb3QuYWZzIGFuZCByb290LmNlbGwsIGFsbCB3aXRoIHRoZSBzYW1lIHJlc3Vs
dC7CoCBJJ3ZlIHRyaWVkIHVzaW5nIGV4aXN0aW5nIGFmc2RiIGVudHJpZXMgYW5kIGFsc28gbWFu
dWFsbHkgc3BlY2lmeWluZyBzZXJ2ZXJzLsKgIEkgbm9ybWFsbHkgaGF2ZSBteSBmaXJld2FsbCB2
ZXJ5IHJlc3RyaWN0aXZlLCBidXQgSSB0cmllZCBkaXNhYmxpbmcgaXQgZW50aXJlbHkuCgoKSWYg
eW91IGZpZ3VyZSBvdXQgd2hhdCBpcyBnb2luZyBvbizCoGxldCBtZSBrbm93LgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
ZnMK
