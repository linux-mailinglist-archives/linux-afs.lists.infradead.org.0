Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D791218E820
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pK6lvtaT3ZdLVtFZi+gobez7H/gx6ibcFNbADzKPtSE=; b=QUqp3QDkmOroHv
	Kmsfy3bkgguEFor9OF9aR7sUXTN9Qc2S/JOPzESAiwWhSEZHL5XJWxN8H/QyWCgnn+5+vzaPLOdcL
	0M2l9YZGGTMXVSkzf2XVhHGzVKu6YbETWKuDdtZ7VU2cDpBRmS4YlbuTTSLhPrKkgjO0aDoJtDFGm
	sx/cO5bA+ElQS4ok2Y40j1t/oKKeZ+3mVg+FqMOXqeEWPVIGiAK4hhK+y+Ewop7K1fb4Q68LDX7px
	9WFuEHQisiXg0qEt+2Alf3wYRsarJPnMXX3ubWSvNFpzN9MbKhgVzHEW2FpCtABwKTPQx9awdBUjf
	1uiiDBuTpm9IekqJWB0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHg-0004ld-Vy; Sun, 22 Mar 2020 10:56:48 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFPzF-0000fp-Gs
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 22:19:30 +0000
IronPort-SDR: Z1bD5QI1EDp4xjRPtMwulYQrRZnKd4bPlA4XaUsqCA+jw6maCvZ8COzbJ0K6MP9uKG3rDF7QBR
 WFQyydlhNxSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 15:19:27 -0700
IronPort-SDR: IPRpLBa7WdI+MvkLQla232xaQRnNsQS2sfWzk6Kjfj4cTeVvuvAdu9x/YLVx9WxSnLs9J2vFiy
 a6AI4GaxQzzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,286,1580803200"; d="scan'208";a="269236493"
Received: from mnyman-mobl.ger.corp.intel.com (HELO localhost) ([10.249.32.33])
 by fmsmga004.fm.intel.com with ESMTP; 20 Mar 2020 15:19:19 -0700
Date: Sat, 21 Mar 2020 00:19:18 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 2/2] KEYS: Avoid false positive ENOMEM error on key read
Message-ID: <20200320221918.GA5284@linux.intel.com>
References: <20200320191903.19494-1-longman@redhat.com>
 <20200320191903.19494-3-longman@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320191903.19494-3-longman@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_151929_577023_FC58EDD9 
X-CRM114-Status: GOOD (  26.71  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.151 listed in list.dnswl.org]
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

On Fri, Mar 20, 2020 at 03:19:03PM -0400, Waiman Long wrote:
> By allocating a kernel buffer with a user-supplied buffer length, it
> is possible that a false positive ENOMEM error may be returned because
> the user-supplied length is just too large even if the system do have
> enough memory to hold the actual key data.
> 
> Moreover, if the buffer length is larger than the maximum amount of
> memory that can be returned by kmalloc() (2^(MAX_ORDER-1) number of
> pages), a warning message will also be printed.
> 
> To reduce this possibility, we set a threshold (page size) over which we
> do check the actual key length first before allocating a buffer of the
> right size to hold it. The threshold is arbitrary, it is just used to
> trigger a buffer length check. It does not limit the actual key length
> as long as there is enough memory to satisfy the memory request.
> 
> To further avoid large buffer allocation failure due to page
> fragmentation, kvmalloc() is used to allocate the buffer so that vmapped
> pages can be used when there is not a large enough contiguous set of
> pages available for allocation.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  security/keys/internal.h | 12 ++++++++++++
>  security/keys/keyctl.c   | 39 +++++++++++++++++++++++++++++++--------
>  2 files changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index ba3e2da14cef..6d0ca48ae9a5 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -16,6 +16,8 @@
>  #include <linux/keyctl.h>
>  #include <linux/refcount.h>
>  #include <linux/compat.h>
> +#include <linux/mm.h>
> +#include <linux/vmalloc.h>
>  
>  struct iovec;
>  
> @@ -349,4 +351,14 @@ static inline void key_check(const struct key *key)
>  
>  #endif
>  
> +/*
> + * Helper function to clear and free a kvmalloc'ed memory object.
> + */
> +static inline void __kvzfree(const void *addr, size_t len)
> +{
> +	if (addr) {
> +		memset((void *)addr, 0, len);
> +		kvfree(addr);
> +	}
> +}
>  #endif /* _INTERNAL_H */
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index 5a0794cb8815..ded69108db0d 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -339,7 +339,7 @@ long keyctl_update_key(key_serial_t id,
>  	payload = NULL;
>  	if (plen) {
>  		ret = -ENOMEM;
> -		payload = kmalloc(plen, GFP_KERNEL);
> +		payload = kvmalloc(plen, GFP_KERNEL);
>  		if (!payload)
>  			goto error;
>  
> @@ -360,7 +360,7 @@ long keyctl_update_key(key_serial_t id,
>  
>  	key_ref_put(key_ref);
>  error2:
> -	kzfree(payload);
> +	__kvzfree(payload, plen);
>  error:
>  	return ret;
>  }
> @@ -877,13 +877,23 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>  		 * transferring them to user buffer to avoid potential
>  		 * deadlock involving page fault and mmap_sem.
>  		 */
> -		char *key_data = kmalloc(buflen, GFP_KERNEL);
> +		char *key_data = NULL;
> +		size_t key_data_len = buflen;
>  
> -		if (!key_data) {
> -			ret = -ENOMEM;
> -			goto error2;
> +		/*
> +		 * When the user-supplied key length is larger than
> +		 * PAGE_SIZE, we get the actual key length first before
> +		 * allocating a right-sized key data buffer.
> +		 */
> +		if (buflen <= PAGE_SIZE) {
> +allocbuf:

Would move this label before condition instead of jumping inside the
nested block since it will always evaluate correctly.

To this version haven't really gotten why you don't use a legit loop
construct but instead jump from one random nested location to another
random nested location? This construct will be somewhat nasty to
maintain. The construct is weird enough that you should have rather
good explanation in the long description why such a mess.


> +			key_data = kvmalloc(key_data_len, GFP_KERNEL);
> +			if (!key_data) {
> +				ret = -ENOMEM;
> +				goto error2;
> +			}
>  		}
> -		ret = __keyctl_read_key(key, key_data, buflen);
> +		ret = __keyctl_read_key(key, key_data, key_data_len);
>  
>  		/*
>  		 * Read methods will just return the required length
> @@ -891,10 +901,23 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>  		 * enough.
>  		 */
>  		if (ret > 0 && ret <= buflen) {
> +			/*
> +			 * The key may change (unlikely) in between 2
> +			 * consecutive __keyctl_read_key() calls. We will
> +			 * need to allocate a larger buffer and redo the key
> +			 * read when key_data_len < ret <= buflen.
> +			 */
> +			if (!key_data || unlikely(ret > key_data_len)) {
> +				if (unlikely(key_data))
> +					__kvzfree(key_data, key_data_len);
> +				key_data_len = ret;
> +				goto allocbuf;
> +			}
> +
>  			if (copy_to_user(buffer, key_data, ret))
>  				ret = -EFAULT;
>  		}
> -		kzfree(key_data);
> +		__kvzfree(key_data, key_data_len);
>  	}
>  
>  error2:
> -- 
> 2.18.1
> 

Doesn't this go to infinite loop if actual key size is at least
PAGE_SIZE + 1? Where is the guarantee that this cannot happen?

/Jarkko



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
