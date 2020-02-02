Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E0A14FF1C
	for <lists+linux-afs@lfdr.de>; Sun,  2 Feb 2020 21:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+B6lSRHrrwaJsB8hzw0RMHZhUhiRS+DZXAUAN8xYgw=; b=Smyq/DA8eXsUeg
	hv7rgG586UYGceiTuPAGZ484dFlf46Lrz4x2/gs7Jc1q8yUN4VtQswqufXYVM4TDclDISycmi8h9o
	i9wc/1HS7V6b3FwFLLMIxsQwswiinbjTJJhmb3HRjbiwSQ1TsbMVOFCndRPbaVq0G/WubI5sTlwW+
	b6/Grkf5G6eZwG58/iRvRLbncjW9Z8DNJZnMhc2DhSWhKFbhaFVy+u/RmMxdjl5j3n9m0yp2KOQz2
	61ITzv4Wk/ODQ/on499GxQ9aPiqFe42OMTFn0ygV8RU0HNYD5j/EAiCpIZTaqrgqboQzYRk954yqD
	wER6MBLBgz0aQSfN33gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyLqI-0003jk-AR; Sun, 02 Feb 2020 20:27:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyLqE-0003j7-M0
 for linux-afs@lists.infradead.org; Sun, 02 Feb 2020 20:27:40 +0000
Received: from cakuba.hsd1.ca.comcast.net (c-73-93-4-247.hsd1.ca.comcast.net
 [73.93.4.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD63D20658;
 Sun,  2 Feb 2020 20:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580675256;
 bh=RS07e3Qlj1ZE6hT/yNk/el9AIRQKLw4CMrmg2qCg/60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mIPiQLt75OcS5pTPQNLZx59Z0lqL6H64LQyCZQ98NAFNg7AKYOUa0brVUY209GSUN
 jzlpVS9hpS178mm3k/pWhWt0Kaw5oXIhR2WZ9v9prdm+Vc3k5pA5D4xOxE1zPeOeop
 G6IG0Rkd4V4ubK5pQCt45OMEzfWJMY4lHKcpO0Vs=
Date: Sun, 2 Feb 2020 12:27:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net 3/4] rxrpc: Fix missing active use pinning of
 rxrpc_local object
Message-ID: <20200202122735.157d8b44@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <158047737679.133127.13567286503234295.stgit@warthog.procyon.org.uk>
References: <158047735578.133127.17728061182258449164.stgit@warthog.procyon.org.uk>
 <158047737679.133127.13567286503234295.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_122738_737979_8DB2CDFF 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, 31 Jan 2020 13:29:36 +0000, David Howells wrote:
> diff --git a/net/rxrpc/conn_event.c b/net/rxrpc/conn_event.c
> index 808a4723f868..abfff3e0921c 100644
> --- a/net/rxrpc/conn_event.c
> +++ b/net/rxrpc/conn_event.c
> @@ -133,6 +133,8 @@ static void rxrpc_conn_retransmit_call(struct rxrpc_connection *conn,
>  		break;
>  	}
>  
> +	BUG_ON(!conn->params.local);
> +	BUG_ON(!conn->params.local->socket);

Is this really, really not possible to convert those into a WARN_ON()
and return?

>  	ret = kernel_sendmsg(conn->params.local->socket, &msg, iov, ioc, len);
>  	conn->params.peer->last_tx_at = ktime_get_seconds();
>  	if (ret < 0)


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
