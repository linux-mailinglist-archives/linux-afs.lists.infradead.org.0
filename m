Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D12CB17
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 18:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OrWV3OC90kwJZHlYuXe3vnriTRoVeKKQ9pdg6KKdLzg=; b=cdVHCn85ONTTw9
	Xpa/J4RZnRc+95d4MxBNJ/n6YE4DqynYfABFyNBJpU1Zwa0hAPwUily26w0DkSs/IGLuztO6TBXZD
	y74jdn21CfxwYInDLbw93vNydlRmuJeZ+GXIIy5Dg/PM+BF+dGxikrN8d4QWWwFsJ2/c98MaS0nJ9
	RhoUmrDjrb+pLmRM1vvE+YxwwlUPSwZFndyxjAZUZlAL7bpotfggIM/OjgxI7fTKL8z8+ZosjHJJb
	hfjNQBYrZh3ad7T5N8HoH+OqAkWYZWbY9DDMMqrm033Sk46nhvKqyFyctWPfFlqsCLQxBLR16HcN3
	EeOdF1DubAuk39pQOq/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeea-0002Bb-41; Tue, 28 May 2019 16:08:44 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVd1z-0003Wb-EZ
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 14:24:50 +0000
Received: from ramsan ([84.194.111.163]) by xavier.telenet-ops.be with bizsmtp
 id HqQS2000K3XaVaC01qQSyc; Tue, 28 May 2019 16:24:42 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00058F-2p; Tue, 28 May 2019 16:24:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hVd1e-00057M-0A; Tue, 28 May 2019 16:24:26 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Igor Konopko <igor.j.konopko@intel.com>,
 David Howells <dhowells@redhat.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Eran Ben Elisha <eranbe@mellanox.com>, Matias Bjorling <mb@lightnvm.io>,
 Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 0/5] Assorted fixes discovered with gcc 4.1
Date: Tue, 28 May 2019 16:24:19 +0200
Message-Id: <20190528142424.19626-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_072447_651721_F4230E93 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [2a02:1800:120:4:0:0:f00:14 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Tue, 28 May 2019 09:08:42 -0700
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

	Hi all,

Ever since commit cafa0010cd51fb71 ("Raise the minimum required gcc
version to 4.6"), I felt bored when looking at my test build logs, as I
was no longer discovering many real issues.  Hence I started wondering
if the modern gcc versions are really catching these classes of bugs
caught before with gcc 4.1, or if they just go undetected.

I reverted some changes and applied some fixes, which allowed me to
compile most of the kernel with gcc 4.1 again.  I built an
m68k/allmodconfig kernel, looked at all new warnings, and fixed the ones
that are not false positives.  The result is a patch series of 5
patches, of which one or two fix real bugs.

Thanks for your comments, and for applying where appropriate!

Geert Uytterhoeven (5):
  lightnvm: Fix uninitialized pointer in nvm_remove_tgt()
  rxrpc: Fix uninitialized error code in rxrpc_send_data_packet()
  net: sched: pie: Use ULL suffix for 64-bit constant
  ALSA: fireface: Use ULL suffixes for 64-bit constants
  [RFC] devlink: Fix uninitialized error code in
    devlink_fmsg_prepare_skb()

 drivers/lightnvm/core.c                      |  2 +-
 net/core/devlink.c                           |  2 +-
 net/rxrpc/output.c                           |  4 +++-
 net/sched/sch_pie.c                          |  2 +-
 sound/firewire/fireface/ff-protocol-latter.c | 10 +++++-----
 5 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
