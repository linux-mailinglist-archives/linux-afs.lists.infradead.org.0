Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5BA78425
	for <lists+linux-afs@lfdr.de>; Mon, 29 Jul 2019 06:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkkUycnPsFWki4NzV4FmrF/tJ+7HJnw9/CxSTLb/87k=; b=MW7+WafwAaoXrK
	KTlg19jimDwAgktUWU+qZce+voBrs83FeHdmFYr+yCXejfkORYi5DXSA0XBFB4Q5W05dp9AF1NacA
	KgWeqACde/kg5dqTwyUfgVASIjwLjyVfk9Rrkk0kZXsUSGZ6b66XtvHqOo/PkZ9WnKeZNyouvyNOC
	m6y3VijEwllMEqOh1ON8xSZhbjzUnsQ7tSO/5XBLvlkMzktlxVqt/f85FkjgEeYpACSQjlXwyE3UY
	AzcMK6o5w1PB2YyKEL9T5jehB1SYI91fz8G5WVphAfI2YIHY6Ju4Qtk8Zx2Aap5f9zMH6qkKOHJBO
	LhrwjJwt8Dl7WDlvFF8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrxND-0002yA-D0; Mon, 29 Jul 2019 04:34:59 +0000
Received: from mail-pg1-f171.google.com ([209.85.215.171])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrxNA-0002xh-Lo
 for linux-afs@lists.infradead.org; Mon, 29 Jul 2019 04:34:58 +0000
Received: by mail-pg1-f171.google.com with SMTP id i18so27548267pgl.11
 for <linux-afs@lists.infradead.org>; Sun, 28 Jul 2019 21:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uFcvUqn3OfBJeefZe5wU2Qo6OHiQGTB8vQx+z25QRVg=;
 b=BbdAFojcRM1lVjaSv7FVDwfffmmrcVNWDKGRgMsVkHBwuni0SIKKL+JKqtN3H6xSJY
 HaFbsRj5Nmdg1jrM9CbwpkjCTC0O+rlvZXu8sGWFo5pB4m63YXFHnYQnlz1DE/cBOR6w
 lqGgfviGUJBzVAU/qZm31XtSK4IyVfB88hXot/UH8+xZEP+wH+bTWWxM3FE0ytgY5YLO
 rFzAbiktFRQ6g2ubEzU4OhFQkdqwQRtteikxwzEM90fti5D071SeoPHkve7vWIG8KxAl
 3J6wYu+dqNs/hoOt8c30wGKMf8gCcBctkO2rNUVE2ptHUQv1samTAsDoPwJvXtZXG4I6
 rJoA==
X-Gm-Message-State: APjAAAU1t7vtwTiVStZNsLFFI2d3L+SNul4H2MvoB5J4A4ZZ2ppcZ4XZ
 kVcB2QmtwlYUz/awAI7odo13Lw==
X-Google-Smtp-Source: APXvYqwlG1VZu3i9vodFMNKAu/Id2t3BBoSTaCWx26eNdqOm+HZzUC5LUXkeDLKPea0s/deYFJoXiQ==
X-Received: by 2002:aa7:8392:: with SMTP id u18mr34739014pfm.72.1564374892389; 
 Sun, 28 Jul 2019 21:34:52 -0700 (PDT)
Received: from fedora19.localdomain
 (2001-44b8-3177-ac00-b321-eb44-0783-2320.static.ipv6.internode.on.net.
 [2001:44b8:3177:ac00:b321:eb44:783:2320])
 by smtp.gmail.com with ESMTPSA id b126sm88504697pfa.126.2019.07.28.21.34.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 21:34:51 -0700 (PDT)
Date: Mon, 29 Jul 2019 14:34:47 +1000
From: Ian Wienand <iwienand@redhat.com>
To: Jeffrey E Altman <jaltman@auristor.com>
Subject: Re: 5.3.0-rc1-afs-next-48c7a244 : volume is offline messages during
 release
Message-ID: <20190729043447.GB20647@fedora19.localdomain>
References: <20190628003332.GA23470@fedora19.localdomain>
 <20190725061745.GA9802@fedora19.localdomain>
 <74b79ff5-6638-3a2b-424b-f3030b498e07@auristor.com>
 <20190726011734.GA9973@fedora19.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726011734.GA9973@fedora19.localdomain>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_213456_715844_D43DA55A 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.171 listed in list.dnswl.org]
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
Cc: linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, Jul 26, 2019 at 11:17:34AM +1000, Ian Wienand wrote:
> So, tl;dr ... yes it appears that Apache can think files are missing
> on volumes during releases with 48c7a244.

I have turned on audit logging on the afs servers, which have been
running for several days (however, over the weekend, which is much
quieter as we don't see as many changes coming through).

I haven't managed to catch any smoking guns of 404 errors seeming to
affect jobs.  I've searched the apache logs for 404 errors on .rpm and
.deb files, along with searching our log collector for apt-get/yum
style errors without luck.

I turned audit logging on at Fri Jul 26 02:45:26 2019.  Since then,
I've seen

 [Fri Jul 26 00:38:35 2019] kAFS: Volume 536870950 'mirror.ubuntu' is offline
 [Fri Jul 26 16:41:41 2019] kAFS: Volume 536870950 'mirror.ubuntu' is offline
 [Fri Jul 26 18:37:51 2019] kAFS: Volume 536870950 'mirror.ubuntu' is offline

If it would be helpful, I can extract the logs from around those
times; the whole thing is getting into the 10's of gb so is getting a
bit unwieldy to pass around.

I will leave it running with auditing on the servers as we come into
the US working week too, to see if we can capture any clearly missing
files.

Thanks,

-i

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
