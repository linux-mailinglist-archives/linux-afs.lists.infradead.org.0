Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 932E214E56F
	for <lists+linux-afs@lfdr.de>; Thu, 30 Jan 2020 23:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wGRwcodzlBcd72uK+Gr3iOBl0aVhWCEmiL9E6U/poQ=; b=WYeZytjdnysp2T
	JHIQ2G5nx5QJDSKzC+X/9oS6tvQcXxLtxBmXmOlvLTWCCuYRrE3Sft2RKxDY2XWmZKImUK8xzxX0S
	E3fRmw8oZkFjsDQ8zM0pj9mqqOLyGqxPtL2k6WzUsTVHWqyiopL2Knx3l8bCH5QiGUE8JyJ/suKB2
	DUwT1VxV+hkvlwXL8YTyRBqx4nzLtyd7p93/Yjne+Wj682Iy5lsSwJ8gnjuvM5Ag4EGelh3IBx/3I
	ZRWzqFDC25U+1vopA3kB78x+aBVRwDBas0SPWwmqU0KAzr08xebUorRGZ0ObFTEb/chZm6Sl8Om+i
	qqNm+38PVKXSQYU/lzIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixI66-0004tl-16; Thu, 30 Jan 2020 22:15:38 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixI63-0004rz-1n
 for linux-afs@lists.infradead.org; Thu, 30 Jan 2020 22:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580422531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juHZpbC38gvldwKKQgtdJvr3WmA0nVAvz2zKADDsVX8=;
 b=J6O9s2jmi8tTh8hycK0U5xfF/6ABFSDjkXBNKKYUYm+mkVLpnJdcT96NWEO2tmMASSOfSf
 ck4CxY9rQFbaC9b9aPRAIeC9Fn46cv1w0nf91RU/myRh0kBcwkFRreiJO2r9+HjtrqIGkF
 un/bgSc6Ch+326IkdDjJbbg7J054OKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287--dY0x9LyPcuhPTVbKqxSyA-1; Thu, 30 Jan 2020 17:15:26 -0500
X-MC-Unique: -dY0x9LyPcuhPTVbKqxSyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99730803C22;
 Thu, 30 Jan 2020 22:15:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-197.rdu2.redhat.com
 [10.10.120.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB24F8BE04;
 Thu, 30 Jan 2020 22:15:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <0000000000005b4a6c0596d8c5a8@google.com>
References: <0000000000005b4a6c0596d8c5a8@google.com>
To: syzbot <syzbot+2e7168a4d3c4ec071fdc@syzkaller.appspotmail.com>
Subject: Re: KMSAN: use-after-free in rxrpc_send_keepalive
MIME-Version: 1.0
Content-ID: <3725015.1580422520.1@warthog.procyon.org.uk>
Date: Thu, 30 Jan 2020 22:15:20 +0000
Message-ID: <3725016.1580422520@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_141535_170784_BDCB1729 
X-CRM114-Status: UNSURE (   5.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 TVD_SPACE_RATIO        No description available.
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
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, glider@google.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git e4866645bc264194ef92722ff09321a485d913a5


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
