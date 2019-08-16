Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C52292804
	for <lists+linux-afs@lfdr.de>; Mon, 19 Aug 2019 17:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:MIME-Version:Subject:To
	:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMIg+/bY8Fg6bOJqFSSfaxpbECU7bn5OJMiI4258zDE=; b=u/F8AtiqY6bNMA
	o8tvZJWeakzIPFBg+wrx7yMzHq7B5rf2/PqFcWBi2oQzDEw+WvIuchnU58QKkEXqOh1H5dR0uySmE
	bSNY5dJ5wN3Q1WGwQQ6EZNybfi5S4IciPUdTgzfQW+154t40OEX9GheH5OT6V1DglbUIi6qFRQTpR
	P6ngHGxeZQOVHG/t5DnNmZdDOXEcsMxazG2tjR3N4XBzUwY2OX00gsuqx+FqVYyJ/zRbcjkx4/N5i
	fhpB96/g1RqeR6d1VimaPg9IYQwSAxohuEqzJoNHRHIakkYlfudsJQG5Lj3pfcbpQ7NxoRFWIWtEA
	fSiKuzG3lR7XFnXAwhrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzjHF-0000u1-Q1; Mon, 19 Aug 2019 15:08:57 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hycPO-0006Bz-TB
 for linux-afs@lists.infradead.org; Fri, 16 Aug 2019 13:36:48 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 335931108;
 Fri, 16 Aug 2019 13:36:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ED0BA4FAC;
 Fri, 16 Aug 2019 13:36:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1562814435.4014.11.camel@linux.ibm.com>
References: <1562814435.4014.11.camel@linux.ibm.com>
 <28477.1562362239@warthog.procyon.org.uk>
 <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
 <20190710194620.GA83443@gmail.com> <20190710201552.GB83443@gmail.com>
 <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
MIME-Version: 1.0
Date: Fri, 16 Aug 2019 14:36:42 +0100
Message-ID: <23498.1565962602@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 16 Aug 2019 13:36:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_063646_952753_16CA16A7 
X-CRM114-Status: GOOD (  13.92  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Mailman-Approved-At: Mon, 19 Aug 2019 08:08:56 -0700
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
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 LSM List <linux-security-module@vger.kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-integrity@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

TWltaSBab2hhciA8em9oYXJAbGludXguaWJtLmNvbT4gd3JvdGU6Cgo+IFNvcnJ5IGZvciB0aGUg
ZGVsYXkuIMKgQW4gZXhjZXB0aW9uIGlzIG5lZWRlZCBmb3IgbG9hZGluZyBidWlsdGluIGtleXMK
PiAiS0VZX0FMTE9DX0JVSUxUX0lOIiBvbnRvIGEga2V5cmluZyB0aGF0IGlzIG5vdCB3cml0YWJs
ZSBieSB1c2Vyc3BhY2UuCj4gwqBUaGUgZm9sbG93aW5nIHdvcmtzLCBidXQgcHJvYmFibHkgaXMg
bm90IGhvdyBEYXZpZCB3b3VsZCBoYW5kbGUgdGhlCj4gZXhjZXB0aW9uLgoKSSB0aGluayB0aGUg
YXR0YWNoZWQgaXMgdGhlIHJpZ2h0IHdheSB0byBmaXggaXQuCgpsb2FkX3N5c3RlbV9jZXJ0aWZp
Y2F0ZV9saXN0KCksIGZvciBleGFtcGxlLCB3aGVuIGl0IGNyZWF0ZXMga2V5cyBkb2VzIHRoaXM6
CgoJa2V5ID0ga2V5X2NyZWF0ZV9vcl91cGRhdGUobWFrZV9rZXlfcmVmKGJ1aWx0aW5fdHJ1c3Rl
ZF9rZXlzLCAxKSwKCm1hcmtpbmcgdGhlIGtleXJpbmcgYXMgInBvc3Nlc3NlZCIgaW4gbWFrZV9r
ZXlfcmVmKCkuICBUaGlzIGFsbG93cyB0aGUKcG9zc2Vzc29yIHBlcm1pdHMgdG8gYmUgdXNlZCAt
IGFuZCB0aGF0J3MgdGhlICpvbmx5KiB3YXkgdG8gdXNlIHRoZW0gZm9yCmludGVybmFsIGtleXJp
bmdzIGxpa2UgdGhpcyBiZWNhdXNlIHlvdSBjYW4ndCBsaW5rIHRvIHRoZW0gYW5kIHlvdSBjYW4n
dCBqb2luCnRoZW0uCgpEYXZpZAotLS0KZGlmZiAtLWdpdCBhL2NlcnRzL3N5c3RlbV9rZXlyaW5n
LmMgYi9jZXJ0cy9zeXN0ZW1fa2V5cmluZy5jCmluZGV4IDU3YmU3OGI1ZmRmYy4uMWY4ZjI2Zjdi
YjA1IDEwMDY0NAotLS0gYS9jZXJ0cy9zeXN0ZW1fa2V5cmluZy5jCisrKyBiL2NlcnRzL3N5c3Rl
bV9rZXlyaW5nLmMKQEAgLTk5LDcgKzk5LDcgQEAgc3RhdGljIF9faW5pdCBpbnQgc3lzdGVtX3Ry
dXN0ZWRfa2V5cmluZ19pbml0KHZvaWQpCiAJYnVpbHRpbl90cnVzdGVkX2tleXMgPQogCQlrZXly
aW5nX2FsbG9jKCIuYnVpbHRpbl90cnVzdGVkX2tleXMiLAogCQkJICAgICAgS1VJRFRfSU5JVCgw
KSwgS0dJRFRfSU5JVCgwKSwgY3VycmVudF9jcmVkKCksCi0JCQkgICAgICAmaW50ZXJuYWxfa2V5
X2FjbCwgS0VZX0FMTE9DX05PVF9JTl9RVU9UQSwKKwkJCSAgICAgICZpbnRlcm5hbF9rZXlyaW5n
X2FjbCwgS0VZX0FMTE9DX05PVF9JTl9RVU9UQSwKIAkJCSAgICAgIE5VTEwsIE5VTEwpOwogCWlm
IChJU19FUlIoYnVpbHRpbl90cnVzdGVkX2tleXMpKQogCQlwYW5pYygiQ2FuJ3QgYWxsb2NhdGUg
YnVpbHRpbiB0cnVzdGVkIGtleXJpbmdcbiIpOwpkaWZmIC0tZ2l0IGEvc2VjdXJpdHkva2V5cy9w
ZXJtaXNzaW9uLmMgYi9zZWN1cml0eS9rZXlzL3Blcm1pc3Npb24uYwppbmRleCBmYzg0ZDllZjYy
MzkuLjg2ZWZkM2VhZjA4MyAxMDA2NDQKLS0tIGEvc2VjdXJpdHkva2V5cy9wZXJtaXNzaW9uLmMK
KysrIGIvc2VjdXJpdHkva2V5cy9wZXJtaXNzaW9uLmMKQEAgLTQ3LDcgKzQ3LDcgQEAgc3RydWN0
IGtleV9hY2wgaW50ZXJuYWxfa2V5cmluZ19hY2wgPSB7CiAJLnVzYWdlCT0gUkVGQ09VTlRfSU5J
VCgxKSwKIAkubnJfYWNlCT0gMiwKIAkuYWNlcyA9IHsKLQkJS0VZX1BPU1NFU1NPUl9BQ0UoS0VZ
X0FDRV9TRUFSQ0gpLAorCQlLRVlfUE9TU0VTU09SX0FDRShLRVlfQUNFX1NFQVJDSCB8IEtFWV9B
Q0VfV1JJVEUpLAogCQlLRVlfT1dORVJfQUNFKEtFWV9BQ0VfVklFVyB8IEtFWV9BQ0VfUkVBRCB8
IEtFWV9BQ0VfU0VBUkNIKSwKIAl9CiB9OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFmcwo=
