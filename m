Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 504101DB8A4
	for <lists+linux-afs@lfdr.de>; Wed, 20 May 2020 17:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ACvaD1nQTdKDKXNAXOeQ3TrUv7UrRKjxhLaFi7OhZjM=; b=G/u6nYGyQQqNu9
	16UpCd83OrQnMDyiykdxRsiyT0tx5Dn2DgZ2KbeEsqoMMgdq8HnsERhf2iZr9IHPmXafSzysgkUyC
	6/Pca1VXdIP+syDd7TyTKZ/7v+qwZDtZx+jy+rMQ9vk/+CJe0J3uQYCS/RRid4bmRDBtBZflM292p
	x3Y8/AUcLYcKj/KGYzEgkyNvqZYGmijW0dNxCbN0RN/4Nw12XTIG+kHwEWojGecU0KILgZtePEJIN
	kXYERqfOTrULS1ZhmV2DJsqJvLH+oK+FO9aTevDFbbkhLfMV3H01e3Yqp2J/nTt9/cxJqd67l4iqD
	dbaZBB8yFWVEvqWufYdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbQwQ-0006JS-7N; Wed, 20 May 2020 15:47:34 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbQwN-0006B8-2B
 for linux-afs@lists.infradead.org; Wed, 20 May 2020 15:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589989644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=WLUPIRPGzvId7Oqd5XPZfHmr2luV6r19pyo95ElWqW0=;
 b=N72qoxlhYwcOa0s/eKO4YFKJIwKLuBGiqtOXxaB9uZ0cdoGGAruwOn4qLHfHXXe/I3+GVj
 FuwTIkw50LHHaqDb6fXOU0dc5v7UcAnwa0tehudkzN/hTuhLAITJ/CfOkK2Hifqn7F8C3l
 XH5nfe6sxMIiXSTSCOmfCobINEjrgfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Sh-TAHz5ORW0-_FY5tIZsw-1; Wed, 20 May 2020 11:47:08 -0400
X-MC-Unique: Sh-TAHz5ORW0-_FY5tIZsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 895B98018A2
 for <linux-afs@lists.infradead.org>; Wed, 20 May 2020 15:47:07 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
 [10.10.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C8EE62932;
 Wed, 20 May 2020 15:47:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Subject: kafs-client-0.4 released
MIME-Version: 1.0
Content-ID: <1859359.1589989626.1@warthog.procyon.org.uk>
Date: Wed, 20 May 2020 16:47:06 +0100
Message-ID: <1859360.1589989626@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_084731_186348_E0296D46 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: dhowells@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

v0.4 of kafs-client has been released.

This makes the following changes:

 (*) libcrypto from OpenSSL is no longer used; rather the relevent DES checks
     are now incorporated into aklog-kafs and AF_ALG is used to handle the
     crypto.

 (*) In the RPMs, the aklog.1 manpage synonym is moved to the -compat rpm so
     that it doesn't clash with other installed AFS clients.

The sources can be found here:

	http://git.infradead.org/users/dhowells/kafs-client.git
	tag v0.4

or here:

	https://www.infradead.org/~dhowells/kafs/kafs-client-0.4.tar.bz2

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
