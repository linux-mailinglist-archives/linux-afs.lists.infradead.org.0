Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 263DD1E47C6
	for <lists+linux-afs@lfdr.de>; Wed, 27 May 2020 17:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oCm2RkvZqJU5szxiHdl6LgqDeeNQ4klw9BpOL+eik2E=; b=iAOT59MEAnj+/82UuVXO/RkWB
	CAGdfLPFWzTRULKz7xecUWoDcL2NZ6s1KKPLbTe1F9Y1YFAld3CAL7l8t7tJgwaMwT6dHAjUjrVxI
	watm6lh/ZPkM7qmSLFoiHthGHV/vM7oDTPQHd8uLiDFUblK2heIYAX2ZnyDw3x7yD+vVbkwAs5Ony
	/LLi2L4pJSJpBnUPv9P54zWX5+ujcYc217iQRaxuVtK1ogatRDHB5gqStmeyGF2e2/ssR6lO5hag/
	qRpr922Zhy8oGyeSvjTeB04Zavkmdob/YwDitEd/O+iJGu8QhxoR9Rajs/NrWra6nUiT9Sou61XmC
	G1bXb/Gyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdyBO-0008QC-Qb; Wed, 27 May 2020 15:41:30 +0000
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdyBJ-0008Oi-V3
 for linux-afs@lists.infradead.org; Wed, 27 May 2020 15:41:29 +0000
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 049CD2E15C6;
 Wed, 27 May 2020 18:41:11 +0300 (MSK)
Received: from vla5-58875c36c028.qloud-c.yandex.net
 (vla5-58875c36c028.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:5887:5c36])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 NGexgijeZg-f9xO3Yql; Wed, 27 May 2020 18:41:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590594070; bh=GZ9x2ZWGySF4Uqa2Gprk7wuQyDm6zUMRUd8rMTt/U0M=;
 h=In-Reply-To:Message-ID:From:Date:References:To:Subject:Cc;
 b=AQjq/e77J+OVLRT4H021tGYF3Ii/ps+KJSby5kWi0IPv+7j8AvpvUslANbYdf7bsY
 ZbdE+y0nXcKxTXAwWeQCbjz4xwTLAQ/fGhn0yzzBMfp/bddO2Xl6xxI/2+LVWFlYCx
 HglSOODQqS47DmAukFgT6vUKiQOZifsEAqeTsY18=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1324::1:4])
 by vla5-58875c36c028.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 wv4sh5qY4F-f9X85OPB; Wed, 27 May 2020 18:41:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH] vfs, afs, ext4: Make the inode hash table RCU searchable
To: David Howells <dhowells@redhat.com>
References: <8ac18259-ad47-5617-fa01-fba88349b82d@yandex-team.ru>
 <195849.1590075556@warthog.procyon.org.uk>
 <3735168.1590592854@warthog.procyon.org.uk>
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-ID: <8c74f334-3711-ea07-9875-22f379a62bb3@yandex-team.ru>
Date: Wed, 27 May 2020 18:41:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3735168.1590592854@warthog.procyon.org.uk>
Content-Language: en-CA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_084126_177613_AE599744 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [77.88.29.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 27/05/2020 18.20, David Howells wrote:
> Konstantin Khlebnikov <khlebnikov@yandex-team.ru> wrote:
> 
>>> Is this something that would be of interest to Ext4?
>>
>> For now, I've plugged this issue with try-lock in ext4 lazy time update.
>> This solution is much better.
> 
> Would I be able to turn that into some sort of review tag?

This version looks more like RFC, so

Acked-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

this definitely will fix my problem with ext4 lazytime:
https://lore.kernel.org/lkml/158040603451.1879.7954684107752709143.stgit@buzz/

> 
> David
> 

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
