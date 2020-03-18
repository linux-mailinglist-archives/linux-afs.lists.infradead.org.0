Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746F18A1A4
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 18:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WncL7MEoj8BM0i+Xj+RKLIScSAPltXh/gAhvD1IDG1w=; b=J5YrR1aM8KAtuT
	WtPN3ftLTEJ7qcmEl7XZKhG7XcgHifl9b5zQF07IxYbOI6G9P/j/Me4IoV1leArPo7ggnliBjulQJ
	Vc5/gYfaF004ZUWu769WcBMG6WAok/C99SmZwqRlLIc3Awrin0mYwjUVLjT6uiTNg8+uDhisYqyNf
	kpXBiL3kK2K0Gdp8qcf7wos9w+w4WwGklvTQIqRmb5JcIYONVLXOraUHRmqN9GPoV73rw1IOcRYTo
	xuiT1CrMWIrhBE+BtJdYxsCckW7a4Wq0U4vRqVFNj6nWpfU453uchaqv/f/Pc3B+KPLTXuAS7Y1Kp
	WS0RzawnGKtNVTawsqwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEccC-0003Wb-UP; Wed, 18 Mar 2020 17:36:24 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEaOz-0007R4-Fy
 for linux-afs@lists.infradead.org; Wed, 18 Mar 2020 15:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584544475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rDahFV9TPWnSHYGEo4pu2LmiluREcgL9pHQHEehqYmE=;
 b=OixeC8J5rWvPM1HvR4PADk47xq4+qPr5lrz4KoHSeL30EOX9RKsD7nfzdj1wrhdV5wxf5B
 u5IDcKW6ceyVQdpR1XWgAWqwJqYwzTISc/dgEiEWMBKjNfTMAvrYrmzkfEFt8OB5y+tCEB
 g/ag96fPTgyi4laZED0PaMe6mluUgsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-zLovBwwuOPCXLkjvjN2tvw-1; Wed, 18 Mar 2020 11:14:34 -0400
X-MC-Unique: zLovBwwuOPCXLkjvjN2tvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97683107ACC7;
 Wed, 18 Mar 2020 15:14:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0851A5C1D8;
 Wed, 18 Mar 2020 15:14:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <e47bef56-9271-93e0-0e59-c77c253babea@redhat.com>
References: <e47bef56-9271-93e0-0e59-c77c253babea@redhat.com>
 <20200317194140.6031-5-longman@redhat.com>
 <20200317194140.6031-1-longman@redhat.com>
 <2832139.1584520054@warthog.procyon.org.uk>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 4/4] KEYS: Avoid false positive ENOMEM error on key read
MIME-Version: 1.0
Content-ID: <2866041.1584544464.1@warthog.procyon.org.uk>
Date: Wed, 18 Mar 2020 15:14:24 +0000
Message-ID: <2866042.1584544464@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_081437_622731_DEA81B0E 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
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
X-Mailman-Approved-At: Wed, 18 Mar 2020 10:36:21 -0700
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

> Doing this is micro-optimization. As the keys subsystem is that
> performance critical, do we need to do that to save a cycle or two while
> making the code a bit harder to read?

It was more sort of a musing comment.  Feel free to ignore it.  kvfree()
doesn't do this.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
