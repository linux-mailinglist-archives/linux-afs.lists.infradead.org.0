Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE15118E822
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfT8Q27mxiwhlRroXSWihO+PjFDpTracuNndq4mcH5Q=; b=YUj7tijhs/n9/r
	NkZx6DPcM4TWrx7H9sCjgZFLwSaepCvqzRGBUMG/Ajv/+pKfes5mULJaEt0Eh6Y5p1xNMZokU90Eu
	xvp+7v3lur7KP0OIiLsxhmE2gCVyDaTxyJxkQzT7akTp87LYtUoAM4+Uu33c6mWTSSX8zBgPNWYwV
	/RRg4Z/p/sBKDBtL+vOTaQQaPVTs8PoKfe55uf03xJQCvRI09AC1rZcyarCWdnVliI1Qe4z/ISX4k
	PW0Jxmz8D/wYX6oC9QNyHnAdp2no6AxRKlyDvWXP1O6vyM1NywObI5J75RQEbVfZltK2pu8LYp2lC
	iNfzaNOORwn/iwodc60Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHl-0004ps-OB; Sun, 22 Mar 2020 10:56:53 +0000
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFTIy-0001D3-J9
 for linux-afs@lists.infradead.org; Sat, 21 Mar 2020 01:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584755515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+Q36V4rd4UMSfz8nT4bEXIIO5pmKgsmOZOZyFzcAyI=;
 b=dzQxFmY4SmV0rkptWIBx7pvv5OMWGwvAczVFzNW3UokAo1r2sYjLM1Pr7skBcuWec2Eax2
 BtDHN3i9ARHMfsX8qMTe6pHA8tI+CIdX2P9BgQrN27BMrk+jKXZ3WYdcttztvMUi814dUl
 wcJAUzH1oCPW36zmkiIq/Vx0JQBjaV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-OdZ44-2iMHiH5OJz8hmoag-1; Fri, 20 Mar 2020 21:51:53 -0400
X-MC-Unique: OdZ44-2iMHiH5OJz8hmoag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5C0B13EA;
 Sat, 21 Mar 2020 01:51:50 +0000 (UTC)
Received: from llong.remote.csb (ovpn-118-190.rdu2.redhat.com [10.10.118.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16536912B5;
 Sat, 21 Mar 2020 01:51:46 +0000 (UTC)
Subject: Re: [PATCH v6 2/2] KEYS: Avoid false positive ENOMEM error on key read
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
References: <20200320191903.19494-1-longman@redhat.com>
 <20200320191903.19494-3-longman@redhat.com>
 <20200320221918.GA5284@linux.intel.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <208854de-824e-5926-e02d-1f5678af3548@redhat.com>
Date: Fri, 20 Mar 2020 21:51:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200320221918.GA5284@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_185204_712824_DB140FF5 
X-CRM114-Status: GOOD (  27.84  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [63.128.21.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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

On 3/20/20 6:19 PM, Jarkko Sakkinen wrote:
> On Fri, Mar 20, 2020 at 03:19:03PM -0400, Waiman Long wrote:
>> By allocating a kernel buffer with a user-supplied buffer length, it
>> is possible that a false positive ENOMEM error may be returned because
>> the user-supplied length is just too large even if the system do have
>> enough memory to hold the actual key data.
>>
>> Moreover, if the buffer length is larger than the maximum amount of
>> memory that can be returned by kmalloc() (2^(MAX_ORDER-1) number of
>> pages), a warning message will also be printed.
>>
>> To reduce this possibility, we set a threshold (page size) over which we
>> do check the actual key length first before allocating a buffer of the
>> right size to hold it. The threshold is arbitrary, it is just used to
>> trigger a buffer length check. It does not limit the actual key length
>> as long as there is enough memory to satisfy the memory request.
>>
>> To further avoid large buffer allocation failure due to page
>> fragmentation, kvmalloc() is used to allocate the buffer so that vmapped
>> pages can be used when there is not a large enough contiguous set of
>> pages available for allocation.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>  security/keys/internal.h | 12 ++++++++++++
>>  security/keys/keyctl.c   | 39 +++++++++++++++++++++++++++++++--------
>>  2 files changed, 43 insertions(+), 8 deletions(-)
>>
>> diff --git a/security/keys/internal.h b/security/keys/internal.h
>> index ba3e2da14cef..6d0ca48ae9a5 100644
>> --- a/security/keys/internal.h
>> +++ b/security/keys/internal.h
>> @@ -16,6 +16,8 @@
>>  #include <linux/keyctl.h>
>>  #include <linux/refcount.h>
>>  #include <linux/compat.h>
>> +#include <linux/mm.h>
>> +#include <linux/vmalloc.h>
>>  
>>  struct iovec;
>>  
>> @@ -349,4 +351,14 @@ static inline void key_check(const struct key *key)
>>  
>>  #endif
>>  
>> +/*
>> + * Helper function to clear and free a kvmalloc'ed memory object.
>> + */
>> +static inline void __kvzfree(const void *addr, size_t len)
>> +{
>> +	if (addr) {
>> +		memset((void *)addr, 0, len);
>> +		kvfree(addr);
>> +	}
>> +}
>>  #endif /* _INTERNAL_H */
>> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
>> index 5a0794cb8815..ded69108db0d 100644
>> --- a/security/keys/keyctl.c
>> +++ b/security/keys/keyctl.c
>> @@ -339,7 +339,7 @@ long keyctl_update_key(key_serial_t id,
>>  	payload = NULL;
>>  	if (plen) {
>>  		ret = -ENOMEM;
>> -		payload = kmalloc(plen, GFP_KERNEL);
>> +		payload = kvmalloc(plen, GFP_KERNEL);
>>  		if (!payload)
>>  			goto error;
>>  
>> @@ -360,7 +360,7 @@ long keyctl_update_key(key_serial_t id,
>>  
>>  	key_ref_put(key_ref);
>>  error2:
>> -	kzfree(payload);
>> +	__kvzfree(payload, plen);
>>  error:
>>  	return ret;
>>  }
>> @@ -877,13 +877,23 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>>  		 * transferring them to user buffer to avoid potential
>>  		 * deadlock involving page fault and mmap_sem.
>>  		 */
>> -		char *key_data = kmalloc(buflen, GFP_KERNEL);
>> +		char *key_data = NULL;
>> +		size_t key_data_len = buflen;
>>  
>> -		if (!key_data) {
>> -			ret = -ENOMEM;
>> -			goto error2;
>> +		/*
>> +		 * When the user-supplied key length is larger than
>> +		 * PAGE_SIZE, we get the actual key length first before
>> +		 * allocating a right-sized key data buffer.
>> +		 */
>> +		if (buflen <= PAGE_SIZE) {
>> +allocbuf:
> Would move this label before condition instead of jumping inside the
> nested block since it will always evaluate correctly.

Yes, you are right. That was not the case for initial version and I
didn't recheck it.


> To this version haven't really gotten why you don't use a legit loop
> construct but instead jump from one random nested location to another
> random nested location? This construct will be somewhat nasty to
> maintain. The construct is weird enough that you should have rather
> good explanation in the long description why such a mess.

I did that to avoid deep nesting. I can rewrite it to remove the the
goto statement.


>
>> +			key_data = kvmalloc(key_data_len, GFP_KERNEL);
>> +			if (!key_data) {
>> +				ret = -ENOMEM;
>> +				goto error2;
>> +			}
>>  		}
>> -		ret = __keyctl_read_key(key, key_data, buflen);
>> +		ret = __keyctl_read_key(key, key_data, key_data_len);
>>  
>>  		/*
>>  		 * Read methods will just return the required length
>> @@ -891,10 +901,23 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
>>  		 * enough.
>>  		 */
>>  		if (ret > 0 && ret <= buflen) {
>> +			/*
>> +			 * The key may change (unlikely) in between 2
>> +			 * consecutive __keyctl_read_key() calls. We will
>> +			 * need to allocate a larger buffer and redo the key
>> +			 * read when key_data_len < ret <= buflen.
>> +			 */
>> +			if (!key_data || unlikely(ret > key_data_len)) {
>> +				if (unlikely(key_data))
>> +					__kvzfree(key_data, key_data_len);
>> +				key_data_len = ret;
>> +				goto allocbuf;
>> +			}
>> +
>>  			if (copy_to_user(buffer, key_data, ret))
>>  				ret = -EFAULT;
>>  		}
>> -		kzfree(key_data);
>> +		__kvzfree(key_data, key_data_len);
>>  	}
>>  
>>  error2:
>> -- 
>> 2.18.1
>>
> Doesn't this go to infinite loop if actual key size is at least
> PAGE_SIZE + 1? Where is the guarantee that this cannot happen?

I think you may have the wrong impression that it caps the buffer length
to PAGE_SIZE. That is not true. key_data_len can be greater than
PAGE_SIZE. I run tests that include one that creates a big key of almost
1Mb. So for buflen <= PAGE_SIZE, key_data_len = buflen. For buflen >
PAGE_SIZE, key_data_len = the actual key length which can be >
PAGE_SIZE. This patch just tries to avoid allocating arbitrary large
buffer with a length much larger than the actual key length.

I will try to make the code easier to read.

Cheers,
Longman


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
