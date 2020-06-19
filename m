Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA6201DF4
	for <lists+linux-afs@lfdr.de>; Sat, 20 Jun 2020 00:22:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTg13NOALIA8CqaCZx0kkgVahhkx4VJpNeEAbSq5kQM=; b=N3ehrVgpq87n1O
	f88pkmjqZUT0iSmNDGJGStn4WQENltYeoKd89zMXEVp8SbjnX++R85tEyNpjomvMAx9p2Mt2qeV5r
	dKR1wFc9zUHZ4IC+mLv2JZuwh3nBOyNc+qRo3TDlkcgBajJUUVY1/A2M5gf1Blmv5Vo4LM5LmrVIL
	e5ZSgLzhzJzUFG2wj35BZk3KZtiPZkV6fG9BSg+2Q/yvQfh4r5elQqLkxjhATCUL8pNkHfynSqDh0
	3plhl0DdkXGTGjO9Q4yyjG0LWMmf2Uvsm56Ezky0U/ovhBIbgG8wAlbae0hyBRFVxsTfnAu4Extse
	IU2ChfQdLCpdTo6A3PUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmPOw-0007KM-CJ; Fri, 19 Jun 2020 22:22:22 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmPOt-0007K0-Hi
 for linux-afs@lists.infradead.org; Fri, 19 Jun 2020 22:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592605337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KckeDijG9hpK4dBhAcGm37ROV9Z0JbkQ/pdnyqRrzZU=;
 b=Da78qu+QjUoFcH62ZfKyG1tw/yxDvsGACYVBcq2/T/beE+TouR9evv+W2UAQICHM39/04U
 gyGmyXFEX/h2iyjSnub1TNz6K5zIMjbAHdz0wxODJpHFPFJSAjWgJtbL2+J+pb1RU+LW4U
 ARw1l1+OE2ZbqAr+rbZuBV0AkAy7dYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-PIKCnAkpPOuGYwEIMmjiMg-1; Fri, 19 Jun 2020 18:22:15 -0400
X-MC-Unique: PIKCnAkpPOuGYwEIMmjiMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 668F3464;
 Fri, 19 Jun 2020 22:22:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA75B5BAC3;
 Fri, 19 Jun 2020 22:22:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <0000000000005805de05a87732bf@google.com>
References: <0000000000005805de05a87732bf@google.com>
To: syzbot <syzbot+d3eccef36ddbd02713e9@syzkaller.appspotmail.com>
Subject: Re: net-next test error: KASAN: use-after-free Write in
 afs_wake_up_async_call
MIME-Version: 1.0
Content-ID: <2215551.1592605332.1@warthog.procyon.org.uk>
Date: Fri, 19 Jun 2020 23:22:12 +0100
Message-ID: <2215552.1592605332@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_152219_664244_D5E6AA05 
X-CRM114-Status: UNSURE (   6.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.211.31.120 listed in wl.mailspike.net]
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
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 dhowells@redhat.com, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

syzbot <syzbot+d3eccef36ddbd02713e9@syzkaller.appspotmail.com> wrote:

> This crash does not have a reproducer. I cannot test it.

This should do it:

	insmod fs/afs/kafs.ko; rmmod kafs

David


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
