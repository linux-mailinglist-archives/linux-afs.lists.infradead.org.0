Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 214141EBFAF
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jun 2020 18:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IPTVCRyetz2ZFq16T5UoZkaBCp9yMJajSPmQZkfXsL4=; b=R/fZwOajJxJcES
	kb5yUAH06tYYOUg6+mOEXgPkX3cT4om8P7RIxkYDWGdq/B+FQItuzZD6URYQ2cbfbSDqzT15IEiuk
	jjCQSUmmFQEmSBSrBpFnuvdw/gJcSUx0/avaBTEEyp4tE9VECjzPFmHqtjWbWFvyVaK6iVa4owTyS
	AEGNAi26iKWZYvWEq+3PRe2eTzCPRq/wToIc3axy4PmPDrratiC2ATXDGg6wTFmosVEmd4TEm11GB
	D5inCX4l2tO2o/ixy/8vUZbY9mqC+sVcH+DOijjJg03lBFx2pUJfB+F5MXzuNd/q5ttvPDiS19ruf
	eLLvOIRIkOBfHBWPyCDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg9Vv-0005Fu-Fk; Tue, 02 Jun 2020 16:11:43 +0000
Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfiXl-0004Eh-Ma
 for linux-afs@lists.infradead.org; Mon, 01 Jun 2020 11:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591010625;
 bh=xt7UBTUtnPCk2kQqG2DBLHWgWmmfl2MNlsqBgwKrxh8=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=agUgQtvmKB1xWe++jLGw/jueqPT9ZcjJU3TSKrI9ZPiXccXMpahkk0Jm4h0Yao+dj
 4w366g9v5iTuTgJaSGCyO9mjop9DF/T4O24vyvqTYuHfl4T7kHmNFTUCtxLVHLoVyC
 z4A/L/HhxRIwr5jdPAby19hDEmyUDA4QxLAWk4lw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.133.32]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lm4TR-1j6ecc2oqn-00Zc3C; Mon, 01
 Jun 2020 13:18:19 +0200
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] afs: Fix memory leak in afs_put_sysnames()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d8e5aa79-3f83-a5de-5aa8-7bd4a287646e@web.de>
Date: Mon, 1 Jun 2020 13:18:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:7UZ2ljg9iRO9n5ouO6yzuqJb+diD4FwJh0QhXsS5Q3MxXnZca2E
 umEqRRNgksEDnzkSgOrvaKbW1+P981gQrdeI1KeF2TnupVAfaOQe0o8sxLNbj23SLMLtFXV
 Vr7zEVLCkrzh0dPb0pSbsgaUX6GBlVC5lE0AZ1C2hWZEZ4WCnQ/a2XGnlyXjicnq46Slva8
 zu8emk0Cr2rVbZfcag4oQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xdygHgNtufk=:8X8rU4Zg7GxPqMxDIQ2Zt/
 pVZJ1VlqQ1ai6P1qHHs/R9kQgQYCEMBwVNCQ4bHOHhETm5F03cc6I3BPHfg1zfC6i5GeORFvg
 jqgPErEkog+7neRwbSPdxUAkpqn3QSLGxM4jWzv3Mnv5LnPcbgZZig76UMY0SE2o0r6G9ZyBn
 /QTneqJdWo7D3k8kXZpP069ZN9IvmykNVkNF4U7UYKpPebwmpCQXrmjLQPBokkd9Dl2IBNNsN
 714NfBfOjWAU5DijQB2ZLFvzN5QftjMCEIz0ufO9OAkiWgZ+Y+9/L4tYiMV88OpzAfw6ojzHP
 D0LLG2TLFFkD6q1/CMiwuhvoQcZg5jqTQS968nABtObbWloj3USP4isCL5aWH5s0FdtNjR3aM
 g9sHVZaa9oYO1qLHfegApl9M9LRN806e2/FuSPgU7BQPhqp5EdGfk677mQ5n3KOWQEBkxHSYP
 6wXxJ3CKD9HCL6x1S+CscjCYOKGip92bfuXGiT8tkSzKc1HnWXX5YKHnTiTlDJzDXTqQSGifR
 BtHS3Cum009/HxSBSbEf408JMLzYSomtQnqfVQed6Qr3rUzMiwirJ43nlRjNvDcuUjIetmITD
 Rhx3AubP/URV8ecSOoEXpTMzc69SYMhPEi4jAHnuWOKzC4YIaggfgPQFs74KJHjFbn6uFtN9K
 ROgwBgh7iwEXKH9DfBfQIzVtoXe0Lz9LhZfdEW18Fxhoe4dedgguJec261iQUWH17qk6qB+g2
 hciO0Ws8pjd5FwxDMyL/uBx091WYIX0p5GHiL/9R+cXdz9Ns8KGN/TZyWIJFsQdTsWBx8+ZxN
 p+urOmzF+2pGTElNbMdzaEceEOPY3BNztE2pwj/Ihv00mZ9SOEarPbTqXE/Xt93zSKb5LCBg2
 N65TvriTktJZ6YPtN3MDlfNw1KYY8XSAn7x4Am62xJAdnApIPDanLZOv2YcFARsbO15+k2/hb
 BD7uZoYP5NhFtS+42idaIR2nPTwXmLsbAZSDO65mFW6nvYrpV1xpb+AGTKQ7tdR/AyS9jyfYk
 W01hPZM1OoKVYqI1idWKr1rgh5SBzPccG8/utgohiGVaOA88u2l8Vn5LmdYM2REFAjChNFI+G
 JnWab39vRu9nzsPCcUcRqLvX3gIEoXQ1zI+LJ1ALJWUCbhgY1vVCyfBaFzej4nGRhf56J/Czf
 U4ousr5PsAyz+PpHWIqI7HEYZ5x+3/HyJ6EUmj5v0nr9x+EKYy1MzVIhlGDlGiCzOxff2uzVQ
 3j2GuPb51NQi/evIR
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_042350_032058_F35304AE 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.15.14 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [markus.elfring[at]web.de]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.15.14 listed in wl.mailspike.net]
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:11:41 -0700
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
Cc: David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org,
 Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

PiBzeXNuYW1lcyBzaG91bGQgYmUgZnJlZWQgYWZ0ZXIgcmVmY250IGJlaW5nIGRlY3JlYXNlZCB0
byB6ZXJvIGluCj4gYWZzX3B1dF9zeXNuYW1lcygpLgoKKiBJIHN1Z2dlc3QgdG8gdXNlIHRoZSB3
b3JkaW5nIOKAnHJlZmVyZW5jZSBjb3VudGVy4oCdLgoKKiBXaGVyZSBkaWQgeW91IG5vdGljZSBh
IOKAnG1lbW9yeSBsZWFr4oCdIGhlcmU/CgoKPiBCZXNpZGVzLCBpdCB3b3VsZCBiZSBiZXR0ZXIg
c2V0IG5ldC0+c3lzbmFtZXMKPiB0byAnTlVMTCcgYWZ0ZXIgbmV0LT5zeXNuYW1lcyBiZWluZyBy
ZWxlYXNlZCBpZiBhZnNfcHV0X3N5c25hbWVzKCkKPiBhaW1zIG9uIGFuIGFmc19zeXNuYW1lcyBv
YmplY3QuCgoqIFdvdWxkIHlvdSBsaWtlIHRvIGNvbnNpZGVyIGFuIGFkanVzdG1lbnQgZm9yIHRo
aXMgaW5mb3JtYXRpb24/CgoqIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRkIGFuIGltcGVy
YXRpdmUgd29yZGluZz8KCiogV2lsbCB0aGUgdGFnIOKAnEZpeGVz4oCdIGJlY29tZSByZWxldmFu
dCBmb3IgdGhlIGNvbW1pdCBtZXNzYWdlPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYWZzCg==
