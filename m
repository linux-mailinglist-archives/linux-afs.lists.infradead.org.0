Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D4111C397
	for <lists+linux-afs@lfdr.de>; Thu, 12 Dec 2019 03:50:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bak0mbzxlnEFIq+Y3o+m6Mbay87jJcePOZeuzzXbuxA=; b=el32MCiGJrtIDq
	I5yXUnxWd+slsOW2CCoP2NGgL4ZgSnmUh1Tjfa/3Qy7+w9+8OT+ppbdM0KqmIHZ2dPDyNQooCdpQz
	N6roDdWu1w96KvUodcxYoyXsx6Xwb4QW1U2O3EkibdfKGfhb7nikb0PSyWWjazowUuFvOvpe5ALv+
	Ry8QekKm/FzCwTWeJJ0hnqiqyuD0vsGCKdMFmSGl62L8lBP5cogxQJ+MyoRyWFRwDzss431Ob55sF
	EhvUU8OjQM1bK/EOPU1Dlx7xoWSJnj4bSKleqMJEeUJHq8fVchoaWJ5T0cY38BArME5OVDoPnZIpx
	stV9HH84FEPX/WLdUlzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifEYH-0006mJ-Np; Thu, 12 Dec 2019 02:50:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifEYF-0006R7-GP
 for linux-afs@lists.infradead.org; Thu, 12 Dec 2019 02:50:04 +0000
Subject: Re: [GIT PULL] afs: Miscellaneous fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576119002;
 bh=UPCC/x01BlBLT7CIZuEuox8GyPHZ1Q2XEbX0lTlzesc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=cvQzquuc8itBxKh0Vav91ng5TybS0BXsT73JgmzEPqkXsJwLuNrqEtH+EJPXvWIjT
 +2TUnjwolugI0FVynllGh0i4rU7KqZJdGrqFWJCLnxJ6ABwHlPDZthg38SBFOLYpvJ
 YxuCaKUJziYxyZIAZ+dgliZ0I9tx1m6ANf8ye0sw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <11743.1576099077@warthog.procyon.org.uk>
References: <11743.1576099077@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <11743.1576099077@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-fixes-20191211
X-PR-Tracked-Commit-Id: 50559800b76a7a2a46da303100da639536261808
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae4b064e2a616b545acf02b8f50cc513b32c7522
Message-Id: <157611900281.8855.6872248503781144513.pr-tracker-bot@kernel.org>
Date: Thu, 12 Dec 2019 02:50:02 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_185003_591600_0D1D1FE4 
X-CRM114-Status: UNSURE (   0.95  )
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, jsbillings@jsbillings.org,
 marc.dionne@auristor.com, torvalds@linux-foundation.org,
 linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Wed, 11 Dec 2019 21:17:57 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-fixes-20191211

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae4b064e2a616b545acf02b8f50cc513b32c7522

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
