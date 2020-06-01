Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A70AE1EA3EC
	for <lists+linux-afs@lfdr.de>; Mon,  1 Jun 2020 14:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLhCf50mL5J4Vl0O2aqV2/0aibWYXVb0Fn52kxuWVwo=; b=DZpLg5f2wskwtV
	Fmyvl8y3BwVTiV6jc1wcRVylC7Wl5g+O86Khr/Im86MokZhDjZiXHFcPA+5umcCL8pQir7hM9AtPQ
	sHPSfcGO8sxumshFZTYfEhCD3yrhXHybyhmq+WXlahW1u0BMwHCJ3GF2qCrAL6e9xCQKdSzSmECkJ
	MHF0kjT8ZzN1MLYyX9mZ+GRJxf3NKHuH3cfLAk28wyxALKZK9lmNLXOsLJfSX4TA+BCMG75gJJT4G
	aaIm7faX2GWRotGqEEqcttEjN2q4zUKft0PklMPAos/nB8QIsuEuW44aX0GrQoASXLQi3LHq0hhoo
	VKAEyEvWWl22yH4o0L6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfjbP-0000FD-1B; Mon, 01 Jun 2020 12:31:39 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfjbL-0000EP-Tu
 for linux-afs@lists.infradead.org; Mon, 01 Jun 2020 12:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591014694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VOACdA2Kaw77MK1p6SFJPm5uM6Jc6RhnwZNlhKvqlk=;
 b=QBoWaP2eRHryUGBwHtZqv+Tb0e8iKNM5+hD4Tror1LmLnF3P7DAsaVHwQMw8boSLxu7cMT
 4yGxOD1Ov8R2C8rXQP1WYVMcbzloq9COjwPqlDv8n/JLRfZbMeRkRucllJJgaXHOH65mWZ
 ru/pf+Rs6TBJVZSjwkyYYoTt1WJ4vnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-VxsYkypcM6-zac2MMITW0A-1; Mon, 01 Jun 2020 08:31:32 -0400
X-MC-Unique: VxsYkypcM6-zac2MMITW0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45F4F107ACF2;
 Mon,  1 Jun 2020 12:31:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DBBF7E7E1;
 Mon,  1 Jun 2020 12:31:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200601092150.3798343-1-chengzhihao1@huawei.com>
References: <20200601092150.3798343-1-chengzhihao1@huawei.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: [PATCH] afs: Fix memory leak in afs_put_sysnames()
MIME-Version: 1.0
Content-ID: <1306173.1591014689.1@warthog.procyon.org.uk>
Date: Mon, 01 Jun 2020 13:31:29 +0100
Message-ID: <1306174.1591014689@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_053136_046248_93CD6E34 
X-CRM114-Status: GOOD (  11.39  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org, yi.zhang@huawei.com,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Zhihao Cheng <chengzhihao1@huawei.com> wrote:

> sysnames should be freed after refcnt being decreased to zero in
> afs_put_sysnames().

Good catch.

> Besides, it would be better set net->sysnames to 'NULL' after net->sysnames
> being released if afs_put_sysnames() aims on an afs_sysnames object.

Why?  We don't normally clear pointers when cleaning up a struct - and of the
two places this is relevant, in one we fail to set up a namespace and in the
other we're tearing down a namespace.  In neither case should the pointer be
accessed again.

> @@ -894,7 +894,7 @@ static struct dentry *afs_lookup_atsys(struct inode *dir, struct dentry *dentry,
>  	 */
>  	ret = NULL;
>  out_s:
> -	afs_put_sysnames(subs);
> +	afs_put_sysnames_and_null(net);

This is definitely wrong.  We obtained a ref 23 lines above and dropped the
lock:

	read_lock(&net->sysnames_lock);
	subs = net->sysnames;
	refcount_inc(&subs->usage);
	read_unlock(&net->sysnames_lock);

We are dropping *that* ref, not the one in the struct.

Just adding the missing kfree() call into afs_put_sysnames() should suffice,
thanks.

David



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
