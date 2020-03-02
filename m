Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 207FA17610E
	for <lists+linux-afs@lfdr.de>; Mon,  2 Mar 2020 18:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i782O6+HTdWc7FrcnhJY3CPpRwjkSPF4m7DVURZAGvE=; b=VCGsk7UkvQbDClnbPIQKepZkE
	vepvrzvMa97lH4uYcXxWoVYZpuvdmsSgEUbY2a8FDv9CdpSmDZaRYKVE5rZ52e8XNgCY11wZS1JYz
	pQarSDOGhLWNhgH3nrHGMhb9+8jL8L1TqBTlcWF+qKcSozT5AaeRDEnzSyfPvqljTsis8BnzA8pCv
	HzrOZypXcqFLCI3ofu4KNk56s7R8sOfGM8+7oYZrJA+6jYvmgftfLBXoiJI9LOTpM2TiIMTAdWfjT
	UXOjhF1cxReRxEKcJujc5Gutbuj0GRVX6n2GnwLa1c5wjzC9TozOEDl/XJ5RRlFAeMvcnKzt779aP
	t9GBTi8Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8ouI-0004Rt-LB; Mon, 02 Mar 2020 17:31:06 +0000
Received: from oroville.ca-zephyr.org ([166.84.7.202]
 helo=portola.ca-zephyr.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8ouF-0004RT-BZ
 for linux-afs@lists.infradead.org; Mon, 02 Mar 2020 17:31:04 +0000
Received: from webmail.ca-zephyr.org (shelter-3.ca-zephyr.org [50.247.112.108])
 by portola.ca-zephyr.org (Postfix) with ESMTP id C9C8D40148;
 Mon,  2 Mar 2020 12:20:56 -0500 (EST)
MIME-Version: 1.0
Date: Mon, 02 Mar 2020 09:20:28 -0800
From: Bill MacAllister <bill@ca-zephyr.org>
To: Spencer Olson <olsonse@umich.edu>
Subject: Re: [PATCH] Add debian build package
In-Reply-To: <CAOx9PejTuEYDC3Nz2kp7p-9g5heVh6FrbX1TnbdBMsUyjVfxhw@mail.gmail.com>
References: <20200229092155.23965-1-olsonse@umich.edu>
 <005EF5A0-4D79-4355-9DD3-DEDF0FA68326@auristor.com>
 <5176a0ceacc80e2ac54b0865cd58b8b4@ca-zephyr.org>
 <CAOx9Pehr_s8vQuccvQ35ksveYYMAsE2B2Q6oDruvtcO-ev2tTg@mail.gmail.com>
 <949b4e71141cc66ed1dfcc9d35018506@ca-zephyr.org>
 <CAOx9PejTuEYDC3Nz2kp7p-9g5heVh6FrbX1TnbdBMsUyjVfxhw@mail.gmail.com>
Message-ID: <809786c0ed8ecfde410e3635e4c6b6fa@ca-zephyr.org>
X-Sender: bill@ca-zephyr.org
User-Agent: Roundcube Webmail/1.3.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_093103_469668_85FC5FAB 
X-CRM114-Status: GOOD (  17.67  )
X-Spam-Score: 0.4 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
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
Cc: David Howells <dhowells@redhat.com>, Bill MacAllister <mac@ca-zephyr.org>,
 linux-afs@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 2020-03-02 08:32, Spencer Olson wrote:
> On Sun, Mar 1, 2020 at 2:59 AM Bill MacAllister <bill@ca-zephyr.org> 
> wrote:
> __
> 1) Status of my debian packaging:
> 
> My config did produce a working package:

I had problems, but at this point I don't remember what they were. I'll
look again.

>   * On Ubuntu 20.04 : works great
>   * On Ubuntu 18.04 : only works if you tweak 
> request-key.d/kafs_dns.conf
>      It looks like 18.04 is still using an older version of keyutils 
> where
>      the naming of the items in request-key.d/* are very important.
>      To temporarily fix this, either:
>      -  add contents of kafs_dns.conf to the top of request-key.conf
>      *or*
>      -  rename kafs_dns.conf or make a symlink to it with the name
> "dnsresolver.conf"
> 
>     After doing this, my "Destination Address required" problem went 
> away.

Seems like we should document this somewhere in the source package.

>    Is it in order to attempt to push the updated version of keyutils
> through to 18.04
>    (I won't personally care much longer, since I'll move entirely to 
> 20.04)

I have not moved forward to 20.04 yet, but not sure that I care to put
much work into 18.04 at this point.

> 2) Debian Packaging feedback
> Cloned Bill's repo and I have some feedback:
>   - you missed installing some libraries that are necessary for the 
> client

Which ones?

>   - your debian config seems a bit more complicated than mine without 
> producing
>     significantly different results (aside from mine working and yours 
> not)

Hmmm, I guess we are at "mine works and yours doesn't" of packaging.  I 
would
like to figure out what we are doing differently.  Are you using "gbp
buildpackage"?

Note, the postinst is a real hack and I intend to revert to your method 
of doing
that work in the rules file instead.

>   - you changed the location of various installed components 
> differently from
>     the normal install.  I don't think these changes are necessary and 
> only
>     make the packaging more complicated/different from the Makefile 
> install.
>     In any case, there does not seem to be a debian reason for making 
> these
>     changes.

I only knowingly changed the location of the binaries are in 
/usr/libexec.

> Either I miscommunicated or you (and perhaps David) misunderstood the
> purpose of my patch:
> 
> The reason for my patch/commits was *not* to help create a quilt 
> solution
> for kafs-cilent, where we have to update from upstream.  Rather, my
> intention was to create a debian build configuration that can live 
> *with*
> the primary source code similar to the redhat/ subdirectory.

I think that we will need to create a "quilt solution" if we want the
kafs-client to be included with Debian. But, I am not a Debian developer
so I will ask about this.

> 2) Redhat Packaging:

My request right now is simple.  Please rename etc.conf to client.conf.

Bill

P.S. Since this work is not my day job I won't get to this until later
this week.

-- 
Bill MacAllister <bill@ca-zephyr.org>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
