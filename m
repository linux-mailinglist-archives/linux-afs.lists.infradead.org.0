Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4535D1DDF18
	for <lists+linux-afs@lfdr.de>; Fri, 22 May 2020 07:04:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rnXZJxrekl6MOx64lCVxen7L0cvUI0dH4g03qmxW/b0=; b=OTN
	B5h/yL7aUHf8urU+7DdqtIWOmyUYbrracjOTQ6/ALTrOSYjxvD/m2lIRfGuNgA2jdmqaQIRnS+DK6
	Q/oUzXoqddlvOrzDxk40sC0oK5Bb3++TP+AgzT3qdgD+sP+68VduM6TuD27hZvgc+SGEOdKOLvhWX
	1JBTH+2TLQ1qKYJO9hRwZDBtPgorWlDQW0j2pFsxFit2aqA+6UkfQzjgEAvGUM9tLmjuzW4mIiaqM
	JTpZ5phXiVIGGuEJYTmqq9wdTiaJGy9hkf3IKqR8+wN3/tzSXi3kuJWstlq/KtnpyztG5j7Rlt0k2
	DYXFOFCpe/T2t0lBVGGN4a2RNT0FqIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbzqJ-00023t-0U; Fri, 22 May 2020 05:03:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbzqH-000235-6Y
 for linux-afs@bombadil.infradead.org; Fri, 22 May 2020 05:03:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PKNUiHK9Hb2/cZzi/FocwTzEpdCaBMxhZnTs6WEbQRc=; b=hcz09AQ4Uj4WShoObh3Y4Dv4lW
 rqv/fxCq91WFEwgFavs34MRCWX0xwQ6uibaUs0Lk8h8/xSiSe1m7QPYm169hPl3ynasDxb+4z8quW
 ML61Xod2erI9OGbOsnEtnm1CCpYBTm66z1I7zzINHT1wYBGtWX4Y7vxLM99efeB+4gyQiRoXEFjpZ
 u5itj9oRYXMVKjmFRD65iY+3oe1F0O5SSBpPK/Lz6TN/T2XlK9Wkp56FLXN/SDAFw/o4+PZemAQOu
 G6QbLZAJk3QjhdnsROkxp2xqAKHETyoRy/+JcXkbz30rijbi8M84vpaIDmk2jU4RvvBK+6imKse5W
 02HXK2ig==;
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbzqC-0004xZ-LM
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 05:03:32 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49SvV50m3Qz9vcJn
 for <linux-afs@lists.infradead.org>; Fri, 22 May 2020 05:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwQlkLEqYDgG for <linux-afs@lists.infradead.org>;
 Fri, 22 May 2020 00:01:49 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49SvV46JWCz9vcJj
 for <linux-afs@lists.infradead.org>; Fri, 22 May 2020 00:01:47 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49SvV46JWCz9vcJj
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49SvV46JWCz9vcJj
Received: by mail-il1-f199.google.com with SMTP id b8so7614337ilr.11
 for <linux-afs@lists.infradead.org>; Thu, 21 May 2020 22:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=PKNUiHK9Hb2/cZzi/FocwTzEpdCaBMxhZnTs6WEbQRc=;
 b=gWX3bduAFtQnUWf4ap1h8sk1OX5aCUOFhenEC65fDEcuw0mzrWt7+M/2t9/aT6ngJx
 FPG41a5BJlAn4XgSJhybY1ScsSJlTC0GDZle/ROvDwB4jLLlaIpbrS0WfOuK49m/5RUf
 dL/SFr5MUX4bccLA4bq0cI/6bCIXHTU6ex/XQVljmGEA1fe1uHs5NXGgRZ4TSRTOYWru
 /jWxkuujky6gBYrdUGVqAnS41Rfl/XB7aUQtyGjb24wyvsP8oDqkupEaI4IlkGrR1s/z
 2pyACcHa65CN2/L2UzLNFDS0b/EFgy6C2DSUXk0GBahpk05QffxLGjb7mMkhsd3vuoJG
 QwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PKNUiHK9Hb2/cZzi/FocwTzEpdCaBMxhZnTs6WEbQRc=;
 b=l08ZiiJXUBp8BnmWe3hvFX2uVKk2QDg7Au3L7jP7jKoh4paI3OZulr1QeOu2gT3A9x
 viVOI8ND6eIRURD1HhW/7zdB0OaC9XtDZoBUWi/FuoB6gMPjZ/6Z3LNYzC9W5rn59pqV
 nyGwqFyirdzH/yVv+mHrQ60SWELSYkrauWtouPGJPKOMQkD8ycy0GhcSprK/70djStr4
 9UkgdJ3YofWRiduQ65dVaTUVqOp2yJ1ROEub4zrsT+wM9wedADnhc6gmKdwqI+nZkxR4
 jslpP5wwSktJpHxaeimIV8iO3ODVI9pZLUBzTtdoKnPV4k6g02eGdmPdjMtUkShB3GYJ
 jLxw==
X-Gm-Message-State: AOAM531GlOBlcWKUow9aBhc+6yIwQnUKk8vOXeC3Byww6XmNQ18Liief
 eYK0ldNCYTKBomv+Kkj4fLdkgoTM8M+xRJCkcJJLehyW1CRfyiRPSFvVgKDoW6Uj6hEUV4QZYHV
 zx9aURGKIKtRtyDDSp6ouzf0G1n3PWg==
X-Received: by 2002:a02:54ca:: with SMTP id t193mr7007999jaa.26.1590123706718; 
 Thu, 21 May 2020 22:01:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJwmNLYhrE/pUNUnqwv/haakA9gU7GWmulh8h6dkVQOIh2qLlZbtTntT/fT/VGWj/bte33nA==
X-Received: by 2002:a02:54ca:: with SMTP id t193mr7007970jaa.26.1590123706362; 
 Thu, 21 May 2020 22:01:46 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu.
 [128.101.106.4])
 by smtp.gmail.com with ESMTPSA id l16sm3998886ils.64.2020.05.21.22.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 22:01:45 -0700 (PDT)
From: wu000273@umn.edu
To: dhowells@redhat.com
Subject: [PATCH] rxrpc: fix a memory leak bug.
Date: Fri, 22 May 2020 00:01:29 -0500
Message-Id: <20200522050129.30148-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_060329_161085_80494261 
X-CRM114-Status: GOOD (  12.43  )
X-Spam-Score: -4.4 (----)
X-Spam-Report: SpamAssassin version 3.4.4 on casper.infradead.org summary:
 Content analysis details:   (-4.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.84.196.206 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Qiushi Wu <wu000273@umn.edu>

In function rxkad_verify_response(), pointer "ticket" is not released,
when function rxkad_decrypt_ticket() returns an error, causing a
memory leak bug.

Fixes: 8c2f826dc3631 ("rxrpc: Don't put crypto buffers on the stack")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 net/rxrpc/rxkad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index 098f1f9ec53b..52a24d4ef5d8 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -1148,7 +1148,7 @@ static int rxkad_verify_response(struct rxrpc_connection *conn,
 	ret = rxkad_decrypt_ticket(conn, skb, ticket, ticket_len, &session_key,
 				   &expiry, _abort_code);
 	if (ret < 0)
-		goto temporary_error_free_resp;
+		goto temporary_error_free_ticket;
 
 	/* use the session key from inside the ticket to decrypt the
 	 * response */
@@ -1230,7 +1230,6 @@ static int rxkad_verify_response(struct rxrpc_connection *conn,
 
 temporary_error_free_ticket:
 	kfree(ticket);
-temporary_error_free_resp:
 	kfree(response);
 temporary_error:
 	/* Ignore the response packet if we got a temporary error such as
-- 
2.17.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
