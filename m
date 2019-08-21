Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F699AA4F
	for <lists+linux-afs@lfdr.de>; Fri, 23 Aug 2019 10:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:References:
	In-Reply-To:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IynnwoWT50xpKLzTvKILrGWZhNZSNZvmEne9AqlskcQ=; b=VipF1ac5Nmsrc7
	Gd2wzS5gHZrrVC2SMNnudpJKz9fWqUbYv347PHx4Gfnk+Jy3yKE+w0gkuWVJvb5tSL5IN2K7BgP90
	4NV7u6wwDymU4gW6ehbE3wIg8xeZ5J+25af8ZDoTWFmTS1SDjEJsuXHKgvXUvTEJHYOttBJYofyBH
	yCb+tDUSsTe1EeQ7wyR3sFJzWVSBJsXv0LOt+ns/Vkku4OUp4bX45AtVdDMPTIy6cZgHrRiTJkYHa
	cvOBnQaGgMQqEBJoVB5BPjZrcvDR4bXFOmwUBbg0LUXzVVwDfwpYuf2n8a0V/UhscTD0LnQspTO56
	CaboeiJ/NOVfVl+LjJjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i14vH-0000jn-FG; Fri, 23 Aug 2019 08:27:51 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Sls-0004um-Ie
 for linux-afs@lists.infradead.org; Wed, 21 Aug 2019 15:43:37 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LFh45L140331
 for <linux-afs@lists.infradead.org>; Wed, 21 Aug 2019 11:43:34 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uh81xtun0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-afs@lists.infradead.org>; Wed, 21 Aug 2019 11:43:34 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-afs@lists.infradead.org> from <zohar@linux.ibm.com>;
 Wed, 21 Aug 2019 16:43:32 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 21 Aug 2019 16:43:29 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LFhSk936306986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 15:43:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89B9752050;
 Wed, 21 Aug 2019 15:43:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.219.114])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2390052054;
 Wed, 21 Aug 2019 15:43:24 +0000 (GMT)
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
From: Mimi Zohar <zohar@linux.ibm.com>
To: David Howells <dhowells@redhat.com>
Date: Wed, 21 Aug 2019 11:43:23 -0400
In-Reply-To: <23498.1565962602@warthog.procyon.org.uk>
References: <1562814435.4014.11.camel@linux.ibm.com>
 <28477.1562362239@warthog.procyon.org.uk>
 <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
 <20190710194620.GA83443@gmail.com> <20190710201552.GB83443@gmail.com>
 <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
 <23498.1565962602@warthog.procyon.org.uk>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19082115-0028-0000-0000-0000039227A6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082115-0029-0000-0000-000024544FC7
Message-Id: <1566402203.5162.12.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_084336_735277_18A43985 
X-CRM114-Status: GOOD (  29.44  )
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [148.163.158.5 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Fri, 23 Aug 2019 01:27:47 -0700
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
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, James Morris <jmorris@namei.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-integrity@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gRnJpLCAyMDE5LTA4LTE2IGF0IDE0OjM2ICswMTAwLCBEYXZpZCBIb3dlbGxzIHdyb3RlOgo+
IE1pbWkgWm9oYXIgPHpvaGFyQGxpbnV4LmlibS5jb20+IHdyb3RlOgo+IAo+ID4gU29ycnkgZm9y
IHRoZSBkZWxheS4gwqBBbiBleGNlcHRpb24gaXMgbmVlZGVkIGZvciBsb2FkaW5nIGJ1aWx0aW4g
a2V5cwo+ID4gIktFWV9BTExPQ19CVUlMVF9JTiIgb250byBhIGtleXJpbmcgdGhhdCBpcyBub3Qg
d3JpdGFibGUgYnkgdXNlcnNwYWNlLgo+ID4gwqBUaGUgZm9sbG93aW5nIHdvcmtzLCBidXQgcHJv
YmFibHkgaXMgbm90IGhvdyBEYXZpZCB3b3VsZCBoYW5kbGUgdGhlCj4gPiBleGNlcHRpb24uCj4g
Cj4gSSB0aGluayB0aGUgYXR0YWNoZWQgaXMgdGhlIHJpZ2h0IHdheSB0byBmaXggaXQuCj4gCj4g
bG9hZF9zeXN0ZW1fY2VydGlmaWNhdGVfbGlzdCgpLCBmb3IgZXhhbXBsZSwgd2hlbiBpdCBjcmVh
dGVzIGtleXMgZG9lcyB0aGlzOgo+IAo+IAlrZXkgPSBrZXlfY3JlYXRlX29yX3VwZGF0ZShtYWtl
X2tleV9yZWYoYnVpbHRpbl90cnVzdGVkX2tleXMsIDEpLAo+IAo+IG1hcmtpbmcgdGhlIGtleXJp
bmcgYXMgInBvc3Nlc3NlZCIgaW4gbWFrZV9rZXlfcmVmKCkuICBUaGlzIGFsbG93cyB0aGUKPiBw
b3NzZXNzb3IgcGVybWl0cyB0byBiZSB1c2VkIC0gYW5kIHRoYXQncyB0aGUgKm9ubHkqIHdheSB0
byB1c2UgdGhlbSBmb3IKPiBpbnRlcm5hbCBrZXlyaW5ncyBsaWtlIHRoaXMgYmVjYXVzZSB5b3Ug
Y2FuJ3QgbGluayB0byB0aGVtIGFuZCB5b3UgY2FuJ3Qgam9pbgo+IHRoZW0uCgpJbiBhZGRpdGlv
biwgYXMgbG9uZyBhcyBhZGRpdGlvbmFsIGtleXMgc3RpbGwgY2FuJ3QgYmUgYWRkZWQgb3IKZXhp
c3Rpbmcga2V5cyB1cGRhdGVkIGJ5IHVzZXJzcGFjZSBvbiB0aGUgLmJ1aWx0aW5fdHJ1c3RlZF9r
ZXlzLCB0aGVuCnRoaXMgaXMgZmluZS4KCj4gCj4gRGF2aWQKPiAtLS0KPiBkaWZmIC0tZ2l0IGEv
Y2VydHMvc3lzdGVtX2tleXJpbmcuYyBiL2NlcnRzL3N5c3RlbV9rZXlyaW5nLmMKPiBpbmRleCA1
N2JlNzhiNWZkZmMuLjFmOGYyNmY3YmIwNSAxMDA2NDQKPiAtLS0gYS9jZXJ0cy9zeXN0ZW1fa2V5
cmluZy5jCj4gKysrIGIvY2VydHMvc3lzdGVtX2tleXJpbmcuYwo+IEBAIC05OSw3ICs5OSw3IEBA
IHN0YXRpYyBfX2luaXQgaW50IHN5c3RlbV90cnVzdGVkX2tleXJpbmdfaW5pdCh2b2lkKQo+ICAJ
YnVpbHRpbl90cnVzdGVkX2tleXMgPQo+ICAJCWtleXJpbmdfYWxsb2MoIi5idWlsdGluX3RydXN0
ZWRfa2V5cyIsCj4gIAkJCSAgICAgIEtVSURUX0lOSVQoMCksIEtHSURUX0lOSVQoMCksIGN1cnJl
bnRfY3JlZCgpLAo+IC0JCQkgICAgICAmaW50ZXJuYWxfa2V5X2FjbCwgS0VZX0FMTE9DX05PVF9J
Tl9RVU9UQSwKPiArCQkJICAgICAgJmludGVybmFsX2tleXJpbmdfYWNsLCBLRVlfQUxMT0NfTk9U
X0lOX1FVT1RBLAo+ICAJCQkgICAgICBOVUxMLCBOVUxMKTsKPiAgCWlmIChJU19FUlIoYnVpbHRp
bl90cnVzdGVkX2tleXMpKQo+ICAJCXBhbmljKCJDYW4ndCBhbGxvY2F0ZSBidWlsdGluIHRydXN0
ZWQga2V5cmluZ1xuIik7Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2tleXMvcGVybWlzc2lvbi5j
IGIvc2VjdXJpdHkva2V5cy9wZXJtaXNzaW9uLmMKPiBpbmRleCBmYzg0ZDllZjYyMzkuLjg2ZWZk
M2VhZjA4MyAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9rZXlzL3Blcm1pc3Npb24uYwo+ICsrKyBi
L3NlY3VyaXR5L2tleXMvcGVybWlzc2lvbi5jCj4gQEAgLTQ3LDcgKzQ3LDcgQEAgc3RydWN0IGtl
eV9hY2wgaW50ZXJuYWxfa2V5cmluZ19hY2wgPSB7Cj4gIAkudXNhZ2UJPSBSRUZDT1VOVF9JTklU
KDEpLAo+ICAJLm5yX2FjZQk9IDIsCj4gIAkuYWNlcyA9IHsKPiAtCQlLRVlfUE9TU0VTU09SX0FD
RShLRVlfQUNFX1NFQVJDSCksCj4gKwkJS0VZX1BPU1NFU1NPUl9BQ0UoS0VZX0FDRV9TRUFSQ0gg
fCBLRVlfQUNFX1dSSVRFKSwKPiAgCQlLRVlfT1dORVJfQUNFKEtFWV9BQ0VfVklFVyB8IEtFWV9B
Q0VfUkVBRCB8IEtFWV9BQ0VfU0VBUkNIKSwKPiAgCX0KPiAgfTsKClRoYW5rcywgRGF2aWQuIMKg
VGhlIGJ1aWx0aW4ga2V5cyBhcmUgbm93IGJlaW5nIGxvYWRlZC4KCk1pbWkKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYWZz
Cg==
