Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B4391610E6
	for <lists+linux-afs@lfdr.de>; Sat,  6 Jul 2019 16:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=H0eGzXfoZYbiBVkyXEFcx3T5fcZSHcL7LBKOM/exuOs=; b=LTx
	cAbiS2I2fl7GNSE7FYrp0o6MRyI1eq4+WB83PJEFKIalyvrOrDoPMXqSgYl7W8NcanGsf9HjDCvqY
	yunyBnxCjgT0acX0CuK0WikamrHF012qbvv6y5PxjeeXSZbNXqqvxAPrq5FYlmXrOOuf15EY2gpSF
	sX8k81DIu7i5VUPayJO0ZXLPZy4p7j0zHbeXcdNOPy7FS2o0sgb/dgGSQVDOE59FVMyO30FYH1wNv
	QDxsjjey4379OuoDhCcX/H2UvoDl/bO1OScQsierXeEIKCsb16X6ukMwQU/K6IMPVONOp21HPzy+Y
	+Q0FMfWtrj+3XDLfdxrWjAur1hyPlsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjlFG-0000sZ-IC; Sat, 06 Jul 2019 14:00:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjlFD-0000rs-3x
 for linux-afs@bombadil.infradead.org; Sat, 06 Jul 2019 14:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n8psGp2L5zngvMvfKfwE2mqM23mLn/F4KWQF+hmK72o=; b=WY0er0Wp6E0EQuRVbouwp6bmD
 wJLZ2Oa00eg9BeiR8CqdjumHxrqx5f8SlLurLJsE2yL4ou02Qjf1wGcjmTesPp7IEXfpwHTrz6d1E
 FE2fMSCApZSoGEWVH9lK/k6fsNUrMLtUWXIVG6PFiOH5jcUjraXqDEMmxvlw6PCw5F5zUfXwbwrMV
 Z+f/ZkoieoXNfeWSeIUDMoD1y6+UPQV4Kg5GltKONZFGk/w/q+0pY+mskYJiNk39zCITOOnUIK4pK
 wMt+cquBHFST+9fY4m1lXcDZ/S6X1U6L7i3gEmRwBj/00ou5iqPeS4ImgKMKZpG0cHUrnxkLaCrF0
 g7FEyRtog==;
Received: from smtpbgsg2.qq.com ([54.254.200.128])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjlF3-0006dQ-Ds
 for linux-afs@lists.infradead.org; Sat, 06 Jul 2019 14:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1562421583; bh=n8psGp2L5zngvMvfKfwE2mqM23mLn/F4KWQF+hmK72o=;
 h=From:To:Subject:Date:Message-Id;
 b=qlVoN4+ZCVDJVdkariBHekie/VEW+LKqrr+zjDtofcs1m+G0Oz7GTa6kKKLM36MKi
 PAUALeRFDlpwyI6TNh6MKYhHK8gUBV3+y8p1pYybhhIVhGlxGwlKvCNHNrHLFRZOn1
 tL5zpty8q8gDgE7XZ1/8c0yExBH7meprzwVJJ2tA=
X-QQ-mid: esmtp3t1562421582tvs5emerj
Received: from localhost.localdomain (unknown [125.82.14.162])
 by esmtp4.qq.com (ESMTP) with 
 id ; Sat, 06 Jul 2019 21:59:41 +0800 (CST)
X-QQ-SSF: A1000000000000F0F1121F00000000C
X-QQ-FEAT: sBszw6/F/Btx8UTNSEbed3+TSLxZtRiGiYUycHCbYM2e6gzb5EEoT0oefnsSu
 Ztfi3wDkYYXpMDRo120DaUccmoeLnPm0my8zwfm0+vHaxp4yQl98QNUZO7rMNSuoMLe7yPl
 oZn4RARSAJF6+xBnHv7IB3uAKbK0VrP9n5S814/OdO/IVbqtYc2ync0KMi6mOfxzze7XBs/
 O/X5lhcIOD5DEVOQKHPMcsvPkJsLcZcjoB3kThkReeUVfNseueeG6VMW9D+JkKj8PZhmojo
 J8sxpZbexs/n94bu5ee2aXdhnWOFf0fnmdng==
X-QQ-GoodBg: 0
From: 1142631421@qq.com
To: dhowells@redhat.com,
	davem@davemloft.net
Subject: [PATCH] rxrpc: Delete one extra TAB character
Date: Sat,  6 Jul 2019 21:59:06 +0800
Message-Id: <1562421546-26725-1-git-send-email-1142631421@qq.com>
X-Mailer: git-send-email 2.7.4
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:qq.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190706_150042_333316_EB6E1D42 
X-CRM114-Status: GOOD (  10.77  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on casper.infradead.org summary:
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [54.254.200.128 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (1142631421[at]qq.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit (1142631421[at]qq.com)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: netdev@vger.kernel.org, Hu Haowen <1142631421@qq.com>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Hu Haowen <1142631421@qq.com>

When I was reading the Linux kernel source, I found that there was
one extra TAB character at the end of one line in one file. Since
it was meaningless and not easy to find, I deleted this extra space
character.

Signed-off-by: Hu Haowen <1142631421@qq.com>
---
 net/rxrpc/protocol.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/protocol.h b/net/rxrpc/protocol.h
index 99ce322..1cefab1 100644
--- a/net/rxrpc/protocol.h
+++ b/net/rxrpc/protocol.h
@@ -57,7 +57,7 @@ struct rxrpc_wire_header {
 
 	uint8_t		userStatus;	/* app-layer defined status */
 #define RXRPC_USERSTATUS_SERVICE_UPGRADE 0x01	/* AuriStor service upgrade request */
-	
+
 	uint8_t		securityIndex;	/* security protocol ID */
 	union {
 		__be16	_rsvd;		/* reserved */
-- 
2.7.4




_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
