Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E301EB0BD
	for <lists+linux-afs@lfdr.de>; Mon,  1 Jun 2020 23:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2kBw//riXZeojIxOZwB23yVQPU0MaVb1/AJUuWbmyg=; b=WQ1w8Va75aMucL
	uHkxeuHKFpAggZW9hg1ozdhX5/i5Z61oZ6xP6YdJsLo1M143OPUrNViTVrrVl6szWr7jV9D1Sdsfj
	m10dZZWRzIHYVFCsA5J2oA3b17lSAaQptr01NVxZNtkA4MD1SqefcmusX9RJ+vasEtljQyFxfB3G+
	k9QT1cfTMM7f56pI5CKSBNrG0yPxVflveTSklKPNLUrEL34w0ZrTc6yiHk0UxwFw0qc2DeqdorahB
	2nvu/Gn+RaPfJPvVl6OCviYhYFzaLJY3miIkksGgSzi3I5A54Urg+2Sb7SitHAYP7e4yMuTt0AudH
	cbYy56RTVqncUTtH19Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfrig-00053k-RZ; Mon, 01 Jun 2020 21:11:42 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfrid-000537-Ty
 for linux-afs@lists.infradead.org; Mon, 01 Jun 2020 21:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591045898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbRzhG2LzWApjj8c+cePRghjnkrYYRcNMFSCvsXUZ8I=;
 b=AralpmOjEWIyTB9navhbDg72jp4sNdjC6SWkDhw0Hr+ftL0cNIpz35lIEwWTrv2gZTzykQ
 ehojKqW8rNQS7v8Hvb/8ycTv5cnM1pcuUL+5FQA9BL73xzj+s4DvjEpA2olwlWbOSJQcCy
 CB5yxm4k7Ksdribn6y4Gtgxx6icPkKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-w1E6bmOQPuerdajZZdA_Yw-1; Mon, 01 Jun 2020 17:11:31 -0400
X-MC-Unique: w1E6bmOQPuerdajZZdA_Yw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE1D11883603;
 Mon,  1 Jun 2020 21:11:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C9D6D01EB;
 Mon,  1 Jun 2020 21:11:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3cc663a5-088d-4d26-34cd-c96e362c1eb2@web.de>
References: <3cc663a5-088d-4d26-34cd-c96e362c1eb2@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: afs: Improve exception handling in afs_net_init()
MIME-Version: 1.0
Content-ID: <1376358.1591045888.1@warthog.procyon.org.uk>
Date: Mon, 01 Jun 2020 22:11:28 +0100
Message-ID: <1376359.1591045888@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_141140_043405_9341C1F5 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Markus Elfring <Markus.Elfring@web.de> wrote:

> I have accidentally taken another look at the implementation of
> the function "afs_net_init".
> I noticed that the statement "net->live = false;" was specified three times
> for exception handling at the end.
> https://elixir.bootlin.com/linux/v5.7/source/fs/afs/main.c#L127
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/afs/main.c?id=9bf9511e3d9f328c03f6f79bfb741c3d18f2f2c0#n127
> 
> Can it be that two of these assignments are redundant then?

Kind of yes, but no.

I want to set "net->live = false" as soon as an error occurs because there are
various async mechanisms that check for it and abort their operation if they
see it, but there are multiple error labels.

So it needs to be cleared before afs_cell_purge() or afs_purge_servers() is
called and it used to be required for something else as well, but that's now
gone.

In the afs_net_init() function, it now probably only needs to be cleared after
"error_open_socket:".  I'm a bit leary of removing the clearances in case I
add a new dependency on it later.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
