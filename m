Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566A1B0DF3
	for <lists+linux-afs@lfdr.de>; Mon, 20 Apr 2020 16:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g37xFcMmsH3THel0ge34b7VCx1ugUgdH6lMjTEnCKgw=; b=f1mf6ly4YtTIH6
	g7JreOl3XSyJmtYNjk3gVEqlL+rzlycJ013zGudl85Gxvwr9OPhgomVxDEzSPmx6ZSqFCHbO3j0zy
	WG01zho4yeLDxwoITBBXCli4gWMtg5SqoZkI0Lt1MAvch9i1/ydrt0haCNAwnJB++B8MuxRlObLt4
	8QP+H3VOVGCWA1zMC47Ux22wCFpcofh0scCy8EDb18kD+TR8nZ7KwBuQbpt56RsaHjNGvQyBOkJ3Q
	DQK6MQsPyg9gijiZA585VRaDa3D5RGZz3juchq1r1iud++3LQypWblypjTMWeh2LvEhUfJk3Yqu60
	a7QIXRI99TYSquAz74tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQX5K-0003BK-TW; Mon, 20 Apr 2020 14:07:42 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQWFB-0004tQ-VT
 for linux-afs@lists.infradead.org; Mon, 20 Apr 2020 13:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587388427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYew2ybNbEYlxnWhOLAX8rprgalSjY8htLDKj7llLh0=;
 b=f/2co/SUzVgqO+vx5jBvEWWT0ZbE7IJgrb7wpxxCkS6cnhDWFHcocKa5iYw8v6fhe1Bf0j
 WXtK1UTtA1fjvHYzfNiQv7Y2+yWzFVI0hGDs6w1QLZXmeErm0ZXcx1hsJYmNDitVS35fxK
 RBr57UUVzEb+ct7eka7VJO0DKky4A7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-8q1U0xdCNU2fff9u2tmIGQ-1; Mon, 20 Apr 2020 09:13:45 -0400
X-MC-Unique: 8q1U0xdCNU2fff9u2tmIGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80352149C1;
 Mon, 20 Apr 2020 13:13:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BDD510013A1;
 Mon, 20 Apr 2020 13:13:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <87imhvj7m6.fsf@cjr.nz>
References: <87imhvj7m6.fsf@cjr.nz>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <927453.1587285472@warthog.procyon.org.uk>
To: Paulo Alcantara <pc@cjr.nz>
Subject: Re: What's a good default TTL for DNS keys in the kernel
MIME-Version: 1.0
Content-ID: <1136023.1587388420.1@warthog.procyon.org.uk>
Date: Mon, 20 Apr 2020 14:13:40 +0100
Message-ID: <1136024.1587388420@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_061350_091495_5C78A605 
X-CRM114-Status: GOOD (  10.98  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 20 Apr 2020 07:07:41 -0700
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 Steve French <smfrench@gmail.com>, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Paulo Alcantara <pc@cjr.nz> wrote:

> >> For SMB3/CIFS mounts, Paulo added support last year for automatic
> >> reconnect if the IP address of the server changes.  It also is helpful
> >> when DFS (global name space) addresses change.
> >
> > What happens if the IP address the superblock is going to changes, then
> > another mount is made back to the original IP address?  Does the second mount
> > just pick the original superblock?
> 
> It is going to transparently reconnect to the new ip address, SMB share,
> and cifs superblock is kept unchanged.  We, however, update internal
> TCP_Server_Info structure to reflect new destination ip address.
> 
> For the second mount, since the hostname (extracted out of the UNC path
> at mount time) resolves to a new ip address and that address was saved earlier
> in TCP_Server_Info structure during reconnect, we will end up
> reusing same cifs superblock as per fs/cifs/connect.c:cifs_match_super().

Would that be a bug?

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
