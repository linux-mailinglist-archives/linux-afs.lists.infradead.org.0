Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DBFA55D1
	for <lists+linux-afs@lfdr.de>; Mon,  2 Sep 2019 14:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R/sfsjtfiNBAkaMxCkC8Mz80Xr6CpyjLwp0nzybX0ZY=; b=dmJJHt9l+WazeA
	BQ8+iZag2yamziklk8BmOyp19LGm8rVIe/LUXd54wcWudvDS0N5V5Uoi/3AXMMMurZzbZiPJcHkU1
	085FptUsAmAWRhA6Xi1K1tQzVc6/mHvF28gVZFbJv4zaK7ESOIDYq5qE/1FzcHXC69jm6pCrCtU5E
	7b4fIdQiBipa6uHPzr4E4ZcBkZHSOxd4Xfo9e6Fd41rTNqWD1dQAty2h8SlVA07wisLQSG6D3vom4
	ZGIDMaSQJPiLzE+55ks5CuycTEiaaBUbN63D1lPDVsRM1Vh0yaULFNd11Xc5t7PEVocKezrmka4D7
	ncuDTEX2LIMWlFu24I9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4lNH-0002As-Go; Mon, 02 Sep 2019 12:23:59 +0000
Received: from mail3-166.sinamail.sina.com.cn ([202.108.3.166])
 by bombadil.infradead.org with smtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i43zk-0002Gg-0v
 for linux-afs@lists.infradead.org; Sat, 31 Aug 2019 14:04:50 +0000
Received: from unknown (HELO localhost.localdomain)([114.254.173.51])
 by sina.com with ESMTP
 id 5D6A7D340002E284; Sat, 31 Aug 2019 21:59:18 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 81418654922483
From: Hillf Danton <hdanton@sina.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net] rxrpc: Fix lack of conn cleanup when local endpoint
 is cleaned up [ver #2]
Date: Sat, 31 Aug 2019 21:59:06 +0800
Message-Id: <20190831135906.6028-1-hdanton@sina.com>
MIME-Version: 1.0
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190831_070448_250777_A58B356C 
X-CRM114-Status: UNSURE (   4.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [202.108.3.166 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (hdanton[at]sina.com)
X-Mailman-Approved-At: Mon, 02 Sep 2019 05:23:57 -0700
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
Cc: marc.dionne@auristor.com, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


On Thu, 29 Aug 2019 14:12:11 +0100 From:   David Howells <dhowells@redhat.com>
> --- a/net/rxrpc/conn_object.c
> +++ b/net/rxrpc/conn_object.c
> @@ -398,7 +398,7 @@ void rxrpc_service_connection_reaper(struct work_struct *work)
>  		if (conn->state == RXRPC_CONN_SERVICE_PREALLOC)
>  			continue;
>  
> -		if (rxnet->live) {
> +		if (rxnet->live && !conn->params.local->dead) {
>  			idle_timestamp = READ_ONCE(conn->idle_timestamp);
>  			expire_at = idle_timestamp + rxrpc_connection_expiry * HZ;
>  			if (conn->params.local->service_closed)

Is there any chance out there that this reaper starts running one minute
after the dead local went into graveyard?


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
