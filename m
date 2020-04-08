Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF61A368D
	for <lists+linux-afs@lfdr.de>; Thu,  9 Apr 2020 17:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXOaZW3IDig/HhG4cZmL13VJEWqPkCSDK3/5jbQ9Bes=; b=cthHnlALHeLwK6
	gtYLJudyb/vdg1nJYfzrNOpeueL9dvy5rkaCWQvViFmGZc5BNqxxxitYTtq6mErH5lH8VAcohT1i7
	vHlLf+XdysEUR+KmnaJynsqGwEdLjLiPCzDwVUgboiyVqCQq1t5oLbvjh+mBVaP82O0dxgK1hW4uu
	qHY68EA+S0Vey2L9AelusWZRosW/4UxyBzQF7Kur6qm1vgDuVmRwm0UF1asoNBYXPFHIKwgy0Ox09
	2saZDl67tcr+shW0QPQnOm9k+qCHK0MHHw6m1GPXlJVK2C2Q2vR30fqQ5OUFsmQNNRL0/Qi6I+8L1
	bobJcM3Zzhqiu3xTGhig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMYkE-000764-EE; Thu, 09 Apr 2020 15:05:30 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCzk-0003HN-KT
 for linux-afs@bombadil.infradead.org; Wed, 08 Apr 2020 15:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gm8ArUa6n6/ETa5zuIPndvUQzvZ3CGDDPb8lGzGsISQ=; b=icW6lCaMdY8/CZYGcBwcD/lMBZ
 /YMhBY3fZpjVH4YWlOgiYFsKOGIHqzmUDlXvb6on4NoDPgG+6L0HthmtuGftvYtRUSxXxNwSj9uZg
 FIbko+YDdgzqwx7qmNzjGTiwlT09CqdK7nF7ldC+uy9TiyfMiqnFYrHtk6j3tEl1BHQtT6DWWWzCn
 S7F2xEoddgo5DQ7pjgFiy9g6YrM2/UXbkRrqJT3oQqyWt8kRWmkKI/G+noCbJOkrDKLR7LnGfYxSc
 6/y7ynEhv+QsYCwhrzk8BawE8F0FmhmpuLaAbh30QyVf58iA/twSi1tKpHEAvhAdRYArUP4Can2k+
 SLN9i61A==;
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCzi-00065j-8p
 for linux-afs@lists.infradead.org; Wed, 08 Apr 2020 15:52:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9CC7AF6E;
 Wed,  8 Apr 2020 15:51:51 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 0B140DA730; Wed,  8 Apr 2020 17:51:10 +0200 (CEST)
Date: Wed, 8 Apr 2020 17:51:10 +0200
From: David Sterba <dsterba@suse.cz>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 05/35] docs: filesystems: fix renamed references
Message-ID: <20200408155110.GW5920@suse.cz>
Mail-Followup-To: dsterba@suse.cz,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Harry Wei <harryxiyou@gmail.com>,
 Alex Shi <alex.shi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>,
 David Howells <dhowells@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Anton Altaparmakov <anton@tuxera.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-afs@lists.infradead.org,
 ecryptfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com
References: <cover.1586359676.git.mchehab+huawei@kernel.org>
 <bcfddf36f60d928c78473af4e6a0b29904213c44.1586359676.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcfddf36f60d928c78473af4e6a0b29904213c44.1586359676.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on merlin.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.15 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Mailman-Approved-At: Thu, 09 Apr 2020 08:05:28 -0700
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
Reply-To: dsterba@suse.cz
Cc: Jan Kara <jack@suse.cz>, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Amir Goldstein <amir73il@gmail.com>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Harry Wei <harryxiyou@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Alex Shi <alex.shi@linux.alibaba.com>, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Mark Fasheh <mark@fasheh.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tyler Hicks <code@tyhicks.com>, Christoph Hellwig <hch@infradead.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Alexey Dobriyan <adobriyan@gmail.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, ecryptfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Apr 08, 2020 at 05:45:57PM +0200, Mauro Carvalho Chehab wrote:
> Some filesystem references got broken by a previous patch
> series I submitted. Address those.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

For

>  fs/affs/Kconfig                                             | 2 +-

Acked-by: David Sterba <dsterba@suse.com>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
