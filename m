Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6141A8A81
	for <lists+linux-afs@lfdr.de>; Tue, 14 Apr 2020 21:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSZhM5n7SsovFSlbF8xLNNaHpOUsk/aqUCejtfYa/qA=; b=pXr75t9/uVNqWr
	Rty8cNdEpSAUpfp07/qdL0KSNhBVfZku4WSuYwWl2M/VmDVslJHgGhF5kH6aHzbmiMJHm5vpOYFzr
	LeAW05RIx3AN/K6pUh3iWLRtGsvYTrpGaYFJgr3k0TlOvAAW15OdpiWcO0mR6tVQLujLhFj9hP/Kd
	w2YRHe03ItRY3HXz38kZMMzek6bZkR9PI5VaId5j2DlkZeZu04JkA+2dLAhVfW6Xo2JirA9NGPtUZ
	7zYmXKuxQs4KCRwm+vrCEbihSYNnfiSmxwYtHhObeeQLduMarEsDc6iD4g2srYX5F/orgjcRRGEWb
	DKx8RBCZk3p3tztQrO8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOQrr-0000ck-F4; Tue, 14 Apr 2020 19:05:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOQro-0007xk-EB
 for linux-afs@lists.infradead.org; Tue, 14 Apr 2020 19:05:06 +0000
Subject: Re: [GIT PULL] afs: Fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586891103;
 bh=rxcX3bkiTxcRaV5uIf1VGYjtryE+LFQC/F5AUl8hJtU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=XI+iFxHGSPhXA/9OrrwIZrvl/P2DJD/HXbStttid4I4GR425ULpTi4CfsNJI1sbHi
 QAnVkjMGiwLa7oxFhOdjEN2Foo0UjGV55A9Y4zx+Bls24yg+cmxafxD/1VniON6Mc4
 ORC+YNntjo/4ow7v7GyxPiPAXC2uV9xZV0QmkpTA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <2940559.1586789415@warthog.procyon.org.uk>
References: <2940559.1586789415@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2940559.1586789415@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20200413
X-PR-Tracked-Commit-Id: 40fc81027f892284ce31f8b6de1e497f5b47e71f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4cd66682b2728734b2fc44f5f1e83a5c740b5cf
Message-Id: <158689110356.29674.8805335271309740535.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2020 19:05:03 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_120504_518270_82B7FF7E 
X-CRM114-Status: UNSURE (   1.41  )
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 torvalds@linux-foundation.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Mon, 13 Apr 2020 15:50:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20200413

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4cd66682b2728734b2fc44f5f1e83a5c740b5cf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
