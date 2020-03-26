Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9B194428
	for <lists+linux-afs@lfdr.de>; Thu, 26 Mar 2020 17:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0juPknBeOxqy2uHhbNkURVSbohfNeqb797SHoRBg8RE=; b=dhZzO4vBolhTZK
	gp1OwKPCpMcYvm2RxSb81q/ZzVNx/wCMPk3y2EebD8WqkTXctdZPZw3wDINmD6jlfiHopVOpFFnIw
	DX+wjRNGTdx4smDIByhZnRPGfSS4ScMonRr+yM1VqOuqFCrmnA57qKzmyYvN8H5wdw3xtf6IBruKe
	/GJ7cepv1TOOJA8Lglp65yYAodiGaRy0D8KxF62Ot7G7QiQ10svKwdUA1KQf8BgWafHF26b1dvYfy
	TmRYQMLaYsm4UCiF8ll1kEd4skvbRMsQ+wsq6wtjAoPpa03wNaTC8GLxtpHZI/2mmMIsUJV3bSblp
	slZlOF/1i/gBKa9idaew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHVE9-0003Yb-4G; Thu, 26 Mar 2020 16:19:29 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHIIT-00048f-2j
 for linux-afs@lists.infradead.org; Thu, 26 Mar 2020 02:31:06 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 327E415B2D569;
 Wed, 25 Mar 2020 19:30:57 -0700 (PDT)
Date: Wed, 25 Mar 2020 19:30:56 -0700 (PDT)
Message-Id: <20200325.193056.1153970692429454819.davem@davemloft.net>
To: longman@redhat.com
Subject: Re: [PATCH v8 0/2] KEYS: Read keys to internal buffer & then copy
 to userspace
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200322011125.24327-1-longman@redhat.com>
References: <20200322011125.24327-1-longman@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 25 Mar 2020 19:30:58 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_193105_122747_8DE66A28 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Thu, 26 Mar 2020 09:19:28 -0700
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
Cc: sumit.garg@linaro.org, crecklin@redhat.com, roberto.sassu@huawei.com,
 ebiggers@google.com, netdev@vger.kernel.org, jsnitsel@redhat.com,
 jmorris@namei.org, zohar@linux.ibm.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, jarkko.sakkinen@linux.intel.com, kuba@kernel.org,
 linux-integrity@vger.kernel.org, linux-afs@lists.infradead.org,
 serge@hallyn.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: Waiman Long <longman@redhat.com>
Date: Sat, 21 Mar 2020 21:11:23 -0400

> The current security key read methods are called with the key semaphore
> held.  The methods then copy out the key data to userspace which is
> subjected to page fault and may acquire the mmap semaphore. That can
> result in circular lock dependency and hence a chance to get into
> deadlock.
> 
> To avoid such a deadlock, an internal buffer is now allocated for getting
> out the necessary data first. After releasing the key semaphore, the
> key data are then copied out to userspace sidestepping the circular
> lock dependency.
> 
> The keyutils test suite was run and the test passed with these patchset
> applied without any falure.

Who will integrate these changes?

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
