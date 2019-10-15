Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 71777D7A69
	for <lists+linux-afs@lfdr.de>; Tue, 15 Oct 2019 17:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGmWo+H0kNs+B+a8rU53Gaky1R8OmEKvAukAzllVQxY=; b=LjRFV4TIJrCE9b
	msa5kSTuoBaXf0F8jX+7DMNXvA77BIUGwrclCtlHWD+AYFYOjmtVdKjNfVBQxTIogiwTD/A/Ci6zS
	VsD0vKHVswLNbbbfhKsfZMzOMG41bK1OY1h5mRHb+PWTjXKrWrSd7KJ0uWFTHkwWAP7NsufrjIdwW
	5khDYtzEoV8oZzqz0YAyukEsYkLclJlYwl+LCQhB3qFUzHFKJlcdZoiXnwhmv3XiReDV3EizMtq/8
	nm0TY1yQRy+Yt975WwQgzoW5AgS4gI2r7xSYJ7xOGQ8tnpkFvK3Zqlh5bPZ6a88ccSnOJWo0nQ505
	ewrQ/NSU/OfSkYmujLCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKP5N-00024e-FV; Tue, 15 Oct 2019 15:50:09 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKP5K-0001WT-Kw
 for linux-afs@lists.infradead.org; Tue, 15 Oct 2019 15:50:08 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7034018CB904;
 Tue, 15 Oct 2019 15:50:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-84.rdu2.redhat.com
 [10.10.121.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 495BD5D6A9;
 Tue, 15 Oct 2019 15:50:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <bf358fc5-c0e1-070f-b073-1675e3d13fd8@gmail.com>
References: <bf358fc5-c0e1-070f-b073-1675e3d13fd8@gmail.com>
 <157071915431.29197.5055122258964729288.stgit@warthog.procyon.org.uk>
To: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH net] rxrpc: Fix possible NULL pointer access in ICMP
 handling
MIME-Version: 1.0
Content-ID: <5907.1571154603.1@warthog.procyon.org.uk>
Date: Tue, 15 Oct 2019 16:50:03 +0100
Message-ID: <5908.1571154603@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 15 Oct 2019 15:50:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_085006_748836_C110030B 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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

Eric Dumazet <eric.dumazet@gmail.com> wrote:

>  void rxrpc_error_report(struct sock *sk)
>  {
> +       struct rxrpc_local *local = rcu_dereference_sk_user_data(sk);

Acked-by: David Howells <dhowells@redhat.com>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
