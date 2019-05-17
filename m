Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B689021691
	for <lists+linux-afs@lfdr.de>; Fri, 17 May 2019 11:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9LxBcwAh9sA87Md8SC7Yc2iErYJmMzi9nLgLEvq/Yg=; b=Ej2n+S+QVJ3EB0
	xNdclAT9U81dwbDC+Ehpn1X2fhOJaVn/cuPxPUlmPWvfb6RYqZsDlmvouU3638MYnB35upR834fI8
	e6VhyFEuHQ236+MflqF+iiMJ8vhziL6QYW0zMsYANDIt7tPwca1CG8+xzlw4visK26sspJts8OQ0Q
	ZADW5iE6kQ8Tavy8a+0TyoaqKTHksvvabn7wfBxIjU0Qj3SPWMB0fqZXav5wH5zmZyV7V0L9QpTbp
	x9TkTV9MEj3yiOgb0kQVc9oin9ILlkntZ8/lD8xNadmPIX9Mg8h3rqo5DptHngD41CQ55EEfDkWL6
	XEzzg3hVp11GZ9oLQOhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRZWk-0002jp-Pu; Fri, 17 May 2019 09:51:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRQgc-0000ko-FM
 for linux-afs@lists.infradead.org; Fri, 17 May 2019 00:25:24 +0000
Subject: Re: [GIT PULL] afs: Miscellaneous fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558052721;
 bh=qH/jYKDYYuG0SN6yqxBilyIgP7RnCizxThvaWYHuv5k=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Vcl98VWv5Rp7//8YzH46O/VVvThBFj9AosScjWG4CvWeCr0ipXwKtxZYtMEyScV0V
 PagHby8CS85i1hBIz/uiY6k6xgvLdM/phyDgTSxrNhRAnKQ7rBkAmMllxDuMfSPgqY
 qnWNG0dS8IShSkm02Olpc0yR1A4KzKeg5OKRb/m0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <14411.1558047621@warthog.procyon.org.uk>
References: <14411.1558047621@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <14411.1558047621@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20190516
X-PR-Tracked-Commit-Id: fd711586bb7d63f257da5eff234e68c446ac35ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fefb2483dc10c736e4235984fed4f3a61c99e1c2
Message-Id: <155805272165.4154.476286721537774730.pr-tracker-bot@kernel.org>
Date: Fri, 17 May 2019 00:25:21 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_172522_760121_0D7373E0 
X-CRM114-Status: UNSURE (   1.91  )
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Fri, 17 May 2019 02:51:45 -0700
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, Joe Perches <joe@perches.com>,
 Jonathan Billings <jsbillings@jsbillings.org>,
 Marc Dionne <marc.dionne@auristor.com>,
 Colin Ian King <colin.king@canonical.com>, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Fri, 17 May 2019 00:00:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20190516

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fefb2483dc10c736e4235984fed4f3a61c99e1c2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
