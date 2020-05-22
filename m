Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C72971DEF6F
	for <lists+linux-afs@lfdr.de>; Fri, 22 May 2020 20:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ezr6HQihuQ6GWr4We7sw0nI1mKrBilYjeE53mCqexIo=; b=TyW9nEo+Hjo48H
	VqVAzxwFIAyhG4jaF3MMU+t6jhJlAR+phoVohWM0l+tNa6AbLCFv1onPQicmpCBQfTMK3FTnDIe56
	3QzMeXWwTRTNIjaKcXEgdA0VVjHB9zjve9dgZBVDmUxBj15Q5/5HIs3QPU2Yx5VwBOnu6Kq7GBzhL
	OG2G/RXaOVDfM2K45dnFIuM6oXe2QxI427dsOKJZsIrNqTcJJ4uiqIZpjihAdMDGVVf6W8jZNmsQt
	F24pEsyrii0CkRdMyz2wkH1J2AkR/P5ZK8HlaHnh/Wz9to+te3CNuyFri8jOGUTmww96OwbOXm+Z2
	hJkwvtzHcrAPhJmfPPyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcCfn-00044Z-2a; Fri, 22 May 2020 18:45:35 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcCfk-00043a-MN
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 18:45:34 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49TFmR2lHZz9vZ2R
 for <linux-afs@lists.infradead.org>; Fri, 22 May 2020 18:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tlzG62HV3Prk for <linux-afs@lists.infradead.org>;
 Fri, 22 May 2020 13:45:27 -0500 (CDT)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49TFmR16n7z9vZ26
 for <linux-afs@lists.infradead.org>; Fri, 22 May 2020 13:45:27 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49TFmR16n7z9vZ26
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49TFmR16n7z9vZ26
Received: by mail-io1-f69.google.com with SMTP id r17so7938924ioa.1
 for <linux-afs@lists.infradead.org>; Fri, 22 May 2020 11:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcvktWzuf/YXJY7B0r0fkd4cBPlRZYMazd1bG7Knz0c=;
 b=gQ7VoiSWNDAurX2rgbSypPcmLB7w9Jvn08mBdJMJuHb25/wtGmnfpprU+6c5L3QG3/
 bzsM9SuomxldGrYsmbNh14S+TTNHtS15CQQucWHvoC50LV9ND9hkZahbIy5y9kTK4oTM
 wsnPs27cKSJV9geYLWjU3NUMGP3vRiAbaCA7ukKMzFJUUS+iCdBe0F8vudzvwOfh6Vuj
 Bci9Gp8t5f1zdZDGWPBEl9CY3EMVnwzN3R8SE0cPrUeDObg5yX5UUGbNbrpDt1pvVQf2
 I7MFa5IVLeLpg5DqLYm2Edbm/awA8ohROq2iHKNlZAyQa6VD/u9bAKg5TEtg2Ar8KX5U
 pvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcvktWzuf/YXJY7B0r0fkd4cBPlRZYMazd1bG7Knz0c=;
 b=QhjdNvHVB+7QpqQDwl0fetl8YSZ5YJD7CQaxQ5LLk01KfwZB7ondJ502q0X94JG2ZU
 vmudgpFo7Li/HH+GB9CmLdSPXmy8m2ipZ264lIXrj86CtGMbc9O1HWTDE9rCJJANAWPy
 II5uU+XU2RAarSZqMQ0F8OPRhejm5HakIL2mJknPCnJkeHPG2rcOITFilE0Wot4UCJSZ
 SexHnykySVQIXpoA+VBZODQ4FZ9qby7wMsbuK6+9MqJfilPetaFlmgHosjQSxb3aTME6
 cHjiVRVP9UEgVdWCQbu4gKP7eKy/mmE+AxoRWPYOFOJoIRw5uJkbbtgUzj2rBewZ6vpO
 Hwpg==
X-Gm-Message-State: AOAM532Naa3S+GEDpeIgs6YD5l+zcmQFMYu96BKeeok2EAJZDBn5n7vb
 0yZdmwUT3qbKllAFqmKMwvY1RHyMvP9uw2yVavUUc9G+NvyBO4n5cpAZ+SqL7O5sqrbc2PC+r4F
 L+oYaaPoKuIQVredU3FBIxFEoeQTZ5w==
X-Received: by 2002:a02:942a:: with SMTP id a39mr9335838jai.50.1590173126220; 
 Fri, 22 May 2020 11:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq7xTVOmomZtExLcWH5Wmv5DCntGP0+yx8VBEomiAdvM5u/Is+jMFWSfoirA2k795Um2KKfA==
X-Received: by 2002:a02:942a:: with SMTP id a39mr9335815jai.50.1590173125861; 
 Fri, 22 May 2020 11:45:25 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu.
 [128.101.106.4])
 by smtp.gmail.com with ESMTPSA id 13sm4012617ioo.23.2020.05.22.11.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 11:45:25 -0700 (PDT)
From: wu000273@umn.edu
To: dhowells@redhat.com
Subject: [PATCH v3] rxrpc: fix a memory leak in rxkad_verify_response().
Date: Fri, 22 May 2020 13:45:18 -0500
Message-Id: <20200522184518.26323-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_114532_815927_D354FEBF 
X-CRM114-Status: GOOD (  12.37  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.84.196.206 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: netdev@vger.kernel.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 linux-afs@lists.infradead.org, Markus.Elfring@web.de, wu000273@umn.edu,
 kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

RnJvbTogUWl1c2hpIFd1IDx3dTAwMDI3M0B1bW4uZWR1PgoKQSB0aWNrZXQgd2FzIG5vdCByZWxl
YXNlZCBhZnRlciBhIGNhbGwgb2YgdGhlIGZ1bmN0aW9uCuKAnHJ4a2FkX2RlY3J5cHRfdGlja2V0
4oCdIGZhaWxlZC4gVGh1cyByZXBsYWNlIHRoZSBqdW1wIHRhcmdldArigJx0ZW1wb3JhcnlfZXJy
b3JfZnJlZV9yZXNw4oCdIGJ5IOKAnHRlbXBvcmFyeV9lcnJvcl9mcmVlX3RpY2tldOKAnS4KCkZp
eGVzOiA4YzJmODI2ZGMzNjMxICgicnhycGM6IERvbid0IHB1dCBjcnlwdG8gYnVmZmVycyBvbiB0
aGUgc3RhY2siKQpTaWduZWQtb2ZmLWJ5OiBRaXVzaGkgV3UgPHd1MDAwMjczQHVtbi5lZHU+Ci0t
LQogbmV0L3J4cnBjL3J4a2FkLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL25ldC9yeHJwYy9yeGthZC5jIGIvbmV0
L3J4cnBjL3J4a2FkLmMKaW5kZXggMDk4ZjFmOWVjNTNiLi41MmEyNGQ0ZWY1ZDggMTAwNjQ0Ci0t
LSBhL25ldC9yeHJwYy9yeGthZC5jCisrKyBiL25ldC9yeHJwYy9yeGthZC5jCkBAIC0xMTQ4LDcg
KzExNDgsNyBAQCBzdGF0aWMgaW50IHJ4a2FkX3ZlcmlmeV9yZXNwb25zZShzdHJ1Y3QgcnhycGNf
Y29ubmVjdGlvbiAqY29ubiwKIAlyZXQgPSByeGthZF9kZWNyeXB0X3RpY2tldChjb25uLCBza2Is
IHRpY2tldCwgdGlja2V0X2xlbiwgJnNlc3Npb25fa2V5LAogCQkJCSAgICZleHBpcnksIF9hYm9y
dF9jb2RlKTsKIAlpZiAocmV0IDwgMCkKLQkJZ290byB0ZW1wb3JhcnlfZXJyb3JfZnJlZV9yZXNw
OworCQlnb3RvIHRlbXBvcmFyeV9lcnJvcl9mcmVlX3RpY2tldDsKIAogCS8qIHVzZSB0aGUgc2Vz
c2lvbiBrZXkgZnJvbSBpbnNpZGUgdGhlIHRpY2tldCB0byBkZWNyeXB0IHRoZQogCSAqIHJlc3Bv
bnNlICovCkBAIC0xMjMwLDcgKzEyMzAsNiBAQCBzdGF0aWMgaW50IHJ4a2FkX3ZlcmlmeV9yZXNw
b25zZShzdHJ1Y3QgcnhycGNfY29ubmVjdGlvbiAqY29ubiwKIAogdGVtcG9yYXJ5X2Vycm9yX2Zy
ZWVfdGlja2V0OgogCWtmcmVlKHRpY2tldCk7Ci10ZW1wb3JhcnlfZXJyb3JfZnJlZV9yZXNwOgog
CWtmcmVlKHJlc3BvbnNlKTsKIHRlbXBvcmFyeV9lcnJvcjoKIAkvKiBJZ25vcmUgdGhlIHJlc3Bv
bnNlIHBhY2tldCBpZiB3ZSBnb3QgYSB0ZW1wb3JhcnkgZXJyb3Igc3VjaCBhcwotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YWZzIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFmcwo=
