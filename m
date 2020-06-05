Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D36321F03A6
	for <lists+linux-afs@lfdr.de>; Sat,  6 Jun 2020 01:50:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RE57RIgSsgJi10qPyscBF65yA/SN4fc+eFY00H0J+z8=; b=IM48t7Liip0hNM
	7ZHP8dZIGS1t45bvY/ZC9dLHIO7SjB8gH3y4t/foY6NssKLQRDuxmlPQXvJdQpDSjp2TgDCp4NPcS
	4JFpnDkhy4fvg+MyO77kseZf9rQTd5nWgVoVlxmh+83gGyNS3mv5By2smxWliF1js+ng7Kp5nzjDZ
	MEFXneucOTogtgwZC9NfxbdJeazSxkUB9GYu/Q/Qxxt1lJnLbUjUAhY5DjUNHhwksoVPRw8EwRIUO
	zC7EBFI+++DVcugbqPjm+1bVwKDaVAtAvIHrZfZOhOVCXwNHn1Ze29aJ77xgGCRjkMZZTDWDk0N/T
	QTKByvCiK3mwk5JGD1JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhM6B-0006dS-Dh; Fri, 05 Jun 2020 23:50:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhM67-0005iO-UN
 for linux-afs@lists.infradead.org; Fri, 05 Jun 2020 23:50:05 +0000
Subject: Re: [GIT PULL] afs: Improvements for v5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591401003;
 bh=h0dhn9foy0oHVA9lAWRv6a28GFTGZK6615/30Nc0DcY=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=zc2VosVc5lbf2pyLupUAZhcn6FFli1byPX4c4hPU05z7P4x6WqXS2/jg5XBhROT0x
 k9t62ceWhFsQ55OKBVtFfvN8OHjFUf9D8//6/10jz+q/MSwu6fc0XTat5Kow3RWESD
 vaQbLX1rqUrRlWPYSgj/8n5l5P9vEJxcfAqwrkhI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <2240660.1591289899@warthog.procyon.org.uk>
References: <2240660.1591289899@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2240660.1591289899@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
 tags/afs-next-20200604
X-PR-Tracked-Commit-Id: 8409f67b6437c4b327ee95a71081b9c7bfee0b00
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9daa0a27a0bce6596be287fb1df372ff80bb1087
Message-Id: <159140100342.11239.8868355253372056432.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jun 2020 23:50:03 +0000
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_165004_006758_7583EFBD 
X-CRM114-Status: UNSURE (   1.36  )
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
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 torvalds@linux-foundation.org, linux-afs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

The pull request you sent on Thu, 04 Jun 2020 17:58:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-next-20200604

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9daa0a27a0bce6596be287fb1df372ff80bb1087

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
