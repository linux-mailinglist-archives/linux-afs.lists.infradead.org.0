Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8741ECF9E
	for <lists+linux-afs@lfdr.de>; Wed,  3 Jun 2020 14:18:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2W4+zOvEy6jp67noqIfCadLy+D0if5xP99yRAcxOiF8=; b=iXp4a4U3yVFa8k
	uBzs6bNA7DfxdF85uRw6MOsFX1nDtnRLeQy9R79UbSCDXmEhLDVKVlTLwZMNmDEXSqeGQVkC7l9ke
	8mdaF3cnQjaEZJxUxz7Iy+d6s7Ae6wa5jBxq46BefG7pNgPAFeVKZ4/KEcKyecPIv1yA+0Lg13kU/
	15Zng2uJFIQedGZMbFd/H3p8eKYXP0mhLKAcDxffPOBz+yykXWc9apcrOEKROFKwYE67eQtuK/uL1
	6l8urxO32IwBhR5hjaUpoZ6QcxBn6llkZJXLi4T7RkpDRJCCRtjM+3Lo7uz5b4yIpvz2KBn+I4u48
	cFwEpJu+qH2l04YzuVaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgSLn-00042g-DN; Wed, 03 Jun 2020 12:18:31 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgSLk-000427-A6
 for linux-afs@lists.infradead.org; Wed, 03 Jun 2020 12:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591186705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AGxQ7torkke0N1Nbf0lB0hWZbd+CHURCbE2Smeh7C0c=;
 b=ildU6mRHL5obD5oPglNjXRjz+I3ooFYu/XCazEFoYxfOuD5e+YTc5Zqn2siVjiXVTyEfs8
 E5NcDNRNA+AGQHf1l9MSopPHr3xVTXTpvFxvOI/2CFGbVJkRa4ynPYbWOtBRRLuq2GzGDl
 M+9zJzP0N4dpxLjA0aALQarlhBzhSlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-nDF5gnVbMdKO1mnAy5NBzA-1; Wed, 03 Jun 2020 08:18:22 -0400
X-MC-Unique: nDF5gnVbMdKO1mnAy5NBzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E692780B709;
 Wed,  3 Jun 2020 12:18:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BF265C240;
 Wed,  3 Jun 2020 12:18:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200603095927.GA1842737@mwanda>
References: <20200603095927.GA1842737@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] afs: Build an abstraction around an "operation"
 concept
MIME-Version: 1.0
Content-ID: <1651697.1591186700.1@warthog.procyon.org.uk>
Date: Wed, 03 Jun 2020 13:18:20 +0100
Message-ID: <1651698.1591186700@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_051828_425312_95AD92D6 
X-CRM114-Status: UNSURE (   5.56  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

>   1322                  d_drop(op->dentry);

It should just be "dentry".  I've rolled that in, thanks.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
