Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B04521A7F7A
	for <lists+linux-afs@lfdr.de>; Tue, 14 Apr 2020 16:20:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zt5iXxeH5tmBiuFAfDpgAeS7waBRH5+Ji06mmfJaGfM=; b=A0a21FJghXoRSz
	szbUQuVgPn6EJ35IwWwJdxmPKv3cTZFwxkw2KlL2bEt/Ce7/gDOIxpBnCd2U9W+64Hw3D0L3pbu40
	D9M+/DTmtzizq1Vlc1G/mdIoNKqOb8odV+LC8Fl4c0dFF8QsEJXLO48WK07wqIMlJnsoQJ2YNI2vN
	n04Rg6bIe6GIxRwZiVzyOC4+yxIjQ1P5Cl8EPZFgxgO7e+DeR73TztpeUsl7ZX8yb6HvZAQAaIJJZ
	BtDpXPVBrAPLQfuX9xEYWXWyOVArY9e4yUO++P1cSYlTabPCzKl84+YXnOk1z8qSI34bsG3WAFBIv
	8mZ11l+c5jNip5Ey7vDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOMQN-0000nG-5I; Tue, 14 Apr 2020 14:20:27 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOMQJ-0000iG-Pf
 for linux-afs@lists.infradead.org; Tue, 14 Apr 2020 14:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586874022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=NYWOZo6GSM1gl5Dpdc7Qc14rRCkPfmWgzyLfnqiKprc=;
 b=VjERq6I7i6Vot0N1ka6Wo1zE2vUilHfgNkEy5OQ1S1FH6rQvw/Nz9hu4RdLVFtXxYienwq
 CpwTNo2gxDJw90q0mYE60dAoeLY/+mbvvhfT1rWPMh8N6CwjO0z4a6rWc9MFfoxpUlICHq
 1QGPqhj0SCLfuaRIkWbesCrdlZLMbDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-95ZOvXX8MsyxzBYsrtgbiQ-1; Tue, 14 Apr 2020 10:20:14 -0400
X-MC-Unique: 95ZOvXX8MsyxzBYsrtgbiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FA47801A12;
 Tue, 14 Apr 2020 14:20:13 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B89C260BE1;
 Tue, 14 Apr 2020 14:20:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org
Subject: What's a good default TTL for DNS keys in the kernel
MIME-Version: 1.0
Content-ID: <3865907.1586874010.1@warthog.procyon.org.uk>
Date: Tue, 14 Apr 2020 15:20:10 +0100
Message-ID: <3865908.1586874010@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_072023_914658_10DF6684 
X-CRM114-Status: UNSURE (   9.77  )
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, keyrings@vger.kernel.org,
 fweimer@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Since key.dns_resolver isn't given a TTL for the address information obtained
for getaddrinfo(), no expiry is set on dns_resolver keys in the kernel for
NFS, CIFS or Ceph.  AFS gets one if it looks up a cell SRV or AFSDB record
because that is looked up in the DNS directly, but it doesn't look up A or
AAAA records, so doesn't get an expiry for the addresses themselves.

I've previously asked the libc folks if there's a way to get this information
exposed in struct addrinfo, but I don't think that ended up going anywhere -
and, in any case, would take a few years to work through the system.

For the moment, I think I should put a default on any dns_resolver keys and
have it applied either by the kernel (configurable with a /proc/sys/ setting)
or by the key.dnf_resolver program (configurable with an /etc file).

Any suggestion as to the preferred default TTL?  10 minutes?

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
