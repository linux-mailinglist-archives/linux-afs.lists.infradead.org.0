Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF521DC7DC
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 09:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XONaxm2Lh65PnTtNqkDgMOKxR6TqhNfFBeZ5Rhvz0Hk=; b=CjP1rZLQpT4Ei+
	eBpE9l2GrQiLoyEpTJ7FpAJfDxIMnaogCIDYj+nIDNJgz+ySi6r9WzEauGYbsK6+wAg/o3jNVqUMm
	83fsCi4scsYyFsrGsVoFePDDYG6VjN8/awHLaAhsH/y8/tPxzo6K+LUH1KatzrFdIyOJUIi5/t/Cy
	iccUJZOaJSGFK4Lz51Ub8H0s9dqu2gN6xypLIYnB9PTehogGb4ioLochD5ruUAJ0yyFb6W0kU4TMU
	b66uZyiX51tvPH8VLLXqT7XAk31oejJ60mDomgZDhI08cDyNBMex+Z+LrzgyfF2EOIv6vIhn2plBN
	CCpCLosNUrncNd5M0umQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbfpw-00073q-Sw; Thu, 21 May 2020 07:41:52 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbfpu-00072k-BF
 for linux-afs@lists.infradead.org; Thu, 21 May 2020 07:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590046907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oHQ+imPSFVixB/pE0KSN2Fs8U6r2Mmjiu0+HMJzZ/Tw=;
 b=b4JqpIwuO42nYOoiyIe2fP6uQTHrg9hwBpBJMXwnfUc3n7wRPX1qZq7FHnAuYFM6t5ia85
 4GWLnUCO00XUqO0A1XdUe0wDhWm7gda21rF54FjtC+3JD4GOwhD0TKFnUEMXTj6MXH3WUa
 jDluxP1IXfGMxgXaynZVqVWEVejcFhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-iHSdMCy9N26WBxgfRQv9uw-1; Thu, 21 May 2020 03:41:45 -0400
X-MC-Unique: iHSdMCy9N26WBxgfRQv9uw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 855D7835B41;
 Thu, 21 May 2020 07:41:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84E0379584;
 Thu, 21 May 2020 07:41:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
References: <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
To: netdev@vger.kernel.org
Subject: Re: [PATCH net 0/3] rxrpc: Fix retransmission timeout and ACK discard
MIME-Version: 1.0
Content-ID: <70946.1590046902.1@warthog.procyon.org.uk>
Date: Thu, 21 May 2020 08:41:42 +0100
Message-ID: <70947.1590046902@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_004150_466379_455F9FF2 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, Jakub Kicinski <kuba@kernel.org>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

I've posted a new version of this with a fixed description for patch 1.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
