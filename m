Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B751AC6F7
	for <lists+linux-afs@lfdr.de>; Thu, 16 Apr 2020 16:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KOW9A1qBfNBoE043XGBFNEMBKCdmyC0TXLfDzKxFl4=; b=olt6SBZfzIS6ND
	9zzvZ5TV89cSWAFOigEjAj3Q1Q02YIORjA9lkyf+Kjsz8W/2HOB2+ur9mZOxXdIlfeKSut80ZYmSY
	z3rWgmgcjx38yRleXwT+dBR7EcJ5IUYr3m7fXxLmRDh6aYbHJNBhaSqcRcArBBdKIA2XPqr77Iugq
	Gb1u455gfcVSla8SjVywNqATBkFmI4AkYJHyBm2hl1T5WfCK1XjLC3/XjXGjviO8Q2J+SO6L8vJdl
	T8B8P4IG9YPbIQkh0iOyqQX1pSHs82AGmJmyofgPR9W6Hq3L8g2pK9ZaFXZP3DgXYVOdwwSp6HJps
	sTqkewRCiHdHKT56lSRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP5nd-0001hs-F8; Thu, 16 Apr 2020 14:47:29 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1YP-0001dh-Pt
 for linux-afs@lists.infradead.org; Thu, 16 Apr 2020 10:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587032127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=duQdUsOOdHGiX8X+SSFFtnhQDtBYHM0gSY3ojiBRAto=;
 b=jME7/jt1K/4ELsgAoKvluDxwiHMLOcTB3G81EKkooBMBg7Uw/obiPuHXN37cOBjSvhfcM0
 qX8x6Qvb49B5TK9HCAHlmMqkBK7E4ixfebeTfebYFpFyUozB8ZRiVy5DAcio9oRsGKYdvb
 zDwKvaDLvuJrlblJHXWb2PyV8TeacTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-lvRNdSpjMxOevcxPakXQlg-1; Thu, 16 Apr 2020 06:15:23 -0400
X-MC-Unique: lvRNdSpjMxOevcxPakXQlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A21218C8C02;
 Thu, 16 Apr 2020 10:15:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7175E5C1D6;
 Thu, 16 Apr 2020 10:15:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAH2r5mvj7GF3i8AE6E=+5f_Vigtb3uw=665F2uuBOgGzUhHObQ@mail.gmail.com>
References: <CAH2r5mvj7GF3i8AE6E=+5f_Vigtb3uw=665F2uuBOgGzUhHObQ@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <e751977dac616d93806d98f4ad3ce144bb1eb244.camel@kernel.org>
To: Steve French <smfrench@gmail.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
MIME-Version: 1.0
Content-ID: <127742.1587032119.1@warthog.procyon.org.uk>
Date: Thu, 16 Apr 2020 11:15:19 +0100
Message-ID: <127743.1587032119@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_031529_923102_B643D6C0 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 16 Apr 2020 07:47:27 -0700
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
 Network Development <netdev@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 keyrings@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Steve French <smfrench@gmail.com> wrote:

> > 10 mins sounds like a reasonable default to me.
> 
> I would lean toward slightly longer (20 minutes?) but aren't there
> usually different timeouts for 'static' vs. 'dynamic' DNS records (so
> static records would have longer timeouts)?

Unfortunately, getaddrinfo() doesn't give me that information.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
