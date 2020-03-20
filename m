Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB2C18E823
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0qvtqsqu7FBCc2hZ0dh2INPGtTEPwsizF9oIC323y0=; b=XHkeDyC1vADDJO
	8QJJbOPcgH7molkSSNms/jwtkCkQzKXNWZngKPDSWHfgN379Lk9LZByMLiEz8xuNYQEIWcMFoSOCl
	vQHdKQrNw0XnloxEJKGcUlP1rRsmd6yJldy9+n2iny6qCV0A9EqY+1AD2SllgOhMc7jFHjvL6ugcb
	Bh4Cpg3OQOCNPbPxv9V/HVu2tl99dKoTPEJV8Gnv/z+am1jKYcnre7rkF0ndhVbwhftIgpP9ka7vy
	4K10lhphzQ1ddkyBM4v3ME45X5DF9h/Qqfl3sO3IhpEPugMC/H6EXECIGj+sT6oaoDcG5HzYv3kyc
	rEC74aX5257jZnlJFhjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHh-0004m6-AZ; Sun, 22 Mar 2020 10:56:49 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFQ16-00023g-5F
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 22:21:25 +0000
IronPort-SDR: CdYnSz2Q+DJCgSm95vH8sSLL/Hnuj2DJQp/4vsuk6f5PS4fZiOpdJp1/gFb67+ljH3POMen04S
 mhJvsQByqBcA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 15:21:22 -0700
IronPort-SDR: 8Ay6OQxM+aILuohwi5ORMLfN3w5f887NOv1ojbguFUvGwTwX9PAZ6JU58Sua45GXWFrKCgK66r
 0P58aLXfrSBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,286,1580803200"; d="scan'208";a="445126035"
Received: from mnyman-mobl.ger.corp.intel.com (HELO localhost) ([10.249.32.33])
 by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2020 15:21:15 -0700
Date: Sat, 21 Mar 2020 00:21:13 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 2/2] KEYS: Avoid false positive ENOMEM error on key read
Message-ID: <20200320222113.GB5284@linux.intel.com>
References: <20200320191903.19494-1-longman@redhat.com>
 <20200320191903.19494-3-longman@redhat.com>
 <20200320221918.GA5284@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320221918.GA5284@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_152124_215177_9E7BB24C 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.120 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Sun, 22 Mar 2020 03:56:45 -0700
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

On Sat, Mar 21, 2020 at 12:19:27AM +0200, Jarkko Sakkinen wrote:
> Would move this label before condition instead of jumping inside the
> nested block since it will always evaluate correctly.
> 
> To this version haven't really gotten why you don't use a legit loop
> construct but instead jump from one random nested location to another
> random nested location? This construct will be somewhat nasty to
> maintain. The construct is weird enough that you should have rather
> good explanation in the long description why such a mess.

What I'm saying that if I fix a bug, the first version of the fix
would probably look something like this is right now. They I think
how to write it right. We don't want fixes that just happen to work.
Right now I'm worried to take this in since I'm not confident that
I haven't some possible corner case, or might still have gotten
something just plain wrong.

/Jarkko

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
