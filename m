Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1910518C8E5
	for <lists+linux-afs@lfdr.de>; Fri, 20 Mar 2020 09:22:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yk1NiyZ2NfE6d4ypKyCKz4BAKBDOh6wfwGNLH/4Pgi4=; b=a+7iDgpiZL+rc/
	a/THj5qyQ6D+rG56KlxXRXzQfA+5CFa8HoLzUkiuPTm1MP4rrM7VLtJxRkUoPDetVOLebuhD3ym5p
	RNswyTqZ/Ru2EDLPdJpCATl3JLMOFK854Ietv4n81w1MX3LbAkHxWkvh5iyxx4da4f8F1OCkAwE/L
	6vlQ9nZJze6cpfurY5yeCBNfDRy8zGzxvW7bTIICPDQOYQldvvxEJcAI8EQhB70r46EW55xT6Q+L8
	+irzNA0Y3AdD5ySWr9iYD8cWPdjoehv6eD0EQBge8ceW2Ue8ZfXXmrEIm9lja39aoEb0wz2YkKD/G
	IYvGMo4/3D7Z3wkhOeFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFCuw-0006qy-CW; Fri, 20 Mar 2020 08:22:10 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFCtK-0006lP-Um
 for linux-afs@lists.infradead.org; Fri, 20 Mar 2020 08:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584692429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VVZY6TeI0YOm1FYG0w30u2dqA8tug6BHP6KzUJXch3w=;
 b=QCoGdzyya9ukt/wRDa4wC3ON5V3UK13QfXp55/FjzVJYzpv/molcLNQzJ91RkCw63Vy6Y+
 tHIU3/ROUyPes0IBFUb4fdKlQUhk+2J5TDLi83vZpZkyWLzdMAl+U66u6RaCPbVm3mAh7n
 WUyq3n9UiaD1igLOdDQ64g5ZaVpdsjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-Nm9VmDiBOxqeGfERJwsHVA-1; Fri, 20 Mar 2020 04:20:27 -0400
X-MC-Unique: Nm9VmDiBOxqeGfERJwsHVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B69A7800D5A;
 Fri, 20 Mar 2020 08:20:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E2B85D9CA;
 Fri, 20 Mar 2020 08:20:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200318221457.1330-2-longman@redhat.com>
References: <20200318221457.1330-2-longman@redhat.com>
 <20200318221457.1330-1-longman@redhat.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 1/2] KEYS: Don't write out to userspace while holding
 key semaphore
MIME-Version: 1.0
Content-ID: <3251034.1584692419.1@warthog.procyon.org.uk>
Date: Fri, 20 Mar 2020 08:20:19 +0000
Message-ID: <3251035.1584692419@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_012031_074443_9623229E 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
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
X-Mailman-Approved-At: Fri, 20 Mar 2020 01:22:09 -0700
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
 Roberto Sassu <roberto.sassu@huawei.com>, Eric Biggers <ebiggers@google.com>,
 netdev@vger.kernel.org, Jerry Snitselaar <jsnitsel@redhat.com>,
 James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-integrity@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Waiman Long <longman@redhat.com> wrote:

> +		if ((ret > 0) && (ret <= buflen)) {

That's a bit excessive on the bracketage, btw, but don't worry about it unless
you respin the patches.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
