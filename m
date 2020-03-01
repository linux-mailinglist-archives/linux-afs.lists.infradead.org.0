Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E08FD174CA8
	for <lists+linux-afs@lfdr.de>; Sun,  1 Mar 2020 11:00:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ha+b7TYUsAUNSYhkVxclqYxfzuj43cw9TO0IKHkF7bw=; b=BO9fl5Ue0ugM8q8DshoSqM1Vx
	/REs0ae03A7qGeUex9mRQDSQEMN+ttDXSTKBWJa1vHWN8hMlO5QL7QRaSQ9llS+tZgHjOVkf4ae4z
	fkPID1sY8A4wlWWVfKV88KN5vep2niSZ8WsQrCwTPKppcddqqmigMhYMqQT0zU71psiXDw9XwVq2L
	GovXPx7zLn6jZdK6cGOP+616uvz4mGFCHTBEAwGYpm+pCIxhBOK0nPNyC87pf3SXl2gqe8+LRcCi8
	aGH2036fNrtRPpi/xuIZTJkEx+5oznOhJFfa1CJDpnLy1mW7p7JmAtiIWNFezrVSS9c9QceEv3yME
	p2POTDrPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8LOb-0007OQ-Ob; Sun, 01 Mar 2020 10:00:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8LOZ-0007Gc-Ve
 for linux-afs@bombadil.infradead.org; Sun, 01 Mar 2020 10:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=lp17ej+hJMtzZRvGl7gH2skAVL6BtfiGYOPEWuDvRRw=; b=hF9oxRqGsAxKfqjz4ab2V7e119
 LECX8Oo5/j85+QdLbhb6Jc37FIJZSJy4SHsho4X7Ad2J90klhBvfx5a7mOE611xOB4Oa8e5aBbMA7
 ppF/w6LIDJ0dr5Ojr3Zx5eK/lfYCLK28fiaORI/RIuZd+/tCUkOfo878JA9AFLORb9U72Pp34y3oh
 kBmV0rhR7c4vhR9xZGMrFboUNHGONrrpGEu7ZqpiZfm1STxmSq26rlVczsYq0lMhBeSbVQOkCM5eR
 xj8S9sflNVKausccCjanqCZ/ZSZee/7l8oXxDQNLLSpqmT64RXIQZXvoc8V515S58yAQ45NdAGGP/
 +SlJP6tQ==;
Received: from oroville.ca-zephyr.org ([166.84.7.202]
 helo=portola.ca-zephyr.org)
 by casper.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8LO8-0003eo-PI
 for linux-afs@lists.infradead.org; Sun, 01 Mar 2020 10:00:22 +0000
Received: from webmail.ca-zephyr.org (shelter-3.ca-zephyr.org [50.247.112.108])
 by portola.ca-zephyr.org (Postfix) with ESMTP id BCD9440027;
 Sun,  1 Mar 2020 05:00:11 -0500 (EST)
MIME-Version: 1.0
Date: Sun, 01 Mar 2020 01:59:43 -0800
From: Bill MacAllister <bill@ca-zephyr.org>
To: Spencer Olson <olsonse@umich.edu>
Subject: Re: [PATCH] Add debian build package
In-Reply-To: <CAOx9Pehr_s8vQuccvQ35ksveYYMAsE2B2Q6oDruvtcO-ev2tTg@mail.gmail.com>
References: <20200229092155.23965-1-olsonse@umich.edu>
 <005EF5A0-4D79-4355-9DD3-DEDF0FA68326@auristor.com>
 <5176a0ceacc80e2ac54b0865cd58b8b4@ca-zephyr.org>
 <CAOx9Pehr_s8vQuccvQ35ksveYYMAsE2B2Q6oDruvtcO-ev2tTg@mail.gmail.com>
Message-ID: <949b4e71141cc66ed1dfcc9d35018506@ca-zephyr.org>
X-Sender: bill@ca-zephyr.org
User-Agent: Roundcube Webmail/1.3.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200301_100000_469435_2D036DAE 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -1.6 (-)
X-Spam-Report: SpamAssassin version 3.4.3 on casper.infradead.org summary:
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.3 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
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

On 2020-02-29 11:46, Spencer Olson wrote:
> Not a problem.  In any case, the error that you are seeing is the same
> error that I am seeing.  I hadn't been using kafs for some time, so I
> can't tell when this started.  I've tried using the dyn mount option,
> mounting the root.afs and root.cell, all with the same result.  I've
> tried using existing afsdb entries and also manually specifying
> servers.  I normally have my firewall very restrictive, but I tried
> disabling it entirely.
> 
> If you figure out what is going on, let me know.
> 
>> $ ls /afs/cs.stanford.edu [2]
>> ls: cannot open directory '/afs/cs.stanford.edu [2]': Destination
>> address
>> required

The problem that I was having was because I moved kafs-dns to /usr/sbin
and didn't adjust the kafs_dns.conf file. But, that wasn't the only
configuration mistake I made. Once I got all the configuration files
in the right directories magic happened.

>> Your work made my progress possible. Thanks a lot for sharing it.
>> Once we get a working package I will see that it gets pushed into 
>> Debian.

I now have a working package.  I have tested on buster and bullseye.
I will need to spin up a 20.04 ubuntu test system to make sure it works
on Ubuntu.  There are still some rough edges that need to be addressed,
but I am ready to start working with Russ Allbery to get it uploaded
into Debian.

Thanks again for your work.

Bill

-- 
Bill MacAllister <bill@ca-zephyr.org>

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
