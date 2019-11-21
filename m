Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47D105624
	for <lists+linux-afs@lfdr.de>; Thu, 21 Nov 2019 16:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpe9JNfUmTKodsc889JpO2k1cvmTFbcXPsaU+LqX6ac=; b=tFDjbt+hWuuHFI
	8inCINbDm5gpigtscohgyaHYJiZlz1SAw2YWkoW/7/5YCiPwlWVMMXgk0PFfCJeSJOAujemdeoRp5
	n6EzJcUoxahwSKE7LDuPAjvh6cg264zZX5DyraC2xNBHc1y26iXTm892G3NhhFulWWvXuzg7zoQ9H
	tJ32lTjkAzM6RghUUAsS49pzVwiXNc+PefnxHy2LoMyuGvmLwgPNCLtJVN3K3/BTbOUKnaewIfhDm
	PTpeMX+Fc6ZX97so60mDBxeKvt7ug0M0M038Nf9JGFkgJnKIQuOwBbnSP8khbQX02E8N7Ja6IMmR2
	6PmzbWXVk0g0RxSIUKtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXooM-000154-1Q; Thu, 21 Nov 2019 15:56:02 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXooI-00011Q-SR
 for linux-afs@lists.infradead.org; Thu, 21 Nov 2019 15:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574351757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWsgKVybaH+JezO0Xvxir4xXLVYM64AtUYc2fCA9+9I=;
 b=By0CE3CcYIO4Q/0kecZ0zeir23N4bTGWY81g8d/rI5ExOk2AZ2iSuzGKAg2SK7TJ8j5USD
 nPwzQNL1FVECGZSc6VxKqSYy1j3dcRKCYGuivsVPBKYELA22xCqUWbGUkFjzTEcACcbQnW
 pzq0RV4sxPOc3TpWnXDyCpFu0WILFuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-XW1zfSQvObO2k-13Np5W9Q-1; Thu, 21 Nov 2019 10:55:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09526593A1;
 Thu, 21 Nov 2019 15:55:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-161.rdu2.redhat.com
 [10.10.120.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5ABF60F8B;
 Thu, 21 Nov 2019 15:55:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <157435064653.9583.16369826233033888377.stgit@warthog.procyon.org.uk>
References: <157435064653.9583.16369826233033888377.stgit@warthog.procyon.org.uk>
To: torvalds@linux-foundation.org
Subject: Re: [PATCH] afs: Fix large file support
MIME-Version: 1.0
Content-ID: <11835.1574351749.1@warthog.procyon.org.uk>
Date: Thu, 21 Nov 2019 15:55:49 +0000
Message-ID: <11836.1574351749@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: XW1zfSQvObO2k-13Np5W9Q-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_075558_996571_4C6F8E52 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Linus,

> By default s_maxbytes is set to MAX_NON_LFS, which limits the usable
> file size to 2GB, enforced by the vfs.

Note that this isn't fixing a critical failure, so you might want to punt it
to the next cycle.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
