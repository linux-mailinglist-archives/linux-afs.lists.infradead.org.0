Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B26491A688F
	for <lists+linux-afs@lfdr.de>; Mon, 13 Apr 2020 17:13:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:References:In-Reply-To:From:Reply-To:To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVtH9QuZGDM+eNx075RZ87Ugm7seeWSmN7O6aVAW4Yo=; b=Y+jRPlF0X63vYk
	oRzkQUZyQh51+eR+e8bgxaTAJbEdDDHsLEznWw+Abi/iBRN/KQ6vAy8gxWOcqtShTy9sf6uuHs3L0
	4wd/CzouAUpFAXFi1jiAb4TceemItW/6707Ct7yeQD6m1GwVgsYv7558glk5m5K5Y77nX/rdVxp+3
	NtiFZYoXcwGtJXCGwH660rhBh57XWDg3OqdpR7vofp7myHRx/tZsEPtD8p1aX369b2u161Ffvq8B5
	7URfq73MRKXmzZqbpC2yGwhUnojR3h5Jk4E2FUFpbSQIsVfEptwhi1y3Fan9REcAeM2n2P0GNTu4G
	YI/HrivOFEBrcJibLzQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO0mK-0005RU-UP; Mon, 13 Apr 2020 15:13:40 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO0mI-0005Qt-M9
 for linux-afs@lists.infradead.org; Mon, 13 Apr 2020 15:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586790817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kJowtOvzAa19C32LJEMTxVyIKp1fzSsgOgfg3CQWfw0=;
 b=H1EOraWx+HWU79UO96IXOJVYVBbx0thl6/zJCnbVlKTB43Evfa7C/wHvk+a4v3BvJDRz12
 HZIWGFRlZke0YrpyUIEbd+dJomLO30EQ0kq3cS3UxWQ6rlWutXD5IF5BULgMTV1Cfh8w9s
 YUJLEcXkXGZA+PyZsEdvgrJyUpkamHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-VqRzGYoNMgSl-wmSX7-zdg-1; Mon, 13 Apr 2020 11:13:35 -0400
X-MC-Unique: VqRzGYoNMgSl-wmSX7-zdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A4768017FD;
 Mon, 13 Apr 2020 15:13:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-224.rdu2.redhat.com
 [10.10.112.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2090B5C1B5;
 Mon, 13 Apr 2020 15:13:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2940559.1586789415@warthog.procyon.org.uk>
References: <2940559.1586789415@warthog.procyon.org.uk>
Subject: Re: [GIT PULL] afs: Fixes
MIME-Version: 1.0
Content-ID: <3060969.1586790812.1@warthog.procyon.org.uk>
Date: Mon, 13 Apr 2020 16:13:32 +0100
Message-ID: <3060970.1586790812@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_081338_791653_8338F812 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 1.2 MISSING_HEADERS        Missing To: header
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 torvalds@linux-foundation.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Howells <dhowells@redhat.com> wrote:

>  (1) Fix the decoding of fetched file status records do that in advances
>      the xdr pointer under all circumstances.

As Willy points out, this isn't very English.  Let me try that again.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
