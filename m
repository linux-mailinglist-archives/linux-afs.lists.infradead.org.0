Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0E7164946
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 16:54:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8tGzEgiDnGogt8N5C/kJAmd888jliPYogfuu8D96CU=; b=ATcefYzXRKOiTA
	cFZKLEZ6lbdZ65OoAXS0tUpp4OY8BDDWQ0SmscT0uAlt+aHNkcPnbcj/c8cG2AIGi46OzFB1tIDgT
	jlzrVEz1HW0OPNpdREe1veNH+tyEkAee3+C6M6vOsRZ7z7Uaqfpao6wIPSY2z9IZioRgLD7nh2aUS
	UFnE3BqwC2SdMJESp+Q+OVivTuJrUUwJ900Yz+pM+2EcjWTK+Cqd/ojMUAqdFOs8qSxMwqM9HU7a9
	Ubdsa6UFsZ+S4gVarL+4LxS5XtaCWMrP/ij+X3BHyxZ+eo9mEfEOPAUDELZA6wNXtsR4j/wKnR0HA
	7EZLrVwPNXMuqTklDBTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4RgM-0004ms-Ck; Wed, 19 Feb 2020 15:54:38 +0000
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4R0Y-0000UF-OT; Wed, 19 Feb 2020 15:11:26 +0000
Date: Wed, 19 Feb 2020 16:11:13 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 00/44] Manually convert filesystem FS documents to ReST
Message-ID: <20200219161113.41add6e4@kernel.org>
In-Reply-To: <20200219023234.7b704acb@lwn.net>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
 <20200218040146.GM7778@bombadil.infradead.org>
 <20200218110406.098fdc09@kernel.org>
 <20200219023234.7b704acb@lwn.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 07:54:36 -0800
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>, Jan Kara <jack@suse.cz>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, Christoph Hellwig <hch@infradead.org>,
 linux-nilfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 Matthew Wilcox <willy@infradead.org>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devel@lists.orangefs.org, Chao Yu <chao@kernel.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Bob Peterson <rpeterso@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>, Johannes Thumshirn <jth@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Em Wed, 19 Feb 2020 02:32:34 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Tue, 18 Feb 2020 11:04:06 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Then, do a second pass at files outside the new directories (like
> > admin-guide), in order to better organize things, eventually splitting
> > some files into kAPI, uAPI and/or admin-guide.  
> 
> I'm looking forward to this phase!  Yes it is harder, and it often
> requires selling the idea to skeptical maintainers.  But that is how,
> IMO, we get from where we're at now to something closer to a set of
> coherent kernel docs.

Yeah, fully agreed that this is an important step.

I'm even more anxious for a third phase: filling the gaps. I'm pretty sure
that several important parts of the Kernel aren't properly represented
at Documentation.

Yet, before start writing new things, we should first organizing what we
already have, making them well-organized.

Cheers,
Mauro

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
