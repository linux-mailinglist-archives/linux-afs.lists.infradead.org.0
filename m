Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC571AF317
	for <lists+linux-afs@lfdr.de>; Sat, 18 Apr 2020 20:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNlD4UgTfzrk0JKQ1HndkU3yDawbDzvLEFlqPhY4W3A=; b=t2NBUlMEWlzozf
	jkp8UuNvCMG6wJV07lPN1ajKoGbmlpZuinf3tFYy3wd7iNMJXvzql3DJI0DzaWVzQPllCaSX4vhVc
	d4gJ5uFEWxKgH5X6DHb11MsRUw1TRbT9Kpoi+G9hNHigNlnbw218f2eEfTs6PcBJQ6qlbhjbgTTI7
	afoIhFRg/7TeyFYQ2Iv0bbImX37gKIN9KqW2cZ9+JvGkVEymhhXBSCrRmEG95pN9cg9aMWR7BTYBt
	WOOXfaS2iGabEmJXb3/HYL2XaKyo7TFrMIMKG5CsN2ejSRPjkV09BasyVE1RuTDIrxqyFmjXJorAC
	b01U+l3LIk6e1olR1uMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPrvp-0005gl-Vs; Sat, 18 Apr 2020 18:11:09 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPrvn-0005ep-Fh
 for linux-afs@lists.infradead.org; Sat, 18 Apr 2020 18:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587233460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4MjBHhLWma7Wyo6Y0oaah6/D7fXV7EHmjvl18i27sII=;
 b=ioJsq6jDqqUymi/qLQOonq70uqML+lxutR1y/JbA3h/mADpYNYIB7yvsamEMYK7MhObPek
 yHXj4lubS0oBFTvYJPcArylZugqLbDiNKzw2LkD/i7kkHzolXvUwxmR0is31euCFhvWHV0
 0LJfC5B3F2OrzBKEsC0LyokAlV2pkmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-VnSCfK7uOTK_mHQ6IZsLpQ-1; Sat, 18 Apr 2020 14:10:58 -0400
X-MC-Unique: VnSCfK7uOTK_mHQ6IZsLpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BD3D1005510;
 Sat, 18 Apr 2020 18:10:57 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-112-5.ams2.redhat.com
 [10.36.112.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BEF660C05;
 Sat, 18 Apr 2020 18:10:54 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Steve French <smfrench@gmail.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
References: <3865908.1586874010@warthog.procyon.org.uk>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
Date: Sat, 18 Apr 2020 20:10:53 +0200
In-Reply-To: <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 (Steve French's message of "Fri, 17 Apr 2020 18:23:53 -0500")
Message-ID: <87a738aclu.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_111107_598646_AA4A91B4 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

* Steve French:

>>> The question remains what the expected impact of TTL expiry is.  Will
>>> the kernel just perform a new DNS query if it needs one?
>
> For SMB3/CIFS mounts, Paulo added support last year for automatic
> reconnect if the IP address of the server changes.  It also is helpful
> when DFS (global name space) addresses change.

Do you have reference to the source code implementation?  Thanks.

Florian


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
