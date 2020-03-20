Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 841DD18C8E6
	for <lists+linux-afs@lfdr.de>; Fri, 20 Mar 2020 09:22:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TI6lbMwCwvMP8M/CNzHzbkeqMVs6v99EzFwNL8HuTCo=; b=qxeNXQjGua8nU+
	O/ALSQ3k0cmdO2d6qoa/WfaJHqxC3LvfTYimM6V8w7cnq9dV5DJr3okxF/4jy8tr1UNMvOZuam1d5
	8aIo78GyomwJ/BHglIwuj/+6cHufxtOrnwIVIfVgIiEpTQfBPD1eLZv8cLyQ6hJNPc/jt0QfAN4+E
	YfI6o/rPwMj/NojPlII+YHIRBkbYyDFO5Ab71NrVWiilFxCQ0EuYdtB0sKKjaZ5gTMAmBjBTQ9Frb
	RWDEuNgXXmUpVmfR6JWV6N+ymhF/pMzijrbMeCs+AaFwAaQtERQurKLW5bKojcbfwhE+/Pbn7xWSD
	qWzVaHGd8FGZTLMppS/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFCuw-0006qn-7A; Fri, 20 Mar 2020 08:22:10 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF74K-0000aZ-Gx
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 02:07:30 +0000
IronPort-SDR: 2usb/F4RG17Kbj5ph2BhVo55W6aoT5uFTTgyKmIGpzFwCR0mYKaAXsmS99qotVNGi4QLRqwZ+M
 PsFGP0XRiy7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 19:07:27 -0700
IronPort-SDR: WiEzzFWd7aTAoICAsN40XtyFpCM6ZL+d1ZkXNh3BJ3Vi1nV2R8/rxwplPDE8ycxCDCxG4UTI9x
 XiL+wxuMpEeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,282,1580803200"; d="scan'208";a="245348348"
Received: from anakash-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.251.183.74])
 by orsmga003.jf.intel.com with ESMTP; 19 Mar 2020 19:07:18 -0700
Date: Fri, 20 Mar 2020 04:07:17 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 2/2] KEYS: Avoid false positive ENOMEM error on key read
Message-ID: <20200320020717.GC183331@linux.intel.com>
References: <20200318221457.1330-1-longman@redhat.com>
 <20200318221457.1330-3-longman@redhat.com>
 <20200319194650.GA24804@linux.intel.com>
 <f22757ad-4d6f-ffd2-eed5-6b9bd1621b10@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f22757ad-4d6f-ffd2-eed5-6b9bd1621b10@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_190728_948403_30AD55CD 
X-CRM114-Status: GOOD (  10.51  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.88 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.55.52.88 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Mailman-Approved-At: Fri, 20 Mar 2020 01:22:09 -0700
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

On Thu, Mar 19, 2020 at 08:07:55PM -0400, Waiman Long wrote:
> On 3/19/20 3:46 PM, Jarkko Sakkinen wrote:
> > On Wed, Mar 18, 2020 at 06:14:57PM -0400, Waiman Long wrote:
> >> +			 * It is possible, though unlikely, that the key
> >> +			 * changes in between the up_read->down_read period.
> >> +			 * If the key becomes longer, we will have to
> >> +			 * allocate a larger buffer and redo the key read
> >> +			 * again.
> >> +			 */
> >> +			if (!tmpbuf || unlikely(ret > tmpbuflen)) {
> > Shouldn't you check that tmpbuflen stays below buflen (why else
> > you had made copy of buflen otherwise)?
> 
> The check above this thunk:
> 
> if ((ret > 0) && (ret <= buflen)) {
> 
> will make sure that ret will not be larger than buflen. So tmpbuflen
> will never be bigger than buflen.

Ah right, of course, thanks.

What would go wrong if the condition was instead
((ret > 0) && (ret <= tmpbuflen))?

/Jarkko

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
