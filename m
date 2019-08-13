Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E07038BD26
	for <lists+linux-afs@lfdr.de>; Tue, 13 Aug 2019 17:30:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:MIME-Version
	:Subject:To:References:In-Reply-To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vI42VEmZerRqKMm+z5tAqw4jJdAtrvvaf0peOMuiAQ=; b=ex1Zrv4EpcFCUi
	QcGK6A0KyeX3SHM4DhK3yzxcy02e+hfvgF2dULg/GgJK6s/WIxcIF+R3MxQKmSIrVreBsOqOqKvkX
	KybnDECmtLnj5LoXI1HVfcDoDtpYHI/XjRyIgnYhpBrryWnCXDKEFJOo5vVmezYNgQCvk3GHpUWqz
	QyB8xFozHjwWgLeQIKhalf50aeQZd1a7Odndn96KOCCMxxpp7/q0usP+ddszHQrK/89ipD68ctUNb
	vtA9I2pNAJJrOmj5EBuTRmtakTa01+zo3v6fmZ84nCbSj6qE89kpMe/QLw96sgX6TPmEZNWiHkyXZ
	Y92NU0x7lDus4zZzvUcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxYkG-0005lL-Sf; Tue, 13 Aug 2019 15:29:56 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxYkD-0005kQ-Qu
 for linux-afs@lists.infradead.org; Tue, 13 Aug 2019 15:29:55 +0000
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60DCC30016E4;
 Tue, 13 Aug 2019 15:29:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A83851001948;
 Tue, 13 Aug 2019 15:29:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CACT4Y+YVyaTrwpaZfpfi9LKA=5TOdKSL60pjAH04dMPNCZTMSQ@mail.gmail.com>
References: <CACT4Y+YVyaTrwpaZfpfi9LKA=5TOdKSL60pjAH04dMPNCZTMSQ@mail.gmail.com>
 <0000000000004c2416058c594b30@google.com>
 <24282.1562074644@warthog.procyon.org.uk>
 <CACT4Y+YjdV8CqX5=PzKsHnLsJOzsydqiq3igYDm_=nSdmFo2YQ@mail.gmail.com>
 <20330.1564583454@warthog.procyon.org.uk>
 <CACT4Y+Y4cRgaRPJ_gz_53k85inDKq+X+bWmOTv1gPLo=Yod1=A@mail.gmail.com>
 <22318.1564586386@warthog.procyon.org.uk>
 <CACT4Y+bjLBwVK_6fz2H8fXm0baAVX+vRJ4UbVWG_7yNUO-SOUg@mail.gmail.com>
 <3135.1565706180@warthog.procyon.org.uk>
 <CACT4Y+YCB3o5Ps9RNq9KpMcmGCwBM4R9DeX67prQ9Q3UppGowQ@mail.gmail.com>
 <8013.1565708810@warthog.procyon.org.uk>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: kernel BUG at net/rxrpc/local_object.c:LINE!
MIME-Version: 1.0
Content-ID: <28571.1565710190.1@warthog.procyon.org.uk>
Date: Tue, 13 Aug 2019 16:29:50 +0100
Message-ID: <28572.1565710190@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 13 Aug 2019 15:29:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_082953_893846_700EEAC5 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
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
Cc: Eric Biggers <ebiggers@kernel.org>, netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-afs@lists.infradead.org,
 dhowells@redhat.com,
 syzbot <syzbot+1e0edc4b8b7494c28450@syzkaller.appspotmail.com>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Dmitry Vyukov <dvyukov@google.com> wrote:

> It only collects console output. I don't know what is trace log. If
> the trace log is not console output, then it won't.

Assuming the system is still alive:

	cat /sys/kernel/debug/tracing/trace

David

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
