Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0C1D6CCE
	for <lists+linux-afs@lfdr.de>; Sun, 17 May 2020 22:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+lhZ4GcyCQJADnTVCBN5j9myccQgtm5WblOJ/pdx9TI=; b=u2iIXL+Va2FOwR
	MGwM9I3GExg+ve/rRRxe+SOCmKDHqk7UvAXC739ljepjG/KZDf1J1vhhMmubc1i1S069maFJsZaVz
	RPNKKd1xd7iTvNotxmm55HxkRPLJUHpwSgjBj6dnRp9V6sABLQZxhP7tB1Gue8E4Rb85aV7ECTIQ9
	VMx6b9MeWPQgNRIM8vRmRRAEqT0YvWjCAu59ZiAl5Qri1iL49UqWxGGgf9g53yQd6UbSd5ikwL2Dg
	bf9LxYOwWrcgr7jGP2CFQagKoMIMrmXYut9jaSVSGtG3+HsfzQ5640gmxf2yIIG77SWduPO0l4if/
	rDAbT0akHbbU+8+i6W2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaPmi-0003m7-CM; Sun, 17 May 2020 20:21:20 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaPme-0003kn-Kn
 for linux-afs@lists.infradead.org; Sun, 17 May 2020 20:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589746873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o7QSlXKNRIHGSgeITtlTa8rgXRVQsZNct4CtfBWVqog=;
 b=M6Dt24AP+sxekeJfsGdGrGkT5LL1mycuVUtPr8NL/wnBiOCcJr2FaTN7jbZo3iGuDOcuTQ
 OuKGSJhLiwp92o3YMZGvpjYE2BDAR40/7qPAAFzrWA2KUVLwj//S5Y+RbCT/ZyAUPcS+dM
 znKWjjm5CVFQG11/FNovK+GzLK1b+WU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-5M-Est2RNB-ciEfkjVS1lw-1; Sun, 17 May 2020 16:21:08 -0400
X-MC-Unique: 5M-Est2RNB-ciEfkjVS1lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2480B800053;
 Sun, 17 May 2020 20:21:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
 [10.10.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 142F760BE2;
 Sun, 17 May 2020 20:21:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Don't unlock fetched data pages until the op completes
 successfully
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Sun, 17 May 2020 21:21:05 +0100
Message-ID: <158974686528.785191.2525276665446566911.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_132116_763769_66CE444D 
X-CRM114-Status: GOOD (  14.93  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Don't call req->page_done() on each page as we finish filling it with the
data coming from the network.  Whilst this might speed up the application a
bit, it's a problem if there's a network failure and the operation has to
be reissued.

If this happens, an oops occurs because afs_readpages_page_done() clears
the pointer to each page it unlocks and when a retry happens, the pointers
to the pages it wants to fill are now NULL (and the pages have been
unlocked anyway).

Instead, wait till the operation completes successfully and only then
release all the pages after clearing any terminal gap (the server can give
us less data than we requested as we're allowed to ask for more than is
available).

KASAN produces a bug like the following, and even without KASAN, it can
oops and panic:

BUG: KASAN: wild-memory-access in _copy_to_iter+0x323/0x5f4
Write of size 1404 at addr 0005088000000000 by task md5sum/5235

CPU: 0 PID: 5235 Comm: md5sum Not tainted 5.7.0-rc3-fscache+ #250
Hardware name: ASUS All Series/H97-PLUS, BIOS 2306 10/09/2014
Call Trace:
 dump_stack+0x97/0xd3
 ? _copy_to_iter+0x323/0x5f4
 __kasan_report+0x130/0x158
 ? _copy_to_iter+0x323/0x5f4
 kasan_report+0x42/0x51
 ? _copy_to_iter+0x323/0x5f4
 check_memory_region+0x13d/0x145
 memcpy+0x39/0x58
 _copy_to_iter+0x323/0x5f4
 ? iov_iter_get_pages_alloc+0x562/0x562
 ? match_held_lock+0x2e/0xff
 ? match_held_lock+0x2e/0xff
 ? __lock_is_held+0x2a/0x87
 ? lockdep_recursion_finish+0x1a/0x39
 __skb_datagram_iter+0x89/0x2a6
 ? copy_overflow+0x14/0x14
 ? lockdep_recursion_finish+0x1a/0x39
 skb_copy_datagram_iter+0x129/0x135
 rxrpc_recvmsg_data.isra.0+0x615/0xd42
 ? rxrpc_kernel_recv_data+0x182/0x3ae
 ? trace_rxrpc_rx_eproto.constprop.0+0x106/0x106
 ? lockdep_recursion_finish+0x1a/0x39
 ? mutex_trylock+0x96/0x96
 rxrpc_kernel_recv_data+0x1e9/0x3ae
 ? rxrpc_recvmsg_data.isra.0+0xd42/0xd42
 ? find_held_lock+0x81/0x90
 ? lockdep_recursion_finish+0x1a/0x39
 afs_extract_data+0x139/0x33a
 ? afs_send_simple_reply+0x2ef/0x2ef
 yfs_deliver_fs_fetch_data64+0x47a/0x91b
 ? afs_v2net+0x15e/0x15e
 afs_deliver_to_call+0x304/0x709
 ? afs_set_call_complete+0xcc/0xcc
 ? test_bit+0x22/0x2e
 afs_wait_for_call_to_complete+0x1cc/0x4ad
 ? afs_make_call+0x8b8/0x8b8
 ? wake_up_q+0x63/0x63
 ? __init_waitqueue_head+0x7b/0x85
 yfs_fs_fetch_data+0x279/0x288
 afs_fetch_data+0x1e1/0x38d
 ? afs_put_read+0x9a/0x9a
 ? test_bit+0x1d/0x27
 ? __kmalloc+0x16c/0x193
 ? afs_readpages+0x32f/0x72e
 afs_readpages+0x593/0x72e
 ? afs_fetch_data+0x38d/0x38d
 ? rcu_read_lock_sched_held+0x78/0xc5
 read_pages+0xf5/0x21e
 ? read_cache_pages+0x1cf/0x1cf
 ? xa_set_mark+0x34/0x34
 ? policy_nodemask+0x19/0x8b
 ? policy_node+0x3b/0x58
 __do_page_cache_readahead+0x128/0x23f
 ? blk_cgroup_congested+0x156/0x156
 ? rcu_gp_is_expedited+0x42/0x42
 ? lockdep_recursion_finish+0x1a/0x39
 ondemand_readahead+0x36e/0x37f
 generic_file_buffered_read+0x234/0x680
 ? iov_iter_init+0x8f/0x9e
 new_sync_read+0x109/0x17e
 ? generic_remap_file_range_prep+0x4a9/0x4a9
 ? __fsnotify_update_child_dentry_flags+0x18a/0x18a
 ? fsnotify_first_mark+0xa6/0xa6
 ? selinux_file_permission+0xea/0x133
 vfs_read+0xe6/0x138
 ksys_read+0xd8/0x14d
 ? kernel_write+0x74/0x74
 ? get_vtime_delta+0x9c/0xaa
 ? mark_held_locks+0x1f/0x78
 do_syscall_64+0x6e/0x8a
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

Fixes: 196ee9cd2d04 ("afs: Make afs_fs_fetch_data() take a list of pages")
Fixes: 30062bd13e36 ("afs: Implement YFS support in the fs client")
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/fsclient.c  |    8 ++++----
 fs/afs/yfsclient.c |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index a3e3a16b32d6..401de063996c 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -385,8 +385,6 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		ASSERTCMP(req->offset, <=, PAGE_SIZE);
 		if (req->offset == PAGE_SIZE) {
 			req->offset = 0;
-			if (req->page_done)
-				req->page_done(req);
 			req->index++;
 			if (req->remain > 0)
 				goto begin_page;
@@ -440,11 +438,13 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		if (req->offset < PAGE_SIZE)
 			zero_user_segment(req->pages[req->index],
 					  req->offset, PAGE_SIZE);
-		if (req->page_done)
-			req->page_done(req);
 		req->offset = 0;
 	}
 
+	if (req->page_done)
+		for (req->index = 0; req->index < req->nr_pages; req->index++)
+			req->page_done(req);
+
 	_leave(" = 0 [done]");
 	return 0;
 }
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index b5b45c57e1b1..fe413e7a5cf4 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -497,8 +497,6 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		ASSERTCMP(req->offset, <=, PAGE_SIZE);
 		if (req->offset == PAGE_SIZE) {
 			req->offset = 0;
-			if (req->page_done)
-				req->page_done(req);
 			req->index++;
 			if (req->remain > 0)
 				goto begin_page;
@@ -556,11 +554,13 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		if (req->offset < PAGE_SIZE)
 			zero_user_segment(req->pages[req->index],
 					  req->offset, PAGE_SIZE);
-		if (req->page_done)
-			req->page_done(req);
 		req->offset = 0;
 	}
 
+	if (req->page_done)
+		for (req->index = 0; req->index < req->nr_pages; req->index++)
+			req->page_done(req);
+
 	_leave(" = 0 [done]");
 	return 0;
 }



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
