Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E07B214A330
	for <lists+linux-afs@lfdr.de>; Mon, 27 Jan 2020 12:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JAU33k1u51KcafHwQv6SPRVZ4Zao/RSbdpnhBqZGWk=; b=nbovauSC9bdPQT
	JECYTxmScqbSuf6ix1kYoTOwI31ngCCZPJkNeb7P6qqNIbEmGzhKqW8H3W8DUbof3qG6YVUPyGzwK
	IPXbrYrVj+SvE69eCIs7sJV92zhuYoRybBNkNI2yneXLIhgkOfef3UkF4WGFOcMJkWmELKXCqmDzS
	gkDNDLYYJDl+puRq0CKI5bBpnW5muE2aOEVQQBkgUjNmzCOKyts1FvlNMvJK51qK/QPO2BC6XxOJX
	TQie0URRvm/f18+WGJ4DoAfZZOKsMnX1wMTz0S8CAsXO6fxjZn1gs2Jbh4YdNi6Wxu9UGXEa8NfoM
	9ozdLe4yBHUYXsOJt/CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw2oZ-00043h-7R; Mon, 27 Jan 2020 11:44:23 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw2oV-00042y-Fu
 for linux-afs@lists.infradead.org; Mon, 27 Jan 2020 11:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580125456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUtieaM6GD2PpqnJW9FIIx3PImpT0oW9u9OtwSX9XIA=;
 b=QaXmIyLjhuil/6diU+4737S1IPW/lGtx8LDMY5QUVeUhByDLuX4vasZKOhQIbt8IpxqFTF
 ur94XbRDEOMHW5kkTYBLsLJjCjfO0f+bCsmV68Rw/zrf6nKVXpeXWkUIG0jigQk3aL/1i+
 C00j/yA4Qm5yf0rFsj2qf2U9OteI8I0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-foaiDgyzN-uZrsXuUKjA4Q-1; Mon, 27 Jan 2020 06:44:12 -0500
X-MC-Unique: foaiDgyzN-uZrsXuUKjA4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9756B800EBB;
 Mon, 27 Jan 2020 11:44:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-99.rdu2.redhat.com
 [10.10.120.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F919451F;
 Mon, 27 Jan 2020 11:44:10 +0000 (UTC)
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
Content-ID: <1452048.1580125449.1@warthog.procyon.org.uk>
Date: Mon, 27 Jan 2020 11:44:09 +0000
Message-ID: <1452049.1580125449@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_034419_607049_A27D81FD 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.120 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

Sorry, I forgot to cc you on the patch.  It's now upstream:

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a45ea48e2bcd92c1f678b794f488ca0bda9835b8

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
