Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D370A2C72
	for <lists+linux-afs@lfdr.de>; Fri, 30 Aug 2019 03:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JqtcwiEU2i7upgMEfP62CM+Fc/0Vvlfez9GDB0gxGbo=; b=V/woEBzdHb3pBw
	QYmGNMD7JTH8ogaXJNN0yBsv1WiofA6s945tw/zei87GrPcVHCyiOFuiI3qtHMqWdr2o9FT8K2mA1
	EIUnf/V8cp4iqGtX9DLvqENs5ZLcZAwOqfOCQTcYYlx09ajMaRf9dYy0rhyZXc4E42SH7b+/Ys8lN
	+OmcwHCg1bAOKz4JsxZtlhjjZmXAFhpDUSwjQxuWIUCVOpyFynA50mBxR6RYJyVql5ud5wtr7QgRe
	Oxe6cwpiviBV4aDLJi2g28cz2UaIcT8oMo1TN1k9wckNXorJ9ysAGQK3lXurTZSXOCFaDojSQFhYG
	oCUsb+CCx+NCINljArVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Vtq-0004NO-9O; Fri, 30 Aug 2019 01:40:26 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Vtm-0004MJ-Vy
 for linux-afs@lists.infradead.org; Fri, 30 Aug 2019 01:40:24 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CBDF7654A36B027F3BE9;
 Fri, 30 Aug 2019 09:40:11 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 30 Aug 2019
 09:40:02 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <dhowells@redhat.com>, <linux-afs@lists.infradead.org>
Subject: [PATCH 0/2] afs: remove some unused variables
Date: Fri, 30 Aug 2019 09:46:43 +0800
Message-ID: <1567129605-142022-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_184023_205465_2A06ED9F 
X-CRM114-Status: UNSURE (   5.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.32 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

zhengbin (2):
  afs: remove unused variable 'ret'
  afs: remove unused variables 'before','after'

 fs/afs/dir_edit.c | 12 ++----------
 fs/afs/server.c   |  3 +--
 2 files changed, 3 insertions(+), 12 deletions(-)

--
2.7.4


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
