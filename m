Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E151A189F58
	for <lists+linux-afs@lfdr.de>; Wed, 18 Mar 2020 16:12:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CygPJzivAvEoB/nAJF6s9akEnHw+spxlznnJLZpbTw=; b=ETDunU5MMXZwmz
	sBtZlvjKyz6DrUAgzLNXmZnaY8uwTIJ6qXntbvb/4oC9oxTQQQowNJkV/WqDUrkxYUxZ40FucHHkK
	2BbD9jV61sr1HFPa9Y56/nB5QTnxLKpgGtHoTcDm3lQ5NP/YuP0AVYBNyOHcyhqEOqa5unB4K+yC6
	qIMuH3roCxKzeWyAwytYhALztaFpz/AFYKtSCS/beqgqtrqRKySDXlwH3l+ArP0N//0em6kR90tou
	8ujyuplNOJqxHO9Q3IWGjZQ1Jd26FaylY1aWsl4slvzyGq5rwD267y0cl5Kv2qFRYKRsCUxFhA2PX
	+Ja8JE51FXXD1naq30BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEaMP-0006yt-JR; Wed, 18 Mar 2020 15:11:57 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEZkY-0003XH-KE
 for linux-afs@bombadil.infradead.org; Wed, 18 Mar 2020 14:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=O4Lls9UoDb9uKTNqm5ZPP3fEFfUNHwPy6zZuzCAlNcw=; b=Qyt/pm+YHrcf782t1mjFVKhChg
 okOLKWNhu7uRQ+1VjZ99jMENEh/PP8fFZDbbRulbKkmg69T7phY4YoiAK95MtilAEUt+AzyShATOn
 Vzv0e6y1oVamc9zJ8JlCeXhvtYTmq2pQB3gmX4p11OoMEuKD+cdLDQtVdbr30vkpLTs9exFxVv6W6
 lY2K9FZrjFaKQHy3dNX4nAcfG9jJnlAA07RfzXK32x5XV+Dj3gw4LJSp+XxPEhD+VetHghxEN/3Uo
 ycqYREMRw16OlpEm4QChuinj2UhND6iNzipgvQ+k7KhRDDLuZlZsFDgaXFIP03g5kRpGd2rFpRr8W
 BMJ7P9qA==;
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEZkW-0004pi-16
 for linux-afs@lists.infradead.org; Wed, 18 Mar 2020 14:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584541948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4Lls9UoDb9uKTNqm5ZPP3fEFfUNHwPy6zZuzCAlNcw=;
 b=PEyCbtuaeC8fe66Nm9su9fSJRqQBFXK094Np0i1G33i5uyqOWMniIInaD64Vf/ypPmfViB
 miq+x0j0Y6nUTAo9rgFdPSW4zUTOocVMwR/smaHdJiPVbLzd7Au+fKveQHr0ppLtVvnYOp
 6j6F4ZwumRPf2AskaZEaGScHo/MwXd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-ftqBYlSBOgiVh8uJpfOpng-1; Wed, 18 Mar 2020 10:32:25 -0400
X-MC-Unique: ftqBYlSBOgiVh8uJpfOpng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78E1E800D50;
 Wed, 18 Mar 2020 14:32:22 +0000 (UTC)
Received: from llong.remote.csb (ovpn-120-114.rdu2.redhat.com [10.10.120.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D818B5C1D8;
 Wed, 18 Mar 2020 14:32:19 +0000 (UTC)
Subject: Re: [PATCH v4 2/4] KEYS: Remove __user annotation from rxrpc_read()
To: David Howells <dhowells@redhat.com>
References: <20200317194140.6031-3-longman@redhat.com>
 <20200317194140.6031-1-longman@redhat.com>
 <2831786.1584519784@warthog.procyon.org.uk>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <fc537b1b-36f5-eac7-111b-e50f41fd01ff@redhat.com>
Date: Wed, 18 Mar 2020 10:32:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2831786.1584519784@warthog.procyon.org.uk>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [63.128.21.74 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-integrity@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 3/18/20 4:23 AM, David Howells wrote:
> Patch 2 and 3 need to be rolled into patch 1 otherwise sparse will give
> warnings about mismatches in address spaces on patch 1.
>
> Thanks,
> David

I separated them because they spans different domain. Sure, I will
repost it to merge the first three.

Cheers,
Longman


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
