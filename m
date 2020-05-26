Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FEC1E26BA
	for <lists+linux-afs@lfdr.de>; Tue, 26 May 2020 18:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VxQY/bYJVfUUVzWDPNyaFZ1+d4gTGx8EjwAlrtMgGh8=; b=N3Xc/CXSDHFvMm
	kHd1wkNq6QWK0q1zUEt11D15JBjs9NSIm4TfPESiX6vNfBU7SXhqZPq1wf4MbRMNWke+f1I2lDQAS
	r17vOLjeTinx39txvwmeVI5/Y77YPpwX/rLZtR/dZt0UMyR9eHJHVxNcowB6DMTPn2DnrZX3s06LR
	OKDlgdQ6Y/r6Lq4WUnNU9PeSf2yBfxqdmPEwLnVsaQtshtaSOxwtY6SjzDRODqCo+oqw6sMVNwDug
	QiZ8H66RHROEKUtqRKCOCaip/mL7wym+X1snlyuhuM7k6Ylx7dYNNQiEiB7xYLpbyiHx44S/40V6t
	FYP0BDT5DmkT0mawNdFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdcIL-0008Kr-6W; Tue, 26 May 2020 16:19:13 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdcIH-0008FH-KA
 for linux-afs@lists.infradead.org; Tue, 26 May 2020 16:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590509946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hN2Hvu1E+MNK/Jpuu31JE8GIcAFc/Q6IIqnIGW+R/bo=;
 b=HNhkO8sHTx6zbCPWCmNLQG68fGaVJ+zbKWCNv1Q2bFOPDnnw4ND7SKyC8pxIDEn1PL6CBz
 j7LJdtr0A7gUt6ylzT5b4FupV5hb/mSEYQ+YE3njyzo0m7je1TtLwcpnZUvn+P7DtyNROU
 repP+Kh3BNZBTSecdAiHGX84o6faPGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-lYY4dhG4NTKgP84AbEnxBQ-1; Tue, 26 May 2020 12:19:03 -0400
X-MC-Unique: lYY4dhG4NTKgP84AbEnxBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D29461;
 Tue, 26 May 2020 16:19:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25C265C1BB;
 Tue, 26 May 2020 16:18:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1590415886-52353-1-git-send-email-xiyuyang19@fudan.edu.cn>
References: <1590415886-52353-1-git-send-email-xiyuyang19@fudan.edu.cn>
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Subject: Re: [PATCH] afs: Fix afs_cb_interest refcnt leak in
 afs_select_fileserver()
MIME-Version: 1.0
Content-ID: <3193792.1590509939.1@warthog.procyon.org.uk>
Date: Tue, 26 May 2020 17:18:59 +0100
Message-ID: <3193793.1590509939@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_091909_742471_B1488C75 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.61 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [205.139.110.61 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Xiyu Yang <xiyuyang19@fudan.edu.cn> wrote:

>  	error = afs_wait_for_fs_probes(fc->server_list, fc->untried);
> -	if (error < 0)
> +	if (error < 0) {
> +		afs_put_cb_interest(afs_v2net(vnode), fc->cbi);
>  		goto failed_set_error;
> +	}

Ummm...  Did you try this?  afs_end_vnode_operation() should then cause a
double free because you don't clear fc->cbi.

You can try it by installing the kafs-client package if your distribution has
it available and starting the afs.mount service or doing:

	mount -t afs none /afs -o dyn

and then:

	ls /afs/grand.central.org/

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
