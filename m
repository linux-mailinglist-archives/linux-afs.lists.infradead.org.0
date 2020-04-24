Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEB11B7DFA
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 20:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2R49T5JMoD9f7HYqJKPuZWowXu+kz8pFSKtG3wx9m0E=; b=pKN/GLM0msK95K
	oMq0ZW9xxSGT8AmsFZK7yWkk7FHGIc+MG6cOIP008KnUAa+qXUKo6B0T+PqRamS3M7leSNSK19xpG
	XK31LBYoQh05iuXFGqRAIRj3kq7Pjz6csMC7Lzf6EeWINt8GNjCXlGQNwZ5xyHymljPZ66UwDhhkD
	6o5bW92G+YTEf3QwDXrtVp25lR7pwys9SWPAEKh0wGORXGNhOKZon/jWBiSZIxM92cgUtX5A7zxbr
	yFKc7efLxv8aPHacRrxuu3UV8L9y+kf2vzDujgAJgxMhnL2leHe1eRciGCgk5ZjZx/HmZ2C5jeMIQ
	VoVoB/NdRbqazWqBQyUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS3FW-0006PN-Vn
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 18:40:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS3FO-0006Fo-U5
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 18:40:24 +0000
Subject: Re: [GIT PULL] afs: Miscellaneous fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587753620;
 bh=oGYtWO0myYIyjZeo9Jqvu/EFmmZXm1TEha+Yj0s0WQc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=hSi5bio/7iNaTmm9YrrxQ/973QH26dTS21KKIyTNdqwhccRX75aPly+ikt99Fk8tg
 8X74fOctGBp5nq3xZ3neTi7GzmS9NUoCZrUdQ0YR+Xrb5bGFKeLw+JAkJCTgyXa4Hs
 NGNrHSKCiELd4NLY1Hg2wSGN1xN4Mw25NtYF98uE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <3632016.1587744742@warthog.procyon.org.uk>
References: <3632016.1587744742@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <3632016.1587744742@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20200424
X-PR-Tracked-Commit-Id: c4bfda16d1b40d1c5941c61b5aa336bdd2d9904a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9a195628522c08f36b3bbd0df96582a07ab272bf
Message-Id: <158775362070.26557.15195413938093187702.pr-tracker-bot@kernel.org>
Date: Fri, 24 Apr 2020 18:40:20 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_114022_981435_FED28E8E 
X-CRM114-Status: UNSURE (   1.17  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 torvalds@linux-foundation.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Fri, 24 Apr 2020 17:12:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20200424

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9a195628522c08f36b3bbd0df96582a07ab272bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
