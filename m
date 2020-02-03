Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 25525151064
	for <lists+linux-afs@lfdr.de>; Mon,  3 Feb 2020 20:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9A093ngBTgOTO1tCK2wBEGJBDDlzwk1XI9bt2EJHDAw=; b=O6j88V1owT1FLE
	2FoVB+0yquPwK6MENSPuDQ09zYXCVNX7SFr/QEbmybY7w4WY8wbW1nO0sg3eE8jl+/h8iFyV7bXOt
	VIzMAyeIk3KM1GLVAbZE4KsVDHcF1j4DKp8JHrAYr1yZllD/kpmZfDSTYLGmUKRFUUIPm0nOiwIp6
	ldXQ0zno+wfPrc0qY+ssJW7f/LpyAy6iFsZjujPk2MohyYlF2Ugi0jO24P3aZqTrXZUXk5v1qGSnU
	J3Jfawn7g84HvsCt2fvKJ3OY3f8yKmgqbNvC5bwBOgsgNdWkxb8LTZj9R+SZhFk5MnHAqc7TN/LxC
	UOuJn32D2lqzLc9FR/yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyhYo-0007bu-2g; Mon, 03 Feb 2020 19:39:06 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyhYk-0007bH-Om
 for linux-afs@lists.infradead.org; Mon, 03 Feb 2020 19:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580758741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=deBqCvYs3KYzR5/P5FdSKrFW2W30N3hhxjCn43gcuGQ=;
 b=SkttSxBSnQKzbmGanX3EWbap/Cnwc67mrgAMT0MMRVQoLCBbjEkIoFisFANsIiLtq5WdWF
 bZc0+92cbK5C/RBoxAkUgfLAHIWqGZj5bDQ1F3AG7+WbMe5dMxGS11IceeC2yDUVeJzUbh
 1ugNlhPrXvADAKLIvYdHucJ2ooXqltk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-bVef1RD8MZ2RY_h7reHVsQ-1; Mon, 03 Feb 2020 14:38:57 -0500
X-MC-Unique: bVef1RD8MZ2RY_h7reHVsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F38201005502;
 Mon,  3 Feb 2020 19:38:55 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com
 [10.10.120.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0669E19481;
 Mon,  3 Feb 2020 19:38:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200203103914.4b038cb7@cakuba.hsd1.ca.comcast.net>
References: <20200203103914.4b038cb7@cakuba.hsd1.ca.comcast.net>
 <158072584492.743488.4616022353630142921.stgit@warthog.procyon.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net 0/4] rxrpc: Fixes ver #2
MIME-Version: 1.0
Content-ID: <1004692.1580758734.1@warthog.procyon.org.uk>
Date: Mon, 03 Feb 2020 19:38:54 +0000
Message-ID: <1004693.1580758734@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_113902_883218_6668D222 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
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

> I pulled rxrpc-fixes-20200202 since that tag seems to correspond to 
> the patches on the mailing list.

Sorry, yes - I forgot to change that.

> Should I queue these for stable? There are some fixes to fixes here, 
> so AFAIK we need:
> 
> 5273a191dca65a675dc0bcf3909e59c6933e2831   4.9+
> 04d36d748fac349b068ef621611f454010054c58   4.19+
> f71dbf2fb28489a79bde0dca1c8adfb9cdb20a6b   4.9+
> fac20b9e738523fc884ee3ea5be360a321cd8bad   4.19+

Yes, please.  DaveM asked me not to put stable tags in my net patches, IIRC,
as his scripts do that automagically.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
