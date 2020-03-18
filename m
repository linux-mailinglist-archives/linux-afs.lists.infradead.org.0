Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900D189F59
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 16:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2eG95UcppSTcsqRgcVDkw1REyXPFwFEfn/eo1vFNfw=; b=Q89dIGP2Cs9mxE
	pNfbvki8H1xvU1t1mYxFnk427RYdLUU0/kthB8S+lUYWAZJ3+LBaE45q7YMuI5z77NcB17oncQXxN
	NqHLfANlBp5tOEomRuF56jg1zUnhH2R8wwBpIvgEugr+Ev6HRWd8EQsGWcBVSagkUG/AwzoY0Zv1x
	yKb9j5DeLIfnJNCSyCg4VuXLw744fkP0f1YPqWoO1iEBiTFWWTUN2YGiQOG/9OcxT2Bp2+/1B4lDl
	pUYTDZrov7v8mcrbzBd+qFF469Y2Kjn0TMnt5nJttdtAVc+/qblg0WEOhTaJjjrY6xSSModtvNTIR
	Oo3MpcP8DW6CBb7+WxSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEaMP-0006z4-Qf; Wed, 18 Mar 2020 15:11:57 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEZmO-0003tN-Qk
 for linux-afs@lists.infradead.org; Wed, 18 Mar 2020 14:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584542080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDcu1iOa70ydGTzbtxeciqeXori85SoY2pnI41cZUDY=;
 b=M+sTpZ4Itm2z/5rKyBttp696B82XawqcxlKgQAYC/0X4kcKRmJsnyo2I/LSqzFaOy1vdSW
 MARFEVbJMbOGvSq0UGAWO8GfJCKPuhtKHc9I1DwVWCU+/XAZdyvc3gRNi4u0RoY+gGiiBy
 PM3HVN/2n476w5NNHpSIIeaThQtrmOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-W8OgMNYEOw6rZG7yJQ1TWA-1; Wed, 18 Mar 2020 10:34:39 -0400
X-MC-Unique: W8OgMNYEOw6rZG7yJQ1TWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D582C189D6C0;
 Wed, 18 Mar 2020 14:34:36 +0000 (UTC)
Received: from llong.remote.csb (ovpn-120-114.rdu2.redhat.com [10.10.120.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66E1D19C58;
 Wed, 18 Mar 2020 14:34:34 +0000 (UTC)
Subject: Re: [PATCH v4 4/4] KEYS: Avoid false positive ENOMEM error on key read
To: David Howells <dhowells@redhat.com>
References: <20200317194140.6031-5-longman@redhat.com>
 <20200317194140.6031-1-longman@redhat.com>
 <2832139.1584520054@warthog.procyon.org.uk>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <e47bef56-9271-93e0-0e59-c77c253babea@redhat.com>
Date: Wed, 18 Mar 2020 10:34:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2832139.1584520054@warthog.procyon.org.uk>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_073444_947464_FE2CC018 
X-CRM114-Status: GOOD (  12.59  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Wed, 18 Mar 2020 08:11:56 -0700
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
 Roberto Sassu <roberto.sassu@huawei.com>, Eric Biggers <ebiggers@google.com>,
 netdev@vger.kernel.org, Jerry Snitselaar <jsnitsel@redhat.com>,
 James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-integrity@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 3/18/20 4:27 AM, David Howells wrote:
> Waiman Long <longman@redhat.com> wrote:
>
>> +static inline void __kvzfree(const void *addr, size_t len)
>> +{
>> +	if (addr) {
>> +		memset((void *)addr, 0, len);
>> +		kvfree(addr);
>> +	}
>> +}
> I wonder if that would be better as "kvfree(memset(...))" as memset() will
> return the address parameter.  If memset is not inline, it avoids the need for
> the compiler to save the parameter.
>
> David

Doing this is micro-optimization. As the keys subsystem is that
performance critical, do we need to do that to save a cycle or two while
making the code a bit harder to read?

Cheers,
Longman


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
