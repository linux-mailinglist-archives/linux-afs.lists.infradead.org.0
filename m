Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 335331AC34B
	for <lists+linux-afs@lfdr.de>; Thu, 16 Apr 2020 15:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iq96CYvqbWDxebQn9GI51jiVXBWZFqbotluzKUGGMkI=; b=GQW/Iyebaau7/n
	Mm8Q5fTwRGm/ZdLt03Asn2NBxq07QuNYrOgXlBNz/uyJxVew3SIrUy8gVh3uGC9rKO7J3hfkvR6yM
	MwXm8Ap3Sgt25FZAc5F+3P6ecGrQDi0Z4HKPfweoOXofYRABGp44L951tj+NVubcvl4duwbxMuKRU
	lK9kW5A4B9xMDScRMScyJbtq4sByW4BNYv1sIvpHtNzDZ37mf53i4FXOevtSrf1AEsGYi0Xn7zCuf
	f+U5vH9mhX/j43o9ZeqKiQLzDTY3nGRXLbRrDAGfmLykMcSXc2zfeshtZwav0uNRGORJ8LACL8Wfq
	H1qYOzhr40wRaAsmADXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP4l1-0001up-R0; Thu, 16 Apr 2020 13:40:43 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP4ky-0001u2-5m
 for linux-afs@lists.infradead.org; Thu, 16 Apr 2020 13:40:41 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03GDcKwv084649;
 Thu, 16 Apr 2020 13:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=+FwckwE718nnFr/35g3gcj/92E89oTBl1ZMCTR5KEIM=;
 b=iqUrY2H9ib6Tqb8czeWAPq4BibUWiDCpkkPRWOnjSVYxuYoossgOsmNXjtBStklxsrN/
 BOrP9qPYV44t2frUqNHruNf9bA99+R1qP05U+WRC7YzNrDD4UzCq2QgGT4EAt3bshHe6
 uvecHlGvvSUAozs7pESH75q4v9OcVMlmTfFEh0f+eEkP2GqqF+jBS5y6ULF4Gts0ilKP
 UQfVBSJ7cQ7MzwTlxH2YR1ArDYswN+/zbvf8AinEnvTOh0UOv/IUc/kzXkl9LS1QrkrD
 UccoJqRh/62a5sd4sXPR5SXu9rhd4Vp7QE2zsD71SkinXrPHQBHbDi4LQL4ew9aox85j 2Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 30dn95sfm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 13:40:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03GDc55R134095;
 Thu, 16 Apr 2020 13:40:33 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 30dynyqbr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Apr 2020 13:40:33 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03GDeWWD019065;
 Thu, 16 Apr 2020 13:40:32 GMT
Received: from anon-dhcp-153.1015granger.net (/68.61.232.219)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 16 Apr 2020 06:40:32 -0700
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: What's a good default TTL for DNS keys in the kernel
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <128769.1587032833@warthog.procyon.org.uk>
Date: Thu, 16 Apr 2020 09:40:30 -0400
Message-Id: <8DC44895-E904-4155-B7B8-B109A777F23C@oracle.com>
References: <874ktl2ide.fsf@oldenburg2.str.redhat.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <128769.1587032833@warthog.procyon.org.uk>
To: David Howells <dhowells@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9592
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9592
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1011
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_064040_306528_DDAD8196 
X-CRM114-Status: GOOD (  22.97  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [141.146.126.78 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: Florian Weimer <fweimer@redhat.com>, linux-cifs@vger.kernel.org,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi David-

> On Apr 16, 2020, at 6:27 AM, David Howells <dhowells@redhat.com> wrote:
> 
> Florian Weimer <fweimer@redhat.com> wrote:
> 
>> You can get the real TTL if you do a DNS resolution on the name and
>> match the addresses against what you get out of the NSS functions.  If
>> they match, you can use the TTL from DNS.  Hackish, but it does give you
>> *some* TTL value.
> 
> I guess I'd have to do that in parallel.  Would calling something like
> res_mkquery() use local DNS caching?
> 
>> The question remains what the expected impact of TTL expiry is.  Will
>> the kernel just perform a new DNS query if it needs one?  Or would you
>> expect that (say) the NFS client rechecks the addresses after TTL expiry
>> and if they change, reconnect to a new NFS server?
> 
> It depends on the filesystem.

Agreed. For example:

The Linux NFS client won't connect to a new server when the server's
DNS information changes. A fresh mount operation would be needed for
the client to recognize and make use of it.

There are mechanisms in the NFSv4 protocol to collect server IP addresses
from the server itself (fs_locations) and then try those locations if the
current server fails to respond. But currently that is not implemented in
Linux (and servers would need to be ready to provide that kind of update).


> AFS keeps track of the expiration on the record and will issue a new lookup
> when the data expires, but NFS doesn't make use of this information.  The
> keyring subsystem will itself dispose of dns_resolver keys that expire and
> request_key() will only upcall again if the key has expired.

Our NFS colleagues working on Solaris have noted that handling the expiry
of DNS information can be tricky. It is usually desirable to continue using
expired information when a new DNS query fails temporarily (times out, or
the network is partitioned, etc). That makes for a more robust network file
service.


> The problem for NFS is that the host IP address is the primary key for the
> superblock (see nfs_compare_super_address()).

I thought that NFSv4.1 and newer have server-provided unique information
that might be used in place of the server's IP address. This information
is supposed to be independent of a server's network addresses.


> CIFS also doesn't make direct use of the TTL, and again this may be because it
> uses the server address as part of the primary key for the superblock (see
> cifs_match_super()).

--
Chuck Lever




_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
