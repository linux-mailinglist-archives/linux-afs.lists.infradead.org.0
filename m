Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA118C202
	for <lists+linux-afs@lfdr.de>; Thu, 19 Mar 2020 22:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZ77CG44jfzxQTCitK8tS+3hH6hvK3og7FhLz15Nv5w=; b=Ei4DlD1w8OGsDj
	FFxRC1XL2HxKDZYEn7o+FeMi35Rr9Y7hQFoQoYMPxz+kg7Z2G16RPhkA1fFYQuwYBVnlG8ezBKpP5
	OZRA4+cNIRKxYs9fmluJ47pyd1aacITLX+o2xRZkQEJuwn0+UnRlPuR1pfmQ9DxLIGTgzUymo3x4o
	mxqqiimOuuRbU4s5HBicVMxtAfWOmmxrjMMpjkRgUtnhL35B58XOe81nymQGXfyHlIEUggTJs2tiW
	xZZb0YU7YYfl9Q+NgXJHta7YlxeSH2cAzYvPlK9KhkgMXIjx559M3R57pscbdasoeXb9rMZK2OH5Q
	db6/T1ew5wO6/pOtYDug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF2Gv-0004nQ-HU; Thu, 19 Mar 2020 21:00:09 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF18D-0000eZ-Sz
 for linux-afs@lists.infradead.org; Thu, 19 Mar 2020 19:47:07 +0000
IronPort-SDR: eMY4Ob521Q9L5Iz2yVAhFEbsdbpvq115e9jC+/I5Oynq5ja3da+d6YwwYL9UPtRNUTyJQb1zCt
 au3/h+cA3Sdg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 12:46:58 -0700
IronPort-SDR: a6SaYj/xeKftbSen3LWYA6qWR9ApLeeTa+v5cjiVyF9UB9Q7xyMMQqIfWGC7lVjo5Zg0E1J0nu
 0ljRFqFI0wdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="391910291"
Received: from oamor-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.182.181])
 by orsmga004.jf.intel.com with ESMTP; 19 Mar 2020 12:46:51 -0700
Date: Thu, 19 Mar 2020 21:46:50 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 2/2] KEYS: Avoid false positive ENOMEM error on key read
Message-ID: <20200319194650.GA24804@linux.intel.com>
References: <20200318221457.1330-1-longman@redhat.com>
 <20200318221457.1330-3-longman@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318221457.1330-3-longman@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_124705_952469_BFA50565 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.43 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Thu, 19 Mar 2020 14:00:08 -0700
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Chris von Recklinghausen <crecklin@redhat.com>, linux-afs@lists.infradead.org,
 Eric Biggers <ebiggers@google.com>, netdev@vger.kernel.org,
 Jerry Snitselaar <jsnitsel@redhat.com>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-integrity@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Mar 18, 2020 at 06:14:57PM -0400, Waiman Long wrote:
> +			 * It is possible, though unlikely, that the key
> +			 * changes in between the up_read->down_read period.
> +			 * If the key becomes longer, we will have to
> +			 * allocate a larger buffer and redo the key read
> +			 * again.
> +			 */
> +			if (!tmpbuf || unlikely(ret > tmpbuflen)) {

Shouldn't you check that tmpbuflen stays below buflen (why else
you had made copy of buflen otherwise)?

/Jarkko

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
