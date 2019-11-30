Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 176E710DEEC
	for <lists+linux-afs@lfdr.de>; Sat, 30 Nov 2019 20:40:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOsT3aP2JDQuMQiMbFNCtZAQTAYQE+QYo2FXvv/Pm6Q=; b=MdmRe9QbJuEzdA
	3LhL3K5LN4r6Uz29yLB/MJj3t/BN+BdtTjFy4nwSMdlPFrNFaPcQPvXHvEdu6rhEzAb9ud++Mcw8/
	43HkqPhmiszRCTwK4zIi6b2+kLrCer++BNDsLTAJ9Ye1jnZ0Ys/mVhWur4q/KtG/Rdj+Bds6mYaM2
	woWLPGHHH0I0xeE0HqrHj6l2/gvPSvW8p+OMVyZwm/33OvphAT+9OM+2er3pNqluqJLHxsNpN/Le1
	GCFreNKuHv2BO2YyFOxvSY0ZImq5wSuqhQdjwxxjpWSWsc1yRUtSvMCNCMv5VX9sk1qng9YTCH7Z4
	xkR8EzHbGsXAL/KY1lrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib8bD-0003cZ-3u; Sat, 30 Nov 2019 19:40:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib8bA-0002u1-K2
 for linux-afs@lists.infradead.org; Sat, 30 Nov 2019 19:40:10 +0000
Subject: Re: [GIT PULL] afs: Minor cleanups and a minor bugfix
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575142805;
 bh=FAKuL0S0DRl5SVomXVMeTyFTKMQjz3YQ3essi+Iaegc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=JDQWc6yVZcd1xz079TJT3fbqfzfvSZxwD76+NqVYxBHZ/hVyEsOqjdNkHr6TNv6TG
 eARFZBJCy3N9z/XqV4rWhpOceQ21dhvRoM3vzqkvWhySMj2QNJd6qaUCDN1KJ/F3ZB
 r+iC33+3nUZEyElr9VHCM5ejFP2Ci/UmWvHE9aDs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <27497.1574808228@warthog.procyon.org.uk>
References: <27497.1574808228@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <27497.1574808228@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-next-20191121
X-PR-Tracked-Commit-Id: 4fe171bb81b13b40bf568330ec3716dfb304ced1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a55d362ffe7caf099a01f6d2ed49a6ea03a4a88
Message-Id: <157514280589.12928.10700973031954050508.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2019 19:40:05 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_114008_689616_CAE971E0 
X-CRM114-Status: UNSURE (   1.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -3.7 (---)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-3.7 points)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.5 FROM_FMBLA_NEWDOM      From domain was registered in last 7 days
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

The pull request you sent on Tue, 26 Nov 2019 22:43:48 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20191121

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a55d362ffe7caf099a01f6d2ed49a6ea03a4a88

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
