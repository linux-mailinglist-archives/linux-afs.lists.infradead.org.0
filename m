Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A701C3C6F
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 16:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fKJ0vnfNXtPSTnUyqL48Hk16Aqfyt40Nk8AYIIqWl4U=; b=GXncazfS729CQS
	K+INTv1fqweEei9NumCwJaZk7pLx1aW18HStIzZA5p4ceooTPPi1b5aPyv3MQd1TbxqAo8yOyrgn5
	thZf/mVOnXS1zcQSNXQLIs5U6m9/UXrxive3t7JcCQq2E5z/iG6vWHDnqTfZPHdIBCdykXf6uxnbg
	W2WWTSuGz3QNi/F+gEDag/YlGeXQMnDAnultPV3woGslWLzKgeDGt4x87JTrwooUQ1Ap3305WUhy9
	AKVfMgbAdRiKtKQlWAMgDrlzj/LeB4MFRPzvtp4dJ2tFpcVwdl8OLlVWLu1hZCTxO+tESH45TuKyR
	zNrqVPNp3WLj/uX/Aq5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVbnA-0006Lr-Ij; Mon, 04 May 2020 14:09:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUBfx-00081T-0g
 for linux-afs@lists.infradead.org; Thu, 30 Apr 2020 16:04:40 +0000
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1A81208D5;
 Thu, 30 Apr 2020 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588262676;
 bh=htL5CBKoN0WCDcYQWi30eM6Fpz9wSc9gmJDRu0SQ/NI=;
 h=From:To:Cc:Subject:Date:From;
 b=unU5CxMku37iTcODJkr/My/DCiuY6c7gGAUz/nAMxHPid7wUgnKJN7TIkX32+xzAE
 LaNUyPunTxlMUmMWOxf8nrGoMgwV6nioZLtQ6AY+8pCNjmTJpZEtKL/ngWXECpueqz
 gmp7pUE+yyWwIAa56XTDl09fGP1NFHQBOR2lpjN0=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
 (envelope-from <mchehab@kernel.org>)
 id 1jUBft-00AxE8-VJ; Thu, 30 Apr 2020 18:04:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/37] net: manually convert files to ReST format - part 2
Date: Thu, 30 Apr 2020 18:03:55 +0200
Message-Id: <cover.1588261997.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_090438_463500_4643EAFE 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 04 May 2020 07:09:55 -0700
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
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 David Howells <dhowells@redhat.com>, linux-sctp@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-afs@lists.infradead.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, Oliver Hartkopp <socketcan@hartkopp.net>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 coreteam@netfilter.org, Jakub Kicinski <kuba@kernel.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>, linux-x25@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-can@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Remi Denis-Courmont <courmisch@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 Ishizaki Kou <kou.ishizaki@toshiba.co.jp>, Florian Westphal <fw@strlen.de>,
 Neil Horman <nhorman@tuxdriver.com>, Geoff Levand <geoff@infradead.org>,
 netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

That's the second part of my work to convert the networking
text files into ReST. it is based on today's linux-next (next-20200430).

The full series (including those ones) are at:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=net-docs

I should be sending the remaining patches (another /38 series)
after getting those merged at -next.

The documents, converted to HTML via the building system are at:

	https://www.infradead.org/~mchehab/kernel_docs/networking/

Mauro Carvalho Chehab (37):
  docs: networking: convert l2tp.txt to ReST
  docs: networking: convert lapb-module.txt to ReST
  docs: networking: convert ltpc.txt to ReST
  docs: networking: convert mac80211-injection.txt to ReST
  docs: networking: convert mpls-sysctl.txt to ReST
  docs: networking: convert multiqueue.txt to ReST
  docs: networking: convert netconsole.txt to ReST
  docs: networking: convert netdev-features.txt to ReST
  docs: networking: convert netdevices.txt to ReST
  docs: networking: convert netfilter-sysctl.txt to ReST
  docs: networking: convert netif-msg.txt to ReST
  docs: networking: convert nf_conntrack-sysctl.txt to ReST
  docs: networking: convert nf_flowtable.txt to ReST
  docs: networking: convert openvswitch.txt to ReST
  docs: networking: convert operstates.txt to ReST
  docs: networking: convert packet_mmap.txt to ReST
  docs: networking: convert phonet.txt to ReST
  docs: networking: convert pktgen.txt to ReST
  docs: networking: convert PLIP.txt to ReST
  docs: networking: convert ppp_generic.txt to ReST
  docs: networking: convert proc_net_tcp.txt to ReST
  docs: networking: convert radiotap-headers.txt to ReST
  docs: networking: convert ray_cs.txt to ReST
  docs: networking: convert rds.txt to ReST
  docs: networking: convert regulatory.txt to ReST
  docs: networking: convert rxrpc.txt to ReST
  docs: networking: convert sctp.txt to ReST
  docs: networking: convert secid.txt to ReST
  docs: networking: convert seg6-sysctl.txt to ReST
  docs: networking: convert skfp.txt to ReST
  docs: networking: convert strparser.txt to ReST
  docs: networking: convert switchdev.txt to ReST
  docs: networking: convert tc-actions-env-rules.txt to ReST
  docs: networking: convert tcp-thin.txt to ReST
  docs: networking: convert team.txt to ReST
  docs: networking: convert timestamping.txt to ReST
  docs: networking: convert tproxy.txt to ReST

 .../admin-guide/kernel-parameters.txt         |    2 +-
 Documentation/admin-guide/serial-console.rst  |    2 +-
 Documentation/filesystems/afs.rst             |    2 +-
 Documentation/networking/bonding.rst          |    2 +-
 Documentation/networking/can.rst              |    2 +-
 .../networking/checksum-offloads.rst          |    2 +-
 Documentation/networking/index.rst            |   37 +
 Documentation/networking/ip-sysctl.rst        |    2 +-
 .../networking/{l2tp.txt => l2tp.rst}         |  145 ++-
 .../{lapb-module.txt => lapb-module.rst}      |  120 +-
 .../networking/{ltpc.txt => ltpc.rst}         |   45 +-
 ...1-injection.txt => mac80211-injection.rst} |   41 +-
 .../{mpls-sysctl.txt => mpls-sysctl.rst}      |   17 +-
 .../{multiqueue.txt => multiqueue.rst}        |   41 +-
 .../{netconsole.txt => netconsole.rst}        |  125 +-
 ...etdev-features.txt => netdev-features.rst} |   19 +-
 .../{netdevices.txt => netdevices.rst}        |   21 +-
 ...filter-sysctl.txt => netfilter-sysctl.rst} |   11 +-
 Documentation/networking/netif-msg.rst        |   95 ++
 Documentation/networking/netif-msg.txt        |   79 --
 ...ack-sysctl.txt => nf_conntrack-sysctl.rst} |   51 +-
 .../{nf_flowtable.txt => nf_flowtable.rst}    |   55 +-
 .../{openvswitch.txt => openvswitch.rst}      |   23 +-
 .../{operstates.txt => operstates.rst}        |   45 +-
 Documentation/networking/packet_mmap.rst      | 1084 +++++++++++++++++
 Documentation/networking/packet_mmap.txt      | 1061 ----------------
 .../networking/{phonet.txt => phonet.rst}     |   56 +-
 .../networking/{pktgen.txt => pktgen.rst}     |  316 ++---
 .../networking/{PLIP.txt => plip.rst}         |   43 +-
 .../{ppp_generic.txt => ppp_generic.rst}      |   52 +-
 .../{proc_net_tcp.txt => proc_net_tcp.rst}    |   23 +-
 ...iotap-headers.txt => radiotap-headers.rst} |   99 +-
 .../networking/{ray_cs.txt => ray_cs.rst}     |  101 +-
 Documentation/networking/{rds.txt => rds.rst} |  295 +++--
 .../{regulatory.txt => regulatory.rst}        |   29 +-
 .../networking/{rxrpc.txt => rxrpc.rst}       |  306 ++---
 .../networking/{sctp.txt => sctp.rst}         |   37 +-
 .../networking/{secid.txt => secid.rst}       |    6 +
 Documentation/networking/seg6-sysctl.rst      |   26 +
 Documentation/networking/seg6-sysctl.txt      |   18 -
 .../networking/{skfp.txt => skfp.rst}         |  153 ++-
 .../{strparser.txt => strparser.rst}          |   85 +-
 .../{switchdev.txt => switchdev.rst}          |  114 +-
 .../networking/tc-actions-env-rules.rst       |   29 +
 .../networking/tc-actions-env-rules.txt       |   24 -
 .../networking/{tcp-thin.txt => tcp-thin.rst} |    5 +
 .../networking/{team.txt => team.rst}         |    6 +
 .../{timestamping.txt => timestamping.rst}    |  154 ++-
 .../networking/{tproxy.txt => tproxy.rst}     |   55 +-
 MAINTAINERS                                   |   14 +-
 drivers/net/Kconfig                           |    4 +-
 drivers/net/appletalk/Kconfig                 |    2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c  |    2 +-
 drivers/net/ethernet/toshiba/spider_net.c     |    2 +-
 drivers/net/fddi/Kconfig                      |    2 +-
 drivers/net/plip/Kconfig                      |    2 +-
 drivers/net/wireless/Kconfig                  |    2 +-
 drivers/staging/fsl-dpaa2/ethsw/README        |    2 +-
 include/linux/netdev_features.h               |    2 +-
 include/net/cfg80211.h                        |    2 +-
 include/uapi/linux/errqueue.h                 |    2 +-
 net/Kconfig                                   |    2 +-
 net/core/pktgen.c                             |    2 +-
 net/lapb/Kconfig                              |    2 +-
 net/mac80211/tx.c                             |    2 +-
 net/netfilter/Kconfig                         |    2 +-
 net/rxrpc/Kconfig                             |    6 +-
 net/rxrpc/sysctl.c                            |    2 +-
 net/wireless/radiotap.c                       |    2 +-
 samples/pktgen/README.rst                     |    2 +-
 70 files changed, 2864 insertions(+), 2357 deletions(-)
 rename Documentation/networking/{l2tp.txt => l2tp.rst} (79%)
 rename Documentation/networking/{lapb-module.txt => lapb-module.rst} (74%)
 rename Documentation/networking/{ltpc.txt => ltpc.rst} (86%)
 rename Documentation/networking/{mac80211-injection.txt => mac80211-injection.rst} (67%)
 rename Documentation/networking/{mpls-sysctl.txt => mpls-sysctl.rst} (82%)
 rename Documentation/networking/{multiqueue.txt => multiqueue.rst} (76%)
 rename Documentation/networking/{netconsole.txt => netconsole.rst} (66%)
 rename Documentation/networking/{netdev-features.txt => netdev-features.rst} (95%)
 rename Documentation/networking/{netdevices.txt => netdevices.rst} (89%)
 rename Documentation/networking/{netfilter-sysctl.txt => netfilter-sysctl.rst} (62%)
 create mode 100644 Documentation/networking/netif-msg.rst
 delete mode 100644 Documentation/networking/netif-msg.txt
 rename Documentation/networking/{nf_conntrack-sysctl.txt => nf_conntrack-sysctl.rst} (85%)
 rename Documentation/networking/{nf_flowtable.txt => nf_flowtable.rst} (76%)
 rename Documentation/networking/{openvswitch.txt => openvswitch.rst} (95%)
 rename Documentation/networking/{operstates.txt => operstates.rst} (87%)
 create mode 100644 Documentation/networking/packet_mmap.rst
 delete mode 100644 Documentation/networking/packet_mmap.txt
 rename Documentation/networking/{phonet.txt => phonet.rst} (82%)
 rename Documentation/networking/{pktgen.txt => pktgen.rst} (62%)
 rename Documentation/networking/{PLIP.txt => plip.rst} (92%)
 rename Documentation/networking/{ppp_generic.txt => ppp_generic.rst} (91%)
 rename Documentation/networking/{proc_net_tcp.txt => proc_net_tcp.rst} (83%)
 rename Documentation/networking/{radiotap-headers.txt => radiotap-headers.rst} (70%)
 rename Documentation/networking/{ray_cs.txt => ray_cs.rst} (65%)
 rename Documentation/networking/{rds.txt => rds.rst} (59%)
 rename Documentation/networking/{regulatory.txt => regulatory.rst} (94%)
 rename Documentation/networking/{rxrpc.txt => rxrpc.rst} (85%)
 rename Documentation/networking/{sctp.txt => sctp.rst} (64%)
 rename Documentation/networking/{secid.txt => secid.rst} (87%)
 create mode 100644 Documentation/networking/seg6-sysctl.rst
 delete mode 100644 Documentation/networking/seg6-sysctl.txt
 rename Documentation/networking/{skfp.txt => skfp.rst} (68%)
 rename Documentation/networking/{strparser.txt => strparser.rst} (80%)
 rename Documentation/networking/{switchdev.txt => switchdev.rst} (84%)
 create mode 100644 Documentation/networking/tc-actions-env-rules.rst
 delete mode 100644 Documentation/networking/tc-actions-env-rules.txt
 rename Documentation/networking/{tcp-thin.txt => tcp-thin.rst} (97%)
 rename Documentation/networking/{team.txt => team.rst} (67%)
 rename Documentation/networking/{timestamping.txt => timestamping.rst} (89%)
 rename Documentation/networking/{tproxy.txt => tproxy.rst} (70%)

-- 
2.25.4



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
