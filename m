Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB631E1057
	for <lists+linux-afs@lfdr.de>; Mon, 25 May 2020 16:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=C3vZEpv/rrSXWNVvr2Hni2h0U3S2aFecue091R2ZASQ=; b=JlB
	dJ3ji8hxaxPZ/Zw1FekSWMDucdUBIU8bQc7PzcI2mg4ELGw5lMRXAzg9G3nDaTAHDEcr2Nt13TBpX
	SIoxvKmZAQi2YKwF0qy/+b4iL2fO0XJ0RfoDge1KONrKVi2gidqD0721zeLl5Hy5GSro2a+5QfwPA
	TbISchh/jJMGvFOaPg8t1g8ER1JJO6owJxEvRfEzk6au0xEbsFeHNeIvycvh9MS307pl0idBQiS9D
	qE23rGA4sVcjWRl0Q2ZUokNAQ5SYi38nMRdYwbkcB6p7yEMzogvq+HVrGWLYIaWqBm3IOfBpzxJza
	+8cjdDGEgFIFWKKJIGKHAKXTDxq5PAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdDwp-0004FG-Ew; Mon, 25 May 2020 14:19:23 +0000
Received: from mail.fudan.edu.cn ([202.120.224.73] helo=fudan.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdDwm-0004EB-Ox
 for linux-afs@lists.infradead.org; Mon, 25 May 2020 14:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=e35Z1aZcBpO4FjT4/OfXhJlClEKE3GlteSXg77ztYqc=; b=j
 PH55+5TSZQKrRnRs/Q6BFmo4bAVedI3XsuUqmNPn+LSJw31h84UiM5/J8FEVXMqf
 6LgFoXk15SpIWDz00Fw8zirS4DN5oG6nUFUFAEPeCFsjcl2omNwKkGfSnLFs6Mnk
 ZrijSSneX648u0Oq5LuS57tHUXaFHZkTkUu9heakeo=
Received: from localhost.localdomain (unknown [223.73.184.21])
 by app2 (Coremail) with SMTP id XQUFCgC3v+M90stetAqpAg--.14499S3;
 Mon, 25 May 2020 22:12:15 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] afs: Fix afs_cb_interest refcnt leak in
 afs_select_fileserver()
Date: Mon, 25 May 2020 22:11:26 +0800
Message-Id: <1590415886-52353-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XQUFCgC3v+M90stetAqpAg--.14499S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1xuF17tF47XrWrZFy3CFg_yoW8Jw1Dpr
 4rCw1DKr98X348GwsxJa1rXa4rX393Xw42kFZxWw1rZws8CF4avr1vqryvgFW7u395Aw4U
 XF18K34Y9FZ8CFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUOlksUU
 UUU
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_071921_293531_70600F3E 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.4 (+)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (1.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

afs_select_fileserver() invokes afs_get_cb_interest(), which returns a
reference of the specified afs_cb_interest object to "fc->cbi" with
increased refcnt.

The reference counting issue happens in one exception handling path of
afs_select_fileserver(). When error occurred in
afs_wait_for_fs_probes(), the function forgets to decrease the refcnt
increased by afs_get_cb_interest(), causing a refcnt leak.

Fix this issue by calling afs_put_cb_interest() when error occurred in
afs_wait_for_fs_probes().

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 fs/afs/rotate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/afs/rotate.c b/fs/afs/rotate.c
index 2a3305e42b14..f73af16cdb92 100644
--- a/fs/afs/rotate.c
+++ b/fs/afs/rotate.c
@@ -357,8 +357,10 @@ bool afs_select_fileserver(struct afs_fs_cursor *fc)
 	_debug("pick [%lx]", fc->untried);
 
 	error = afs_wait_for_fs_probes(fc->server_list, fc->untried);
-	if (error < 0)
+	if (error < 0) {
+		afs_put_cb_interest(afs_v2net(vnode), fc->cbi);
 		goto failed_set_error;
+	}
 
 	/* Pick the untried server with the lowest RTT.  If we have outstanding
 	 * callbacks, we stick with the server we're already using if we can.
-- 
2.7.4


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
