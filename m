Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D0510985F
	for <lists+linux-afs@lfdr.de>; Tue, 26 Nov 2019 05:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m3z5bxweVdxsc+kuDQHjRrL2tv9MQ5I37CfURQUntfU=; b=K7qyhBVs45EuT2
	yEmwrVJkLNVB3+0AppIPmgLOHVgbKFi5R1qg+7IpGrNz7zaN+ip+z5VlxgigtKxyMBwk5SSS6zhyW
	ZmD/mnpwIHKkScLPaHglTydAQw7NWOLxVtYtRcBttExyCdl3t1hsnWkcWlEf0ZCJPG0KdL+RUK7sw
	T0f02oeJBR3wVwh1lFXGjmRKlphJqHLgaqycXJZlZLMbRsrzcU3+viiAuKZCf4ACkEZ9Z5whi55Hl
	T38VBDD3VOyu9suuj9NjO225d3oDlN95qixaHovU+WbuKlIu2b+XrUFXXc7Ps4L3WLZa/7cNecksw
	vsQQaSWN00EXVO0OFfgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZSn5-00039v-M7; Tue, 26 Nov 2019 04:49:31 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZSn3-00039R-Kl
 for linux-afs@lists.infradead.org; Tue, 26 Nov 2019 04:49:30 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQ4n5pQ136534;
 Tue, 26 Nov 2019 04:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=qfUxOfHmD2AsLFdd38w56vhvpfaDkLF8SGLymQFzT+8=;
 b=STYsPLJOkhgtYhytJTMNcYaz2Hq9rKb0BDgon145ixpirm9mBM/ywz+VgfhF3/F2/c+E
 xQBXEuilvGe46C0gK++is77L/RKcHbppkaWHtB/ZqRU356SX5OoSdMePI02U/QsLD5pp
 uCCp80QgECw0fOHR+ahoRJraePnjfPtmN8pdhPl7uH/WueYu75Zi2v/UfZDjEpNPBbxq
 COxcGjUYijaepieOhI8yXGv6/1gWiuGOgOfl7EWwOcqfrzpqr4/xrcQpAzqcXxRtHNpM
 UwSLPr0Z5QhhL5EFk2G5K4Vo1OrXzqjuWgb4aIpCSY40uClUVk6WhFzJNzWxMoA4ZoUU 1g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2wev6u43gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 04:49:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQ4nEdT152506;
 Tue, 26 Nov 2019 04:49:23 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2wfe9kwffv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 04:49:19 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAQ4mHUV032709;
 Tue, 26 Nov 2019 04:48:19 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 25 Nov 2019 20:48:16 -0800
Date: Tue, 26 Nov 2019 07:48:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: dhowells@redhat.com
Subject: [bug report] afs: Overhaul volume and server record caching and
 fileserver rotation
Message-ID: <20191126044716.rkicpvxoyw3l2ikp@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=430
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260039
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=489 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_204929_815894_B538E3EB 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [156.151.31.86 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
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
Cc: linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hello David Howells,

The patch d2ddc776a458: "afs: Overhaul volume and server record
caching and fileserver rotation" from Nov 2, 2017, leads to the
following static checker warning:

	fs/afs/server.c:557 afs_update_server_record()
	warn: 'alist' can also be NULL

fs/afs/server.c
   533  static noinline bool afs_update_server_record(struct afs_fs_cursor *fc, struct afs_server *server)
   534  {
   535          struct afs_addr_list *alist, *discard;
   536  
   537          _enter("");
   538  
   539          trace_afs_server(server, atomic_read(&server->usage), afs_server_trace_update);
   540  
   541          alist = afs_vl_lookup_addrs(fc->vnode->volume->cell, fc->key,
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch thinks afs_vl_lookup_addrs() can either return error pointers or
NULL.  It is an understandable way to read the code.

   542                                      &server->uuid);
   543          if (IS_ERR(alist)) {
   544                  if ((PTR_ERR(alist) == -ERESTARTSYS ||
   545                       PTR_ERR(alist) == -EINTR) &&
   546                      !(fc->flags & AFS_FS_CURSOR_INTR) &&
   547                      server->addresses) {
   548                          _leave(" = t [intr]");
   549                          return true;
   550                  }
   551                  fc->error = PTR_ERR(alist);
   552                  _leave(" = f [%d]", fc->error);
   553                  return false;
   554          }
   555  
   556          discard = alist;
   557          if (server->addr_version != alist->version) {
                                            ^^^^^^^^^^^^^^
Leading to a NULL dereference here.

   558                  write_lock(&server->fs_lock);
   559                  discard = rcu_dereference_protected(server->addresses,
   560                                                      lockdep_is_held(&server->fs_lock));
   561                  rcu_assign_pointer(server->addresses, alist);

regards,
dan carpenter

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
