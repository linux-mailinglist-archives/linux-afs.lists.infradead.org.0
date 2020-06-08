Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228A1F2544
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 01:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/6ZFnLXup4roJOTmHiAioFQDYaL7fCzt2vXa6TVfeA=; b=I/wAePvNKV1c+/
	UBjx7PmvjWMf1Cj5YHVE9xiXTDlP6BnyUlokunajgJGboKWxWfukl0/GBGr9ewzWrSl+0HdJ80rim
	n3JFOdWNOMZsMX+bbVcRYGCWNdPRWR19xxVJewaZa31aRrOT4Pg9Qbqu7gLks5aybFxQQ2HA0KptT
	aPzLpHrhkKeGje6RuClQBG7IJ/9IoAAKgVhx2ygv/1PaRmlP4a1RI1n81Zav/QG+yqjmBnZiod7Eu
	DP8lF6zk5j432796cq57cWJ8onbVKiTWf2fAbVfS1k6OO4iB+qSNvy2eCfFAyy8YF8pZOdERtidVs
	oYpVXWccmMHwFrS7pg4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiRB4-0008Lp-LX; Mon, 08 Jun 2020 23:27:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQy3-0007LO-5I
 for linux-afs@lists.infradead.org; Mon, 08 Jun 2020 23:14:15 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7789D21527;
 Mon,  8 Jun 2020 23:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658050;
 bh=lAm2lEdjnD+8xOhLGJf5QyoQipYEWFhTNMRALZMd/cg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fklxR1+CH3OCa2DeO9M2c6/R4j8+EFKpK8lTsg4OsGlAizb2WdOZGcv22ZE2jYOM7
 6DTCbeZxnyqOEHn/OAQnvreyziqkh8L9WXe7QO6OyG/A09yz++c0LwfA5rncmN47lr
 YKoAYrFW0qqVjO8s1mxjDXhgM21k+U4lrlQKAYRI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 098/606] afs: Don't unlock fetched data pages
 until the op completes successfully
Date: Mon,  8 Jun 2020 19:03:43 -0400
Message-Id: <20200608231211.3363633-98-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161411_395615_6B857E29 
X-CRM114-Status: GOOD (  14.23  )
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
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
Cc: David Howells <dhowells@redhat.com>, Sasha Levin <sashal@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>

[ Upstream commit 9d1be4f4dc5ff1c66c86acfd2c35765d9e3776b3 ]

Don't call req->page_done() on each page as we finish filling it with
the data coming from the network.  Whilst this might speed up the
application a bit, it's a problem if there's a network failure and the
operation has to be reissued.

If this happens, an oops occurs because afs_readpages_page_done() clears
the pointer to each page it unlocks and when a retry happens, the
pointers to the pages it wants to fill are now NULL (and the pages have
been unlocked anyway).

Instead, wait till the operation completes successfully and only then
release all the pages after clearing any terminal gap (the server can
give us less data than we requested as we're allowed to ask for more
than is available).

KASAN produces a bug like the following, and even without KASAN, it can
oops and panic.

    BUG: KASAN: wild-memory-access in _copy_to_iter+0x323/0x5f4
    Write of size 1404 at addr 0005088000000000 by task md5sum/5235

    CPU: 0 PID: 5235 Comm: md5sum Not tainted 5.7.0-rc3-fscache+ #250
    Hardware name: ASUS All Series/H97-PLUS, BIOS 2306 10/09/2014
    Call Trace:
     memcpy+0x39/0x58
     _copy_to_iter+0x323/0x5f4
     __skb_datagram_iter+0x89/0x2a6
     skb_copy_datagram_iter+0x129/0x135
     rxrpc_recvmsg_data.isra.0+0x615/0xd42
     rxrpc_kernel_recv_data+0x1e9/0x3ae
     afs_extract_data+0x139/0x33a
     yfs_deliver_fs_fetch_data64+0x47a/0x91b
     afs_deliver_to_call+0x304/0x709
     afs_wait_for_call_to_complete+0x1cc/0x4ad
     yfs_fs_fetch_data+0x279/0x288
     afs_fetch_data+0x1e1/0x38d
     afs_readpages+0x593/0x72e
     read_pages+0xf5/0x21e
     __do_page_cache_readahead+0x128/0x23f
     ondemand_readahead+0x36e/0x37f
     generic_file_buffered_read+0x234/0x680
     new_sync_read+0x109/0x17e
     vfs_read+0xe6/0x138
     ksys_read+0xd8/0x14d
     do_syscall_64+0x6e/0x8a
     entry_SYSCALL_64_after_hwframe+0x49/0xb3

Fixes: 196ee9cd2d04 ("afs: Make afs_fs_fetch_data() take a list of pages")
Fixes: 30062bd13e36 ("afs: Implement YFS support in the fs client")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/afs/fsclient.c  | 8 ++++----
 fs/afs/yfsclient.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 68fc46634346..d2b3798c1932 100644
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
-- 
2.25.1


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
