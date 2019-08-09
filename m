Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD5880B8
	for <lists+linux-afs@lfdr.de>; Fri,  9 Aug 2019 19:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hWA0wbWLJH66vcuf9Bz3rWtpPZbLqf9FF6JYRyvlY4Y=; b=K4Gf60ZI3xR4cG
	9LSnNL63cGMIGjZuVoa1wVD+QPU31kMC42ptXgUiJ5pfYwL4X67Fwzpfly4rfeuYeyck6+llJy1Zw
	bm7E/Fv8ek2XJ0OUl/80U3v09bEAPkXyC9OPUaBaU0+QbIPrvNaq0JNcPnbyXV9d4VbxTI0Ji6ru8
	+u6xjs89DgzII3Vf9pklbVVRa0Grs0mvX0KLtJ9d7gB6Bfrb1XBXVSB2NEdNMxLLma9fnQbSo6UtS
	tZFunpZf2Dp9M0Jq4rn23lrWE2JorcZrhENid0wyS9bcDZdeJBbTvbPffBkEJmKun7PVd8GJIRZre
	HmWhv1l+LEfEy2XepjMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw8IJ-0007wL-3q; Fri, 09 Aug 2019 17:03:11 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw8IF-0007vd-NT
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 17:03:09 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hw8I7-0006uW-LD; Fri, 09 Aug 2019 17:02:59 +0000
From: Colin King <colin.king@canonical.com>
To: David Howells <dhowells@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-afs@lists.infradead.org,
 netdev@vger.kernel.org
Subject: [PATCH][net-next] rxrpc: fix uninitialized return value in variable
 err
Date: Fri,  9 Aug 2019 18:02:59 +0100
Message-Id: <20190809170259.29859-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_100307_901354_C1B73840 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [91.189.89.112 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

An earlier commit removed the setting of err to -ENOMEM so currently
the skb_shinfo(skb)->nr_frags > 16 check returns with an uninitialized
bogus return code.  Fix this by setting err to -ENOMEM to restore
the original behaviour.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: b214b2d8f277 ("rxrpc: Don't use skb_cow_data() in rxkad")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/rxrpc/rxkad.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index 8b4cddd8b673..c810a7c43b0f 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -248,8 +248,10 @@ static int rxkad_secure_packet_encrypt(const struct rxrpc_call *call,
 	crypto_skcipher_encrypt(req);
 
 	/* we want to encrypt the skbuff in-place */
-	if (skb_shinfo(skb)->nr_frags > 16)
+	if (skb_shinfo(skb)->nr_frags > 16) {
+		err = -ENOMEM;
 		goto out;
+	}
 
 	len = data_size + call->conn->size_align - 1;
 	len &= ~(call->conn->size_align - 1);
-- 
2.20.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
