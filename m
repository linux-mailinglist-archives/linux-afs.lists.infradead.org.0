Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A76C7165C71
	for <lists+linux-afs@lfdr.de>; Thu, 20 Feb 2020 12:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxQM5sueLB5mSbEsm08JBN/RPVHMykw6kHmyLbk0y/o=; b=XnZ7U/Yd8uFsju
	k8F1s6u1vVSrSK5XxCC6rx/EoE1WzZDfmcYsYpUJ/01IogW0ZxFuwZmsc4wmGhkptUrPNzEA137E1
	ae1vElF2KFlHYZtWNfZPm5ZrS0Ojym6WP0ieGEnO8kIM3ks6fHYbc2T5XXTXFVH/ftm7sF9+x9LOS
	Kr7B283j8bmHxAI5DAWP/OhyJV3xhmupogUXZa4pq6398eMl47bJMV4iFf0hKQ+PGN7hDh7kGEIqt
	vFtSi4Edh/KUruJlMzkLdVx0OIuvjf5Hxt8iEfJgTSohheAPYVRnDSbC4ZBy3JCsFGKufa+UmAKgp
	bFF9L3J6kNFpXpryYZzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4jgM-0005p8-Mh; Thu, 20 Feb 2020 11:07:50 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4jgJ-0005of-UP
 for linux-afs@lists.infradead.org; Thu, 20 Feb 2020 11:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582196865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pi4tU0EznP2TOBw3gjfG94dlzvHBEhkZWsOdCIPsMwk=;
 b=NTXiP/LUVlYLLDKnJ5eUJkXkANvFDgMKBf5ZaPRXtAkVXM2xHdGM0QamI2WcpbtigpOk2s
 ZzM2exXf0AZr1+QIvHNhWRh7X1k6mmXgRRs3gjMqZMLS+vS+zRpK8KbvuE3PB4jtkQqmjo
 PDzaZD/unRwBW1AgSTJJEAbcX+Tlr7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-8a6jE98hP7G8NIx1Hp7b1A-1; Thu, 20 Feb 2020 06:07:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EDD78017DF;
 Thu, 20 Feb 2020 11:07:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-122-163.rdu2.redhat.com
 [10.10.122.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB9D19C4F;
 Thu, 20 Feb 2020 11:07:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200220104746.15bca53a@schienar>
References: <20200220104746.15bca53a@schienar>
 <20200219113929.6f55aa3e@schienar> <231889.1582128329@warthog.procyon.org.uk>
To: Julian Wollrath <jwollrath@web.de>
Subject: Re: NULL pointer dereference v5.6.0-rc2
MIME-Version: 1.0
Content-ID: <590356.1582196860.1@warthog.procyon.org.uk>
Date: Thu, 20 Feb 2020 11:07:40 +0000
Message-ID: <590357.1582196860@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 8a6jE98hP7G8NIx1Hp7b1A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_030748_056540_A1102C29 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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

Julian Wollrath <jwollrath@web.de> wrote:

> it is self-compiled but there seem to be no debugging symbols available:
> 
> Reading symbols from fs/afs/kafs.ko...
> (No debugging symbols found in fs/afs/kafs.ko)
> (gdb) i li *afs_update_server_record+0x45
> No line number information available for address 0x195a5
> <afs_update_server_record+69>
> 
> If I would recompile it with debugging symbols (how would I enable
> them?), would I still get the correct line number?

You need to enable CONFIG_DEBUG_INFO.  It might work.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
