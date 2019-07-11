Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A9965134
	for <lists+linux-afs@lfdr.de>; Thu, 11 Jul 2019 06:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVlkpUFixuFr1Kvi5FvyhupWlp9dEaiBH4Yp7r25/rw=; b=gTOvRKYP9yONUq
	OUoeAmX7HAuiDhpZ/LmTK5x9ydNYWt+wPZlV+K21tAxEgjtNcsFqdh0IzAIgK7xiVXIOjFtGdv8LK
	5LJdys+pTt+z6lDAPeThdFC8L7Fus9kIpFbQCUg9DE527/HsOWgBwHMZFPyYqj1WKXPyex7ZLkKc5
	5Go1VsSpyaV4z2/SM3r8i60FKN9bpZfBJE3/b9FGiijgFcZjqdW/ItvIbd4oi25GHkzQFFYK2slIC
	n+zd+Px4FyW+DJql7WL8dEkXAZ2XZP9Ogw+LJZYybf/yMPYkO/ZMrBZGAqDoY97nESEe0ej4UsLKj
	4H6ksRhJ+k/RO1BdYJuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hlQsI-00069F-QF; Thu, 11 Jul 2019 04:40:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlQsF-0005Yu-Gv
 for linux-afs@lists.infradead.org; Thu, 11 Jul 2019 04:40:04 +0000
Subject: Re: [GIT PULL] afs: Miscellany for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562820002;
 bh=BlEwBoMZiqlTzcxCh2VUi0xFZw2gJ1VGjZXrg2TFvYY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Vq4GaLVMaq7bCnq4NiAJiRLf/PcD3bcRO7eE5sdJEYjXvSYHmjKYoPpm1j/UUcY17
 vLFVWwFH+HuyIDjfGx/O57HbnThk0Ed6GGBe8BMTrl/82MGtFF8p5ouD4lT2L1+DDw
 VjxUcFLrsmGDDRQsEHxPe1FWoO3WUxCVKKlzdrQg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <29485.1562363139@warthog.procyon.org.uk>
References: <29485.1562363139@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <29485.1562363139@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-next-20190628
X-PR-Tracked-Commit-Id: 1eda8bab70ca7d353b4e865140eaec06fedbf871
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8dda9957e3a1c871dfbabf84c4760f9b26032442
Message-Id: <156282000248.18259.11105783387466270234.pr-tracker-bot@kernel.org>
Date: Thu, 11 Jul 2019 04:40:02 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_214003_598811_AFFFAC70 
X-CRM114-Status: UNSURE (   1.25  )
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
Cc: jmorris@namei.org, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Fri, 05 Jul 2019 22:45:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20190628

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8dda9957e3a1c871dfbabf84c4760f9b26032442

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
