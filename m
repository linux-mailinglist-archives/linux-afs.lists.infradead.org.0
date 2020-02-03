Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A96150420
	for <lists+linux-afs@lfdr.de>; Mon,  3 Feb 2020 11:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uF68nwcvYioa9xTHkLgYgDbCiZ9NSTb0D+r8Cqf/SyA=; b=AASvRnJp3FScuP
	Yw/X19Bbtb45v7R0doIUsDOiC1V3ASHtDBoQbhfQ/z3vcNhraL63jJVZpgG2b5h0UOvxxf5XE0XHS
	wgdiv/9GqE8M7TaIsfYI12AYotFVBu5xoxMHHxhk4QHePV1z5UzTZoaoRo5yNLedoNA7H5ifDUN8a
	Vf7/XVB+MBQLfYf3gxQKyeqjwOVZv53STSiQlvzZhdPMnN8nE0nL8+9JAe7dXEza/UDKoHxeQ65Bi
	enVwkenMGnOCKvn34uudf8cdKy7RfS1uZXvIP8aiZK//us+2dE75pdt0DjUi/+mu/EDZ6YeNqYlQ3
	QnkVKfiv3zo2r/9pjepg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyYtY-00030d-VO; Mon, 03 Feb 2020 10:23:56 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyYtW-0002yE-H8
 for linux-afs@lists.infradead.org; Mon, 03 Feb 2020 10:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580725432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ir31YPKw00IaR4oAq3edSrrdUHl7ICLQw2SC3HVAAC4=;
 b=NoJNiM4Lcod32IrYupB81Bf2pXmfDTwC7+N61c2f7BT9wsUhLZMsHA1gxZriUEDV8zaJB5
 Tsa0gbagZaHjQ9uruhKkOjc5vpG/aQ+S/lox9jhsLrqEGi34IE+2q5rM8N/wjtcFdW2yH7
 UEFHzD07rbxp9nhGP8iAtZ1a1SkZic8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-nK8sREX3OCKJMwcjJ7ImLg-1; Mon, 03 Feb 2020 05:23:47 -0500
X-MC-Unique: nK8sREX3OCKJMwcjJ7ImLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780EB18A6EC2;
 Mon,  3 Feb 2020 10:23:46 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com
 [10.10.120.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 702A91FD3B;
 Mon,  3 Feb 2020 10:23:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200202122735.157d8b44@cakuba.hsd1.ca.comcast.net>
References: <20200202122735.157d8b44@cakuba.hsd1.ca.comcast.net>
 <158047735578.133127.17728061182258449164.stgit@warthog.procyon.org.uk>
 <158047737679.133127.13567286503234295.stgit@warthog.procyon.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net 3/4] rxrpc: Fix missing active use pinning of
 rxrpc_local object
MIME-Version: 1.0
Content-ID: <734243.1580725424.1@warthog.procyon.org.uk>
Date: Mon, 03 Feb 2020 10:23:44 +0000
Message-ID: <734244.1580725424@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_022354_660177_6C7723A8 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Jakub Kicinski <kuba@kernel.org> wrote:

> > +	BUG_ON(!conn->params.local);
> > +	BUG_ON(!conn->params.local->socket);
> 
> Is this really, really not possible to convert those into a WARN_ON()
> and return?

I can take those out - I actually put them in to help figure out which pointer
had become NULL - but turning them into a WARN_ON() and return doesn't
actually help that much since, without this patch, there was nothing to stop
the relevant pointer getting cleared between this point and the next access,
so there's a chance you'd end up with the same oops anyway.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
