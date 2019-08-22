Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C399EC1
	for <lists+linux-afs@lfdr.de>; Thu, 22 Aug 2019 20:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GycC5n1TZCgo8b/teSgsTu9Z+GkBekbLu1h8fQLPDvc=; b=h9ytEZXTfB3tQ/
	OwmeO+O+/978zyg+npr1Lxop3/7BWpsaa9DvVdpFapCjwdQk0vQrosCYTV04JrMydaN4+5ZJMOj2i
	gL8Ej0PNtzzArzvmjl2ANUi6OI0tdhWB2fbQWFXMLz9UNpG7GSrsvXxrYL9F74dAm+uakKqnEcVsf
	OsSVSj+JpHOFWa8uCVMfYHD4QoMQjDQMvj+GSwHVb3pjF4Yo/LvCl5flvVTQ94WpFH1qXzsiavv3F
	+OiXzuIF5p4RrRCHksNSLbJjMOz+uUl03FneU3jGHE/NxvZSZinQGZ6haY943zW6S8/qg605ul40C
	mOUEXt12/4cAdaJRMKeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0rqc-00038n-Oa; Thu, 22 Aug 2019 18:30:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0rqZ-0002uJ-AX
 for linux-afs@lists.infradead.org; Thu, 22 Aug 2019 18:30:08 +0000
Subject: Re: [GIT PULL] afs: Fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566498606;
 bh=Mg43IPyxQgY8DIuetTLTwM+nBK82U9tuabS8PmKxRtQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=e7cdRbmVb6MwR1bXWekSjXiwvVFS4+v+mFdLYQpj5TkC7CiRrl6EeqMDOg60k+cKf
 3k2t2niQUVaPRhwzV6YUixUfNrOuvv8a9OjX/TFIN4a+iRbrrulKhAOPuBS72J1p0T
 9Hr5tbyReAnTujcdmSabnQ3qs3Isb4WLRLHD52Vw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <32268.1566479439@warthog.procyon.org.uk>
References: <32268.1566479439@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <32268.1566479439@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20190822
X-PR-Tracked-Commit-Id: 7533be858f5b9a036b9f91556a3ed70786abca8e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e8c3fa9f4d3b9c56ee9436c310318a8165d695c1
Message-Id: <156649860661.11049.11048812113160004145.pr-tracker-bot@kernel.org>
Date: Thu, 22 Aug 2019 18:30:06 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_113007_393886_DCF5CDD2 
X-CRM114-Status: UNSURE (   1.62  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: yuehaibing@huawei.com, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 marc.dionne@auristor.com, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Thu, 22 Aug 2019 14:10:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20190822

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e8c3fa9f4d3b9c56ee9436c310318a8165d695c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
