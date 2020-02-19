Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C3164975
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 17:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tk011ZJe/FA+tv9vl95rblhx/19Mix70f4kkUrEiZOk=; b=OpCnEYO+D5MDTD
	+QHgiuS2hzQseqE+XVo9ZUS5ynW8GzKzYTxyhoYOr52lLqj6ozImU0t+cWKmdEZNhEPxCUu3XYEzV
	duqVZdGL/yAigFfQHVlIK0jMbHHwd9ksaLJI9ZSd360TJr4BPvhZxK0i/JfeZIgS/+8/vAbD4WVOr
	ig9rBsxYusf5n0RgxYOswQuiLqvs36swSe0i4nIyE+qK97EB5CNd2QCXV8m4tTLXM5f9wHVSC5m1E
	ivCxP63MjzN3f9nZBDrdsBZ9T1mR34DlOLpER6uPOe038Deado4tTH1Dkp+y4lmjs6VJ1RIwVsvT+
	RXRt+58K2g0Zdtzs9cqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Rrb-00027P-Kt; Wed, 19 Feb 2020 16:06:15 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4RrZ-00026y-13
 for linux-afs@lists.infradead.org; Wed, 19 Feb 2020 16:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582128369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtuXG7J2SEV5B4M91UuGClBvYclbGQX7WjIc1otv+DE=;
 b=XhSYXUwUbBKhTs+/apyQ3DB/E06y0LaJsyz19YW1uPzq0pX+2Oi4q3TSOFb4MI1ZIhqlzZ
 lRdt//erGgc4n1ri0kcYGP8iy9wlOyKw5UMF2gtRiVA/vNtinRLh+J+jx/aPGfI2f4b7KU
 cdJB23KqYwVIIScqtL4QvLUVmOgwCkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-_V23__I6OwmIvxWQtNUZUg-1; Wed, 19 Feb 2020 11:05:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 303FA189F789;
 Wed, 19 Feb 2020 16:05:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-122-163.rdu2.redhat.com
 [10.10.122.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82C40811F8;
 Wed, 19 Feb 2020 16:05:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200219113929.6f55aa3e@schienar>
References: <20200219113929.6f55aa3e@schienar>
To: Julian Wollrath <jwollrath@web.de>
Subject: Re: NULL pointer dereference v5.6.0-rc2
MIME-Version: 1.0
Content-ID: <231888.1582128329.1@warthog.procyon.org.uk>
Date: Wed, 19 Feb 2020 16:05:29 +0000
Message-ID: <231889.1582128329@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: _V23__I6OwmIvxWQtNUZUg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_080613_148717_AFFDEFA1 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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

Julian Wollrath <jwollrath@web.de> wrote:

> RIP: 0010:afs_update_server_record+0x45/0x120 [kafs]

It would be useful to know the line on which this occurred.  Would it be
possible for you to load the kafs module into gdb and do:

	i li *afs_update_server_record+0x45

Is this a packaged distribution kernel?  If so, you might need to install the
debuginfo package for it first.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
