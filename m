Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED81702C
	for <lists+linux-afs@lfdr.de>; Wed,  8 May 2019 06:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5S6bMhI+73Y3MB6Ze1vGtvsGo807mKpWxTsY84W1Zas=; b=jh8VoUi2tEd54n
	N7whlDohV2wM7hW5mXHGQ6cIVttNvMT0e8HZ8zk4C3nXck0hMv47infW2dea8WT4F/E5CZGekxaxP
	6dAGO20uxuPPBYQwn4FyNsXLHziegpyLgn/49b8RDDjHNZdFuJslWIfGU6niLRbhWIusC0trs4U26
	PtY1ufXag98Pw2sIAlFFxSxYyp3/sW5tGuc2sE7sQv+B61O748kmCHKeQ7tfqvkKYTqiFWfqPNoUE
	3nmRs5OGVKa4QqgR24NMTgSaCNF3ApUlpQ+/K+BASfuf6HRrJeBZrp1hXQucBy7LTx1oJmmXNA2q3
	NDALXEmHPNRShGkwS9pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOEbh-00057x-Q1; Wed, 08 May 2019 04:55:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOEbf-0004e8-BO
 for linux-afs@lists.infradead.org; Wed, 08 May 2019 04:55:04 +0000
Subject: Re: [GIT PULL] AFS fixes and development
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557291302;
 bh=51OU6zrDGh8cgnFmsUBmDw6WGnV4s3BjfmxvI6z4C2g=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=kR8NhlH8vJ2BxtiNoyo98nDAAa8xB0KX97IF/2dEOobCKYilDvWAha390WtDMa0bi
 shzRcGrY5JaLbktOjLYunLiYmJGtkpY2PQ2Wf1+fXqCB1rydw9HIs5lfBGZ56XeuGy
 WfrBfNARprBG6KfNp6H6Cx6lrRlWC8INPVMQ3XNE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <28470.1557259877@warthog.procyon.org.uk>
References: <28470.1557259877@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <28470.1557259877@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-next-20190507
X-PR-Tracked-Commit-Id: f5e4546347bc847be30b3cf904db5fc874b3c5dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5fef2a9732580c5bd30c0097f5e9091a3d58ce5
Message-Id: <155729130225.10324.6561479759670477472.pr-tracker-bot@kernel.org>
Date: Wed, 08 May 2019 04:55:02 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_215503_418806_36B81FD7 
X-CRM114-Status: UNSURE (   1.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 torvalds@linux-foundation.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Tue, 07 May 2019 21:11:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20190507

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5fef2a9732580c5bd30c0097f5e9091a3d58ce5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
