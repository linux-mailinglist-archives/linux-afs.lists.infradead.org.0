Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B401702D3
	for <lists+linux-afs@lfdr.de>; Mon, 22 Jul 2019 16:59:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L5qNCFciPkbTIDFGOnWdAOFvMNTna3wWxgBCf4Xk8xs=; b=P6LnObuSK5YGEQ
	tH1vdQKl9I/J+VnjNTgYvwMvhvNn8f1XlRA1b6+ToiggEgsJ1wEplK4JROgnEl0bXz9fcS/pfjr/t
	vig4aSq0R+t8DzoNNSCag92+jPYUamWLZwHsQVYIKy6GclRZmGl2o6XwvvB70QhSXxOwepwGjxOVg
	KAbsTWaR0w+CK+pLNnIUzGiBqlT1NpiBS16kTG99o2aMTxBVpt8nDXrxbQ3mFo/92QmWqsyLX02md
	UXXwnphyJwxspXS2tZYpi2JBnEaF1n0aQJwhVK8ONvDv5FA33OpX5gUwfdOG6c7/Lfmu6QhZQWlqP
	jnoz8RVxdN7/pt7seHTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpZm2-0004V4-1T; Mon, 22 Jul 2019 14:58:46 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpZlx-0004Oc-SM
 for linux-afs@lists.infradead.org; Mon, 22 Jul 2019 14:58:43 +0000
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M72Xn-1hmYIL10oB-008bY6; Mon, 22 Jul 2019 16:58:30 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: David Howells <dhowells@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next] rxrpc: shut up -Wframe-larger-than= warnings
Date: Mon, 22 Jul 2019 16:58:12 +0200
Message-Id: <20190722145828.1156135-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:lfUDGrLpfiXr0926+j2P2OlmuIJ9NeSW7hz8xpL9W9/lJWhLyxr
 nvy0gDbgeppmwx5SNKpsWc+kRWqKjri7P6sr1ev6Ni6JpuD6b9lOpGqjq9c/mOazV/kZO89
 BhM/bodFV621uaH+Om47Oer2s95AQ9aOLPAg0UMDON68IcCMVTiV5llJknLtQnVDEQeonSM
 Bne5lVBalJEvcLsf+iUrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FSBaxuTAGN0=:DC1HwUKvN32xA+BmgiSi7p
 5BlOr7hXovf7a2nSPKJT9fKI5oL3ewkotHvT7gChJ58N3ObJta+RX2z95PAIKvWuk7rnMGsfv
 cCC5dupWpKlz2umtRlihopD5G69vxMzetqMDiZCvHq3kBhQNS+CLBqKtsCXTKR7/xkA5g2V2F
 sJkqK8fwkMUGbflM593akcchF3u3g8FFRGvFxcoBmSH9uVlV3P8vtSezwQXtZwKmXsh2bpl+B
 DhPEkEp+2Jye5oLjpcUDWpARuAbNbTI05mMFS+MKlYffblU0nOEYCgnywnccztSdw1MlSy2o4
 P/VHWgYnRuNAkRyWUp4UYrBlEfvotJd4jrQpoCWebMCvOXEOu/7veqN4SdMc5VMllvJwBC/R8
 d+JrNMSHEVbp6bYuZmmwXLVwl+PRXk3nxqRwgYLfyWHxEFJr+iOY1qaANkZ348iljRePrR1+F
 5mRdXtq/oGsDbALMLO8EITVqnD5HaGfPnSMxlP4XfUxjmOMW3Eu9e9WBXebZT8OsfB7o4wu1Q
 06+w6tVTGHhapGjBtibEN/LsZ5uz9UkR5X7oMNSfoD1RsrKPThoDR52oQYf6pCNYwfsqhMFXq
 +8tAm1nyxr+xYaDzaDuSKYLL+8oY+KT/EbYd2ymalbQbVWKrp8YlSQgaeAwVBiD9Yn/1JlDYf
 gliInbSQrx/vFOIz80D0jUg2N4k4D/zzJkm+km1/nqoV3eM+eNUib1KVsxXmzUKgpJG//rndn
 T+Irze9420UQg0b97RVKHAZ1dKwPJuYld3rpxw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_075842_286808_84F66E23 
X-CRM114-Status: GOOD (  11.77  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [212.227.126.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.126.130 listed in wl.mailspike.net]
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

rxkad sometimes triggers a warning about oversized stack frames
when building with clang for a 32-bit architecture:

net/rxrpc/rxkad.c:243:12: error: stack frame size of 1088 bytes in function 'rxkad_secure_packet' [-Werror,-Wframe-larger-than=]
net/rxrpc/rxkad.c:501:12: error: stack frame size of 1088 bytes in function 'rxkad_verify_packet' [-Werror,-Wframe-larger-than=]

The problem is the combination of SYNC_SKCIPHER_REQUEST_ON_STACK()
in rxkad_verify_packet()/rxkad_secure_packet() with the relatively
large scatterlist in rxkad_verify_packet_1()/rxkad_secure_packet_encrypt().

The warning does not show up when using gcc, which does not inline
the functions as aggressively, but the problem is still the same.

Marking the inner functions as 'noinline_for_stack' makes clang
behave the same way as gcc and avoids the warning.
This may not be ideal as it leaves the underlying problem
unchanged. If we want to actually reduce the stack usage here,
the skcipher_request and scatterlist objects need to be moved
off the stack.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 net/rxrpc/rxkad.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index ae8cd8926456..788e40a1679c 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -139,7 +139,7 @@ static int rxkad_prime_packet_security(struct rxrpc_connection *conn)
 /*
  * partially encrypt a packet (level 1 security)
  */
-static int rxkad_secure_packet_auth(const struct rxrpc_call *call,
+static noinline_for_stack int rxkad_secure_packet_auth(const struct rxrpc_call *call,
 				    struct sk_buff *skb,
 				    u32 data_size,
 				    void *sechdr,
@@ -176,7 +176,7 @@ static int rxkad_secure_packet_auth(const struct rxrpc_call *call,
 /*
  * wholly encrypt a packet (level 2 security)
  */
-static int rxkad_secure_packet_encrypt(const struct rxrpc_call *call,
+static noinline_for_stack int rxkad_secure_packet_encrypt(const struct rxrpc_call *call,
 				       struct sk_buff *skb,
 				       u32 data_size,
 				       void *sechdr,
@@ -311,7 +311,7 @@ static int rxkad_secure_packet(struct rxrpc_call *call,
 /*
  * decrypt partial encryption on a packet (level 1 security)
  */
-static int rxkad_verify_packet_1(struct rxrpc_call *call, struct sk_buff *skb,
+static noinline_for_stack int rxkad_verify_packet_1(struct rxrpc_call *call, struct sk_buff *skb,
 				 unsigned int offset, unsigned int len,
 				 rxrpc_seq_t seq,
 				 struct skcipher_request *req)
@@ -397,7 +397,7 @@ static int rxkad_verify_packet_1(struct rxrpc_call *call, struct sk_buff *skb,
 /*
  * wholly decrypt a packet (level 2 security)
  */
-static int rxkad_verify_packet_2(struct rxrpc_call *call, struct sk_buff *skb,
+static noinline_for_stack int rxkad_verify_packet_2(struct rxrpc_call *call, struct sk_buff *skb,
 				 unsigned int offset, unsigned int len,
 				 rxrpc_seq_t seq,
 				 struct skcipher_request *req)
-- 
2.20.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
