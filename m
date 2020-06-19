Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DABBB201DC1
	for <lists+linux-afs@lfdr.de>; Sat, 20 Jun 2020 00:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lc2gJoYgtDExdIQCwL2rWejUdNEiBrgRW76bvR83FE=; b=qxnh/MGdjYKNQE
	dybHuCeYcK4QZcDPU48/19RpCRsbhBfpm1Cl2tLGxNqr1nSpZDo4mzr9EZCDlGEw0f4nwwb5P1UDN
	2LEPenbTHCQPvGaVaaFceIKzk4pfG92CMHKUzAv5UQS/n1wbv5pXIsYEXFbicitg9EtZ5GS1mMsQ2
	rMux5JC/U4m3sZlFoF9ESTjRYeyzAkZxkAqx6kN6fqsq5hCTyGaaXsqfF10TaF05QHNvypnYdsC0J
	wX0ZYU2eF9XEOMny80TiMh+Qre3fThpkJaLcAYMkkbkGFEyxzH79jfU2q3ewc+ylPRIe0XQLmxMUn
	jjlGSI6hXw4+rZ7kIfKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmP7l-0003vt-CC; Fri, 19 Jun 2020 22:04:37 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmP7i-0003vW-67
 for linux-afs@lists.infradead.org; Fri, 19 Jun 2020 22:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592604272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zE25PztAeYspSZdKFWX6ttU7TX+nk2oGIiHynCDXJVA=;
 b=c9tbFhBla7yqHK+Iee8j/wFuseM71ckc1Whbg2I6fMPzk7Y2xpx5d4lwsD3DMDp9rPsK9P
 qaC1kgvb0D7Wzfe7L+OSI/wJBMa9jT2hKZdTsQhacpggg5bmG0XLGE3JrZnLGsppAlGKsM
 Xt/vbl+UKgFO9kUhyzYnUNcU90iT3kI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-fRbPtyloNCaZ-wjkOgiVgQ-1; Fri, 19 Jun 2020 18:04:28 -0400
X-MC-Unique: fRbPtyloNCaZ-wjkOgiVgQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91E7B18585A4;
 Fri, 19 Jun 2020 22:04:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1BC1002382;
 Fri, 19 Jun 2020 22:04:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <00000000000042f7b405a86969e4@google.com>
References: <00000000000042f7b405a86969e4@google.com>
To: syzbot <syzbot+0710b20f5412c027fefb@syzkaller.appspotmail.com>
Subject: Re: bpf test error: KASAN: use-after-free Write in
 afs_wake_up_async_call
MIME-Version: 1.0
Content-ID: <2213247.1592604265.1@warthog.procyon.org.uk>
Date: Fri, 19 Jun 2020 23:04:25 +0100
Message-ID: <2213248.1592604265@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_150434_293155_3D6B7606 
X-CRM114-Status: UNSURE (   5.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [205.139.110.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.139.110.120 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: daniel@iogearbox.net, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org, ast@kernel.org,
 dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

#sys dup: net-next test error: KASAN: use-after-free Write in afs_wake_up_async_call


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
