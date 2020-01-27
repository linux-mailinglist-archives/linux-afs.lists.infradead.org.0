Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C83614A5D6
	for <lists+linux-afs@lfdr.de>; Mon, 27 Jan 2020 15:16:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiu3pKEZ+DlqCUf9ftjtTFmuSBlORZBm2494gYHbjTk=; b=Mu9muAXa5qp5ey
	pjxFN6zzijmteYpemLQrKQH1BDp5fqsrID7cwd5/NecSFhVlUm4kspAyxAHyUg5s+4Pi+7K5lrOMo
	BaGFYZLj2pZBzlO1PEC1g0caQgrdfiBBmrpZZWnmixuWrsW4ZcZPnAR0Cibx3L7tXBfLEYIYBzjqD
	VMq9vrF+BIbpZOJtLtisoZ85e25DyDx9fw0YsDbN7YbufjB6+vIAIITj29/4IKl0NOdA6OibxTsVQ
	RhKUEuBT51Busn+Qmt4ZVflmrWTxhgGEY2Px1WN1Z8UkX6ZkVcPFcOw3Rua0X2qOpCRqG34yA2+hd
	YINNo+omhkKjWON+GTpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw5BE-0004bT-ML; Mon, 27 Jan 2020 14:15:56 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw5BC-0004aw-1t
 for linux-afs@lists.infradead.org; Mon, 27 Jan 2020 14:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580134552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WkvSDwSG0ICKN8SDTNhYC6T7ULaT30MIRmlQvVlNa1E=;
 b=O/5I/lW+cXdUYLAdORltBcpfij4PvVA+dXCBC4tXwSnbu94Yy0JaTpaD0clvEVhkFkFWnm
 KtnJhkRTab8WSd0fc2/4zixAL4ucCtdtmTb22htaxYqNjFyGnOOe+WQzaXTjBx7QL1NoUo
 gw1M///CmfM1NFq1TlHC7XEG0CPu1ME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-1HtWR7f9OcG0lI5gn1Q0Dg-1; Mon, 27 Jan 2020 09:15:49 -0500
X-MC-Unique: 1HtWR7f9OcG0lI5gn1Q0Dg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70682107ACC7;
 Mon, 27 Jan 2020 14:15:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-99.rdu2.redhat.com
 [10.10.120.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8062149AF;
 Mon, 27 Jan 2020 14:15:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <000000000000f349be059bcd827a@google.com>
References: <000000000000f349be059bcd827a@google.com>
To: syzbot <syzbot+016c7186c1d55575bab8@syzkaller.appspotmail.com>
Subject: Re: WARNING in __xlate_proc_name (2)
MIME-Version: 1.0
Content-ID: <1465947.1580134546.1@warthog.procyon.org.uk>
Date: Mon, 27 Jan 2020 14:15:46 +0000
Message-ID: <1465948.1580134546@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_061554_181382_88A71501 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.120 listed in wl.mailspike.net]
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
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

#syz dup: WARNING in __proc_create (2)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
