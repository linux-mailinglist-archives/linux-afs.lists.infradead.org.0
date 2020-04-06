Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E62119F172
	for <lists+linux-afs@lfdr.de>; Mon,  6 Apr 2020 10:18:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FMwnxLqveiMzhqrnXzJNoGhjeKxLdNYEjqpjX86PQTk=; b=u5YCFqifCdBcrfm+oXf4vi6LW
	D13IVczFDPekSp1D9dfExSX9ibYN8SGcMH8DfxKRscwhZlw/UKtwB6lgv/2XUr14g3ULROlGVvefj
	1UpDdwPrXuvdbqKOd2JTi0B4AVE61Iddsio/yuXzS2Q88674EcYjvo7D3xnZa6XPfQeU1teIEnKs6
	EX96CgPV5tlo0dpf2wrznV8lA0RV2/UqcgfbRt35+ggQj7ffb36XRYv7XN3ncoz8+Airnsg4KolkY
	V75lxsRuD6laJ8u/nzomZqcTUyj4c+k5HDtj+v9gqDbkeYwmjSI7oyRbfPCh+x6fKJjPkbhf6rK+V
	dkqDJO5MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLMxV-0005Yh-90; Mon, 06 Apr 2020 08:18:17 +0000
Received: from mail.enea.it ([192.107.51.3] helo=enea.it)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLMxS-0005Cr-4C
 for linux-afs@lists.infradead.org; Mon, 06 Apr 2020 08:18:16 +0000
X-ExtScanner: Niversoft's FindAttachments (free)
X-Origin-Check: Messaggio transitato dal mailserver di ENEA
Received: from bracco1.frascati.enea.it (account giovanni.bracco@enea.it
 [192.168.201.93] verified) by enea.it (CommuniGate Pro SMTP 6.1.18)
 with ESMTPA id 316993288; Mon, 06 Apr 2020 10:17:45 +0200
Subject: Re: [OpenAFS] 2020 AFS Technologies Workshop Cancelled.. kafs update
To: David Howells <dhowells@redhat.com>
References: <9253801f-92de-b963-8ea0-296e53e25f88@enea.it>
 <17130f4b238.2752.7e7218444f75578ebec1b7dbb1486319@cnf.cornell.edu>
 <3078968.1585847195@warthog.procyon.org.uk>
From: Giovanni Bracco <giovanni.bracco@enea.it>
Message-ID: <be710f52-ee4d-c1c5-d11e-a39f572e14b4@enea.it>
Date: Mon, 6 Apr 2020 10:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3078968.1585847195@warthog.procyon.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_011814_328307_C4F9C21A 
X-CRM114-Status: GOOD (  18.47  )
X-Spam-Score: -2.3 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.107.51.3 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [192.107.51.3 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: linux-afs@lists.infradead.org, openafs-announce@openafs.org,
 openafs-devel@openafs.org, openafs-info@openafs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Thank you for the news!

I have tried for the first time the kafs client on a Fedora 31 and it 
worked really nicely, I am very impressed by how it is simple to have it 
working. Of course I have no be able to make a massive test yet, but it 
look really interesting

My feeling is that to  put it really in production the main missing 
points are:

1) pam module
2) user commands, essentially "fs" first of all and also "pts"
3) inotify

The bos, vos and backup command can be run on server nodes, which can be 
standard OpenAFS systems, am I right?

Giovanni


On 02/04/20 19:06, David Howells wrote:
> Giovanni Bracco <giovanni.bracco@enea.it> wrote:
> 
>> In the present complicate situation, it would be nice to have some news about
>> the latest development both of OpenAFS and kafs
> 
> The status of kafs can be found at:
> 
> 	https://www.infradead.org/~dhowells/kafs/todo.html
> 
> There is now a filesystem-afs subpackage that provides the /afs mountpoint as
> part of the filesystem package in Fedora and others.  I'm trying to get it
> into the LSB also.
> 
> There is now a kafs-client package in Fedora and others that provides
> configuration, systemd services and DNS upcall handling plus an aklog.
> 
> I'm currently rewriting the operation handling in kafs to improve fileserver
> failover and rotation and so that I can support asynchronous I/O.
> 
> I'm also rewriting local filesystem caching in Linux (fscache) to:
> 
>    - Use async direct I/O to the backing filesystem (which is a lot faster)
>    - Not use bmap to track contents (which isn't guaranteed with extents)
>    - Be lazy about metadata writeback (reducing metadata ops)
>    - Provide better handling of versioned files (eg. directories)
>    - Use of larger I/O granules on the network (256K rather than PAGE_SIZE)
>    - Code simplification (3-4000 LoC removed)
> 
> All in all, it's looking a *lot* faster.  I also have on my radar for fscache:
> 
>    - Moving culling into the kernel
>    - Better indexing support
>    - Disconnected operation support
> 
> For kafs-utils (which provides the command suite), I've started rewriting that
> in C because the Python language subtleties keep changing and breaking it.
> Also I've been asked for a C/C++ version so that Python libraries are not
> required.  The plan now is to put a swig interface on top of it.
> 
> David
> 
> _______________________________________________
> OpenAFS-info mailing list
> OpenAFS-info@openafs.org
> https://lists.openafs.org/mailman/listinfo/openafs-info
> 

-- 
Giovanni Bracco
phone  +39 351 8804788
E-mail  giovanni.bracco@enea.it
WWW http://www.afs.enea.it/bracco

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
