Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4BE1AF8F0
	for <lists+linux-afs@lfdr.de>; Sun, 19 Apr 2020 11:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6egVOUE7+TWOUH1DUi+DCFkbFuq/alguGFVsqW2SrQ=; b=B9McgDL1I/oztj
	jW8Mn/nc6j+Q9X7C9khCrTGKDRK5+HAPg/rF+cwflHDp1v+LywtkalXEZ5ew9XAPTZsSoBR16bc3w
	lwyLhyHQ7G8WzUrs3pzVzscyY1IC1+f/wfyaarlMECwmQ+DG6uebkmAXlFcxgSmY0FI1IFu8r+lnK
	49abWX3UKzuIhDr2iTVXxCbWFZ3QEU92+UmJG/auwCkDY56vlzBP2RsIRwJkyCvueunytZKX1qNXk
	n45gJ8Rx5x4OBENvJ1TMtTupf3kErl9HZ+jnw7AS3A4hztJnFM8Qi+cRWMeCDXdAkZtvRwpGz/jp+
	q05DN4xM9HwgDBr7tBWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ6GI-0001B1-4O; Sun, 19 Apr 2020 09:29:14 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ5So-0004pv-A0
 for linux-afs@lists.infradead.org; Sun, 19 Apr 2020 08:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587285480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gtE/RAI8Ll8mxlz3GjJNNnyp/GGzHjOzYL41aghGZqo=;
 b=KpAID+zlhBw8BsNROAh+bs9SIC01CM/8ER1TUrEL+ZeP4VyaJE5olj+zBGO7zESVinowXu
 vZinpEcgLEvBvWImcSYtA3+kIXa+VbSTLf5opn5+jeRG72bO7AmvJMfZbs3IvzgobFgesg
 +ZONGV+j+1K6DsRna1BYij9tgFJLr3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-LHnNx2NRM0CC-We1R3FlPQ-1; Sun, 19 Apr 2020 04:37:56 -0400
X-MC-Unique: LHnNx2NRM0CC-We1R3FlPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D694318C35A0;
 Sun, 19 Apr 2020 08:37:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AB8FA1056;
 Sun, 19 Apr 2020 08:37:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
References: <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
To: Steve French <smfrench@gmail.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
MIME-Version: 1.0
Content-ID: <927452.1587285472.1@warthog.procyon.org.uk>
Date: Sun, 19 Apr 2020 09:37:52 +0100
Message-ID: <927453.1587285472@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_013806_421438_6B3ECDD6 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Sun, 19 Apr 2020 02:29:12 -0700
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 keyrings@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Steve French <smfrench@gmail.com> wrote:

> For SMB3/CIFS mounts, Paulo added support last year for automatic
> reconnect if the IP address of the server changes.  It also is helpful
> when DFS (global name space) addresses change.

What happens if the IP address the superblock is going to changes, then
another mount is made back to the original IP address?  Does the second mount
just pick the original superblock?

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
