Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA71D2F4F
	for <lists+linux-afs@lfdr.de>; Thu, 14 May 2020 14:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfXOTnSi0RQHmMLz5EM035m/lvhGuc5cE9fb8lQf4oM=; b=KG6B63BmiZNA7l
	oJ3a9noeChnMTREYQ+BCObwOwP/YcHKdRQUUM0tG2Y0Hq6wbv+9j1ObCvn1gHHEoXRXpWsoFEeRTT
	oRyd5mZz9gj25DWRKFHN5zbmMRN1M+pbGuzNn4M2aXL2cJpDWNB9CMPte+9j9RFQ3TEfzV/pXq9g2
	HmYg2ye3ImMp1pUxEmAAwbPL6xo3xMDfN15ES+wI3k40PF7Xl3LWP5KYtF7/kkzEplonxRUhs7B+R
	IVnHeylGTkqDDqHOEJU1uzrOTuu8oPSfzVTEeGqQMJJegNvZNzZXYb5B89bzZWcXZxiaoiOqBn6lY
	2WgscyJbqLGMNrL9ll+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZCl1-0004qb-BI; Thu, 14 May 2020 12:14:35 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZBIB-0002hv-MA; Thu, 14 May 2020 10:40:44 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8A1C268BEB; Thu, 14 May 2020 12:40:40 +0200 (CEST)
Date: Thu, 14 May 2020 12:40:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>
Subject: is it ok to always pull in sctp for dlm, was: Re: [PATCH 27/33]
 sctp: export sctp_setsockopt_bindx
Message-ID: <20200514104040.GA12979@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
 <20200513062649.2100053-28-hch@lst.de>
 <20200513180058.GB2491@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513180058.GB2491@localhost.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_034043_870483_B2DDB13A 
X-CRM114-Status: GOOD (  10.13  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [213.95.11.211 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Thu, 14 May 2020 05:14:29 -0700
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
Cc: Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Neil Horman <nhorman@tuxdriver.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org,
 Vlad Yasevich <vyasevich@gmail.com>, linux-kernel@vger.kernel.org,
 Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
 "David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, May 13, 2020 at 03:00:58PM -0300, Marcelo Ricardo Leitner wrote:
> On Wed, May 13, 2020 at 08:26:42AM +0200, Christoph Hellwig wrote:
> > And call it directly from dlm instead of going through kernel_setsockopt.
> 
> The advantage on using kernel_setsockopt here is that sctp module will
> only be loaded if dlm actually creates a SCTP socket.  With this
> change, sctp will be loaded on setups that may not be actually using
> it. It's a quite big module and might expose the system.
> 
> I'm okay with the SCTP changes, but I'll defer to DLM folks to whether
> that's too bad or what for DLM.

So for ipv6 I could just move the helpers inline as they were trivial
and avoid that issue.  But some of the sctp stuff really is way too
big for that, so the only other option would be to use symbol_get.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
