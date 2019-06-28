Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6126758F1C
	for <lists+linux-afs@lfdr.de>; Fri, 28 Jun 2019 02:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/W4sl+uTNnwQYqWDesA1YNcH4pqPPVGlq3WyodmUKVU=; b=XWeBeMcllvGwkp
	rtcBvzsL0lwqEBY6aFBkTq89jHlM73I1b6Qdqy272Yk2b2RXpYaryxevyKYL1ANhyo3fJf+BMldI7
	v7RA08qrbalrUxjHNozg3zqsEHkjN0rOvVbR/WXrY5e/2RR19o+nllRoVXAJegWMs4OYhePq03W/y
	HxR7o2sFWZppLck2KyJS8zJgWZu01x51MqoR5IxYS+zsvV/3D63NWcEPacVMfVe8i4zKK9JN5C2ty
	B2R1I4pzUe5CJsqiGtFf/cQemGLmnnFJ/fpro9WKB9zm/SyESM0t0N7nKhJkOsXRSIZ43V4n76P0w
	k+sbNw+D7G4HOyWOkUig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgf0k-0007av-S0; Fri, 28 Jun 2019 00:45:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgf0h-0006yL-J5
 for linux-afs@lists.infradead.org; Fri, 28 Jun 2019 00:45:04 +0000
Subject: Re: [GIT PULL] AFS fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561682702;
 bh=wE0WyHlTV0mNFSx7vHFnmAbdh3OFAI5S95W9IoLnzwQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=mmrJ42WJWxkbmjyEzMbJGn/wMGMpym3AHje9aTVOlvqffCPfjQMAYQXaAPV+nHLrs
 CllDqABAQFb511GeQpfqGPBmTeKoeWA8GFXl0mayjINf8fiJ27SMpftfk9uBM+o8aG
 bY0d2In+WBppgENCe9lhA2bSzOZvXxzFuPd+TI+o=
From: pr-tracker-bot@kernel.org
In-Reply-To: <11571.1561556393@warthog.procyon.org.uk>
References: <11571.1561556393@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <11571.1561556393@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20190620
X-PR-Tracked-Commit-Id: 2cd42d19cffa0ec3dfb57b1b3e1a07a9bf4ed80a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd0f3aaebc5b17e0ccb1b9ef9ae43042d075d767
Message-Id: <156168270234.1895.4402791272691293668.pr-tracker-bot@kernel.org>
Date: Fri, 28 Jun 2019 00:45:02 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_174503_651840_12A27C18 
X-CRM114-Status: UNSURE (   1.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Wed, 26 Jun 2019 14:39:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20190620

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd0f3aaebc5b17e0ccb1b9ef9ae43042d075d767

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
