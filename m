Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1CA2113C
	for <lists+linux-afs@lfdr.de>; Fri, 17 May 2019 02:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJLbTB+37NpneUfw9b7MtJBeEdFMxut540LokMvebI8=; b=d/QYZz3ydERC8u
	YI2P9TAtJZHm2Dck+eSm/kBxDji6IHo5Z65US5se9p42qI6Fq2pcZSlujIInYrRMGW6h1UvKNAue1
	0HOTOa8QgV4QG04TMGc8gZ8Jle4ntZpWG2Rx0UH02VbRRxTauIwWtjzeh+icQUnSjQt/N3qCghPbR
	sLnzzfbt70/Qn0TDsIHF0gGdHocCa0+tFFHuucv/Fh3ZXmQFW+/lQ9ikwMCHtNlFv40qLaDPT+/G3
	DbJR0HyrqyL7I/R3UZ5l1lVlMzClCHzWpYj60Umoe5MGcAgnOftcgqdyEgSMqgI0XRbkfYFmGS6ai
	OqYdV+AICBFNwwLmMzaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRQgf-0000lU-TI; Fri, 17 May 2019 00:25:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRQgc-0000kp-R7
 for linux-afs@lists.infradead.org; Fri, 17 May 2019 00:25:24 +0000
Subject: Re: [GIT PULL] afs: Fix callback promise handling
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558052722;
 bh=0RzTI5eZC27hvW7LiDE5bJwxYMzbHhab9LqWsZel2UM=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Sn1fC9/LMfKVNi/vyElrLMPcZ68UTg/LgeGbvRiUP/o6ZS+RuN9yHtmgTi2dfBy6C
 0O+u3AVlpRcBigaGaD7QM0Gxb+X7qFkD5xscgfon+0uT6ZuMI1FViO4g38f+s9kBz/
 9wjs8Njt0BdqUmb1glc2fiCqckdum6xEqJ/HqXD8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <14598.1558047724@warthog.procyon.org.uk>
References: <14598.1558047724@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <14598.1558047724@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-b-20190516
X-PR-Tracked-Commit-Id: 39db9815da489b47b50b8e6e4fc7566a77bd18bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d74471924f2a01dcd32d154510c0500780b531a
Message-Id: <155805272252.4154.14037520601109942729.pr-tracker-bot@kernel.org>
Date: Fri, 17 May 2019 00:25:22 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_172523_175313_B133B775 
X-CRM114-Status: UNSURE (   1.92  )
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
Cc: linux-kernel@vger.kernel.org, dhowells@redhat.com,
 Jonathan Billings <jsbillings@jsbillings.org>,
 Marc Dionne <marc.dionne@auristor.com>, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Fri, 17 May 2019 00:02:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-b-20190516

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d74471924f2a01dcd32d154510c0500780b531a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
