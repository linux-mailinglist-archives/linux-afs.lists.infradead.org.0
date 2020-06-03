Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F021ECD0E
	for <lists+linux-afs@lfdr.de>; Wed,  3 Jun 2020 12:00:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Zw2KZvy/ujW7rRvKKEif75y85oO7PiXCl8RQuRHSg0=; b=McyF8um2aDlAhv
	bXsl/om/DrA2zuT0U0iUOvLpCtXF9tgWllSk2imin3I2pC6JObYkb3kmjCDxBtZPxkp8PTx1dMFPy
	cC8FTl3Njos0cICC1aXLHymK83nmTnnR2El3a14F3xpDONzsr9/dysE1mgIC4rTW9iV7azg8ers9R
	urjGF/s1TXaCnDHSFaRr+n7eHVUwUFJv1yoo70VoUjMRA0DjQDKxLpDJALJxkWhotMCHtfeUYHBam
	rWyA1jMbx43tAw/iuFPw0upYsvfZWiZpadhwEx3mSantb/CVgkLvixOITYquBO51N9989AGLgrnrb
	OwZAqtBqEfkb0NGZTRSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgQBQ-0003du-6V; Wed, 03 Jun 2020 09:59:40 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgQBN-0003KX-Li
 for linux-afs@lists.infradead.org; Wed, 03 Jun 2020 09:59:39 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0539v7mY135995;
 Wed, 3 Jun 2020 09:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=iWIl3jse9JI3vbLlNLPpwjLVN2HllDBQhKJd8uBYH5A=;
 b=v5YVPBx++MQYNJI+WRPLiV4F/9AExVj8X6qICtHRllxc4Cy3A7eGVQmk8YYlowurx1hJ
 iO/J26D7HIYpyXSQ1laBYwJ3wV5RFG9j4iNtTDv01GoSiHClzx3vcXFzHnRsC3v7KrPJ
 4c8m4O4yNd0ZzvUW4rRV5i1Lxt6jeThtFJdhX2JXX9Ai1EDM0eMp1rBryHw9aOQpz1y7
 S7lz2ZuwFdJ4kES8v/tQHf0tXlQg/UJRcWquGEtGzXZcrrIBZTxXtrfkWgFoV5ffa9NM
 jF54TgWeD9nzscdByFXu+k0BzkJ1NiuQklPGWPrXpLJIyiO/MCAYnAuD8hzVdL9h2fhN og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 31bfem8bvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 03 Jun 2020 09:59:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0539s2b8028499;
 Wed, 3 Jun 2020 09:59:33 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 31dju300ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Jun 2020 09:59:33 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0539xW8C024575;
 Wed, 3 Jun 2020 09:59:32 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 03 Jun 2020 02:59:32 -0700
Date: Wed, 3 Jun 2020 12:59:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: dhowells@redhat.com
Subject: [bug report] afs: Build an abstraction around an "operation" concept
Message-ID: <20200603095927.GA1842737@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=957
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9640
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=3
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006030077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_025937_822490_D3E8B3FF 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [141.146.126.78 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [141.146.126.78 listed in wl.mailspike.net]
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

The patch 23c4e93c8619: "afs: Build an abstraction around an
"operation" concept" from Apr 10, 2020, leads to the following static
checker warning:

	fs/afs/dir.c:1322 afs_mkdir()
	error: 'op' dereferencing possible ERR_PTR()

fs/afs/dir.c
  1312  static int afs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
  1313  {
  1314          struct afs_operation *op;
  1315          struct afs_vnode *dvnode = AFS_FS_I(dir);
  1316  
  1317          _enter("{%llx:%llu},{%pd},%ho",
  1318                 dvnode->fid.vid, dvnode->fid.vnode, dentry, mode);
  1319  
  1320          op = afs_alloc_operation(NULL, dvnode->volume);
  1321          if (IS_ERR(op)) {
                           ^^
  1322                  d_drop(op->dentry);
                               ^^^^^^^^^^
  1323                  return PTR_ERR(op);
  1324          }
  1325  
  1326          afs_op_set_vnode(op, 0, dvnode);
  1327          op->file[0].dv_delta = 1;
  1328          op->dentry      = dentry;

regards,
dan carpenter

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
