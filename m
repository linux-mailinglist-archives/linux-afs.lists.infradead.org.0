Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B6145231
	for <lists+linux-afs@lfdr.de>; Wed, 22 Jan 2020 11:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaLhbp5K6RtLf1hT8TnaYKrLXwJ6yDUth3XYQi9Cj5A=; b=mt9xOubBW5K98s
	YaOLhgnkw2ksgvzmXeH4CwkUNck9iy9Fh2HNyBh5csHwaGmgYDm/2vMsXYwc4feO9v9X9dwKj9mUu
	+9nhOIxcLkUS3D3tZD86Ewm+OQvv/PbwHqoWimBFhOA9ShVxYwldFoo5vnBLXJ1SwmAFKf9kNLQZm
	KctL+eatFK7fnPblRtW6JfYTn3HgSJ0iIPaUEqgcZkDcAZOY0a4QZzrzP9Jd9eUahy3nYFiwXjgqI
	55T831dj5h1EVWA2xSw4cpRvNml2PjIbsws/VWf3Zm+B9/LFGa3P7uMZV6c+p0ywh7nJj8e3Ste2l
	4JGjnA77tmli1vTEzitw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuCyT-00085T-Pg; Wed, 22 Jan 2020 10:11:01 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuCyQ-00084d-W3
 for linux-afs@lists.infradead.org; Wed, 22 Jan 2020 10:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579687855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G3sIdSKUAznoVtH5H8r0191KUIId3ChkMxDztaPw080=;
 b=T9UKeAl28R8jjxbRRTusYrMsAxlLU2nL4pkvAc1XrZRC/Zra2pmCGwS8UwaIPxEu6B1d6c
 Aid2LU59ci/5TDBpS9/F0TJO60KZMYmtnUkOI5hqLZPBwGr9RSWX2yY92oNL259BQ9P+fW
 bbxaWMxwPK7Q+Uaf6WfACfoe0fYnl7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-hJH0JR9HN8K3BNnAEmjjDQ-1; Wed, 22 Jan 2020 05:10:54 -0500
X-MC-Unique: hJH0JR9HN8K3BNnAEmjjDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B43A9107ACC4;
 Wed, 22 Jan 2020 10:10:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-49.rdu2.redhat.com
 [10.10.120.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 784018121A;
 Wed, 22 Jan 2020 10:10:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200122081340.2bhx5jfezl55b3qb@kili.mountain>
References: <20200122081340.2bhx5jfezl55b3qb@kili.mountain>
 <000000000000da7a79059caf2656@google.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: WARNING in __proc_create (2)
MIME-Version: 1.0
Content-ID: <3397878.1579687850.1@warthog.procyon.org.uk>
Date: Wed, 22 Jan 2020 10:10:50 +0000
Message-ID: <3397879.1579687850@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_021059_106429_F70B3478 
X-CRM114-Status: UNSURE (   6.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, syzkaller-bugs@googlegroups.com,
 linux-afs@lists.infradead.org,
 syzbot <syzbot+b904ba7c947a37b4b291@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We should probably ban '/' characters from the cell name in
> afs_alloc_cell().

And non-printable chars too.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
