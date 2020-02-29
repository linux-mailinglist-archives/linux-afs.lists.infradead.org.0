Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 525DA174638
	for <lists+linux-afs@lfdr.de>; Sat, 29 Feb 2020 11:35:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxhzNRZYWuM6ucIVVSuYJF7DeOBdut+V4Q7Povdp8rA=; b=jWpMsWlL38lXgi
	uIOgX0USC+8XZgK9gyUq1OaCydZQNvnCYumpu8Bkk9Rf3D8IItjmcegzaa6Ku7NfuHFL2At5G0geD
	J3jm4lfJ5cZe+StmKLOxsjatEMabK1SxL3zHHXBubKOKNB+gefevuAtQK7VsNq3hcq7aEVgTjsv/A
	qm46RHDqykHEf00/QROCAfA1z56RQAU5YdGmpNEWE/ohX5grzcUXlxDeiifMVXHI6kG3k3iiwY98s
	igVx0bGYuwIJQpFKlckEZjIt9y0TTql+DrQeVPxzIAH9hoEw07ddk2HlCkz96bTi9vU1JgmDqiAIF
	iHyqwUw9UnDFuct7aX5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7zSI-0004Ur-DW; Sat, 29 Feb 2020 10:34:46 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7zSF-0004UO-6W
 for linux-afs@lists.infradead.org; Sat, 29 Feb 2020 10:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582972479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=haxCWgaHr8ligHFD3qxcn1VzFS68SBjrYPOZGDOkCrM=;
 b=SSbI6aWQviKTdXLnQDQCc8AYp5MJl3/ytslbbLMNKhlZgUerBjnvpqiSKkmBKn9VhCCk9e
 ro8+x3IHfh/2a005K8CUqEIz2XcOQ8UEVxdv2WuJvgee+Un/QV+lMq/yzkQWVIZQn+TJI4
 qDYmxNkaAtV+5ONCtIJXCbBAcJzdKZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-j9qO58jNOUy-oCFfWGc8-A-1; Sat, 29 Feb 2020 05:34:37 -0500
X-MC-Unique: j9qO58jNOUy-oCFfWGc8-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F11931007269;
 Sat, 29 Feb 2020 10:34:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-182.rdu2.redhat.com
 [10.10.120.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1187190780;
 Sat, 29 Feb 2020 10:34:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200229092155.23965-1-olsonse@umich.edu>
References: <20200229092155.23965-1-olsonse@umich.edu>
To: "Spencer E. Olson" <olsonse@umich.edu>
Subject: Re: [PATCH] Add debian build package
MIME-Version: 1.0
Content-ID: <266333.1582972471.1@warthog.procyon.org.uk>
Date: Sat, 29 Feb 2020 10:34:31 +0000
Message-ID: <266334.1582972471@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_023443_319685_D1C3D9A5 
X-CRM114-Status: UNSURE (   9.51  )
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Spencer E. Olson <olsonse@umich.edu> wrote:

> Signed-off-by: Spencer E. Olson <olsonse@umich.edu>
> ---
> 
> This patch adds debian packaging to kafs-client.  This patch also includes an
> auto-changelog generator that creates the changelog required in the proper
> format for debian packages.  This generator takes the changelog content directly
> from the git log (as such, it would be challenging to properly build this debian
> package without the git repository present).

The description needs to go before the Signed-off-by line and the "---"
otherwise the patch import tools will discard it along with the file change
list.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
