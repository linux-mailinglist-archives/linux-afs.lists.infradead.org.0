Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A11E9860
	for <lists+linux-afs@lfdr.de>; Sun, 31 May 2020 17:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypxluef8qBfihhFU46oxop0b/UnFmtMX6ow7a82nqFY=; b=Q82Ck9iZdc7QmM
	XyKwbUdnr0Ma/qR+bfyHQtr++WvkDl2H7xDXh9dzRCRzA6BzyCz2hgfc2gK7yhEdKVwrjm0SXjiCp
	GVAI2rgjbQScxjgClEkGS/Y3xczksvkJwoL9E2QiBiSsqarswnfPcCnvinBnmxjgbBSNyz3otunhe
	2VAQm8xVEjn9AHnEOdo8rq7KSS3KIIQyxIGofXz5lnIwZNB91oLZTfBez86aPOG4UXFisyrHlh3SE
	l5h5dlsicN/5+NMiqEhDLhr2CxEJ1RFASXy2NSrQeT+fOAtkG+6Lu6GDpyUbmlJpoanDEFBcZXrhk
	vK/SvtdBLO6//XVNTN0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfPaN-0002H0-Nv; Sun, 31 May 2020 15:09:15 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfPaK-0002G6-FK
 for linux-afs@lists.infradead.org; Sun, 31 May 2020 15:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590937751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yDUA+JUdTjFPwNW7cVcL/jAUJqXfAJ27+Lah22MRRXo=;
 b=WPeZmC8nC9xsv8EOqxJPzixC55QKQDXq03vAgwYxNs8Q07QULIn9RW9X3FLy43LA9VHSbC
 AxH6LiqOxokbESOTAfaI84LoEYzS/V9mzyOoToHB6DCtWaZOOufu/x10t/kWkqfET4qwb4
 ufmXErZJJWN1caS32IC3bCyhhzueuII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-k7yVd-fmPneHxU-Pj9uOIA-1; Sun, 31 May 2020 11:09:07 -0400
X-MC-Unique: k7yVd-fmPneHxU-Pj9uOIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF5A835B40;
 Sun, 31 May 2020 15:09:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFD5F60F8D;
 Sun, 31 May 2020 15:09:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAFAFadCErKJ0mjkyKrVCCDAV7oShdA22O-TD6VEmFM0Mwfqahg@mail.gmail.com>
References: <CAFAFadCErKJ0mjkyKrVCCDAV7oShdA22O-TD6VEmFM0Mwfqahg@mail.gmail.com>
To: gaurav singh <gaurav1086@gmail.com>
Subject: Re: [PATCH] conn_client: Add check for rxpc channel
MIME-Version: 1.0
Content-ID: <1159569.1590937744.1@warthog.procyon.org.uk>
Date: Sun, 31 May 2020 16:09:04 +0100
Message-ID: <1159570.1590937744@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_080912_591018_70C749F0 
X-CRM114-Status: UNSURE (   8.89  )
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: trivial@kernel.org, netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi,

Note that "conn_client:" isn't a suitable tag for the subject.  You should use
"rxrpc:" instead.

How did you find this by the way?  You shouldn't get a NULL pointer there.
Either the call is waiting for a channel to be assigned (in which case the
condition on:

	if (!list_empty(&call->chan_wait_link)) {

will be true) or it should have been assigned a channel, in which case chan
will not be NULL.

Note that the function takes the lock under which this is managed
(conn->channel_lock) across this, so it shouldn't change.

Even __rxrpc_disconnect_call(), which is called to implicitly close out a call
that gets superseded on its channel, doesn't stop
rxrpc_disconnect_client_call() from finding the channel.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
