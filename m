Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD141DEDCE
	for <lists+linux-afs@lfdr.de>; Fri, 22 May 2020 19:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ezr6HQihuQ6GWr4We7sw0nI1mKrBilYjeE53mCqexIo=; b=RWtMMnmk8UO5Se
	iA36r9d4xjWCkWfbkoSa2N28eg6S6ZQR35VEHlJE2+70p5G3nT2zFj0Jy1uYvE3iCbjcQnzmXbjoZ
	yVe5XzdL4HIhCZ6FTFebTq7rb7Pycbjcn/4H4MEMheDZ2OzhfFrLt45UEPd9AB00q3/fAdBwTK1UG
	xFKM2qWJcC2V1n23YGMIXXgiYwfES+wfJvZ7smilJBXTTuc7RxgcJVXwd7fvz7gn0xuuBsPN4KYCd
	sljUjRlbzxtsxfecMYHYJHhqIHTKOmSf8tHKQJPEnFaGq+kZ13lLyjCBUdLSTTaZ9FHy0Tz119vXg
	+UocG3bKzF+tz5o9IVNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcB3j-0003qd-4e; Fri, 22 May 2020 17:02:11 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcB3g-0003py-Ju
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 17:02:10 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49TCT52ql2z9vq6H
 for <linux-afs@lists.infradead.org>; Fri, 22 May 2020 17:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qse8tti6OFrG for <linux-afs@lists.infradead.org>;
 Fri, 22 May 2020 12:02:01 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49TCT51FCXz9vq5k
 for <linux-afs@lists.infradead.org>; Fri, 22 May 2020 12:01:59 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49TCT51FCXz9vq5k
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49TCT51FCXz9vq5k
Received: by mail-il1-f199.google.com with SMTP id g17so9177007iln.13
 for <linux-afs@lists.infradead.org>; Fri, 22 May 2020 10:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcvktWzuf/YXJY7B0r0fkd4cBPlRZYMazd1bG7Knz0c=;
 b=RPyx5VKZg01nlilTUwX5Cmiq3CYO1XGWWWpwNXEK7NinUgy+CEPWCAB5Rw0fQ2MW/h
 v7yt5WyOEyoMtST0NTAnPyD5sZq8NKBky5hEKpu3vgfPED3qBNYzj4oiUl4G6nNihcBC
 ZWbHrKs/Q6vCDck4adYyE2HOAaxtk926rpEE+Tq/QmCMsY5mF2WJFm1vNwV5IyL2E6ta
 s9Ldm4IsuP1H+9FLCOeIlLdCTrojz8RMifIsyzprSlJRpRQI0J6ucIVsJqPFigBC5pxM
 if5hJaBJ7AReU8zY8tiCuZiIosqLxKqu+6mnps6NZBcZU35Rx8/t49wNIcHQSkCbHo/A
 BvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jcvktWzuf/YXJY7B0r0fkd4cBPlRZYMazd1bG7Knz0c=;
 b=jIQOcmGT5P14JtSI5qS9a0q38AJTY3nhgfHm0SrYRsaYAR/cFgHQ/oeMcRe29bWPfx
 yilWMfcX33TobJdOeBFubLsOAgbE25dms4e2DfaPqABxGMS5sxC1SxUrsNyuMAYZrbij
 oyLou9AB3TTlhr4GRg+U821BVAnNlOBO0S6mxW3jtHQ0CFHkSQuNJprgkuGfRkSW3GuX
 VENgpOmfQbg+HBHNO8wRazpwqKGMdD6QB67MqukUmXb4J9Y98P4JVAf6F9MwxslJtAky
 XH00kr8LRMsTXtHkKDmNhwbapXaoNbNNnhowt6TZ9qPi92Ekyj1LO5JK6xOTM4UfdGQH
 wmrw==
X-Gm-Message-State: AOAM532uOaFvRhbleyT+tnNM1E9+Lc8yLK7PkSeA1ouBldmW18HEIHYt
 hJaKID6OCTwRnX2KIkwT4OeWAI0T6uVnaD/w62Jld2/PMGWSR2cgJRKcReeCP1yp9xY62UE1Wzu
 afnYyW3PGW+BSSx1eeEIbicxi/lxjww==
X-Received: by 2002:a92:5acb:: with SMTP id b72mr14247794ilg.76.1590166918954; 
 Fri, 22 May 2020 10:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKXeudn5JD/jVIbjuH9rx5TwDU+GyZP+kgSPDsbHyJXtF9ElTagjdAhKOHLdsLYAK1IWG6hw==
X-Received: by 2002:a92:5acb:: with SMTP id b72mr14247737ilg.76.1590166918456; 
 Fri, 22 May 2020 10:01:58 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu.
 [128.101.106.4])
 by smtp.gmail.com with ESMTPSA id o70sm2427477ilb.86.2020.05.22.10.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:01:57 -0700 (PDT)
From: wu000273@umn.edu
To: dhowells@redhat.com
Subject: [PATCH v2] rxrpc: fix a memory leak bug.
Date: Fri, 22 May 2020 12:01:27 -0500
Message-Id: <20200522170127.23033-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_100208_759749_D8C39049 
X-CRM114-Status: GOOD (  12.21  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.84.196.208 listed in list.dnswl.org]
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
 linux-afs@lists.infradead.org, wu000273@umn.edu, kuba@kernel.org,
 davem@davemloft.net
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
