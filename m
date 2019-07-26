Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C64D975C70
	for <lists+linux-afs@lfdr.de>; Fri, 26 Jul 2019 03:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcBmd1gc9J1CUjXzs/M18b0YrJxVfR9Ef1fo+Y949bc=; b=ilmAM9MX2kUuhB
	mY1ss4gvOnOcoLS2ToQuocYPXlmOy3tl9pIhbbsm+eLlaivmxkX1fqBKw+qGl0Pblz7B86ssc907g
	zDX8xrTuJkNV1q1qa6DOeuJXC8M7ta8tSfT90EDBdaWKRjtEb0YhDJNDwq11CVL2KvgReMasj9bNl
	5UV8zlKLWtQcxTcu1RRw3n5Ewepp8/XNA6NCLlI6V/onk5hY+YM1tJqy0gqV7zmKd+/HdBWoITTkY
	Lyll/72meCcnaQjaO+ZMpOnFPbTkafUBW2f7qJH2b4C8qEAXrgosbEDJPbf3qWKMrybb8YG9XrEj2
	m7DiOyiiWd1qFaxNdSZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqorf-0008F1-ID; Fri, 26 Jul 2019 01:17:43 +0000
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqorc-0008Eb-Od
 for linux-afs@lists.infradead.org; Fri, 26 Jul 2019 01:17:42 +0000
Received: by mail-pf1-f182.google.com with SMTP id g2so23632719pfq.0
 for <linux-afs@lists.infradead.org>; Thu, 25 Jul 2019 18:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rzMYJMIbPfgFtA8biy437EjY3VzVwiq8mXePtq0nu1g=;
 b=dk7Gng7ZbuOdqWHfMLiJVocdZqR8P9UOBRp2iQpveh9frvuVoeabCs9tiEEwbhCqde
 E7WqVV4pk5Y9O5FA2dEBk1wfWYt/Z9iZSIxCZTv+4qxEhHWiAeqmQRCMKUH7+7XrWyAq
 AkFVgalJ4JXpTWwXB3TN30cHaTtCpVuSTpmLzqvcqjTC8tQ9sQxpvKlk7FymHH3aVneT
 yY91re6p7yPPfmcFu50WAiFCb8ZaN7FcneZhHWo02O8TRpuBGj4wpvVlzMZUsJjtZjh5
 QWbfN7bGRb8VvG9IKpmRmho1I0eEjdHNAM554ZdlkfUWMBfAwANYhWOTz8kK3d3kMhqX
 WFMQ==
X-Gm-Message-State: APjAAAVKLn05t6slWsrdgLwGMGMokmjTGnufSLu+Rl4YXI14Jmre7UI2
 XdvGbg3WjOl8AZPBOIPkTUhOwB1lVQ4=
X-Google-Smtp-Source: APXvYqy/OysJ3NLHWMnTijMvJocwVmSVnWrUi3j0JnKZ6J06nmFcvNScCTamjtQ2fOBmqC1szrqoEA==
X-Received: by 2002:a62:874d:: with SMTP id i74mr19059691pfe.94.1564103859833; 
 Thu, 25 Jul 2019 18:17:39 -0700 (PDT)
Received: from fedora19.localdomain
 (2001-44b8-3177-ac00-b321-eb44-0783-2320.static.ipv6.internode.on.net.
 [2001:44b8:3177:ac00:b321:eb44:783:2320])
 by smtp.gmail.com with ESMTPSA id h6sm48300026pfb.20.2019.07.25.18.17.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 18:17:38 -0700 (PDT)
Date: Fri, 26 Jul 2019 11:17:34 +1000
From: Ian Wienand <iwienand@redhat.com>
To: Jeffrey E Altman <jaltman@auristor.com>
Subject: Re: 5.3.0-rc1-afs-next-48c7a244 : volume is offline messages during
 release
Message-ID: <20190726011734.GA9973@fedora19.localdomain>
References: <20190628003332.GA23470@fedora19.localdomain>
 <20190725061745.GA9802@fedora19.localdomain>
 <74b79ff5-6638-3a2b-424b-f3030b498e07@auristor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74b79ff5-6638-3a2b-424b-f3030b498e07@auristor.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_181740_863437_E8FA9FD2 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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

On Thu, Jul 25, 2019 at 11:10:47AM -0400, Jeffrey E Altman wrote:
> The important question to answer is whether or not the applications
> reported a failure with the 579cb95f6d3a8f7db0ee361d6e8ed0c448c7a244 kernel.

So we had a reported failure case @ 07-25 16:39 of a 404 from the
centos EPEL mirror during a CI run [1]

 2019-07-25 16:39:23.606826 | primary | INFO:kolla.common.utils.openstack-base:[91m http://mirror.iad.rax.opendev.org/epel/7/x86_64/Packages/p/python-elasticsearch-1.9.0-1.el7.noarch.rpm: [Errno 14] HTTP Error 404 - Not Found

Webserver logs confirm that the mirror node (running 48c7a244)
returned that:

 162.242.218.105 - - [2019-07-25 16:39:22.881] "GET /epel/7/x86_64/Packages/p/python-elasticsearch-1.9.0-1.el7.noarch.rpm HTTP/1.1" 404 266 - "-" "urlgrabber/3.10 yum/3.4.3"

There were no other related Apache errors or anything else I could
see, other than returning this 404.

Per [2], the vos release kicked off at 16:39:12 and finished at
17:00:46 on our update server:

...
 2019-07-25T16:39:12,801099873+00:00
 Kerberos initialization for service/epel-mirror@OPENSTACK.ORG
 rsync completed successfully, running vos release.
 + k5start -t -f /etc/afsadmin.keytab service/afsadmin -- vos release -v mirror.epel
 ...
 2019-07-25T17:00:46,977989838+00:00

This correlates with the following in the mirror server logs:

 [Thu Jul 25 16:39:18 2019] kAFS: Volume 536870968 'mirror.epel' is offline

The dashboard @ [3], if restricted to 07-25 16:38 -> ~17:00 shows ~16
other similar hits.  I haven't been through them all, some may be
referring to the same thing.  Other searches might reveal slightly
differently worded things too.  However, several other files in the
EPEL repo are mentioned.  We can see that none of the files there
having issues were updated in the prior rsync, so they are not fresh
data as it were.

So, tl;dr ... yes it appears that Apache can think files are missing
on volumes during releases with 48c7a244.

-i


[1] http://logs.openstack.org/86/668286/4/check/kolla-build-oraclelinux-binary/0d3fc67/job-output.txt.gz#_2019-07-25_16_39_23_606826
[2] http://paste.openstack.org/show/754873/
[3] http://logstash.openstack.org/#dashboard/file/logstash.json?query=message%3A%5C%22HTTP%20Error%20404%5C%22%20AND%20node_provider%3A%20rax-iad


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
