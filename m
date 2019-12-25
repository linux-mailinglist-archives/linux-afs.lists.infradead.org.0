Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D30EB12A535
	for <lists+linux-afs@lfdr.de>; Wed, 25 Dec 2019 01:16:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUwZDO+iC/H+YJzJTE82I8p4U6Uzf3g28zoFAlryXq8=; b=aq1sGGKTJKleBW
	P1dISYpUGAjk+Ohg5xA4/ZkXaLFn8GIxgaZqJmuRv/957/K6kd5pm4lZjMHWK2NvY4C125xd+fSG0
	LzxzIsp5D31uyfE05g4yBClBwk1YnhUPzXiQe216xfFhExEfCb5dPXaQAmNF6oNE/xW+GmuJWEhAJ
	u8VcFDlvX4lXllhR7HeFGSRv6/ae6vj/LmtlJLKBJc0WZjt6AFStX1qzHGMbIigYf56wcoNl7PjoD
	DOtnBIaHLI1c0kL+DfMYU+Wd05BJftZ0rGBYAwhNrXTe/VZkbuDUb/sy7cQ9N3rEi9t/Q6i77nGES
	69YWM4OY+2AYHKVDJOQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijuL6-0000f3-Vp; Wed, 25 Dec 2019 00:15:49 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijuL4-0000eK-BA
 for linux-afs@lists.infradead.org; Wed, 25 Dec 2019 00:15:47 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C497C154CCC3F;
 Tue, 24 Dec 2019 16:15:39 -0800 (PST)
Date: Tue, 24 Dec 2019 16:15:39 -0800 (PST)
Message-Id: <20191224.161539.500554691107655943.davem@davemloft.net>
To: dhowells@redhat.com
Subject: Re: [PATCH net 0/3] rxrpc: Fixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <157688311975.18694.10870615714269857980.stgit@warthog.procyon.org.uk>
References: <157688311975.18694.10870615714269857980.stgit@warthog.procyon.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 24 Dec 2019 16:15:40 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_161546_384359_B5F7F471 
X-CRM114-Status: GOOD (  11.33  )
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

From: David Howells <dhowells@redhat.com>
Date: Fri, 20 Dec 2019 23:05:19 +0000

> 
> Here are a couple of bugfixes plus a patch that makes one of the bugfixes
> easier:
> 
>  (1) Move the ping and mutex unlock on a new call from rxrpc_input_packet()
>      into rxrpc_new_incoming_call(), which it calls.  This means the
>      lock-unlock section is entirely within the latter function.  This
>      simplifies patch (2).
> 
>  (2) Don't take the call->user_mutex at all in the softirq path.  Mutexes
>      aren't allowed to be taken or released there and a patch was merged
>      that caused a warning to be emitted every time this happened.  Looking
>      at the code again, it looks like that taking the mutex isn't actually
>      necessary, as the value of call->state will block access to the call.
> 
>  (3) Fix the incoming call path to check incoming calls earlier to reject
>      calls to RPC services for which we don't have a security key of the
>      appropriate class.  This avoids an assertion failure if YFS tries
>      making a secure call to the kafs cache manager RPC service.
> 
> The patches are tagged here:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
> 	rxrpc-fixes-20191220

Pulled, thanks David.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
