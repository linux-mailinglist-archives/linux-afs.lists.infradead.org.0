Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1CC70EB0
	for <lists+linux-afs@lfdr.de>; Tue, 23 Jul 2019 03:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TudlVS0iz2MUvEdOgI1oMNVcOzHbb49ZNQ1t48cxYv0=; b=sIXpHMRNW65ups
	echQ4L3JFhpvQQaLcKjmoW1UGOZjjJSthAE1MRYIfzSkXbwCDnd/S7hjGub3k0WglvOFg3aig/s5a
	+L3LEEJVkRouRWeli2i2K8ScPQhaNQ5STUwMz/mqbeAwtCHH8U3IsHGqms1T+y5tZTsK3AIwUQ7gl
	cfvee9b8oTQcd0Xcy6alNwXE8MIsMTMTr0TsPznEQYd6i8L09J+Tx1tXXsy1ygfnOCP3AKTEN3veS
	sIasN5g9sqWxnqFN04JV0A+nS8dbgdhNplwRspQ4Zrgx5SX1GMC8rTpNttGBp4LEzkhmQiHTcP8Dt
	QHdc/PyPNCPpYaiHT7eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpje6-00006Y-3p; Tue, 23 Jul 2019 01:31:14 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpje0-0008VL-VT
 for linux-afs@lists.infradead.org; Tue, 23 Jul 2019 01:31:11 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EF0E115305EB4;
 Mon, 22 Jul 2019 18:31:07 -0700 (PDT)
Date: Mon, 22 Jul 2019 18:31:07 -0700 (PDT)
Message-Id: <20190722.183107.298639131733640783.davem@davemloft.net>
To: arnd@arndb.de
Subject: Re: [PATCH net-next] rxrpc: shut up -Wframe-larger-than= warnings
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190722145828.1156135-1-arnd@arndb.de>
References: <20190722145828.1156135-1-arnd@arndb.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 22 Jul 2019 18:31:08 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_183109_209732_EC071265 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
Cc: keescook@chromium.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, clang-built-linux@googlegroups.com,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 22 Jul 2019 16:58:12 +0200

> rxkad sometimes triggers a warning about oversized stack frames
> when building with clang for a 32-bit architecture:
> 
> net/rxrpc/rxkad.c:243:12: error: stack frame size of 1088 bytes in function 'rxkad_secure_packet' [-Werror,-Wframe-larger-than=]
> net/rxrpc/rxkad.c:501:12: error: stack frame size of 1088 bytes in function 'rxkad_verify_packet' [-Werror,-Wframe-larger-than=]
> 
> The problem is the combination of SYNC_SKCIPHER_REQUEST_ON_STACK()
> in rxkad_verify_packet()/rxkad_secure_packet() with the relatively
> large scatterlist in rxkad_verify_packet_1()/rxkad_secure_packet_encrypt().
> 
> The warning does not show up when using gcc, which does not inline
> the functions as aggressively, but the problem is still the same.
> 
> Marking the inner functions as 'noinline_for_stack' makes clang
> behave the same way as gcc and avoids the warning.
> This may not be ideal as it leaves the underlying problem
> unchanged. If we want to actually reduce the stack usage here,
> the skcipher_request and scatterlist objects need to be moved
> off the stack.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

David H., I assume you will take this into your tree.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
