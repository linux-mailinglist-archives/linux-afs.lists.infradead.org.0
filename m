Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B05018E81E
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h8TFnwwVSnVqxsAbbzH35KMUVjPk4DnY0o8g0nGB5p0=; b=oLOjtVglQ1+sah
	abV4qRCYhX7hAhN7lxSVS8VyB9OUOrzbsTGsBHHJnMdVyLo0+b5WBTsUcOfztm/R0/anJ9UocwLOw
	oZf5YrgIx1vNN97j1bGHJWc45eZ9btVJmRH4b2eVCXLoVPeyvJ/SJLH/X4gnUa76GznbQE0HYRPh6
	h5Wp73jycunLcGS3QDeDET9KO2U5AyIMWcB7fNvMD1leQ6UbJACLo80bPDCGU4ChLRHr3MwszFBux
	oJhkfIhSuL5G1NNamciTOTKJdraLr4mBmNnI3uAQs9LWAnSiWIHjfy0od+xGmkxDrPmwFkzIJDBUP
	Pr0yjHBKLyAeV3+RuJRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHg-0004jV-07; Sun, 22 Mar 2020 10:56:48 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFJHN-0000ne-F0
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 15:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584716980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+aUM1Yn2Y/IYb21uZgrRPO9zmI5FLmUctu7OcB3Czc=;
 b=W2QyzFaLigQjVC3dxyvg2bbE5i05wz6+FL/MNUwJAC1ayUyucytoldJuirsrfRh7PjbEay
 ZG0jR0GMqyb4yjreV/DTgfSGp9g9pvL8YqfpdAjhJDpk6W23nQWRLcGOuMNBpR3YWNOWKP
 +53wqF4rlr67etwInWe31DZkhZzVLXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-t2-NJVv6NAmkytbnxuHV-w-1; Fri, 20 Mar 2020 11:09:39 -0400
X-MC-Unique: t2-NJVv6NAmkytbnxuHV-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 354B018AB2C4;
 Fri, 20 Mar 2020 15:09:36 +0000 (UTC)
Received: from llong.remote.csb (ovpn-118-190.rdu2.redhat.com [10.10.118.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACDE25C1B8;
 Fri, 20 Mar 2020 15:09:32 +0000 (UTC)
Subject: Re: [PATCH v5 2/2] KEYS: Avoid false positive ENOMEM error on key read
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
References: <20200318221457.1330-1-longman@redhat.com>
 <20200318221457.1330-3-longman@redhat.com>
 <20200319194650.GA24804@linux.intel.com>
 <f22757ad-4d6f-ffd2-eed5-6b9bd1621b10@redhat.com>
 <20200320020717.GC183331@linux.intel.com>
 <7dbc524f-6c16-026a-a372-2e80b40eab30@redhat.com>
 <20200320143547.GB3629@linux.intel.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <ab411cce-e8dd-c81c-fec4-b59624f66d76@redhat.com>
Date: Fri, 20 Mar 2020 11:09:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200320143547.GB3629@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_080945_595492_68079ADD 
X-CRM114-Status: GOOD (  17.56  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
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

On 3/20/20 10:35 AM, Jarkko Sakkinen wrote:
> On Fri, Mar 20, 2020 at 09:27:03AM -0400, Waiman Long wrote:
>> On 3/19/20 10:07 PM, Jarkko Sakkinen wrote:
>>> On Thu, Mar 19, 2020 at 08:07:55PM -0400, Waiman Long wrote:
>>>> On 3/19/20 3:46 PM, Jarkko Sakkinen wrote:
>>>>> On Wed, Mar 18, 2020 at 06:14:57PM -0400, Waiman Long wrote:
>>>>>> +			 * It is possible, though unlikely, that the key
>>>>>> +			 * changes in between the up_read->down_read period.
>>>>>> +			 * If the key becomes longer, we will have to
>>>>>> +			 * allocate a larger buffer and redo the key read
>>>>>> +			 * again.
>>>>>> +			 */
>>>>>> +			if (!tmpbuf || unlikely(ret > tmpbuflen)) {
>>>>> Shouldn't you check that tmpbuflen stays below buflen (why else
>>>>> you had made copy of buflen otherwise)?
>>>> The check above this thunk:
>>>>
>>>> if ((ret > 0) && (ret <= buflen)) {
>>>>
>>>> will make sure that ret will not be larger than buflen. So tmpbuflen > >> will never be bigger than buflen.  > > Ah right, of course, thanks.
>>> What would go wrong if the condition was instead
>>> ((ret > 0) && (ret <= tmpbuflen))?
>> That if statement is a check to see if the actual key length is longer
>> than the user-supplied buffer (buflen). If that is the case, it will
>> just return the expected length without storing anything into the user
>> buffer. For the case that buflen >= ret > tmpbuflen, the revised check
>> above will incorrectly skip the storing step causing the caller to
>> incorrectly think the key is there in the buffer.
>>
>> Maybe I should clarify that a bit more in the comment.
> OK, right because it is possible in-between tmpbuflen could be
> larger. Got it.
>
> I think that longish key_data and key_data_len would be better
> names than tmpbuf and tpmbuflen.
>
> Also the comments are somewat overkill IMHO.
>
> I'd replace them along the lines of
>
> /* Cap the user supplied buffer length to PAGE_SIZE. */
>
> /* Key data can change as we don not hold key->sem. */

I am fine with the rename, will sent out a v6 soon.

Cheers,
Longman


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
