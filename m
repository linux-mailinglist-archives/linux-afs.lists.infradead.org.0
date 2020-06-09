Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6F1F4064
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 18:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lp+ntbmNgye6PPPByaGskWu+jv0XFdnBAVX/+qqKRSw=; b=Ss5SkbeYu1Jh2Q
	qiSQ1orykrKB8uVSralphm+yFlevUKKIpf/4PQQm31XfFKHHpRlRFkyM2uvtj64LpKH41qUIJ83yN
	PGtZczNZwb5CQjz0vFw/1/UzGJo78QuRiPoC7GM/quK5E2KvWsK8hk60GjT2IMMCwoLoEvfl+r3Ir
	pXifN3ln66IDap8pglgFXLiPBwoGBM9pZM04mT3U/Mq5oXZJURObmyET8+HbKVtONqDy+dYvUM3Kg
	GjgoIZGjdbWGa02wPLpPjtR7QsjjuhV5XpF7QMtLEsKKE2udKJ+H3ILOW7Z1VFDV5FxArTpjXqo7k
	OIzFsKIAzCE98EHa/SCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigsZ-0000O9-I6; Tue, 09 Jun 2020 16:13:35 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigsW-0000Ms-FI
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 16:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591719211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUGhyhAM3xv/+2IOQidLA1A/yKCzpzQ3bL3njFAMOIs=;
 b=AuCsk62RuvQXn+b/oFfkWd69/W1qb041PlHeWy0vBT4yWK1YgfrfPzyVhjNrt4TxOTZcgs
 CRmUwIKqeXCPk2icuUIex6thgl/mjAibdCqBPMnb2FnmdVevbaCNqlse2F2flY+cGTqOO9
 5D2KyS3uqA9hUlTUWWPHYgUSdlzJP1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-eumuOTcrNTyyjj6fSpoEKg-1; Tue, 09 Jun 2020 12:13:29 -0400
X-MC-Unique: eumuOTcrNTyyjj6fSpoEKg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E3FB8014D4;
 Tue,  9 Jun 2020 16:13:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BD81768DA;
 Tue,  9 Jun 2020 16:13:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 3/6] afs: Fix use of BUG()
From: David Howells <dhowells@redhat.com>
To: linux-afs@lists.infradead.org
Date: Tue, 09 Jun 2020 17:13:26 +0100
Message-ID: <159171920664.3038039.18059422273265286162.stgit@warthog.procyon.org.uk>
In-Reply-To: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
References: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.22
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_091332_582369_0962E38E 
X-CRM114-Status: GOOD (  12.88  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [207.211.31.81 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Fix afs_compare_addrs() to use WARN_ON(1) instead of BUG() and return 1
(ie. srx_a > srx_b).

There's no point trying to put actual error handling in as this should not
occur unless a new transport address type is allowed by AFS.  And even if
it does, in this particular case, it'll just never match unknown types of
addresses.  This BUG() was more of a 'you need to add a case here'
indicator.

Reported-by: Kees Cook <keescook@chromium.org>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/vl_alias.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/afs/vl_alias.c b/fs/afs/vl_alias.c
index 093895c49c21..136fc6164e00 100644
--- a/fs/afs/vl_alias.c
+++ b/fs/afs/vl_alias.c
@@ -73,7 +73,8 @@ static int afs_compare_addrs(const struct sockaddr_rxrpc *srx_a,
 	}
 
 	default:
-		BUG();
+		WARN_ON(1);
+		diff = 1;
 	}
 
 out:



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
