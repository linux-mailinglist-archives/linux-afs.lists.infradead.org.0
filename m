Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E631958AA
	for <lists+linux-afs@lfdr.de>; Fri, 27 Mar 2020 15:10:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KDPkofw1Gj/bzmNvy34OT2w6BlXHZKftxaUq/GYy3V0=; b=YELurmpHX2OzO4txExNpKspXvJ
	m5wL+QGuPxScRgHuwR+pC5Hg/z+UpEWzK3CfgNbD3lZz5yiONttZIayM5Zp6rjt3OQb1f7QtXN59D
	4IonMX/Xw6HvtBx6xIj2HNZX1NNfvAI00wlw13o2RcsalerwlRvzQIzGoptGLLOgEWpicCnKd58Ca
	7IG2U29yXimvF2AuNHujgtHnlwRpKwlcK8n1fZSnRe0HuqRob00/AYJ960z6YZ7rY7bDlCWDlNp73
	MtvrP64VxEpxuiCxqDQLR7fWRIgQWUVur/EqPbKeVC6KRzhHf0zKBNrMQM8vc6Bv8tUikn5gaGVMw
	Xd4je/WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHpgY-00042a-Vq; Fri, 27 Mar 2020 14:10:10 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHb9n-0001Y5-3q
 for linux-afs@lists.infradead.org; Thu, 26 Mar 2020 22:39:24 +0000
IronPort-SDR: xHDrHv5LNDQ5A0AU7GWtxGkl0sAowc7V/VaaWNwQ/yQt29ZcGm4EK8Cjec4ACwxapezKIwBQ9M
 x8PngAtItuCQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 15:39:21 -0700
IronPort-SDR: CbGRbHx5FxUsTvFPh0ITjcnE0hZMIHPUuZ0/wEjbeMEYIezkBNz8AYlbvdktrD0OVjTSwJqngG
 8EF6qQZLjYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,309,1580803200"; d="scan'208";a="240804376"
Received: from alewando-mobl.ger.corp.intel.com ([10.252.40.24])
 by fmsmga008.fm.intel.com with ESMTP; 26 Mar 2020 15:39:15 -0700
Message-ID: <c3a91d6d572d4975a8a5d3dbf004e46d7f59be78.camel@linux.intel.com>
Subject: Re: [PATCH v8 0/2] KEYS: Read keys to internal buffer & then copy
 to userspace
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: David Howells <dhowells@redhat.com>, David Miller <davem@davemloft.net>
In-Reply-To: <996368.1585246352@warthog.procyon.org.uk>
References: <20200325.193056.1153970692429454819.davem@davemloft.net>
 <20200322011125.24327-1-longman@redhat.com>
 <996368.1585246352@warthog.procyon.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
MIME-Version: 1.0
Date: Fri, 27 Mar 2020 00:37:30 +0200
User-Agent: Evolution 3.35.92-1 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_153923_166281_24777FB8 
X-CRM114-Status: UNSURE (   5.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.115 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Mailman-Approved-At: Fri, 27 Mar 2020 07:10:10 -0700
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
Cc: sumit.garg@linaro.org, crecklin@redhat.com, ebiggers@google.com,
 netdev@vger.kernel.org, jsnitsel@redhat.com, jmorris@namei.org,
 zohar@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 roberto.sassu@huawei.com, kuba@kernel.org, longman@redhat.com,
 linux-integrity@vger.kernel.org, linux-afs@lists.infradead.org,
 serge@hallyn.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, 2020-03-26 at 18:12 +0000, David Howells wrote:
> David Miller <davem@davemloft.net> wrote:
> 
> > Who will integrate these changes?
> 
> I'll do it unless Jarkko wants to push it through his tree.

Please do.

/Jarkko


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
