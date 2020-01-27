Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EC414A5DA
	for <lists+linux-afs@lfdr.de>; Mon, 27 Jan 2020 15:16:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiu3pKEZ+DlqCUf9ftjtTFmuSBlORZBm2494gYHbjTk=; b=fGuiPwclsRgbuv
	nfGxBn+vek+4qPC0IbKYzqZcqD3Kt5voWFTH7lf75miLdfZTbI1+YjLXuuUGV9AVyJ4l1bfgwl61e
	TK40pEVPbtBDJIvCJwxHp5mJDmSPSI6VwZJMaWf/gt0X5+YpW1JPDdTiReZBHSxFatD84shbsTv5J
	BYuxjRS3/0t6k2G0m8ZchtjrUNmskEQ1MguOuKlmsyFlgn6DF+gDzefqY0BjgroS9XL7VQpQKGuWV
	rFtB7qaDtIAbWFsbY06PklMSiRsVn3D+IkLrlBuLPTXeklKGkhKuPLjXcWXUkkxJgNwCVuEiWRmOV
	aeczfpYv6wcHLaK6/Gmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw5Bf-0004eX-Sv; Mon, 27 Jan 2020 14:16:23 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw5Bb-0004da-5N
 for linux-afs@lists.infradead.org; Mon, 27 Jan 2020 14:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580134578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WkvSDwSG0ICKN8SDTNhYC6T7ULaT30MIRmlQvVlNa1E=;
 b=BSm38yWVGShyxMKpD8Dl+cxbN0z/OGolTD5VUSAq4aPJakDAgb9O7keTNrU3tJ+zTxQIUb
 CRqcLRcrNqS6YvZzjPZd7u9f3IWMZkDVPOPDUHwRAmOd5mMJcqHQVpsTxS8pNu2lgl/L21
 8XiNnhLufnM7bnS3jmJXiPSNAyIgGzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-oiZvXpDBMh65jnnLgA6WCw-1; Mon, 27 Jan 2020 09:16:16 -0500
X-MC-Unique: oiZvXpDBMh65jnnLgA6WCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4026810054E3;
 Mon, 27 Jan 2020 14:16:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-99.rdu2.redhat.com
 [10.10.120.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D7AE80A5C;
 Mon, 27 Jan 2020 14:16:14 +0000 (UTC)
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
Content-ID: <1465963.1580134573.1@warthog.procyon.org.uk>
Date: Mon, 27 Jan 2020 14:16:13 +0000
Message-ID: <1465964.1580134573@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_061621_141073_1CA8AD47 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.120 listed in wl.mailspike.net]
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
