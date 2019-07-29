Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37B78A23
	for <lists+linux-afs@lfdr.de>; Mon, 29 Jul 2019 13:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXgGkQX4fgZh2cu/B1Ck3XO/N1WLR3D92qBPnkRgX44=; b=q2MxMvKx6eX8MD
	zKSswnJjEvZn2ZLiI3zaNeRi9c5HFVHkmeuFsdvXGWZoBF7u6k/DzHoO3uZK/rfF/Uz6g+buahVOI
	FJFezAL321g//hZGaf8q4v2mteGyUT6tPIiZcyk36E8qs8zV7GqQMc6yPBpUk3dhtLevFAFz+X03T
	Vw32MFaIg6w1Hcv8l11mNiNVSn4NGeOpIIV6sCXmPK7P3KyNUVQwpq9iJl8if8aCjTzKduWvtuvdg
	5PWdClU5HGAob6ERUpajstnV3DonzddNFvF0OJItm1U4R0T62yPyoyE6qQMeC+g2rGz5hJcbX4iAj
	yAT2rUVLXQ/OVXaQAhMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs3VE-0006E0-DN; Mon, 29 Jul 2019 11:07:40 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs3VB-0006A1-9K
 for linux-afs@lists.infradead.org; Mon, 29 Jul 2019 11:07:39 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7CF1C85541
 for <linux-afs@lists.infradead.org>; Mon, 29 Jul 2019 11:07:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA4E95D6A0;
 Mon, 29 Jul 2019 11:07:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190729042745.GA20647@fedora19.localdomain>
References: <20190729042745.GA20647@fedora19.localdomain>
To: Ian Wienand <iwienand@redhat.com>
Subject: Re: 5.3.0-rc1-afs-next-48c7a244 : afs_dir_check_page(9fcb): bad magic
 1/2 is 0000
MIME-Version: 1.0
Content-ID: <12331.1564398453.1@warthog.procyon.org.uk>
Date: Mon, 29 Jul 2019 12:07:33 +0100
Message-ID: <12332.1564398453@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 29 Jul 2019 11:07:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_040737_358624_C63CDEA0 
X-CRM114-Status: GOOD (  11.69  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Ian Wienand <iwienand@redhat.com> wrote:

>  kAFS: afs_dir_check_page(9fcb): bad magic 1/2 is 0000
>  DIR 20000026:9fcb f=1800 l=2000 al=1800 r=0
>  DIR 0 2 2 0
>  [00] 000004d23fffffffff0100000000000000000000000000000000000000000000
>  [01] 0000000000000000000000000000000000000000000000000000000000000000
>  [02] 000004d23fffffffff0100000000000000000000000000000000000000000000
>  [03] 0000000000000000000000000000000000000000000000000000000000000000

Okay, this looks weird.

Blocks 00 and 02 have correct magic numbers (04d2).

Block 03 shouldn't have anything in it - in fact it shouldn't even have been
filled in (the read length was l=2000, but the actual length read was
al=1800).  afs_deliver_fs_fetch_data() will clear any unused part of the
buffer at the end.

Block 01, however, is all zeros.  We *should* have read block 01 - between 00
and 02 - as a single-piece read.

Also, the number of pages field at the beginning of each block is also 0 in
all blocks read - which I'm not sure is correct.

Looking at how similar 00-01 are to 02-03, it makes me wonder if, somehow, the
same Linux pagecache page is being used for both - thereby allowing one to
overwrite the other.  I think I need to print the page addresses and indices
too.

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
