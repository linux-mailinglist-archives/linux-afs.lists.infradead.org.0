Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB514E56E
	for <lists+linux-afs@lfdr.de>; Thu, 30 Jan 2020 23:15:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GhNb6t6Hiv4SlwUaMzMnqhsWOLI8l3ZV1cKUHM0ngX4=; b=uaLjBoiuWO957A
	5Yl9SgMx9xT2xH12b+1Yrp+cOsWpGvt5zZgqSfAQBb4CLPzwMpqMLX4Ub/o+x/Ip5L4eVnX9PcsgQ
	WhUfDTgWALn1AZNn+IiERP654ukiGA04wfv5ZG8KYjR/XMP6yueq3JqNE7ghpRAOEyhdCn1korCmF
	v/Pph0sOVzPme5wStnqC6wTpmUeisyv9x38iqOtCZ0i1Z4kOpeeyjEHICbWVfFax2NeM42P1Pb50O
	ocZKN3hahhJrSvlBZ+bOEs35rXqgjNQzhhVY1X2xMcMTFNqgtWDUN5MqgAzt40g5NTCE6Ide4yBOI
	i8KNDeTQQxpUF1iCazlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixI63-0004t9-SG; Thu, 30 Jan 2020 22:15:35 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixI61-0004ry-41
 for linux-afs@lists.infradead.org; Thu, 30 Jan 2020 22:15:34 +0000
Received: by mail-io1-f72.google.com with SMTP id n26so2923536ioj.1
 for <linux-afs@lists.infradead.org>; Thu, 30 Jan 2020 14:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to:cc;
 bh=+k7iDP+b+RSppJNVffwutaADbltSwq9ahKvDsUQFSno=;
 b=rKaC8uaDggTb06++xyqujqiPWeQmXDpFL2UYVJEbmO25syOzL5/S/a3ESt16fHKJIa
 Bha6hHsYzcPXzHQCx11jSuZG+Sno2ljsla9y4TuiYftgOjJSTANVwj1+mEPIuSzgTJwi
 Rvuuzts6ZgkrtmxT48hkeVro2mTSjVH8rUvyOGXQz9CotNEv5utuK9ARTTjbjqctckh0
 sO3L1z3RvLyilZ1PoMdOQwWQuViRpVWAvRo4AUCynPdwbknM4lP0CgwoxCogMhLVapzb
 2FIz+azq/aoI7fA1F2ELkFFoANXtK1F6dkmOdIoHlM8lyp/t9m3BaMuKuO2qo2yN/Fyc
 XOBA==
X-Gm-Message-State: APjAAAWUcApyXxJ4Xq1Xhd9nD8p0qrROpfNPv9fdQR2DTwPWNcX8CCdI
 43J9UJg9ju0LoFvY4LSbCu2z169p/XZbpcQ2XL23hjCMwhdP
X-Google-Smtp-Source: APXvYqzCBZ/4ytbfQ/bruKEWdSfGIalMqVxY1nmEN/PfITi1/h8RpCDn5XQ2z28pfaS1iyaRrIPuWw325giOjT+XycQu/RjlaEmK
MIME-Version: 1.0
X-Received: by 2002:a92:8141:: with SMTP id e62mr6399121ild.119.1580422531620; 
 Thu, 30 Jan 2020 14:15:31 -0800 (PST)
Date: Thu, 30 Jan 2020 14:15:31 -0800
In-Reply-To: <3725016.1580422520@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000097a7d3059d62cbd4@google.com>
Subject: Re: Re: KMSAN: use-after-free in rxrpc_send_keepalive
From: syzbot <syzbot+2e7168a4d3c4ec071fdc@syzkaller.appspotmail.com>
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_141533_160351_D9040E70 
X-CRM114-Status: UNSURE (   4.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.6 (++)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (2.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 2.0 SHORT_SHORTNER         Short body with little more than a link to a
 shortener
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
 dhowells@redhat.com, glider@google.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git e4866645bc264194ef92722ff09321a485d913a5

KMSAN bugs can only be tested on https://github.com/google/kmsan.git tree
because KMSAN tool is not upstreamed yet.
See https://goo.gl/tpsmEJ#kmsan-bugs for details.

>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
