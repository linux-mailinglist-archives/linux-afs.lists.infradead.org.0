Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2441DF2FA
	for <lists+linux-afs@lfdr.de>; Sat, 23 May 2020 01:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0H5ZnS7Wnm2xyVxJ/sk45My4obGUctJ5Zk+PUmwFm0=; b=WVrVfLuPd+XBgd
	CBLEICXf9wqEfiDrOvcqpFk21QcHFBKf6imnAAt4F1TEwXlXOgtIpJj7P9YA39F/vWbkh1w4zeVL+
	DUBJcwwZeGLZ59pvFwST+mrNSAzKraiCFClmZ09XgbQwg6WBIS7ynHZU0HJcCqmICida/4ipe9XE3
	AyJOSg3D6zdKT6E73ZxSAyOW8WTvQVmeETky0/rgbfsyDW6SlO6pIazUwEc7T+AOcpCECIkJM4kwR
	jEYiWFFy7PW4USCCu3saq5VZBF3R0QhS68qTCi3xaqfV81dHj1LSctFbxXuZQrElkF6a7yM0sbBDh
	eCh/tCDOj+I2rA/GgyAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcH46-00088a-5V; Fri, 22 May 2020 23:26:58 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcH41-00087Q-VK
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 23:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590190011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ML9m6yqp+0tcU4CPCOGDw0ZTVISsG/4OQXgXgDYzfc=;
 b=cziCdNEH1vdGdGBr+i1zy8xfdBdsqJa0WD59ngmLEf1oKsVJksO/YK8p9Ebkyr+nmsFxXs
 ksD//qgCsoLoG3ru6JILIymGgKHvMyeTTYYIXZOtgwzt87XgQ92TIvafzD3+Z541v8UVkH
 T4iYHZy4ZVs2xvQp8BTcyTGrbmf9Rx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-2zI9wFUpMQGsKtFIr0R05Q-1; Fri, 22 May 2020 19:26:49 -0400
X-MC-Unique: 2zI9wFUpMQGsKtFIr0R05Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D1AF107ACCA;
 Fri, 22 May 2020 23:26:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DE325D788;
 Fri, 22 May 2020 23:26:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200522.155418.406408375053374516.davem@davemloft.net>
References: <20200522.155418.406408375053374516.davem@davemloft.net>
 <159001690181.18663.663730118645460940.stgit@warthog.procyon.org.uk>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net 0/3] rxrpc: Fix retransmission timeout and ACK discard
MIME-Version: 1.0
Content-ID: <997164.1590190006.1@warthog.procyon.org.uk>
Date: Sat, 23 May 2020 00:26:46 +0100
Message-ID: <997165.1590190006@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_162656_062353_C85472A3 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
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
Cc: dhowells@redhat.com, netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Miller <davem@davemloft.net> wrote:

> Pulled, thanks David.

Thanks.  I'll rebase my two extra patches I've just sent you a pull request
for when you've updated the branch.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
