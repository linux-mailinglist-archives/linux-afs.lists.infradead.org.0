Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D749A1E5A39
	for <lists+linux-afs@lfdr.de>; Thu, 28 May 2020 10:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dSg9v22YNoSk1R3E4URgeXefvWvRE4AkjWajE2AyJ/E=; b=nPdjd/PeN+7ca4
	69wYtiaAxlrsBdIhshkOh3s6L60CDsRgNs5rxbxi+F3MLUzC6L3yhK5V9Peql4MsyaO5DShgtErCf
	lA1cVyitRL9JS/tRv/bfqaggxPBqWgPyKFTBaN/xKB7bhryKrCz/EVZR3UP517kBSu0Pz4yqCotH7
	hbFLgxTY2ssBW4zHEXcMlrZtAfNm1pnafk+LKncU4wXwM/6Sz1B3Al6YOqWzV9/V+ihQw5pSnq7sd
	hQh9UY5EEvmHhW7e3WNdaMGKBx3jYPsGLTjUWOfHbs/FYKz4tIAdrrLUFSO/ft5ilVThQlgzto14D
	UUmQ3N1Li5YN14o05bLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDWf-0005kV-4p; Thu, 28 May 2020 08:04:29 +0000
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jeAqN-0001QR-LQ; Thu, 28 May 2020 05:12:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: remove most callers of kernel_setsockopt v3
Date: Thu, 28 May 2020 07:12:08 +0200
Message-Id: <20200528051236.620353-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 01:04:27 -0700
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
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 cluster-devel@redhat.com, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Jon Maloy <jmaloy@redhat.com>,
 linux-rdma@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, Ying Xue <ying.xue@windriver.com>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Dave,

this series removes most callers of the kernel_setsockopt functions, and
instead switches their users to small functions that implement setting a
sockopt directly using a normal kernel function call with type safety and
all the other benefits of not having a function call.

In some cases these functions seem pretty heavy handed as they do
a lock_sock even for just setting a single variable, but this mirrors
the real setsockopt implementation unlike a few drivers that just set
set the fields directly.


Changes since v2:
 - drop the separately merged kernel_getopt_removal
 - drop the sctp patches, as there is conflicting cleanup going on
 - add an additional ACK for the rxrpc changes

Changes since v1:
 - use ->getname for sctp sockets in dlm
 - add a new ->bind_add struct proto method for dlm/sctp
 - switch the ipv6 and remaining sctp helpers to inline function so that
   the ipv6 and sctp modules are not pulled in by any module that could
   potentially use ipv6 or sctp connections
 - remove arguments to various sock_* helpers that are always used with
   the same constant arguments

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
