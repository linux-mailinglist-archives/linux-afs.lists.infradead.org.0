Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47A71236
	for <lists+linux-afs@lfdr.de>; Tue, 23 Jul 2019 08:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XXEJ6qbImDYpEZdv6BrQtak1tzRvTambXzKDtmiVIM=; b=ULH4dX5JonBqy2
	8/7gbPOZBfmAtKFoExVd5eHSJLSWH4XL7TlB5vUdfaonK7flasa3M8vaqprjpkDXL4KA9YfomldtG
	tQ01KIC3BoC1Ubas+LtxqZKJDOsHnB0Hre9oRNNhes1ny+Gz4ZGWUsJODuBQF6YR/19pgNTUfKeE7
	xRwHvIs+oBH50SqCypy0ga5J2EFDcilQ9LjznFsEBr3dQP8bhKS8SSZoI4aBUJ3I77A+lEM+UX/9u
	gJYVZzMScfu2AHqI0YdY+vnmrS/HezAsUldOxAqF9C60Hy6VZAbz2uIZqJJeFXbe3OrLTlmLvNuCU
	tm5JS+dDKmvZha0qWrXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpol3-00087D-LV; Tue, 23 Jul 2019 06:58:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkgat-0005hs-Hg
 for linux-afs@lists.infradead.org; Tue, 09 Jul 2019 03:15:04 +0000
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562642102;
 bh=ffJpmiG3YCVrmSdb4Ds3CGUQgDaz+9N4x55s4P3dlvo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=gquIdpoSw1zf4tIdWE/tortMRjaZsdQquNItwfubAGAx7ABS6Jg++fZscnR0BnsTY
 IBuaA0rawGY1tLdIcROynx/7Ndt8b7dpg8G33y+ze2Xv6bNom2fBgUYdFNSu1/eoIZ
 WpG6iyy5q1f4L2tWwnRPvv2jW+B6HfkehCwoYY2E=
From: pr-tracker-bot@kernel.org
In-Reply-To: <28477.1562362239@warthog.procyon.org.uk>
References: <28477.1562362239@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-nfs.vger.kernel.org>
X-PR-Tracked-Message-Id: <28477.1562362239@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/keys-acl-20190703
X-PR-Tracked-Commit-Id: 7a1ade847596dadc94b37e49f8c03f167fd71748
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f75ef6a9cff49ff612f7ce0578bced9d0b38325
Message-Id: <156264210283.2709.18395042155936707106.pr-tracker-bot@kernel.org>
Date: Tue, 09 Jul 2019 03:15:02 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_201503_616288_7C6CC082 
X-CRM114-Status: UNSURE (   1.27  )
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 22 Jul 2019 23:58:43 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Fri, 05 Jul 2019 22:30:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/keys-acl-20190703

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f75ef6a9cff49ff612f7ce0578bced9d0b38325

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
