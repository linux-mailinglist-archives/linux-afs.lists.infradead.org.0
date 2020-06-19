Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C974201DDD
	for <lists+linux-afs@lfdr.de>; Sat, 20 Jun 2020 00:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/EJDiag/pPX/NjMwMANw10sTN/7f/1z6XPaVrJD5Zo=; b=F4IkRXfmgayjK/
	G1dn+GQD2aSSUrVIqflu/LsCikwmbsuWOrvp4eZS0fBaq4YETpf5zZBGmo7GVaMLiJyAUK82dAoEI
	LJjukQpN7nq2ouj/c/cv5/v2AATJO/E3lgrrnLi+x0Ss02dgnWJ4AcCUiJlf311xinWgCk2Fs3TSc
	8S0xJL5jN/iAFDq5dndR53IUc3z4EdFCEYuKSw709KvNDKh/PcQf5kmlXc1+9G3qmMfs9sBCcz40i
	rn2oWgMnFKff1ucmxNt57+gE5lFERh9YL07Lv+rBwBHB6K+lIMRxSxtA/8DDIgVXuHfVakSEJHjUt
	SVUoIqHmQOTw6Wuy4KOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmPFx-0001Vp-EK; Fri, 19 Jun 2020 22:13:05 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmPFv-0001Uq-D2
 for linux-afs@lists.infradead.org; Fri, 19 Jun 2020 22:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592604781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2+FgfKVWJ0OmMYlV9X2tHyMUlSlq4J73WMXUePK2hM=;
 b=OimJQFOo1Xzex6kcinMp9+ShCEVkYTMWB4vAZMwuOePssp6Cx9QM3GRwoqgGHkjAuJSoEw
 YR0y5R+Ng4Km491dY3hz8iQ8KL4Ujq/4zt/Xd1JF5cM+EZNtRiAnsnLYhqSPT7oYsiG9Bt
 JqnjFLf6+YnhBtqgPaMW7+yC1ruD8PU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-BBau2pmlPCC1Al3-ZfRkBg-1; Fri, 19 Jun 2020 18:12:58 -0400
X-MC-Unique: BBau2pmlPCC1Al3-ZfRkBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B50107ACCA;
 Fri, 19 Jun 2020 22:12:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E27B19C4F;
 Fri, 19 Jun 2020 22:12:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <0000000000009111c005a845c2bc@google.com>
References: <0000000000009111c005a845c2bc@google.com>
To: syzbot <syzbot+d3eccef36ddbd02713e9@syzkaller.appspotmail.com>
Subject: Re: net-next test error: KASAN: use-after-free Write in
 afs_wake_up_async_call
MIME-Version: 1.0
Content-ID: <2214468.1592604774.1@warthog.procyon.org.uk>
Date: Fri, 19 Jun 2020 23:12:54 +0100
Message-ID: <2214469.1592604774@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_151303_528106_C94F16D2 
X-CRM114-Status: UNSURE (   5.65  )
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
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
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git 559f5964f95ce6096ae0aa858eaee202500ab9ca


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
