Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF81E4733
	for <lists+linux-afs@lfdr.de>; Wed, 27 May 2020 17:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5eINfX6+Ui8YHqEWrnfcen6jQonv8C9wodgvbFs4Kg=; b=UVQg3DLPe+jXMp
	KhncCRYXq6f1HgxNNiCsXK3LLPjHCl9M3ulcwwpkIX5jhjTg+Bpd7ZM1mYiwhZQEFBb7ha47ZBhiU
	40V5nbjDuJ2/wcdxhsQe8uLp6Ke6azm3v+CuuiOsxnQpw9vRkT4mOGEYfHao3YRI72ApViJAALC0D
	P7YBtbyqeDJcXclvCgYwlAkcGgvZekD7JT+lUTkhPaj/6H2rykkAmP1wjBtdlNV9yINge6GFEzQ23
	vwcWu1z/1dLGf8B1UC34XpU/6M9YqzIb2ZLz9LAYkCc7lf09ln1uveLjRbj3uwEcvUPKLIPIukoYD
	IFtV5JWsO460Lh2VMcKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdxrg-0004HY-E9; Wed, 27 May 2020 15:21:08 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdxrd-0004GX-Qi
 for linux-afs@lists.infradead.org; Wed, 27 May 2020 15:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590592862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RGIL+/IPozSdXT6nYYNzdE5I68dd6nQjbL88V5yYabU=;
 b=QSnkODs/glXESpsQPq7M5QzhFkC/wbk80O/ZwinrEeioZIT658K9a8ufzJwHzal0Hewutd
 oJY/54gIncxtHrtoOPRct8PT4+u75ZYCNyCQtkj5NinIyz8YBy7uMWlUSxsjej4WNAdn3Q
 eJ60upIlCFWVEk0mH8E2NA/ojGc0nvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-MHC_BvWZMn-wrLvk_5xWow-1; Wed, 27 May 2020 11:20:58 -0400
X-MC-Unique: MHC_BvWZMn-wrLvk_5xWow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 256551005512;
 Wed, 27 May 2020 15:20:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E3E85C1B0;
 Wed, 27 May 2020 15:20:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <8ac18259-ad47-5617-fa01-fba88349b82d@yandex-team.ru>
References: <8ac18259-ad47-5617-fa01-fba88349b82d@yandex-team.ru>
 <195849.1590075556@warthog.procyon.org.uk>
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Subject: Re: [PATCH] vfs, afs, ext4: Make the inode hash table RCU searchable
MIME-Version: 1.0
Content-ID: <3735167.1590592854.1@warthog.procyon.org.uk>
Date: Wed, 27 May 2020 16:20:54 +0100
Message-ID: <3735168.1590592854@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_082105_939686_B0245368 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
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
Cc: Theodore Ts'o <tytso@mit.edu>, dhowells@redhat.com,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Konstantin Khlebnikov <khlebnikov@yandex-team.ru> wrote:

> > Is this something that would be of interest to Ext4?
> 
> For now, I've plugged this issue with try-lock in ext4 lazy time update.
> This solution is much better.

Would I be able to turn that into some sort of review tag?

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
