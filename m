Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE51D993D
	for <lists+linux-afs@lfdr.de>; Tue, 19 May 2020 16:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvAkyNGplqWTw+zsEvhRX31HKCXW5vSD11Z0sYi2PBg=; b=EG6MpD3mwqV+yH
	+c2c4IBf8gOYl1BpUw5ft9Nga8H4wyQQKWUsB/zCHqfvwmi7H9U51OTKp1lpqXx1m9nA2+gtgFieH
	oea7FlSLYFGT/h3LUQ4orthLRfBi6jykhKMjbUf/XR3wbRA38/kvJai0U8Yvknb3Tlh50x8vYpTTn
	yo1xmGaYpM+PVPCcCKs7vQs1/GTKs4Xb2p9ITq8adxqQGqfKmfHDvqEfQG3oCMpUX+2Z6i7+mobWa
	XrBbE4FXVIIIZZwtJCy6Or5O+Bjdb0y8rplKdpFbtlczqjg1FURNyfZNQVGTtvoYCQUMcl0iM2tnN
	0IBuMmUJeBTmlJirQEkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb34O-0002FB-6u; Tue, 19 May 2020 14:18:12 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb34L-000245-Pp
 for linux-afs@lists.infradead.org; Tue, 19 May 2020 14:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589897883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FNB/aoMyF4TGVvRymSR3/vRA73Z6PL62rY+8MIyJp3Y=;
 b=AkHpk8kFipO1xRAjGjwquE/5U9qij6Jtrn89mU9Rp81ira1mkgDypH2uc209Qgc/syux1P
 D7hzypCj7MmfBkY0OzTE4ndLnu3OEkTlMII8PpIPqf34BGGOmKeLmXTSYZ8UzB/NicHxNh
 yfvWoQQe1HYS8JJTwH8yAEDGBoytWIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-159IX1CAOkG4oJ0ZYsciJw-1; Tue, 19 May 2020 10:18:00 -0400
X-MC-Unique: 159IX1CAOkG4oJ0ZYsciJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D10E939342;
 Tue, 19 May 2020 14:17:58 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-18.ams2.redhat.com
 [10.36.113.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3C85707DF;
 Tue, 19 May 2020 14:17:56 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] dns: Apply a default TTL to records obtained from
 getaddrinfo()
References: <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
Date: Tue, 19 May 2020 16:17:55 +0200
In-Reply-To: <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
 (David Howells's message of "Mon, 18 May 2020 15:22:45 +0100")
Message-ID: <87blmkgga4.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_071809_918282_CC9D68BE 
X-CRM114-Status: GOOD (  11.64  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

* David Howells:

> Fix this to apply a default TTL of 10mins in the event that we haven't got
> one.  This can be configured in /etc/keyutils/key.dns_resolver.conf by
> adding the line:
>
> 	default_ttl: <number-of-seconds>
>
> to the file.

If the name resolution is not needed continuously, but only for the
connection attempt, I suggest to use a much shorter TTL, like five
seconds or so.

I'm worried that if the implied TTL is too long, some system
administrators will have to figure out how to invalidate the DNS cache.

Thanks,
Florian


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
