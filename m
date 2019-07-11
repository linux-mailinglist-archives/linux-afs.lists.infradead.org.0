Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF45171239
	for <lists+linux-afs@lfdr.de>; Tue, 23 Jul 2019 08:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:References:
	In-Reply-To:Date:To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMSdZZ79VCTOXRcBnHq1Lb1OS+0V+MBcxp0IX8+JnEc=; b=knX5VnjofRzw7F
	S0hJa9iFwyiG92/Tnf4tDogHXqZ5T00OfXk7Wcc95OGYi/qHhjcJvA1ZR67A9ivHTz8qQ7Faq1Y34
	MqPVRrqPqc6yX4XjfDc0w/yxiYZm88T5mhKrayQJ5jnxOcvyynEXgQv05BCZgP99Wc118Hc/386ni
	+rFdk/IV6e6KAEsM5CwhDX6V8KDt6ZGkjLa/2zlqiQq8OrgDbxFChRCnFIZjef2wbub/mbcW9Q05O
	xO6J07w/uc0GEUiWqQio/5UAyZFvBxRVbMrONIwzFtGqiiLMPyets2pUexEXN7fOYJ++X+SKW2IZm
	Q2a0FAMFVoddEJpfS+6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpol7-0008A9-B1; Tue, 23 Jul 2019 06:58:49 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlPR0-00089d-4k
 for linux-afs@lists.infradead.org; Thu, 11 Jul 2019 03:07:51 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6B37erw018109
 for <linux-afs@lists.infradead.org>; Wed, 10 Jul 2019 23:07:45 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tnqdyag2f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-afs@lists.infradead.org>; Wed, 10 Jul 2019 23:07:43 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-afs@lists.infradead.org> from <zohar@linux.ibm.com>;
 Thu, 11 Jul 2019 04:07:31 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 11 Jul 2019 04:07:28 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6B37F0p35652076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jul 2019 03:07:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5429A405B;
 Thu, 11 Jul 2019 03:07:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 735A7A4054;
 Thu, 11 Jul 2019 03:07:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.110.74])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Jul 2019 03:07:26 +0000 (GMT)
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
From: Mimi Zohar <zohar@linux.ibm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, David Howells
 <dhowells@redhat.com>, James Morris <jmorris@namei.org>,
 keyrings@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-nfs@vger.kernel.org, CIFS <linux-cifs@vger.kernel.org>,
 linux-afs@lists.infradead.org, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>, linux-integrity@vger.kernel.org, LSM List
 <linux-security-module@vger.kernel.org>, Linux List Kernel Mailing
 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Jul 2019 23:07:15 -0400
In-Reply-To: <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
References: <28477.1562362239@warthog.procyon.org.uk>
 <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
 <20190710194620.GA83443@gmail.com> <20190710201552.GB83443@gmail.com>
 <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19071103-4275-0000-0000-0000034BBC6E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071103-4276-0000-0000-0000385BC1F1
Message-Id: <1562814435.4014.11.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_200750_297616_BC9195D8 
X-CRM114-Status: GOOD (  18.58  )
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [148.163.156.1 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Mailman-Approved-At: Mon, 22 Jul 2019 23:58:43 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

SGkgTGludXMsCgpPbiBXZWQsIDIwMTktMDctMTAgYXQgMTg6NTkgLTA3MDAsIExpbnVzIFRvcnZh
bGRzIHdyb3RlOgo+IEFueXdheSwgc2luY2UgaXQgZG9lcyBzZWVtIGxpa2UgRGF2aWQgaXMgb2Zm
bGluZSwgSSd2ZSBqdXN0IHJldmVydGVkCj4gdGhpcyBmcm9tIG15IHRyZWUsIGFuZCB3aWxsIGJl
IGNvbnRpbnVpbmcgbXkgbm9ybWFsIG1lcmdlIHdpbmRvdyBwdWxsCj4gcmVxdWVzdHMgKHRoZSBv
dGhlciBpc3N1ZXMgSSBoYXZlIHNlZW4gaGF2ZSBmaXhlcyBpbiB0aGVpciByZXNwZWN0aXZlCj4g
dHJlZXMpLgoKU29ycnkgZm9yIHRoZSBkZWxheS4gwqBBbiBleGNlcHRpb24gaXMgbmVlZGVkIGZv
ciBsb2FkaW5nIGJ1aWx0aW4ga2V5cwoiS0VZX0FMTE9DX0JVSUxUX0lOIiBvbnRvIGEga2V5cmlu
ZyB0aGF0IGlzIG5vdCB3cml0YWJsZSBieSB1c2Vyc3BhY2UuCsKgVGhlIGZvbGxvd2luZyB3b3Jr
cywgYnV0IHByb2JhYmx5IGlzIG5vdCBob3cgRGF2aWQgd291bGQgaGFuZGxlIHRoZQpleGNlcHRp
b24uCgpkaWZmIC0tZ2l0IGEvc2VjdXJpdHkva2V5cy9rZXkuYyBiL3NlY3VyaXR5L2tleXMva2V5
LmMKaW5kZXggNTE5MjExYTk5NmU3Li5hOTkzMzJjMWUwMTQgMTAwNjQ0Ci0tLSBhL3NlY3VyaXR5
L2tleXMva2V5LmMKKysrIGIvc2VjdXJpdHkva2V5cy9rZXkuYwpAQCAtODk2LDcgKzg5Niw3IEBA
IGtleV9yZWZfdCBrZXlfY3JlYXRlX29yX3VwZGF0ZShrZXlfcmVmX3Qga2V5cmluZ19yZWYsCiAg
ICAgICAgLyogaWYgd2UncmUgZ29pbmcgdG8gYWxsb2NhdGUgYSBuZXcga2V5LCB3ZSdyZSBnb2lu
ZyB0byBoYXZlCiAgICAgICAgICogdG8gbW9kaWZ5IHRoZSBrZXlyaW5nICovCiAgICAgICAgcmV0
ID0ga2V5X3Blcm1pc3Npb24oa2V5cmluZ19yZWYsIEtFWV9ORUVEX1dSSVRFKTsKLSAgICAgICBp
ZiAocmV0IDwgMCkgeworICAgICAgIGlmIChyZXQgPCAwICYmICEoZmxhZ3MgJiBLRVlfQUxMT0Nf
QlVJTFRfSU4pKSB7CiAgICAgICAgICAgICAgICBrZXlfcmVmID0gRVJSX1BUUihyZXQpOwogICAg
ICAgICAgICAgICAgZ290byBlcnJvcl9saW5rX2VuZDsKICAgICAgICB9CgpNaW1pCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFmcwo=
