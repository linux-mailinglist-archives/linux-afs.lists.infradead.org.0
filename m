Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C221D189F5D
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 16:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqjTrb5MHPzizsox7aqVQ1itwcR/5vSBlTho0Gjj4AM=; b=IKozNCdhZlRAyd
	3crdE7VcnMMB34jNXRk8TqtaC8t2gY/y/aL9tNZKtkPWGYyTgrorX6cC7YgckCFLzoYYGgwLbk3TR
	VFi+uNiNlBDvWRaeOVvpU/TJlVG876+0cEzYJnGaeWCiFUG7DJxsNm4Z9DHWkKL2oHFGAV+L0b/m5
	F8fcWCMpa+ffyBGi/Jx0ljRUn4mc8vNWX3yWKEZWq7dg+d/kLPWflteGxOndGJm22syQDuzIAf//E
	KctR5c0J2CE4mH0QVJqJqMZbn/N8Iut/fGjGYeICWu+yg0Z15TYCeCL+/r7/8uz4ThLSZL+Wy2hfh
	NrvqiwRQogHkKug5QNqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEaMP-0006yi-DS; Wed, 18 Mar 2020 15:11:57 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEU3H-0004OA-8p
 for linux-afs@lists.infradead.org; Wed, 18 Mar 2020 08:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584520065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VH0+XlPo10NyA/xz91Ej5gjsjWF5TbKzK+mngsaI8Lo=;
 b=EsJoSAaOKfJJb+K//YYr9yDeh6ZUdW3sB+nNsPgpXi684OgnLkgz54ozx3Zr3zuc3gT3RM
 Rmdo2RrgqE5m5Lv0CnN7G4LVpJiQK/M8MTYhig5CQRcAqRIcSRuQaadGgx9vFxSneYcpjo
 9EYEnLnf+lk0AeLDBZRMb+QRZ/7iN/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-yA7fyRPiO0KsCqIveqAp5A-1; Wed, 18 Mar 2020 04:27:43 -0400
X-MC-Unique: yA7fyRPiO0KsCqIveqAp5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D72D4800D4E;
 Wed, 18 Mar 2020 08:27:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-126.rdu2.redhat.com
 [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D081819C70;
 Wed, 18 Mar 2020 08:27:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200317194140.6031-5-longman@redhat.com>
References: <20200317194140.6031-5-longman@redhat.com>
 <20200317194140.6031-1-longman@redhat.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 4/4] KEYS: Avoid false positive ENOMEM error on key read
MIME-Version: 1.0
Content-ID: <2832138.1584520054.1@warthog.procyon.org.uk>
Date: Wed, 18 Mar 2020 08:27:34 +0000
Message-ID: <2832139.1584520054@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_012747_400513_58A69C4F 
X-CRM114-Status: UNSURE (   8.72  )
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
X-Mailman-Approved-At: Wed, 18 Mar 2020 08:11:56 -0700
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

> +static inline void __kvzfree(const void *addr, size_t len)
> +{
> +	if (addr) {
> +		memset((void *)addr, 0, len);
> +		kvfree(addr);
> +	}
> +}

I wonder if that would be better as "kvfree(memset(...))" as memset() will
return the address parameter.  If memset is not inline, it avoids the need for
the compiler to save the parameter.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
