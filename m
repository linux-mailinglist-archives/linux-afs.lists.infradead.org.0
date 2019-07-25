Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E494674BB3
	for <lists+linux-afs@lfdr.de>; Thu, 25 Jul 2019 12:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4BcM/3NROQ8O09kWqS29zKkMdrThvfI4qtdCYjQChQ=; b=dvswjKpV/W2l8X
	VIUq8wk598+FIMVNNZKc+qDnn2BVmsyHb7EsyYzDX0shwwOeHNRCs9Y0CXBGtY4XBtX/hc6vLRWud
	ytfKTGQorcTnZlBsG+Bq4eakcFRl7njadKL4GFRqMpVT2pdAseSPIea1R0h2yTONHrz+eyHo1inFK
	6c+00vONsuPu0rHIl5xhXJQao68B6MS1IaC8U0bamPGAz8hgkfksMo7yVeBKyOAP/VSqtJPncxQ56
	DMdVC2r1KYjLcQ3VPI1qsyAvVx4B48H1RbIAznrGnYLxC5JJazy0lT5uRVEgrRNKg+6RoVvAJLcxU
	yLc4uekkeGZ3Dm1d8drQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqb6z-0007So-DZ; Thu, 25 Jul 2019 10:36:37 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqX4Z-0002JI-Of
 for linux-afs@lists.infradead.org; Thu, 25 Jul 2019 06:17:53 +0000
Received: by mail-pg1-f180.google.com with SMTP id n9so16240021pgc.1
 for <linux-afs@lists.infradead.org>; Wed, 24 Jul 2019 23:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aCEdwKvptXRGKq7efkrX5L1To4Mz+Fnm2wbDPYUNW4k=;
 b=VAdME8ljid7gtQsYM63v5j0Bacsc7Y3HdwNMAWmCEusdlwnzDG+oe2a+DK9uXiI3l8
 US8XGgC8x5evdBNQvesbCTFLIdCJ3O1/Y3cH/oS1X4bzsfg1OQMZ8+64Uv9/KB4tyYW9
 lre2L7wBzyeSy/477fHzPA2G3EOpFFDHfXmAuPg9mJzwaJFvV2XbwcISTP7i1t0DeBXx
 NedXhgBhC73SNkJUtFjKFswrYyFrDBPVkOVSiFv8pB4lAKBt6J3nejpgGr/3ioKhqvXc
 KddaY2lWPkYBpaISaB14jq8M+58LvBm/N/+gvd1A562Vdp7zc2kyzlMTQXDLT5Jw13QL
 9UtQ==
X-Gm-Message-State: APjAAAWROLXp00a7qZA5AVmqWLzWQfC6QgsZW+NoN9WgEy+lWG4qooL6
 ppRTQQ42mAeFRPzO8T4Bhyqev1LroOg=
X-Google-Smtp-Source: APXvYqzdUz5OZqHWid6ld5tT3qrkbvKLjuBRlRcmv9FvS63nXEUWP45tGZt+E44IU3jin+esNuaRYg==
X-Received: by 2002:a63:4041:: with SMTP id n62mr13774309pga.312.1564035470207; 
 Wed, 24 Jul 2019 23:17:50 -0700 (PDT)
Received: from fedora19.localdomain
 (2001-44b8-3177-ac00-b321-eb44-0783-2320.static.ipv6.internode.on.net.
 [2001:44b8:3177:ac00:b321:eb44:783:2320])
 by smtp.gmail.com with ESMTPSA id b136sm60288356pfb.73.2019.07.24.23.17.48
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 23:17:49 -0700 (PDT)
Date: Thu, 25 Jul 2019 16:17:45 +1000
From: Ian Wienand <iwienand@redhat.com>
To: linux-afs@lists.infradead.org
Subject: 5.3.0-rc1-afs-next-48c7a244 : volume is offline messages during
 release
Message-ID: <20190725061745.GA9802@fedora19.localdomain>
References: <20190628003332.GA23470@fedora19.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628003332.GA23470@fedora19.localdomain>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_231751_805150_1DA540C8 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.180 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Mailman-Approved-At: Thu, 25 Jul 2019 03:36:35 -0700
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

As an update to the prior mail, we have been running this server with
the afs-next branch @ 579cb95f6d3a8f7db0ee361d6e8ed0c448c7a244
(5.3-rc1) for about 30 hours.

In that time, we've had the following:

 [Wed Jul 24 10:22:37 2019] kAFS: Volume 536871036 'mirror.yum-puppetlabs' is offline
 [Wed Jul 24 20:42:28 2019] kAFS: Volume 536870968 'mirror.epel' is offline
 [Wed Jul 24 22:48:09 2019] kAFS: Volume 536870950 'mirror.ubuntu' is offline
 [Thu Jul 25 00:39:31 2019] kAFS: Volume 536870950 'mirror.ubuntu' is offline

So again, taking the Jul 24 22:48 message, the volume was being
released between 22:46 and ~22:50

 2019-07-24T22:46:50,710929268+00:00
 Kerberos initialization for service/reprepro@OPENSTACK.ORG
 reprepro completed successfully, running vos release.

 mirror.ubuntu 
     RWrite: 536870949     ROnly: 536870950 
     number of sites -> 3
        server afs01.dfw.openstack.org partition /vicepa RW Site 
        server afs01.dfw.openstack.org partition /vicepa RO Site 
        server afs02.dfw.openstack.org partition /vicepa RO Site 
 This is a complete release of volume 536870949
 Re-cloning permanent RO volume 536870950 ... done
 Getting status of parent volume 536870949... done
 Starting transaction on RO clone volume 536870950... done
 Setting volume flags for volume 536870950... done
 Ending transaction on volume 536870950... done
 Replacing VLDB entry for mirror.ubuntu... done
 Starting transaction on cloned volume 536870950... done
 Updating existing ro volume 536870950 on afs02.dfw.openstack.org ...
 Starting ForwardMulti from 536870950 to 536870950 on afs02.dfw.openstack.org (as of Wed Jul 24 20:39:22 2019).
 updating VLDB ... done
 Released volume mirror.ubuntu successfully
 Kerberos initialization for service/afsadmin@OPENSTACK.ORG
 2019-07-24T22:50:31,594378108+00:00

The others are in a similar situation.

As another data point, we have an original server still running
5.2-rc7 from upstream (6fbc7275c7a9ba97877050335f290341a1fd8dbf) that
is completely idle.  It is configured the same as the active mirror
server.  It has been up for 24 days at this point, and has the
following in the logs:

 [Tue Jul  9 16:09:38 2019] kAFS: Volume 536871010 'mirror.opensuse' is offline
 [Thu Jul 11 12:10:32 2019] kAFS: Volume 536871010 'mirror.opensuse' is offline
 [Thu Jul 11 12:17:38 2019] kAFS: Volume 536871036 'mirror.yum-puppetlabs' is offline
 [Thu Jul 11 20:17:21 2019] kAFS: Volume 536871010 'mirror.opensuse' is offline
 [Fri Jul 19 10:23:44 2019] kAFS: Volume 536871036 'mirror.yum-puppetlabs' is offline
 [Mon Jul 22 14:09:55 2019] kAFS: Volume 536871010 'mirror.opensuse' is offline
 [Mon Jul 22 14:41:10 2019] kAFS: Volume 536870968 'mirror.epel' is offline
 [Tue Jul 23 10:18:26 2019] kAFS: Volume 536871036 'mirror.yum-puppetlabs' is offline
 [Wed Jul 24 20:41:35 2019] kAFS: Volume 536870968 'mirror.epel' is offline

So not appreciably more or less offline messages than the live server.

-i

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
