Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 810D0B7142
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 03:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8I/82gRmlFIqHT/LnROoDqQqlnTSM7aJnw7X0jEu6Ps=; b=mEBLVmTPOUTm8N
	+9f59dlTkEWi+pKlVcDweRMR4q5jpMWUnJiQhiOhwPIdIt927ZP4EAU7j1nuA53LdSnxA4HGEao3K
	wFDPjX8OA4UPScMSL4cGu9+8T6aZe+Exkj9vXtN6ibpiWEzdKePk2DpW55Ty8YcH2LhR/YmveJIqh
	Bal571OVNSiCjiBFtAQBNESxJtl015JcaAlUFsO2nCIIctAUJwLKvd+5qNUqNwIJtajy/hXJ1dEmp
	nyq98nVH6FeDiTqNo91DT6N2vp3ZxCjz5mPbxKtCYg+9JTtHE+GCwpXy2rRi3fu1VGt1FLxgVRWyh
	kPyQNluQlmONQltrwvRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAlf0-00009h-DZ; Thu, 19 Sep 2019 01:55:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAlex-0007sz-6O
 for linux-afs@lists.infradead.org; Thu, 19 Sep 2019 01:55:04 +0000
Subject: Re: [GIT PULL afs: Development for 5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568858102;
 bh=h5EbUi2YKlgLrGkHKTD9u4kmqulfEU8Juz+gspWMpAI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=IVXRkwvsFfkvut90JB27p/Stfm0ap1x5vP9IQDEWruOTSG3DvCxYaARNcA+WatC2K
 hP6+fqD9KtIN4e639gPMdmBuuUScBwXnBQ3Zj8HBmndIiHFsfzgCJ1eItBm385yn8U
 p5+dZA6iuyE3ME7TU1T5c3TIRo5DpaDFSmB94Ljs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <16147.1568632167@warthog.procyon.org.uk>
References: <16147.1568632167@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <16147.1568632167@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-next-20190915
X-PR-Tracked-Commit-Id: a0753c29004f4983e303abce019f29e183b1ee48
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0bb73e42f027db64054fff4c3b3203c1626b9dc1
Message-Id: <156885810200.31089.6710579917930332156.pr-tracker-bot@kernel.org>
Date: Thu, 19 Sep 2019 01:55:02 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_185503_265152_398F2980 
X-CRM114-Status: UNSURE (   1.71  )
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: yuehaibing@huawei.com, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 marc.dionne@auristor.com, linux-fsdevel@vger.kernel.org,
 torvalds@linux-foundation.org, linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Mon, 16 Sep 2019 12:09:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20190915

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0bb73e42f027db64054fff4c3b3203c1626b9dc1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
