Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB61FC2EE
	for <lists+linux-afs@lfdr.de>; Wed, 17 Jun 2020 02:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEck3V8e1Ugqs0pChRI2E+/I/QR5u9VBvr1edjVBAUs=; b=tXJc3TByzNf7Y6
	pG61Xi9lnRFig1ud81r79x9Q4klW/e7SgCs0vRZXPMgX9+FpfkTNrq3hUXS1WM0WFlEddsqOBWXIU
	cn6yPBgvxxJmFbkM4Mf+q11tIe6/9zzd/jeJ7iZzjBWNLyW9UsT1km0PyJISKmNS919yyOxxi+e7S
	2t2D97beCLsCRtGVtx/lEc33L9UwMKp1xbvq7A/4JoduUlnobeGJIGbM9dwS5c3jUKZ22RlCmi5Ao
	rDoCMadzmTiiyCTnpkGN7w1p5nwTSrF/nkJ8fhLcDFrY2UqNRyZHWbC+oUWLUGb9d6/AP5KW3rfkY
	ryGkv72BqJ86Bwazh0YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlMCU-00038u-8t; Wed, 17 Jun 2020 00:45:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlMCR-0001N2-BA
 for linux-afs@lists.infradead.org; Wed, 17 Jun 2020 00:45:08 +0000
Subject: Re: [GIT PULL] afs: Fixes for bugs found by xfstests
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592354702;
 bh=5e0a5iVK0TowUVssPommYkc0TiKB/g2Al8oPNa9mwdY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=xmD6N+dN46UNILbjwMP2cHybDYG10PBuE8BXl69PdQU9/4tRZf/8DHgLvBqIhLynh
 6udFqP56Zm80iivQhz7UWd+QI+bJ8MQKJUcHibFZztlT7pEgn4fvHudl135suydsMn
 F5mD95K9IByHUZEQO4JDQP2yOV9AYp4uMooZ/154=
From: pr-tracker-bot@kernel.org
In-Reply-To: <930958.1592344306@warthog.procyon.org.uk>
References: <930958.1592344306@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <930958.1592344306@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20200616
X-PR-Tracked-Commit-Id: b6489a49f7b71964e37978d6f89bbdbdb263f6f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 26c20ffcb5c86eb6a052e0d528396de5600c9710
Message-Id: <159235470279.15875.12694874433794392475.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2020 00:45:02 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_174507_425435_C5C1118E 
X-CRM114-Status: UNSURE (   0.96  )
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, marc.dionne@auristor.com,
 torvalds@linux-foundation.org, linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Tue, 16 Jun 2020 22:51:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20200616

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/26c20ffcb5c86eb6a052e0d528396de5600c9710

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
