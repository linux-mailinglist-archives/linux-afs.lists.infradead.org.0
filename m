Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35D8E2C8
	for <lists+linux-afs@lfdr.de>; Thu, 15 Aug 2019 04:37:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gUtEzZHtxqaQuC9dMUEtEveP3kpvUvVEXRwBigY1Amc=; b=TZM
	vB8djwEUAjonu9PVlQKo24r7TYDiNKEXrDYZJi9XKrg7XVF9kUR6QJTDY3HR8Co9JYBAEocqLqdMH
	rJL+E5t6N/ik5ROEt3UeNcNf26gLCUZwGWYOnfjNx7sarFteJxl/9HDm8VmIHlBex/ahvugsJuCaH
	xowMLtTlHisNjuf8fdcYMBOXSIb1AjOHf2pKYTGAMvA7DlO8gqUV/JyobRCmCq3vqbXYRlSw4kMbn
	uTeuWr74ZVy9Id8/ec0wrC2K75k0wY6sj+gsvSO6yxrrh/QKuZXTBbyFm7BxOUqDg5U4eUKz9yplP
	raGs1pnl/SXnifbIbbfqwxAXV0BUlgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy5dV-0003vA-0X; Thu, 15 Aug 2019 02:37:09 +0000
Received: from smtprelay0091.hostedemail.com ([216.40.44.91]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy5dP-0003uR-TW
 for linux-afs@lists.infradead.org; Thu, 15 Aug 2019 02:37:06 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 2E38C83777EE;
 Thu, 15 Aug 2019 02:36:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:4:41:69:355:379:541:800:960:973:982:988:989:1260:1345:1437:1605:1730:1747:1777:1792:2196:2199:2380:2393:2559:2562:3138:3139:3140:3141:3142:3865:3866:3867:3868:3870:3871:4250:4321:4384:4605:5007:6261:7875:8603:8660:8957:9592:10848:11026:11658:11914:12043:12050:12291:12296:12297:12438:12555:12683:12895:12986:13148:13230:14096:14110:14394:21080:21433:21626:30012:30029:30046:30054,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:1:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: plane66_590520a5a0e1f
X-Filterd-Recvd-Size: 18134
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Thu, 15 Aug 2019 02:36:51 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: David Howells <dhowells@redhat.com>
Subject: [PATCH] afs: Move comments after /* fallthrough */
Date: Wed, 14 Aug 2019 19:36:49 -0700
Message-Id: <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_193704_100178_E3A6F3DD 
X-CRM114-Status: GOOD (  12.35  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.40.44.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-afs@lists.infradead.org,
 Nathan Huckleberry <nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Make the code a bit easier for a script to appropriately convert
case statement blocks with /* fallthrough */ comments to a macro by
moving comments describing the next case block to the case statement.

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/afs/cmservice.c | 10 +++-------
 fs/afs/fsclient.c  | 51 +++++++++++++++++----------------------------------
 fs/afs/vlclient.c  | 50 +++++++++++++++++++++++++-------------------------
 fs/afs/yfsclient.c | 51 +++++++++++++++++----------------------------------
 4 files changed, 62 insertions(+), 100 deletions(-)

diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
index b86195e4dc6c..2270fe9325da 100644
--- a/fs/afs/cmservice.c
+++ b/fs/afs/cmservice.c
@@ -282,10 +282,8 @@ static int afs_deliver_cb_callback(struct afs_call *call)
 	case 0:
 		afs_extract_to_tmp(call);
 		call->unmarshall++;
-
-		/* extract the FID array and its count in two steps */
 		/* fall through */
-	case 1:
+	case 1:		/* extract the FID array and its count in two steps */
 		_debug("extract FID count");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -329,9 +327,8 @@ static int afs_deliver_cb_callback(struct afs_call *call)
 		afs_extract_to_tmp(call);
 		call->unmarshall++;
 
-		/* extract the callback array and its count in two steps */
 		/* fall through */
-	case 3:
+	case 3:		/* extract the callback array & count in two steps */
 		_debug("extract CB count");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -651,9 +648,8 @@ static int afs_deliver_yfs_cb_callback(struct afs_call *call)
 		afs_extract_to_tmp(call);
 		call->unmarshall++;
 
-		/* extract the FID array and its count in two steps */
 		/* Fall through */
-	case 1:
+	case 1:		/* extract the FID array and its count in two steps */
 		_debug("extract FID count");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 114f281f3687..d9dc1bdfa695 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -341,8 +341,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		}
 		/* Fall through */
 
-		/* extract the returned data length */
-	case 1:
+	case 1:		/* extract the returned data length */
 		_debug("extract data length");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -369,8 +368,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		ASSERTCMP(size, <=, PAGE_SIZE);
 		/* Fall through */
 
-		/* extract the returned data */
-	case 2:
+	case 2:		/* extract the returned data */
 		_debug("extract data %zu/%llu",
 		       iov_iter_count(&call->iter), req->remain);
 
@@ -411,8 +409,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		afs_extract_to_buf(call, (21 + 3 + 6) * 4);
 		/* Fall through */
 
-		/* extract the metadata */
-	case 4:
+	case 4:		/* extract the metadata */
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
 			return ret;
@@ -1476,8 +1473,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		afs_extract_to_buf(call, 12 * 4);
 		/* Fall through */
 
-		/* extract the returned status record */
-	case 1:
+	case 1:		/* extract the returned status record */
 		_debug("extract status");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -1489,8 +1485,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		afs_extract_to_tmp(call);
 		/* Fall through */
 
-		/* extract the volume name length */
-	case 2:
+	case 2:		/* extract the volume name length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -1505,8 +1500,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the volume name */
-	case 3:
+	case 3:		/* extract the volume name */
 		_debug("extract volname");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -1519,8 +1513,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the offline message length */
-	case 4:
+	case 4:		/* extract the offline message length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -1535,8 +1528,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the offline message */
-	case 5:
+	case 5:		/* extract the offline message */
 		_debug("extract offline");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -1550,8 +1542,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the message of the day length */
-	case 6:
+	case 6:		/* extract the message of the day length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -1566,8 +1557,7 @@ static int afs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the message of the day */
-	case 7:
+	case 7:		/* extract the message of the day */
 		_debug("extract motd");
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
@@ -1862,8 +1852,7 @@ static int afs_deliver_fs_get_capabilities(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* Extract the capabilities word count */
-	case 1:
+	case 1:		/* Extract the capabilities word count */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -1876,8 +1865,7 @@ static int afs_deliver_fs_get_capabilities(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* Extract capabilities words */
-	case 2:
+	case 2:		/* Extract capabilities words */
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
 			return ret;
@@ -2034,8 +2022,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* Extract the file status count and array in two steps */
-	case 1:
+	case 1:		/* Extract the file status count & array in two steps */
 		_debug("extract status count");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -2074,8 +2061,7 @@ static int afs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		afs_extract_to_tmp(call);
 		/* Fall through */
 
-		/* Extract the callback count and array in two steps */
-	case 3:
+	case 3:		/* Extract the callback count & array in two steps */
 		_debug("extract CB count");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -2207,8 +2193,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the returned data length */
-	case 1:
+	case 1:		/* extract the returned data length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -2225,8 +2210,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the returned data */
-	case 2:
+	case 2:		/* extract the returned data */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -2235,8 +2219,7 @@ static int afs_deliver_fs_fetch_acl(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the metadata */
-	case 3:
+	case 3:		/* extract the metadata */
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
 			return ret;
diff --git a/fs/afs/vlclient.c b/fs/afs/vlclient.c
index cfb0ac4bd039..c0b327ff0005 100644
--- a/fs/afs/vlclient.c
+++ b/fs/afs/vlclient.c
@@ -193,10 +193,10 @@ static int afs_deliver_vl_get_addrs_u(struct afs_call *call)
 				   sizeof(struct afs_uuid__xdr) + 3 * sizeof(__be32));
 		call->unmarshall++;
 
-		/* Extract the returned uuid, uniquifier, nentries and
-		 * blkaddrs size */
 		/* Fall through */
-	case 1:
+	case 1:		/* Extract the returned uuid, uniquifier, nentries and
+			 * blkaddrs size
+			 */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -220,8 +220,8 @@ static int afs_deliver_vl_get_addrs_u(struct afs_call *call)
 		count = min(call->count, 4U);
 		afs_extract_to_buf(call, count * sizeof(__be32));
 
-		/* Fall through - and extract entries */
-	case 2:
+		/* Fall through */
+	case 2:		/* extract entries */
 		ret = afs_extract_data(call, call->count > 4);
 		if (ret < 0)
 			return ret;
@@ -323,8 +323,8 @@ static int afs_deliver_vl_get_capabilities(struct afs_call *call)
 		afs_extract_to_tmp(call);
 		call->unmarshall++;
 
-		/* Fall through - and extract the capabilities word count */
-	case 1:
+		/* Fall through */
+	case 1:		/* extract the capabilities word count */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -336,8 +336,8 @@ static int afs_deliver_vl_get_capabilities(struct afs_call *call)
 		call->unmarshall++;
 		afs_extract_discard(call, count * sizeof(__be32));
 
-		/* Fall through - and extract capabilities words */
-	case 2:
+		/* Fall through */
+	case 2:		/*  extract capabilities words */
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
 			return ret;
@@ -431,12 +431,12 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 	case 0:
 		afs_extract_to_buf(call, sizeof(uuid_t) + 3 * sizeof(__be32));
 		call->unmarshall = 1;
-
-		/* Extract the returned uuid, uniquifier, fsEndpoints count and
-		 * either the first fsEndpoint type or the volEndpoints
-		 * count if there are no fsEndpoints. */
 		/* Fall through */
-	case 1:
+	case 1:		/* Extract the returned uuid, uniquifier,
+			 * fsEndpoints count and either the first fsEndpoint
+			 * type or the volEndpoints count if there are no
+			 * fsEndpoints.
+			 */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -476,8 +476,8 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		afs_extract_to_buf(call, size);
 		call->unmarshall = 2;
 
-		/* Fall through - and extract fsEndpoints[] entries */
-	case 2:
+		/* Fall through */
+	case 2:		/* extract fsEndpoints[] entries */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -525,12 +525,12 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		afs_extract_to_buf(call, 1 * sizeof(__be32));
 		call->unmarshall = 3;
 
-		/* Extract the type of volEndpoints[0].  Normally we would
-		 * extract the type of the next endpoint when we extract the
-		 * data of the current one, but this is the first...
-		 */
 		/* Fall through */
-	case 3:
+	case 3:		/* Extract the type of volEndpoints[0].
+			 * Normally we would extract the type of the
+			 * next endpoint when we extract the data of
+			 * the current one, but this is the first...
+			 */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -556,8 +556,8 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		afs_extract_to_buf(call, size);
 		call->unmarshall = 4;
 
-		/* Fall through - and extract volEndpoints[] entries */
-	case 4:
+		/* Fall through */
+	case 4:		/* extract volEndpoints[] entries */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -592,8 +592,8 @@ static int afs_deliver_yfsvl_get_endpoints(struct afs_call *call)
 		afs_extract_discard(call, 0);
 		call->unmarshall = 5;
 
-		/* Fall through - Done */
-	case 5:
+		/* Fall through */
+	case 5:		/* Done */
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
 			return ret;
diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
index 2575503170fc..77cf878e6a25 100644
--- a/fs/afs/yfsclient.c
+++ b/fs/afs/yfsclient.c
@@ -452,8 +452,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the returned data length */
-	case 1:
+	case 1:		/* extract the returned data length */
 		_debug("extract data length");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -480,8 +479,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 		ASSERTCMP(size, <=, PAGE_SIZE);
 		/* Fall through */
 
-		/* extract the returned data */
-	case 2:
+	case 2:		/* extract the returned data */
 		_debug("extract data %zu/%llu",
 		       iov_iter_count(&call->iter), req->remain);
 
@@ -525,8 +523,7 @@ static int yfs_deliver_fs_fetch_data64(struct afs_call *call)
 				   sizeof(struct yfs_xdr_YFSVolSync));
 		/* Fall through */
 
-		/* extract the metadata */
-	case 4:
+	case 4:		/* extract the metadata */
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
 			return ret;
@@ -1434,8 +1431,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		afs_extract_to_buf(call, sizeof(struct yfs_xdr_YFSFetchVolumeStatus));
 		/* Fall through */
 
-		/* extract the returned status record */
-	case 1:
+	case 1:		/* extract the returned status record */
 		_debug("extract status");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -1447,8 +1443,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		afs_extract_to_tmp(call);
 		/* Fall through */
 
-		/* extract the volume name length */
-	case 2:
+	case 2:		/* extract the volume name length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -1463,8 +1458,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the volume name */
-	case 3:
+	case 3:		/* extract the volume name */
 		_debug("extract volname");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -1477,8 +1471,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the offline message length */
-	case 4:
+	case 4:		/* extract the offline message length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -1493,8 +1486,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the offline message */
-	case 5:
+	case 5:		/* extract the offline message */
 		_debug("extract offline");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -1508,8 +1500,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the message of the day length */
-	case 6:
+	case 6:		/* extract the message of the day length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -1524,8 +1515,7 @@ static int yfs_deliver_fs_get_volume_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the message of the day */
-	case 7:
+	case 7:		/* extract the message of the day */
 		_debug("extract motd");
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
@@ -1817,8 +1807,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* Extract the file status count and array in two steps */
-	case 1:
+	case 1:		/* Extract the file status count & array in two steps */
 		_debug("extract status count");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -1857,8 +1846,7 @@ static int yfs_deliver_fs_inline_bulk_status(struct afs_call *call)
 		afs_extract_to_tmp(call);
 		/* Fall through */
 
-		/* Extract the callback count and array in two steps */
-	case 3:
+	case 3:		/* Extract the callback count & array in two steps */
 		_debug("extract CB count");
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
@@ -1990,8 +1978,7 @@ static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* Extract the file ACL length */
-	case 1:
+	case 1:		/* Extract the file ACL length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -2012,8 +1999,7 @@ static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* Extract the file ACL */
-	case 2:
+	case 2:		/* Extract the file ACL */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -2022,8 +2008,7 @@ static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* Extract the volume ACL length */
-	case 3:
+	case 3:		/* Extract the volume ACL length */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -2044,8 +2029,7 @@ static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* Extract the volume ACL */
-	case 4:
+	case 4:		/* Extract the volume ACL */
 		ret = afs_extract_data(call, true);
 		if (ret < 0)
 			return ret;
@@ -2057,8 +2041,7 @@ static int yfs_deliver_fs_fetch_opaque_acl(struct afs_call *call)
 		call->unmarshall++;
 		/* Fall through */
 
-		/* extract the metadata */
-	case 5:
+	case 5:		/* extract the metadata */
 		ret = afs_extract_data(call, false);
 		if (ret < 0)
 			return ret;
-- 
2.15.0


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
