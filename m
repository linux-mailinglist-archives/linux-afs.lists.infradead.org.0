Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B491F25C7
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 01:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3akYoVWV864lgNRyCk/s58fOZZ929EfE18I4eyOwhs=; b=IxtVxPSVbzXzr8
	EIu3F11YR2SE1TrYphgevFFSsjE8eR0lm55scoCqceSxkREJboLovO1k3QL6WQGmvqjxips50+bq+
	6DJl7eLCS89nnSqrcNTmQ0JoLSF0hE5rH4QSuEvDhc/NRpBUpBdT/Y7Orec9/pNrXUJCHCAlRDofR
	d1PgLmP+0NMy0mH8TrWvIwQR4SwbiLpXS1ATebrYIbYhBgziKUcfepglpkTsZdVvG4IlaCwJfYyKS
	ySyTMGp60CvJmAJgFlgC0xpe9H2AtSc3eR8Q7fyQLWjaM/KhUwZheljQB3Y1flHbMByx6Z8EwjpWE
	Z1syWeP9+fcUbQ1BIP+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiRDr-0004mq-Eu; Mon, 08 Jun 2020 23:30:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQzx-000354-1b
 for linux-afs@lists.infradead.org; Mon, 08 Jun 2020 23:16:19 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2908120814;
 Mon,  8 Jun 2020 23:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658168;
 bh=A+2JaOpuAnOIT+qANT0NjlO+6c2TDnl9rdUJ6hBS1E0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RRMt6LsewQj/+j+L90xUsFbMLYo+9UiD69tvkvvxaGSMIZjSDw4amKhHPZTWZ+Iqe
 RUyQUT8NO10V2ulNKnXzTq1TG8+y+E7f6dZXK3csNoqMKWi/PqKuUH+iz06DzPQyfr
 qyjEX6HE8q//VbnxZ0Z6LGmHiD97v9a1QpgIIZTI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 195/606] rxrpc: Fix a memory leak in
 rxkad_verify_response()
Date: Mon,  8 Jun 2020 19:05:20 -0400
Message-Id: <20200608231211.3363633-195-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161609_228766_73FADAFE 
X-CRM114-Status: GOOD (  12.46  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Howells <dhowells@redhat.com>, Markus Elfring <Markus.Elfring@web.de>,
 Qiushi Wu <wu000273@umn.edu>, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Qiushi Wu <wu000273@umn.edu>

commit f45d01f4f30b53c3a0a1c6c1c154acb7ff74ab9f upstream.

A ticket was not released after a call of the function
"rxkad_decrypt_ticket" failed. Thus replace the jump target
"temporary_error_free_resp" by "temporary_error_free_ticket".

Fixes: 8c2f826dc3631 ("rxrpc: Don't put crypto buffers on the stack")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
2.25.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
