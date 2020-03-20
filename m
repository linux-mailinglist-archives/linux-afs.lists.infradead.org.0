Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5114018E81C
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bm8142tQodbqVO7nFelTHaXuibEg6hXxMpDVTg0StRQ=; b=Yo6NrsCFFB3FzP
	6eBIj/zxLmNof+04PQ3EVxMs0xVP3kiNFb14jjavz30ELOJilPObN5vYmfVKskA0/Oit+/9Kit70N
	LXpCOx5jtAooDwwnXQZhpfuMOmU7j1yNku9qiyYxWurL3+/dxvZqdHrLLaqGJasmkWaJtXzmXmd49
	lHCap7c94h0MYhrj/6YPyusc7o6Tlj4yGRB7yQV/duCs1kxiH1TfiG4C56a/A7WdiDnofMK3VtFRj
	kNzOf551yEf8rrRZ8Ugog/IjhuPKsLfwCh87FPnzviN+KbD9Z4Nz8CZWeLJn6HFrTSLsMN8cAHOPC
	cbntGbaMNGtpfIU+qtug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHf-0004j8-Hk; Sun, 22 Mar 2020 10:56:47 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFI8p-0007JO-GO
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 13:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584712610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aBKKCxuGzKiLvrrqPPRyma9kDDTtMDjNgcj+HYwHhTs=;
 b=R5aulqqHutbJXeuhOGBj92E+UT18Hx/7fzRYMpvh2uIZM/euas2YVxhNUiTDGFnZR3ETQY
 AFy0cSw37xYj10ikdXMZo271iFysm11/XPanSTUQK6pJ9L97a2dc4CS3FsipDycIDWMokY
 04ZfUdW+FYBEAqVg+by58/6C92nKy+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-uCxcpSM7P_e66dxWVrksMQ-1; Fri, 20 Mar 2020 09:56:48 -0400
X-MC-Unique: uCxcpSM7P_e66dxWVrksMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD92477;
 Fri, 20 Mar 2020 13:56:46 +0000 (UTC)
Received: from llong.remote.csb (ovpn-118-190.rdu2.redhat.com [10.10.118.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0641C62937;
 Fri, 20 Mar 2020 13:56:42 +0000 (UTC)
Subject: Re: [PATCH v5 1/2] KEYS: Don't write out to userspace while holding
 key semaphore
To: David Howells <dhowells@redhat.com>
References: <20200318221457.1330-2-longman@redhat.com>
 <20200318221457.1330-1-longman@redhat.com>
 <3251035.1584692419@warthog.procyon.org.uk>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <69678e1c-dfbe-7484-85ad-601ebe23c90d@redhat.com>
Date: Fri, 20 Mar 2020 09:56:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3251035.1584692419@warthog.procyon.org.uk>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_065651_628885_723E66AF 
X-CRM114-Status: GOOD (  10.25  )
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

On 3/20/20 4:20 AM, David Howells wrote:
> Waiman Long <longman@redhat.com> wrote:
>
>> +		if ((ret > 0) && (ret <= buflen)) {
> That's a bit excessive on the bracketage, btw, but don't worry about it unless
> you respin the patches.

Got it.

Thanks,
Longman


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
