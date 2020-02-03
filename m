Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C67BE151100
	for <lists+linux-afs@lfdr.de>; Mon,  3 Feb 2020 21:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIdocd2LIANJf5/LwHm02y6v0W305Jwu+N47eHIQ5UM=; b=QKfnJ+fqfW/DHw
	TDKl3CpIAKopn5zV86i5nXAh6Bc9JfRFAUJzBEbVlGsrXJrjIgf+HyB0PAU6IVliqEcnpftY3jb4R
	pK1fDXp2bv8ghY9eVIDRWT5pYooSGPvYVb8Ia8uqEXF4M1WXEqxt3jXJi28R08hDKeDRXh90Brsl+
	0f9ykVNOYAZszBkwOZ+ZJ+bWgINCO2F58q2pAJz3Y7OQeKwjxWtr9Elq4tSrA+SR/dNeqVHvbG5LY
	b4VWk+kW68O0BLBF5YxRlgDke6dFTkWEebCQlK97XDId8PTUeoIcqtDtqiU6F6j1PmehSrnQxT+Xn
	GF0ga2vrJF3TXQiW0hAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyiKH-00015T-PI; Mon, 03 Feb 2020 20:28:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyiKF-00014i-6u
 for linux-afs@lists.infradead.org; Mon, 03 Feb 2020 20:28:08 +0000
Received: from cakuba.hsd1.ca.comcast.net (unknown [199.201.64.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9AE22087E;
 Mon,  3 Feb 2020 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580761685;
 bh=3er9Mbo1MF0RwB7FU4DQbVlZanm0eWeQ0U0klGwIWRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ViVA2f8T5fE2GoFExizvlmM/BqtEfVu0VCloXYg35GL8rNGObeRbFtWpkOlcn6lKt
 JZZUP8hXnkYQemqkkXQQ/kW3Fkh+XeNEOviy8zCMSq8IvN+07/x6b/UUYeCDQj5ZCO
 9knCSt+PBhZ3keibcg+3XJ9YB6jv/E6GX6qA1YI4=
Date: Mon, 3 Feb 2020 12:28:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net 0/4] rxrpc: Fixes ver #2
Message-ID: <20200203122804.2926cd6f@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <1004693.1580758734@warthog.procyon.org.uk>
References: <20200203103914.4b038cb7@cakuba.hsd1.ca.comcast.net>
 <158072584492.743488.4616022353630142921.stgit@warthog.procyon.org.uk>
 <1004693.1580758734@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_122807_274716_0A44E847 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, 03 Feb 2020 19:38:54 +0000, David Howells wrote:
> Jakub Kicinski <kuba@kernel.org> wrote:
> > Should I queue these for stable? There are some fixes to fixes here, 
> > so AFAIK we need:
> > 
> > 5273a191dca65a675dc0bcf3909e59c6933e2831   4.9+
> > 04d36d748fac349b068ef621611f454010054c58   4.19+
> > f71dbf2fb28489a79bde0dca1c8adfb9cdb20a6b   4.9+
> > fac20b9e738523fc884ee3ea5be360a321cd8bad   4.19+  
> 
> Yes, please.  DaveM asked me not to put stable tags in my net patches, IIRC,
> as his scripts do that automagically.

Yup, I'll queue these up.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
