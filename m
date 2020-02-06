Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0F15449B
	for <lists+linux-afs@lfdr.de>; Thu,  6 Feb 2020 14:10:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfoM2hwWWIDP2L+3PIvLyHla3o8bofPYfwdCf6TKOls=; b=T2LOLaNtrpu2GK
	sjGYq4NjyukDxmC0WB5n9gjDKP4F4unJjH5HuZCcDDaLCDzfQUA014pXkY0mPVBnldu9xBT+a7j9R
	9OnvRJq9joCNJXk7vviiv2qyINXwGDb2N6yfAHfYNfZuUDX1JUIgKCr9qQDm8eVQl53EGkQ/JhJIL
	V7Xo87ZJgF7T+2n1QJsbDNx1J0gOqFxMvkCPkcjknWk+7u5ozu/iNv0faaxZS75GA2e7XFPj/wuil
	bKKd6ylOD8l1WrouqZykqabl+Rd8CmZpiDBWIzm2ROhFAWwBj+M7UPT7q8ixhZC0Lqrj9AucE/tNP
	0ePQ1PQ9iEp/nJPLY9ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izguo-0004gU-CR; Thu, 06 Feb 2020 13:09:54 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izguj-0004fR-PS
 for linux-afs@lists.infradead.org; Thu, 06 Feb 2020 13:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580994586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZgKjq5f4oMoXVI4WqrUXov10JILu8ei/f35tvvz5Kbg=;
 b=FTO7/8tDOr6uQuCyWV1BMHo8ZKq3n535OaqJJ/MNeU5au9P1DrZLmyPmjERN7YRpCBNO4i
 lwzUvGwbXKOh5Y98Lt9nZqlQAGZJNrbE6G2YfDjBxWaR+xFwgHGZOcj0vhS3Bqp9stXRaH
 fl+Cw8XT8EY27Mem6+BAPue83HrXMJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-qH7P_AwpP2eTBjAnESgrMQ-1; Thu, 06 Feb 2020 08:09:41 -0500
X-MC-Unique: qH7P_AwpP2eTBjAnESgrMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E51104D419;
 Thu,  6 Feb 2020 13:09:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-218.rdu2.redhat.com
 [10.10.120.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B996E90536;
 Thu,  6 Feb 2020 13:09:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200204084005.11320-1-hdanton@sina.com>
References: <20200204084005.11320-1-hdanton@sina.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: inconsistent lock state in rxrpc_put_client_conn
MIME-Version: 1.0
Content-ID: <2183051.1580994576.1@warthog.procyon.org.uk>
Date: Thu, 06 Feb 2020 13:09:36 +0000
Message-ID: <2183052.1580994576@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_050949_907024_AFDF21AF 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, kuba@kernel.org,
 syzbot <syzbot+3f1fd6b8cbf8702d134e@syzkaller.appspotmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hillf Danton <hdanton@sina.com> wrote:

> Take lock with irq quiesced.

I think that's overkill.  It only needs _bh annotations, not _irqsave/restore
- but even that is probably not the best way.

The best way is to offload the stuff done by rxrpc_rcu_destroy_call() to a
workqueue if called in softirq mode.  I'm not sure whether rcu callbacks are
done in softirq mode - if they are, then it can just call rxrpc_queue_work().

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
