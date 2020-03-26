Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D73E194996
	for <lists+linux-afs@lfdr.de>; Thu, 26 Mar 2020 21:53:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uvu257U/giUDdT9Z0iNgLNKrP6D10P7VwD9sVHTzmhc=; b=EKnLmzZsO1adsm
	hRSYPBxIqYD+OQfXBVV1SVCByjsvZGG9qfG3rvyDIp44ODOVm5NXaAejYHwXG2Ek14GAKHiXrEfZt
	3kghY9c0oUTp8CzFHjV4F+7vHi1thLpl+Sd46OWas547Xs73aNkC7Cd7egDOsojVhLxviloRxENKf
	X34GZfrE7w3s8Q8pAGbYU7f2Qlkpbd4Ee1dtNkOvjDyouJo/Q98J37l8R2OxHvGC+9jtxnkOOJof+
	ClFsUaI/O0wmAxqUU6WhCiOqQKBsWhFb8NRgvTuVmyEjD2WrJanG/qIPBS7AOCAuiBf7EaUm8H3GQ
	PNgAPFE91xr6LZTI2PdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHZUo-0002WU-4t; Thu, 26 Mar 2020 20:52:58 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHWzo-0001pk-IS
 for linux-afs@lists.infradead.org; Thu, 26 Mar 2020 18:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585246367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xSpHtNBxLLhtF34YSYaO2d4Hbj2Yy2CbluzS9RwRxJk=;
 b=FzLA8EpXSrdW3UC1SAtLYlsuYFRdvQJ3UPlANlfuuqAxbO1ZV7e0fgD98EfGUeYc6kOsHz
 iVqK68Oyp/rcVp9RXE8yuLVQYDuuIlMUlniLl4yoQvfkm7Xs4UXahNXSbqb+Lsm2TxQLjQ
 zeBMvD/I/h+8pSDWBzJMKV/XTC9uhpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-LYKPwtB9OVaVDStq5YqjMQ-1; Thu, 26 Mar 2020 14:12:43 -0400
X-MC-Unique: LYKPwtB9OVaVDStq5YqjMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCD2B100550D;
 Thu, 26 Mar 2020 18:12:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4E5960BF3;
 Thu, 26 Mar 2020 18:12:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200325.193056.1153970692429454819.davem@davemloft.net>
References: <20200325.193056.1153970692429454819.davem@davemloft.net>
 <20200322011125.24327-1-longman@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v8 0/2] KEYS: Read keys to internal buffer & then copy to
 userspace
MIME-Version: 1.0
Content-ID: <996367.1585246352.1@warthog.procyon.org.uk>
Date: Thu, 26 Mar 2020 18:12:32 +0000
Message-ID: <996368.1585246352@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_111248_691996_89B132C6 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 26 Mar 2020 13:52:56 -0700
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
Cc: sumit.garg@linaro.org, crecklin@redhat.com, roberto.sassu@huawei.com,
 ebiggers@google.com, netdev@vger.kernel.org, jsnitsel@redhat.com,
 jmorris@namei.org, zohar@linux.ibm.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, jarkko.sakkinen@linux.intel.com, kuba@kernel.org,
 longman@redhat.com, linux-integrity@vger.kernel.org,
 linux-afs@lists.infradead.org, serge@hallyn.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Miller <davem@davemloft.net> wrote:

> Who will integrate these changes?

I'll do it unless Jarkko wants to push it through his tree.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
