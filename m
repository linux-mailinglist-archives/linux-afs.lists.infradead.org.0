Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 269407841D
	for <lists+linux-afs@lfdr.de>; Mon, 29 Jul 2019 06:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A061iVkqlRVOmBa8UpNSn0r/ZOpTt/5vVyABrIkKO8k=; b=eEhaRz0RiRrwBS
	vWR/c9FoCFfOpR6G2IMRU0aXPNrAaZvTNWy7Lh5nIWqSYTvBMJ2ztuBCsvzA0zoY6x8aqgbqeApgo
	3JqoAjtk4s3bWEUP7Nu7/ylf5FDwCXmwiTWBwSiFQGFfDdkl27MBqzRymwEWYmGUi1yHT+1xHi77V
	yPjyGobj5sb1XibOIYJ1KzxzEEwtNZ2XJwGAMsAYXeXAouT5WyDiv93wnoGRpS7sfUVASrflBPpPv
	yetwrI4xrGXEQhHhKqNh6a6aJdOQCY3xT4qxfNzqt60rLF8ts+X9qiOEWRQfYAr1XkMudengaEG2i
	BN4VFNGxCft+VPCHjR0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrxGP-0001Wi-L5; Mon, 29 Jul 2019 04:27:57 +0000
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrxGM-0001WH-II
 for linux-afs@lists.infradead.org; Mon, 29 Jul 2019 04:27:56 +0000
Received: by mail-pg1-f178.google.com with SMTP id i18so27540111pgl.11
 for <linux-afs@lists.infradead.org>; Sun, 28 Jul 2019 21:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=VLEiorShk3C9V3ZndHt66LUaAu/4a6WK6W4QGRxC9so=;
 b=tpxr3B3kMU8PiERISgcIRN0Wl0glhM6AMpreJ1pc6MHzcFOPvFvrIb8fI8Qw/mYY/K
 5nMqo/Oh3sjOLT23mem+j2FcEcnlsXF8s7ZkpIDo+NVY3+jB+GubpCaSoailkTYgOQ8F
 OsebquKdqSj55DvcHQ5ENB/dzt6dRhwE3jqqozCEs0O95jMi3u1I4lm/1/tgRnhbKjED
 kvh0eybisYyW31qDe0qZXMwjo3leDv4anYaKaxixdbCKD9s6RC6Fv5qhHGKw5L2x2oIv
 jIjsEBtunotn5qlqXErsYDkEaX3KiHQ4NwaqO/7H20IqpZNEk7p5eFc0LysR+PwL8GKT
 tfwQ==
X-Gm-Message-State: APjAAAWffw9Y4hk2hliApNbhCsVljTGICb2kdkZVG8E4KeXd9gTF7Pxi
 /CZ+QDlhvbbJVyhAerr8FIjciNIHzyI=
X-Google-Smtp-Source: APXvYqwIB3gPpY9Kf3XsvhcsY/pCgX+qrlL/1ootks1H3EQNhpS3nuZwugEaDvRbQajyAybzqf3eDQ==
X-Received: by 2002:aa7:9f8b:: with SMTP id z11mr35339558pfr.121.1564374470287; 
 Sun, 28 Jul 2019 21:27:50 -0700 (PDT)
Received: from fedora19.localdomain
 (2001-44b8-3177-ac00-b321-eb44-0783-2320.static.ipv6.internode.on.net.
 [2001:44b8:3177:ac00:b321:eb44:783:2320])
 by smtp.gmail.com with ESMTPSA id a128sm65726040pfb.185.2019.07.28.21.27.48
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 21:27:49 -0700 (PDT)
Date: Mon, 29 Jul 2019 14:27:45 +1000
From: Ian Wienand <iwienand@redhat.com>
To: linux-afs@lists.infradead.org
Subject: 5.3.0-rc1-afs-next-48c7a244 : afs_dir_check_page(9fcb): bad magic
 1/2 is 0000
Message-ID: <20190729042745.GA20647@fedora19.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_212754_607825_7663DAED 
X-CRM114-Status: UNSURE (   5.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.178 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hello,

We got a single instance of an error I hadn't seen before on
5.3.0-rc1-afs-next-48c7a244

 [Sun Jul 28 23:00:25 2019] kAFS: afs_dir_check_page(9fcb): bad magic 1/2 is 0000
 [Sun Jul 28 23:00:25 2019] DIR 20000026:9fcb f=1800 l=2000 al=1800 r=0
 [Sun Jul 28 23:00:25 2019] DIR 0 2 2 0
 [Sun Jul 28 23:00:25 2019] [00] 000004d23fffffffff0100000000000000000000000000000000000000000000
 [Sun Jul 28 23:00:25 2019] [01] 0000000000000000000000000000000000000000000000000000000000000000
 [Sun Jul 28 23:00:25 2019] [02] 000004d23fffffffff0100000000000000000000000000000000000000000000
 [Sun Jul 28 23:00:25 2019] [03] 0000000000000000000000000000000000000000000000000000000000000000

(the immediate prior message to above was:

 [Fri Jul 26 18:37:51 2019] kAFS: Volume 536870950 'mirror.ubuntu' is offline

24+ hours ago, so there was no indication of any other issues leading up to this)

We currently have file logging turned on the openafs servers, which
did not capture anything from exactly this second.  I have extracted
the logs of the three servers for the minute of 23:00-23:01 and put
them at

 https://people.redhat.com/~iwienand/afs-2019-07-28-23-00/afs01.dfw.log
 https://people.redhat.com/~iwienand/afs-2019-07-28-23-00/afs02.dfw.log
 https://people.redhat.com/~iwienand/afs-2019-07-28-23-00/afs01.ord.log

The server this message appeared on is 104.130.4.160, which only
appears to have talked to afs02.dfw in the log files during this
minute.  I can extract other logs if that would be helpful.

Thanks,

-i

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
