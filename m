Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D361A18E825
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cmq7oeGyMfRNHaHWHinohunJWc+ZBvmDgDHDzAjguk=; b=ZyAly1RPIGPY0E
	2BCcdCO+BGJEkrZX3p6QcoN6Mc4c39rPHhYfr9EhL/i39QozNYekx5txi0OhgC1TIzLR3npzue6dS
	+DjnVEeT0pgLx0ImgP8NiDzfNNS3U1Ca2wOYT/7NGYCSxdlF8o3jKmSwrNhN9sPRX6h3L5GmXh3lg
	SMl2BzZfqO7mMthauWwy1xPK46TFAOFNWcM6UuJ9R058Vfh/xFJKXdopMnNGlXDZ+TYn8jnjHWGV2
	TLh45eI2kA/GadenPtjWtTmMYzrmrU5d/ZwOO2uQB7jJtu2Aw3y5hOUcxaxE3Ba6KJkjKoFCqlnYI
	RW1NJlMsV1ogtHM4wpbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHf-0004jJ-Nm; Sun, 22 Mar 2020 10:56:47 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFIkb-0007eb-K3
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 14:35:54 +0000
IronPort-SDR: YeU4YUszoPvGImm0lkC/WI2MO4x9Jf1x9rlljBHU3XxPfJT0VoBSYEHqCtN11O/is2t+B1ObDY
 skMW5KQveJLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 07:35:52 -0700
IronPort-SDR: 31yy+iEliot0MYaUGlxyywSdC2TYVWie+dTp/EwvWI6d5G7CX6cuWYyjHg4ItAZSCUX2kp0+Ge
 tp2Cyown55zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="444986444"
Received: from jsakkine-mobl1.tm.intel.com (HELO localhost) ([10.237.50.161])
 by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2020 07:35:48 -0700
Date: Fri, 20 Mar 2020 16:35:47 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 2/2] KEYS: Avoid false positive ENOMEM error on key read
Message-ID: <20200320143547.GB3629@linux.intel.com>
References: <20200318221457.1330-1-longman@redhat.com>
 <20200318221457.1330-3-longman@redhat.com>
 <20200319194650.GA24804@linux.intel.com>
 <f22757ad-4d6f-ffd2-eed5-6b9bd1621b10@redhat.com>
 <20200320020717.GC183331@linux.intel.com>
 <7dbc524f-6c16-026a-a372-2e80b40eab30@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7dbc524f-6c16-026a-a372-2e80b40eab30@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_073553_703447_4F8765FB 
X-CRM114-Status: GOOD (  16.43  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [134.134.136.24 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [134.134.136.24 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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

On Fri, Mar 20, 2020 at 09:27:03AM -0400, Waiman Long wrote:
> On 3/19/20 10:07 PM, Jarkko Sakkinen wrote:
> > On Thu, Mar 19, 2020 at 08:07:55PM -0400, Waiman Long wrote:
> >> On 3/19/20 3:46 PM, Jarkko Sakkinen wrote:
> >>> On Wed, Mar 18, 2020 at 06:14:57PM -0400, Waiman Long wrote:
> >>>> +			 * It is possible, though unlikely, that the key
> >>>> +			 * changes in between the up_read->down_read period.
> >>>> +			 * If the key becomes longer, we will have to
> >>>> +			 * allocate a larger buffer and redo the key read
> >>>> +			 * again.
> >>>> +			 */
> >>>> +			if (!tmpbuf || unlikely(ret > tmpbuflen)) {
> >>> Shouldn't you check that tmpbuflen stays below buflen (why else
> >>> you had made copy of buflen otherwise)?
> >> The check above this thunk:
> >>
> >> if ((ret > 0) && (ret <= buflen)) {
> >>
> >> will make sure that ret will not be larger than buflen. So tmpbuflen > >> will never be bigger than buflen.  > > Ah right, of course, thanks.
> >
> > What would go wrong if the condition was instead
> > ((ret > 0) && (ret <= tmpbuflen))?
> 
> That if statement is a check to see if the actual key length is longer
> than the user-supplied buffer (buflen). If that is the case, it will
> just return the expected length without storing anything into the user
> buffer. For the case that buflen >= ret > tmpbuflen, the revised check
> above will incorrectly skip the storing step causing the caller to
> incorrectly think the key is there in the buffer.
> 
> Maybe I should clarify that a bit more in the comment.

OK, right because it is possible in-between tmpbuflen could be
larger. Got it.

I think that longish key_data and key_data_len would be better
names than tmpbuf and tpmbuflen.

Also the comments are somewat overkill IMHO.

I'd replace them along the lines of

/* Cap the user supplied buffer length to PAGE_SIZE. */

/* Key data can change as we don not hold key->sem. */

/Jarkko

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
