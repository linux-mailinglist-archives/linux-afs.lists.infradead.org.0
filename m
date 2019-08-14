Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BB88E0D3
	for <lists+linux-afs@lfdr.de>; Thu, 15 Aug 2019 00:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKkQ2uAoWeQeaP1IZkAFg5T83CVJ9M9DHlUOpYZsL2c=; b=H2kORsKxfGhWvP
	/a9KbZ2ohTNMTwfCScZ6UDXu40jf7v5DDpsNIRj0nSpEogLCDekWKQ24lAUdyBU2Jc/oXr5ZdskyL
	nsLBCQE3MJNlcv+/dHxlEddSBOs83Nde1ptgffdWfK0eQeejSvTfVsS6FaGF6WWQ/XC72Z6PgnOwZ
	aOuu2FePD+8OXnG1pzQ+TEoiibA4Eyr2KVIpv1LFOEFhRLYOrs4H6OuTF9IOVNj1DH/WvhPdSeXMM
	klXLwpqbSp3fTYshWj+q0+gq5aNgCgo2wTDG5JyPRhvvatQlFbzqY4QEC7Ph8hIEhI1BBbvVeY7LB
	iesQwN4DUGsQi/mP8CiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy1rG-0005iX-1Y; Wed, 14 Aug 2019 22:35:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy1rC-00056m-TG
 for linux-afs@lists.infradead.org; Wed, 14 Aug 2019 22:35:04 +0000
Subject: Re: [GIT PULL] afs: Fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565822101;
 bh=FlnPkqgHy5T6T3OPFXc7nhSpwpi5ci6Jdc5n4cQTtpQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=HHsKo1NEpfGB+Gn9JzGrxbObTriGKoIrYgqswSI8kfca6K+srVGP5XvswXcvnW0NO
 13uihYXFMyCNusYNmbuTsNmzRLtIaO27Ibe2uahyBb+9z1arTIScio5Itx3UZilKhM
 2mFFepY37At+Qh5w1Jc3WKIYSD/hQCvtNmQCXVx4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <13851.1565792320@warthog.procyon.org.uk>
References: <13851.1565792320@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <13851.1565792320@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20190814
X-PR-Tracked-Commit-Id: 9dd0b82ef530cdfe805c9f7079c99e104be59a14
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e22a97a2a85d2a0bdfb134cbbc7ff856ae67edba
Message-Id: <156582210191.11528.8553610434794038321.pr-tracker-bot@kernel.org>
Date: Wed, 14 Aug 2019 22:35:01 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_153502_974534_047105B5 
X-CRM114-Status: UNSURE (   1.40  )
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, baijiaju1990@gmail.com,
 marc.dionne@auristor.com, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Wed, 14 Aug 2019 15:18:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20190814

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e22a97a2a85d2a0bdfb134cbbc7ff856ae67edba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
