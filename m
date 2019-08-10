Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93888D04
	for <lists+linux-afs@lfdr.de>; Sat, 10 Aug 2019 21:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1ZnkXhKbcTyj22L+U4X8qPyJz3OekbpaT/8l+llOfo=; b=AkmyHM4DTFBSeY
	jQg7mD6hvOMBbxc5xet2TeRTotHGZ+XiiMkc+tMjROaiEF8HJeXOPvLLZMdJDABNcO3sCovmTY/Hn
	5a+dm4payQZyrgU5NK3BSHMtKco/AMNCFVN3onfJQXUblkNX4K4I30H5haA8YeKz4wp1Rwq7rvqzb
	SgZ6IFMbzA6WF0wjdtjms9xsz0jPEdmN1s38C78BU5KCUp3NdyxKjzRi0cpj3/A5oxys9a+K9LaPN
	QHQ3NhaT1DkaNHodOA35CjmvPSMOdR534L+3PMI76khZAKuMlNwYHfw/DSxRU3dKdgl1RuuJYODpg
	DVhRMWNa+VASbtsy46HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwXAp-0004ha-76; Sat, 10 Aug 2019 19:37:07 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwXAo-0004c4-6w
 for linux-afs@bombadil.infradead.org; Sat, 10 Aug 2019 19:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eSQJAjKpE7qM2Oy6jvpPfZMD9Yr9xzZO7KtevR9Sn4g=; b=UjzoZz/AZaxXTpS+WMk9drT/YK
 QFBfIGyMCzAin3yzze0WGUwkwerMscnYbijTsxPeQ3fOqBOB97bWVppSp8his4BqWsa3+YbrixCE7
 zvn66MklLWOXIqX3VKhJvGLukbziaLdZouybav9tF7wVl9QRw0OVabZzDJCLPykYIXhCQl/b/UyzD
 NVn6wwfBO4mSRTlXrisjED11ffONCI38tgOuQQUww+5aG6mJbwTgU8wpPRfk5tC592upitHROf34f
 zHpavS6aHtWoOofkdSfvJSt54V7hR2jdZYeBpMUA67GKg+y0o03FkySYde8fNBeSm5rYgvJc6NYN5
 vEjVYvDw==;
Received: from mout.web.de ([212.227.15.4])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwXAk-0004Ch-O6
 for linux-afs@lists.infradead.org; Sat, 10 Aug 2019 19:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1565465810;
 bh=BuQeTb04Z4SYUkfH7ZfnNqizRF1eN4faALW9kEk/zsI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=G4vr+V7620KZU0OY/xBE4xfpVmEcMEcB/GVSnBw/KMYk7HQZsUKBWV8BFkBeJ1Kf/
 jWWpCp70M/Pr7nUx2ds0NJkNFtWmhITZf/Neorj06OPNRxyVaJ/AhFI8BSXnm0Go0B
 HFuZwF+G/wRh5FIfkQoLHdxkomoKQq2twQ87JE5Y=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from saldaea ([188.63.164.35]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MAjet-1i2KUp2Fvn-00BtVQ; Sat, 10
 Aug 2019 21:31:08 +0200
Date: Sat, 10 Aug 2019 21:31:06 +0200
From: Julian Wollrath <jwollrath@web.de>
To: Jeffrey E Altman <jaltman@auristor.com>
Subject: Re: File changes from different client get not recognised
Message-ID: <20190810213106.571d70b4@saldaea>
In-Reply-To: <a27c78f8-2b55-3410-4cbe-e5dcff9b2862@auristor.com>
References: <20190810133918.3046fb6a@schienar>
 <a27c78f8-2b55-3410-4cbe-e5dcff9b2862@auristor.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9GiWIWdSWXvag7pbU6aIE2fT2JardvB5XK5eWL2+ydYA9X6g0nn
 Jyk+ejch7rifQSwGWNzzkv/vf48v152OyP6Fo1gc/jnAgRzTjcSfGEWkSTNWbepigw7aKPl
 8kkmn47aPm8M+Mw6JXKQyQox/yWtwSEaidKhm4frFpEK1JbqkWhScx9pjvh0xCRNIfuluwC
 oh4zqGPqth4mH+kbbt6wA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d/uBJk8feH8=:eky6HzDPyk6tlL/WHmmeAH
 oGxXY+otrWKq3rRycefKGSJONG7eO2POXCYVbAV9npaZDTsIpgKlsH2airlR43G9AbXC710vk
 aY8ywg7Oz3HQUwkXNiiaYeY2nKChv5yzk/dguhlrc3N+1CMHaNv/q+BfNKHOiTXaijcKCiDTM
 PZxTw1jSaSjwGNlPRZHdrLG4lPPvVhRvhM29iXFAo/Wh0PSP7tRI+BdY/5fZwiWg6MtKMtqQ7
 s6xDZVe9FlDQudQ4bIDMm4b8bFqssCee9tT0pTbNasOk2csQBu+kiWj5BhGHg+fTTkY/f57Cw
 WBBV3rnIm1HaCUDGzL62auUkfPdz2AzykgAZQt9U625h0nJ3OBj7g/aQiRHnSeS7z33Q9fKuX
 lr5UebKd32+4v7ADNzdy5TIfHL9xlsd4Ju1ViNuvb4IlSp/4ZycXY+rNMluUhL3emxZ5FfZSs
 TxeEGN53pK3TAqdK3WC3wRC0fQHIyytO19MC4MFi+7A647raCSAQnbAMvOIxTTJCQHWUe0A9O
 CqA7TX9hP4tyeWEmvyC++j/Xo6LwXaJMR8UYH0R2WVDEZ0p0f1UmBzhc0NS+uQw8QcvUk9rq1
 yGxSHB+XkK7KTxv0Oulv/6ydOErbDg3PRToMriegXCom2WTC/vCLtMMBiTWl9QqDDyu4FIzM2
 siNSOQhaYCe0msJcAPTLUwTTa6Uv9KEVTrT5T/AOtiJXik/9A61ZcxURd+wBdc4YFxl2o8tZZ
 8fpvOu0KLj/ZbywlhNJxJGClcwf6GbAf1e4XlIxBU5rYsERjXUQs8o4Hqa8BHNB3a+idkuG17
 4v93Ajtwx5Y7bdeKerYZUn3v3UID3x34pbGgXQlpRS79Ln2g4d1mT35dscN1ZB/XXpISEa+uh
 BKqcBUwAIH/icCQnTjlBZNKLEH1LoViReMyfoGNaJl5Ve50ZP8Pw9/RWXWjD5NIuuZRTXa/vB
 WbZ3Sv3YiyjD4esuWJjPAyGAhB24p1N/UkrboGUesSQS2b7WWUDAql0X8SJ1lnH/hSIJ8Ii4R
 rQTWRiQrmdX1ImHVcCUEcZgwYgL+wHnfSIUNzfmVfAhd6HopjGqX6vUkBYCwAX/mruaqbi17i
 jI9T/fBD5fDqr4kTc9M2zMw2xDL/KpqJzuLKby9NkJbR7RUm29n/lm3CVTBU8g3vBkhIlGyPK
 XEMsA=
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (jwollrath[at]web.de)
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [212.227.15.4 listed in list.dnswl.org]
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
Cc: linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi Jeffrey,

sorry for forgetting that: I use Debian unstable but I have a self
compiled kernel to include kAFS. The last test I did was with Linux
kernel version 5.1.7 but the problem is there, since I tried out kAFS
(which I believe, the first time was with 4.19).


Cheers,
Julian

Am Sat, 10 Aug 2019 12:21:47 -0400
schrieb Jeffrey E Altman <jaltman@auristor.com>:

> Hi Julian,
>
> Please provide details of which Linux distribution and which kernel
> you are using.
>
> Jeffrey Altman
>
> On 8/10/2019 7:39 AM, Julian Wollrath wrote:
> > Hi,
> >
> > I have the following setup: I mount an AFS filesystem on one
> > computer (C1) with kAFS and change into one of the folders in the
> > filesystem do an `ls` or open a file or something else.
> >
> > Then, with a different computer (C2) I go into the same folder and
> > make some changes, e.g. change the content of one file in the
> > folder, I previously looked at with C1.
> >
> > Now, with C1 I do `ls -l` again. The files last modification time is
> > unchanged. Trying to open the file will fail. Only unmounting and
> > remounting will show me the correct folder contents and makes it
> > possible for me to look into the file.
> >
> >
> > Cheers,
> > Julian
> >
> > --
> >  ()  ascii ribbon campaign - against html e-mail
> >  /\                        - against proprietary attachments
> >
> > _______________________________________________
> > linux-afs mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-afs
> >



--
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
