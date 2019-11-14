Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F983FC824
	for <lists+linux-afs@lfdr.de>; Thu, 14 Nov 2019 14:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnCiwRXkbFWcq14Tn71Uvemtxv8YRjhLOuiYeyzkMbY=; b=UJqtkRrar+aj1Z
	cus5rbP0lBfntip0F3QE6a7wra+cNiQ/XWJx7I4y70Q9suXe5U1zRUcxcxLaMobRey6YVyw1JoSJM
	2YTQx0V6HgWo3S6Uj3sh9GMi8s21Z6z+frxA35f45dGaNkNNVhLLATVwpvodr9nJ+AgxAhR7NcaHs
	bpMfigkL6aUYn1DJW9DD9gvjt5UYxer0c9kwjirhNfWD36kZnRogrEMYxBkXuqmQ5hcTJyZgssW6Y
	XbQFLFxVfmyTbdJkhFr2G11417SRY7/Fhzl94/UkTf2QxvhwMlL00p+JNyPlNoO0mQ88IRuGuQ2Hy
	A3L7wfPhj3U8zanvuUVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVFWy-0004N8-Hl; Thu, 14 Nov 2019 13:51:28 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVFMh-0000Ak-NH
 for linux-afs@lists.infradead.org; Thu, 14 Nov 2019 13:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573738849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2J7Gf6SuzKWX47g7qh2y1AT+N7TUFXmW/HwIIlq/BU=;
 b=fMzYoGtWvIkDnVtc2+aCYBLm/vaHjWrk3M5rxbPEJ7hsMknFzhH9xMK+br9y47l7/lsdjS
 qBre057H6H7qjVg716OxbrBHoCo6R9IhRrJA474mKkzP0DHKBuebk/l2NJ2jbYjgsNED7l
 JTUKtX6VQzrPmFcpJGa5i3Rp81bB5yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-uy07ckELPtiy0UFAGms6Ow-1; Thu, 14 Nov 2019 08:40:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA83D800C77;
 Thu, 14 Nov 2019 13:40:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-254.rdu2.redhat.com
 [10.10.120.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3751A60BD7;
 Thu, 14 Nov 2019 13:40:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <24942.1573667720@warthog.procyon.org.uk>
References: <24942.1573667720@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>,
 "Theodore Ts'o" <tytso@mit.edu>
Subject: How to avoid using bmap in cachefiles -- FS-Cache/CacheFiles rewrite
MIME-Version: 1.0
Content-ID: <30126.1573738838.1@warthog.procyon.org.uk>
Date: Thu, 14 Nov 2019 13:40:38 +0000
Message-ID: <30127.1573738838@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: uy07ckELPtiy0UFAGms6Ow-1
X-Mimecast-Spam-Score: 0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_054051_832372_9141078C 
X-CRM114-Status: GOOD (  12.13  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Mailman-Approved-At: Thu, 14 Nov 2019 05:51:26 -0800
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, linux-cachefs@redhat.com,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Christoph,

I've been rewriting cachefiles in the kernel and it now uses kiocbs to do
async direct I/O to/from the cache files - which seems to make a 40-48% speed
improvement.

However, I've replaced the use of bmap internally to detect whether data is
present or not - which is dodgy for a number of reasons, not least that
extent-based filesystems might insert or remove blocks of zeros to shape the
extents better, thereby rendering the metadata information useless for
cachefiles.

But using a separate map has a couple of problems:

 (1) The map is metadata kept outside of the filesystem journal, so coherency
     management is necessary

 (2) The map gets hard to manage for very large files (I'm using 256KiB
     granules, so 1 bit per granule means a 512-byte map block can span 1GiB)
     and xattrs can be of limited capacity.

I seem to remember you said something along the lines of it being possible to
tell the filesystem not to do discarding and insertion of blocks of zeros.  Is
there a generic way to do that?

Also, is it possible to make it so that I can tell an O_DIRECT read to fail
partially or, better, completely if there's no data to be had in part of the
range?  I can see DIO_SKIP_HOLES, but that only seems to affect writes

Thanks,
David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
