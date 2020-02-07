Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A84401552E4
	for <lists+linux-afs@lfdr.de>; Fri,  7 Feb 2020 08:23:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lTKa4w7vLUEoKaiz7dn0Y7HH+QHI0Pd3+hNmcJ1UUw=; b=l7hBc4cRtceP3A
	P4wb7cOlfRyo0ChL697ASEKfB5/BJynhL3cZZiERofMaUKeoXs3MeEq04nn2d8HbfYACep6kWClqR
	IsQT2CpIKYNUzQJwn+46zxbfAf5G1bsnBF0rWUmPbCarbz3NewvbOrW23+dnfRxoYJQ+6wCRpvfFP
	oN78CPE0oNDg+trjwGtaxNw4jo5/G+zbHqngGurxCh8/Pus6CrE0/zB3xp5zJrGtqUsLTy2RVZWJv
	bDLb2zvi3SbDNvxGkeBPHPJHA9dyYlwq5FsMdXMoq3pTmgjwRalksBT/wU5rgCURRAuVX6qgVNOts
	mdVPazd0mw12ZNV+LOaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izxz6-0004GF-TA; Fri, 07 Feb 2020 07:23:28 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izxz4-0004FR-Af
 for linux-afs@lists.infradead.org; Fri, 07 Feb 2020 07:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581060204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/1eHis89MpyLuxYDGM/uGf+wxAz3YIEtRor+3W21dw=;
 b=e4wqmYsumtzlwTfVQG8/2Fw3C8+moVh4IlE71pPekFSKimBLwTNBEvSezHxVDK+R/mNd+1
 3/epPSxW3rZzQHCA0jx9MXIBRhPMABpQr4Rj9o9d+E0jEo5/eWeRdg3L5fKHThUPRysraz
 u+d2c6UIVtr3d3FV2QNtgB2xZMsZp+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-w5vvEUNNNmCIBUUG-UCjJQ-1; Fri, 07 Feb 2020 02:23:16 -0500
X-MC-Unique: w5vvEUNNNmCIBUUG-UCjJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69644DB64;
 Fri,  7 Feb 2020 07:23:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com
 [10.10.120.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88CF78E9FE;
 Fri,  7 Feb 2020 07:23:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200207031553.18696-1-hdanton@sina.com>
References: <20200207031553.18696-1-hdanton@sina.com>
 <20200204084005.11320-1-hdanton@sina.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: inconsistent lock state in rxrpc_put_client_conn
MIME-Version: 1.0
Content-ID: <2394695.1581060192.1@warthog.procyon.org.uk>
Date: Fri, 07 Feb 2020 07:23:12 +0000
Message-ID: <2394696.1581060192@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_232326_436072_83FA1712 
X-CRM114-Status: UNSURE (   5.49  )
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
 dhowells@redhat.com, kuba@kernel.org,
 syzbot <syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

I've posted a patch for this:

https://lore.kernel.org/netdev/158099746025.2198892.1158535190228552910.stgit@warthog.procyon.org.uk/

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
