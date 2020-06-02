Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B1A1EBF80
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jun 2020 17:58:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2sCbzXTXTTkmnuD1c8ARfa9SKoHNEfkjZA7oOXiG+k=; b=btHqjkW2XKED5x
	LyXPvJ1RcJ9wF1GzODcWLCtgEbqKUxwHC9DpoFcL3eoTBqaY+jjHqA5F/jDb6Q8C+OZ9CI2ZrxxKK
	IgrOjFBp43SGawZjHaN97i+KYI+shMfyF0JY/BVynRiQrhtOPwRYmgUAwdqcIXV5xd+ynTlosH2yA
	MuFbuposSvC9oCd2LsXmioyBDfQQk1ZxLeMOe6mYCM0XHtVuOXQbaWgKu9mJmECNSnLVbcFzV4cK+
	ziY3AbPA5OkMkVCjso8MYZ7AhMKrGHk7w0uSZj8Kj1dbs4FPpLBolDljDSNyKUzSDIw20fvhC+bD6
	BACdpI10ehjTxICHYYWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg9Id-000393-Oc; Tue, 02 Jun 2020 15:57:59 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg9Ib-00038l-BF
 for linux-afs@lists.infradead.org; Tue, 02 Jun 2020 15:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591113474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASapiG1/TIS7H1SxUqbkFSMoaWA/OIJ5pQnMhbATzrQ=;
 b=UMZTjsmZxCEWul1paEA/8Xs5PMInd8rrx0akvh9oaYSxY2enBUW5SVigjQRTm+8c8qodza
 eT5Vvf98NSXANYaeaCEeVkomOYBmkE0oas7wwLx1XM93ZGzE4jS1lNEfM1zoZ6KYE6eOkc
 RAsiAOKLiiw7VlFG8tFIhnTXfu1/Jfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-ktdmV6otPgG0CWWrUc8lSQ-1; Tue, 02 Jun 2020 11:57:42 -0400
X-MC-Unique: ktdmV6otPgG0CWWrUc8lSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B14C4107B0EF;
 Tue,  2 Jun 2020 15:57:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE51A1BCBE;
 Tue,  2 Jun 2020 15:57:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200602153505.64714-1-colin.king@canonical.com>
References: <20200602153505.64714-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] afs: fix double kfree on cell_name on error exit
 path
MIME-Version: 1.0
Content-ID: <1504659.1591113454.1@warthog.procyon.org.uk>
Date: Tue, 02 Jun 2020 16:57:34 +0100
Message-ID: <1504660.1591113454@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_085757_460155_3D9A9103 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: dhowells@redhat.com, kernel-janitors@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The error exit path is currently kfree'ing cell_name for a second time,
> the previous kfree of this object occurred a statement earlier. Fix this
> by removing it.
> 
> Addresses-Coverity: ("Double free")
> Fixes: 6147fe6b7f8c ("afs: Detect cell aliases 3 - YFS Cells with a canonical cell name op")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I've folded it in, thanks.

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
