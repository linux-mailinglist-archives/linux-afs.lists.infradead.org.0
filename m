Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786A1FA568
	for <lists+linux-afs@lfdr.de>; Tue, 16 Jun 2020 03:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4PCyd1q4mhbH8omV/Wh7KK4CybYaUw2C7dnhbHkoe8=; b=lMVBxiqeR2jXEZ
	eSUvcUk43QsCy5DP1GPo7SgHrm1s2sHaek5DBE+iXO0m9xUB/l44JH+cgB4pJj7Z3yxq6akzTI+ca
	TdkrH+YVbNsc7Adso3zWBwXmykzmtoDdwc788Rp+YcDcMi/bDOcHe200aracJL0HD4Nx35nVoPrf/
	9V/jWLuB+LykLumthpE3onsp16aHq/h5Hly+BnFeeT5t0cjLXoSiRu2Kizb2X8/mXtmtmhFr0Y2/i
	QFcXkl+SNyYonIaI2Lme5XvRCdo9YQn2irrfgfemRFkyqfmxx1ik3xnvjFCJqhyNUvOvFr59yHy4Y
	eKIVA8huOZP96HaKtqtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl06H-00019x-Oj; Tue, 16 Jun 2020 01:09:17 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl06E-00019M-Kt
 for linux-afs@lists.infradead.org; Tue, 16 Jun 2020 01:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592269752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ETWPRcEqi2xYFGp+N9uQV1NdwMdzaSSeQcMx7Y54xII=;
 b=fynY8KlQ0wPJzTOR0hB2QsARRE4CEPkp/T2nON5CPUOHx17+uJOem06QxjBhmwLQ6EnMEf
 S1ODIS8HxlGXYUR6v2hmkD4J1Jde7N0jTXl0KJz+J5BB5bolwwVCeuXbx2IxC8v9CUGYg2
 bDicH8/OgRGsjQ09ipKTJvWQKuh20ps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-IK-OBL4MO1ew5gV1Gmu6rw-1; Mon, 15 Jun 2020 21:09:10 -0400
X-MC-Unique: IK-OBL4MO1ew5gV1Gmu6rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BE8010059BA;
 Tue, 16 Jun 2020 01:09:09 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 079B060C05;
 Tue, 16 Jun 2020 01:09:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200615232751.GA22366@embeddedor>
References: <20200615232751.GA22366@embeddedor>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] afs: Use array3_size() helper in
 afs_extract_to_buf()
MIME-Version: 1.0
Content-ID: <761786.1592269747.1@warthog.procyon.org.uk>
Date: Tue, 16 Jun 2020 02:09:07 +0100
Message-ID: <761787.1592269747@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_180914_758635_1364F7D9 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: dhowells@redhat.com, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-afs@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Gustavo A. R. Silva <gustavoars@kernel.org> wrote:

> Use array3_size() helper instead of the open-coded version in
> afs_extract_to_buf(). These sorts of multiplication factors need
> to be wrapped in array3_size().

For afs_deliver_cb_callback(), this adds redundant checking, as does the one
on the kmalloc() on the preceding line:

		call->buffer = kmalloc(array3_size(call->count, 3, 4),
				       GFP_KERNEL);
		if (!call->buffer)
			return -ENOMEM;

because directly above them is a range check:

		if (call->count > AFSCBMAX)
			return afs_protocol_error(call, afs_eproto_cb_fid_count);

limiting the array size to 50.

Further, note that it's *not* a 3D array.  3 * 4 is the element size and is
constant.  I've written it that way as the block is 3 XDR units, but the block
size is actually 12 bytes.

The one in the kmalloc() should also not be using array3_size() for the same
reason.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
