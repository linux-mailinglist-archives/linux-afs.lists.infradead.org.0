Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4945F18E81B
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbfdMB8fMq5X6y9z1opp0mgmG/E6aQlct+l+MK0l/hE=; b=a55ZcP7NjZzFsY
	VaLHELhyakh8Zpqd3/PF3wOqilR7FtFGNPwa9ltPl6aBJVz1kmrDKZbUZm414gcyTBWRu6vevlKpj
	WPbYa06SNCHfwRLz1AtsQWFbk2rcmDa1SqkBrHQrQrtZkmD6GAVtKWjnPlLV6269iO+69GsZXkcye
	cK4pUXHSHLl9BQUq0cjRvBW4z7YH6iU7S2TLJBEib3V7a3H1G4k2VQY5LYKkqW51bEYcymeK15C3H
	XGLLX4kkjFHqLWmoU3zOZ5WM6oWlGZTXCLi1qQ8EIC68szyrbdqFAuHP+NelGuXufgR6W6pb/t23N
	EE5H9X5boRooLGzQ5xyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHi-0004md-4h; Sun, 22 Mar 2020 10:56:50 +0000
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFRU6-0002wE-BR
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 23:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584748523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YMUkk0ARH4QnFA1QZkDjLSOJImmLVHTfhOfgY4nYzeY=;
 b=ZIi0CzZpXG5NxsyBjKln7WZrWFHpMBbIaqQmlnkYlSlEsBUsU/2QDu2kY+jWgY/27lsZmm
 g5a/lHzZsm10EL0Ef7EJo9vZltFYPt8pG3noV2KS+HxUo/UEZnmvGQXaZkETf00dPSk23I
 SabE4qNbcX9qzdgrJu+S0H+HvaCl22U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-J6Id791BNzebo-XDbrltLA-1; Fri, 20 Mar 2020 19:55:22 -0400
X-MC-Unique: J6Id791BNzebo-XDbrltLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C87AB8017CC;
 Fri, 20 Mar 2020 23:55:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46CB660BF1;
 Fri, 20 Mar 2020 23:55:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200320143547.GB3629@linux.intel.com>
References: <20200320143547.GB3629@linux.intel.com>
 <20200318221457.1330-1-longman@redhat.com>
 <20200318221457.1330-3-longman@redhat.com>
 <20200319194650.GA24804@linux.intel.com>
 <f22757ad-4d6f-ffd2-eed5-6b9bd1621b10@redhat.com>
 <20200320020717.GC183331@linux.intel.com>
 <7dbc524f-6c16-026a-a372-2e80b40eab30@redhat.com>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 2/2] KEYS: Avoid false positive ENOMEM error on key read
MIME-Version: 1.0
Content-ID: <3984028.1584748510.1@warthog.procyon.org.uk>
Date: Fri, 20 Mar 2020 23:55:10 +0000
Message-ID: <3984029.1584748510@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_165526_488784_24F59B66 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [63.128.21.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Sun, 22 Mar 2020 03:56:45 -0700
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Chris von Recklinghausen <crecklin@redhat.com>, linux-afs@lists.infradead.org,
 Eric Biggers <ebiggers@google.com>, netdev@vger.kernel.org,
 Jerry Snitselaar <jsnitsel@redhat.com>, James Morris <jmorris@namei.org>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, Roberto Sassu <roberto.sassu@huawei.com>,
 Jakub Kicinski <kuba@kernel.org>, Waiman Long <longman@redhat.com>,
 linux-integrity@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:

> /* Key data can change as we don not hold key->sem. */

I think you mean "we don't".

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
