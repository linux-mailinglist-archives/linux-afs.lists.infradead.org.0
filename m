Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630638E54
	for <lists+linux-afs@lfdr.de>; Fri,  7 Jun 2019 17:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7bsCfLnVSTRr5GpXbxCcEptZ9E7jyzmbGnbT4ZdMwdo=; b=Vb/4OPFwGNPqU0
	SAkRhwrzFjhN058n2pUPSp12dJDUGNoXBHABaKBWBJddamzQBe07w1RsRauQrKTcSyREXinXD2bqX
	hJqfPoN2C2SpFtI2KbNwrflqKQcHDVbSviQqElDfxbUdema2rtia0YQ+Du2aCt+5jFSDboNJ12Ecb
	TguvN5+2CDGb9ae2KvunFgt8uxGt9JvTKd+exAduo072KXcl4d6r9+D0i9crI8S6BNMB1LnR/+Qn1
	5UdScJbXGGOwRf8N8m/bsoO3XmQwC1r0GoZOYx8u3rc4tVNmvzV/2pNSFubDvMdhRSb1f0BZJ3+c2
	EdAkZAwOENXwQotvzR1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZGOI-0004Vp-PN; Fri, 07 Jun 2019 15:02:50 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZGOF-0004VU-R1
 for linux-afs@lists.infradead.org; Fri, 07 Jun 2019 15:02:49 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 21D194C940;
 Fri,  7 Jun 2019 15:02:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com
 [10.10.120.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F025104B50D;
 Fri,  7 Jun 2019 15:02:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Subject: Proposed afs-filesystem package for Fedora to add /afs
MIME-Version: 1.0
Content-ID: <19382.1559919757.1@warthog.procyon.org.uk>
Date: Fri, 07 Jun 2019 16:02:37 +0100
Message-ID: <19383.1559919757@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 07 Jun 2019 15:02:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_080248_000526_9A9A1C52 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: dhowells@redhat.com, openafs-devel@openafs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Here's a new package, afs-filesystem, that I'm going to propose for Fedora.
All it does is create the /afs directory and reapply the security label to it.
This has been okayed by the Fedora Packaging Committee:

	https://pagure.io/packaging-committee/issue/888

They have also offered the alternative of adding the /afs directly to the
filesystem package.

The package consists of just the attached specfile.  It simplifies management
of the /afs directory as rpm can't handle an upgrade to a package that also
specifies the directory.  With a package the only creates the directory and
does nothing else, hopefully upgrading will not be necessary.

This will also be usable by packages for other AFS clients, such as OpenAFS.

David
---
Name:		afs-filesystem
Version:	1.0
Release:	1%{?dist}
Summary:	The AFS dynamic filesystem mountpoint directory
License:	Public Domain
URL:		https://www.infradead.org/~dhowells/afs-filesystem.spec
BuildArch:	noarch

BuildRequires: filesystem

%description
Provide the /afs directory that the AFS dynamic root gets mounted upon.

%prep

%build

%install
mkdir -p %{buildroot}/afs

%posttrans
restorecon /afs 2>/dev/null >/dev/null || :

%files
%dir %attr(555,root,root) /afs

%changelog
* Fri Jun 7 2019 David Howells <dhowells@redhat.com> 1.0-1
- Initial commit

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
