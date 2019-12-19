Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D9126338
	for <lists+linux-afs@lfdr.de>; Thu, 19 Dec 2019 14:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KtLurxCDKBAFhVnaUt/BDOLXyME2BSFPuwN2h5UwISo=; b=QRAA6rQ+sq+EAu
	8vs/47zWXcnpKdmuSimTtQk+bZ7k59CjPYFrUJVc0fEkqWkKXfdYaB+jDzKFLl+Sbaf6R3I+5KthE
	hTfDRdPlD5daBftRU+dfoVaTPfh9CTeRobeAu5EDySNKQqyPUvKvFPDffkNvAtliFRAMwhC5IDYT2
	3EfH84/O9ZwwgKwgcdnRD4GMnui3kv7hfVycS8C8LfnI8/jkZfhAM31q5J9lzN38PD3505DVQeOTx
	QWJ1ebhBSKnAbVRBsr5r625J+SIKDc4JThDYbbHTbhu94dS9jrHRDg7UHaRXSkyn++hCR/UrkrMV/
	Mnvy9GL8nvd0r/d2xHZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihvej-0002E5-19; Thu, 19 Dec 2019 13:15:53 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihvee-0002CL-Ho
 for linux-afs@lists.infradead.org; Thu, 19 Dec 2019 13:15:51 +0000
Received: from linux.localdomain (unknown [123.138.236.242])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxjxTod_tdXZIMAA--.55S2;
 Thu, 19 Dec 2019 21:15:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: David Howells <dhowells@redhat.com>
Subject: [PATCH] afs: Fix compile warning in afs_dynroot_lookup()
Date: Thu, 19 Dec 2019 21:14:51 +0800
Message-Id: <1576761291-30121-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
X-CM-TRANSID: AQAAf9DxjxTod_tdXZIMAA--.55S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4xuFW7ZrW3Jw4fXr1xuFg_yoWfJwcEyF
 47K3s5CrWUJr92yF4FgFWUtFs5Wws8GF4DurZxWr4DKayUAa15t3WDArZxJF47Gwnayr98
 Cw18KrsxJry7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb7AYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6ry8MxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0rgA7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_051549_052753_EE0DA662 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Rml4IHRoZSBmb2xsb3dpbmcgY29tcGlsZSB3YXJuaW5nOgoKICBDQyAgICAgIGZzL2Fmcy9keW5y
b290Lm8KZnMvYWZzL2R5bnJvb3QuYzogSW4gZnVuY3Rpb24g4oCYYWZzX2R5bnJvb3RfbG9va3Vw
4oCZOgpmcy9hZnMvZHlucm9vdC5jOjExNzo2OiB3YXJuaW5nOiDigJhsZW7igJkgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV21heWJlLXVuaW5pdGlhbGl6ZWRd
CiAgcmV0ID0gbG9va3VwX29uZV9sZW4obmFtZSwgZGVudHJ5LT5kX3BhcmVudCwgbGVuKTsKICAg
ICAgXgpmcy9hZnMvZHlucm9vdC5jOjkxOjY6IG5vdGU6IOKAmGxlbuKAmSB3YXMgZGVjbGFyZWQg
aGVyZQogIGludCBsZW47CiAgICAgIF4KClNpZ25lZC1vZmYtYnk6IFRpZXpodSBZYW5nIDx5YW5n
dGllemh1QGxvb25nc29uLmNuPgotLS0KIGZzL2Fmcy9keW5yb290LmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9h
ZnMvZHlucm9vdC5jIGIvZnMvYWZzL2R5bnJvb3QuYwppbmRleCA3NTAzODk5Li4zMDNmNzEyIDEw
MDY0NAotLS0gYS9mcy9hZnMvZHlucm9vdC5jCisrKyBiL2ZzL2Fmcy9keW5yb290LmMKQEAgLTg4
LDcgKzg4LDcgQEAgc3RhdGljIHN0cnVjdCBkZW50cnkgKmFmc19sb29rdXBfYXRjZWxsKHN0cnVj
dCBkZW50cnkgKmRlbnRyeSkKIAlzdHJ1Y3QgZGVudHJ5ICpyZXQ7CiAJdW5zaWduZWQgaW50IHNl
cSA9IDA7CiAJY2hhciAqbmFtZTsKLQlpbnQgbGVuOworCWludCBsZW4gPSAwOwogCiAJaWYgKCFu
ZXQtPndzX2NlbGwpCiAJCXJldHVybiBFUlJfUFRSKC1FTk9FTlQpOwotLSAKMi4xLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYWZzCg==
