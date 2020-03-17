Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD29189662
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 08:58:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/vrn3LDq9e8qbQTyZiyQWCAoDK8yzgNXO6LilNfzUtg=; b=Xc13lzDpbFRh1AVaa9HINs/qj7
	bu9Hw0h8ZU7xYVdsjInqSJCTIbnOrdiG/k+QQo1nkkGc5xo6hNVkmPaq27ETqFIIW4hJ18tAzTMj+
	km4i+fpY7TrQPT2VRk+UyQFhfMz8TTZvI+UWp1GwvGbBHlOq9fnYOAWM1TdF7rt4+D8NCPoMv0r5m
	HRncMER7ym/ecWJy6Tk4nUlJNPL5m5Ve/28J6AXnDOAbvCrrVhdWZfLh4MmA9gtl7vj5Snc1jbpTj
	xvhJozhUgSpDWUNDFJ2iv5nseJIaFHpEP7tZXmcx2rPFrFKm0NAKiCsJt+4SX2eNNxG6H6JhquVbS
	arHR0dlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETaJ-0002Ns-3b; Wed, 18 Mar 2020 07:57:51 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7o-00008b-FB
 for linux-afs@bombadil.infradead.org; Tue, 17 Mar 2020 19:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TLh7fxXRQ0dpTKGNzTwR3rofoc+DNuOkh1kniQaCX2c=; b=ykb+8rbeBgtQSM4h2/H3rIT0i/
 ajnNF3XkFBMZcX2peWNd8fDGt7zkao6w2lzOLkbtpJsftGvGemXcNQP2aFN6mf0SfBBH6swW2C70w
 52f9BLl+K4/npAXlMqxXc2wo5k0ZXg41qjjoLlCi6fLA/tn4IujLT1wryhyCqfmWT67c5a9C9+0I0
 15S9piHh61/P7vnnbKW1W8v55JTKtQOoGJb998+rkA2ohEY0hXphwjKnIKEGTLV785/S7UfcqRrW1
 HavXPyqlsiIYpNoOjmx4h8QWyaLL7gh5EeDEdW6BeJIGpdWPp2+qtaQvgtxeu0lhuDKeobgMopSMq
 lHJEFtoA==;
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEI7m-00006U-CY
 for linux-afs@lists.infradead.org; Tue, 17 Mar 2020 19:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584474177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=TLh7fxXRQ0dpTKGNzTwR3rofoc+DNuOkh1kniQaCX2c=;
 b=NKKaynpEaE8uqzZ75kCZn94mBE/C/Sv/W+TDWQntCfoc/UdGtJGVgcvjhKyGjQcAXCAGrs
 1yjuj4S28PItp7LnnOkYuuxNcQaOVYBDhkK55zw70jbciIPZMeEG3ks2TrHx1x6/+oEPee
 J5t3T1AhM+uOG34nu65TOIhfAXmooLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-2XksrESOO-SPPeqVQnymNg-1; Tue, 17 Mar 2020 15:42:52 -0400
X-MC-Unique: 2XksrESOO-SPPeqVQnymNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22C14107B7D9;
 Tue, 17 Mar 2020 19:42:48 +0000 (UTC)
Received: from llong.com (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF55910016EB;
 Tue, 17 Mar 2020 19:42:43 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v4 3/4] KEYS: Remove __user annotation from dns_resolver_read()
Date: Tue, 17 Mar 2020 15:41:39 -0400
Message-Id: <20200317194140.6031-4-longman@redhat.com>
In-Reply-To: <20200317194140.6031-1-longman@redhat.com>
References: <20200317194140.6031-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Wed, 18 Mar 2020 00:57:49 -0700
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Chris von Recklinghausen <crecklin@redhat.com>,
 Eric Biggers <ebiggers@google.com>, netdev@vger.kernel.org,
 Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Roberto Sassu <roberto.sassu@huawei.com>, Waiman Long <longman@redhat.com>,
 linux-integrity@vger.kernel.org, linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

As the keyctl_read_key() has been modified to use a temporary kernel
buffer to read out the key data instead of passing in the user-supplied
buffer directly, there is no need to use the __user annotation for
dns_resolver_read().

Signed-off-by: Waiman Long <longman@redhat.com>
---
 net/dns_resolver/dns_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/dns_resolver/dns_key.c b/net/dns_resolver/dns_key.c
index 3e1a90669006..ad53eb31d40f 100644
--- a/net/dns_resolver/dns_key.c
+++ b/net/dns_resolver/dns_key.c
@@ -302,7 +302,7 @@ static void dns_resolver_describe(const struct key *key, struct seq_file *m)
  * - the key's semaphore is read-locked
  */
 static long dns_resolver_read(const struct key *key,
-			      char __user *buffer, size_t buflen)
+			      char *buffer, size_t buflen)
 {
 	int err = PTR_ERR(key->payload.data[dns_key_error]);
 
-- 
2.18.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
