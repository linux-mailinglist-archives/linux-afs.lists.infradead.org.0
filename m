Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D31F4A00
	for <lists+linux-afs@lfdr.de>; Wed, 10 Jun 2020 01:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGfNq7e6jl6WDLz1nE5tnSb+hXEUJUZWvJE0xma0Zf8=; b=TXFrUeRDlR/tZZ
	LrHj3fKP6MCZH4UN0QyACTmiWWaHVBKvpXXrEd5Py+9wwR77Xxy58GbVzIfDxLcrvjV/iZe/HuSCU
	+jO5+as/ADbnsRuwhKWywcFQoI0mYeUUL74u28r5FVdYhuz+e+r0neoK4i6SUoNnny9tCxauCU5AI
	7YEKzerSqWxRmfZsaJlX3CFs9PPUhJooP3zFLjowGzNdZ7BWsHSC9NJXXuju8qITuPFWZaG/K0UwI
	T8NvxaGNKCoq73n78ybvg70lnS1qlHKNwVWzfCBKi0QiyMqgXIG87Ych6wXLSwUhd38KHYBv97EFU
	zoH8hni0KB6qkRsAkLRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jinNh-0006Kf-Ev; Tue, 09 Jun 2020 23:10:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jinNe-0004zV-Bv
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 23:10:07 +0000
Subject: Re: [GIT PULL] afs: Misc small fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591744203;
 bh=PWL47kqkwUUVGbUhRreca/H463T7rLQ4+w8MVdM3OVw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=PjSkZzlPvVuUis6st1gRwV0CzxRYmdpsOtJsda1zzd76l4nbTr6AXmoSP1oxrk7tZ
 gfz49wb6CHwgzX8YPRcdS3GGYdhjm2nurSQX0cgbL+vXqzppzXu+s8ySRV0NmTU/dE
 zJL3m51V/Qll7mHeOffIEXYDZcavA7bxTXSnQzM8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <3071963.1591734633@warthog.procyon.org.uk>
References: <3071963.1591734633@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <3071963.1591734633@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20200609
X-PR-Tracked-Commit-Id: c68421bbad755a280851afff0fb236dd4e53e684
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4964dd29140a44e26474dbdca559b7393aba6c39
Message-Id: <159174420387.2962.13061146341675614064.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jun 2020 23:10:03 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_161006_459464_FA0CE5AD 
X-CRM114-Status: UNSURE (   1.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: keescook@chromium.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Tue, 09 Jun 2020 21:30:33 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20200609

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4964dd29140a44e26474dbdca559b7393aba6c39

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
