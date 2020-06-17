Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5051FCE39
	for <lists+linux-afs@lfdr.de>; Wed, 17 Jun 2020 15:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5vcdKgwIA5xV7/fgEBa+wd9mBxUHMe/jxWDoLScMdFs=; b=le0lSE3RHCouB4
	vqrrY6p6m66TqI+hscELO3QSCbRTVePELCY4kkDMG8H41Y9lJPV89Wm2SQqEInLkgwU0upfd++11Y
	OVq9CeUoOUv4MUrcqUNEaEKnY63h9pt9jMU/QURUXsa5LtxWS/zV5q0Y+SIzU1FxrgRkonAxf7BvA
	OYlsDKTy3pynzzyx+e5JJc7476rPQ7Ldp8P/sx7lFkZ24nETe/jFBb3piQcLxR1DT6QDFnkYU14w/
	7nmir4lv003fm989xmh6oMWG/WONEgJ34mdhkDSCeopKNM69dF8+/0cPERgtS3xidUyrzhbWT4ilN
	g45JOc0m97mmdRMs0SxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlXwD-0006u3-Sv; Wed, 17 Jun 2020 13:17:09 +0000
Received: from rdns4.delivers-solutions.com ([147.135.99.24])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlXwA-0006su-SK
 for linux-afs@lists.infradead.org; Wed, 17 Jun 2020 13:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=default;
 d=delivers-solutions.com; 
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=info@delivers-solutions.com; 
 bh=HfOzYHtXihvNe2PYgpNWZYop7xo=;
 b=ln6DMCefL12MagbCj+Reu+V9h0BTmYZ3MrJ3wxhI/BkFkwtoZTJXLBaDHY+F87r13DgYAkHUi9cM
 OeElrBMWjJ0QeScpXovE2r+ir1uVcMUVKcDNKr9JzzHm0QALlsdJafocP0IFGhT0WJygeqjLwxBG
 cSBRR2g8p1e5F/9uUXY=
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=default;
 d=delivers-solutions.com; 
 b=BHgEwxinz7xxfNGI3CBO2IWGczj7Ch8u8AdJtNRAWGxiU4ARY6+0gadpfoxNZpGNFIDR4a5snROp
 smLtkm61Hm8eE3Gxqt/MSCHtudhr7gom/xooImKmrU6IO0RGk9W61GFGzZeNKTQxf7WuREsqUMQ0
 IMlorbhuI1qfBEyWeZM=;
From: info@delivers-solutions.com
To: linux-afs@lists.infradead.org
Subject: Receipt For Goods Available
Date: 17 Jun 2020 15:17:05 +0200
Message-ID: <20200617151705.5A42CFA8CBC240B7@delivers-solutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_061706_912300_6FE67D9D 
X-CRM114-Status: UNSURE (   0.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
Reply-To: info@cocyflame.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi

Hope this mail finds you well.

Our company have not bought your products before but due to 
excess demand of it here, so we decided to go for it.

I still have other request to make but there all in my 
specification.

Please let me know if you still have stocks available.


Waiting for your reply

 



Warmest Regards,

Angela Wilpert

Sales Executives Dept

HDT Sales & Merkating
vasileos konstantinou 89 Paphos, Paphos, Cyprus
Phone: +357 26 040001


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
