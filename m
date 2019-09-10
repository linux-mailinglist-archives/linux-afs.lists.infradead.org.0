Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 888B9AE8AC
	for <lists+linux-afs@lfdr.de>; Tue, 10 Sep 2019 12:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U9cxQIoky6kb7hGxd4v6LYg0CTjFWxASD/MGnykY8U8=; b=svFVXn2/hoKTNwl43n1QwsATg
	dZZOjS+BI8ZHmIHedy6j3E2or5ekvlxeb1Tpa6wvA0aEqcI0PLke7gDH0thEiV1PNqeyLEBIShxyO
	hQ+ljQIXtGmwQ6LnN4/Yt7+ilY4MZW27X7X3uR9ZWWWDs8uOWmdEXfR+Cu8E2+SOrZA7AhsdzwayU
	48oVSIY46BEUuh6iagdyt03FSMayrvD6aLmDDRA3rMKyuIDL5wsPw7EtuPQpcDMdkxVVm7SpM+SeV
	XG7uHWsENhy05JwsgSBvofgHvYAz/ViCwG9uErJUFvv7NDI7QLAtzJNiOug2TUVGxy2yRXxSGHSf0
	NOZlmT/bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7dl7-0002UH-S5; Tue, 10 Sep 2019 10:52:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7dl5-0002Ty-5T
 for linux-afs@lists.infradead.org; Tue, 10 Sep 2019 10:52:28 +0000
Received: from localhost (unknown [148.69.85.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A97F920692;
 Tue, 10 Sep 2019 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568112746;
 bh=BEBUTIR1fNzkMOmIVHGpGroWQ3Ro/ae17Ts/8rK1HBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zscLtYO3qbbTaKtDfXG+uZDsNg/AYmEmDLzFUtq2aFSkxArTo0FQQR/C6p64ik5p+
 SnLW5dh9exLXhhPHhgyYJ1aSEjvIWxkgyOJsayVXTD62UYJldtq+a1gMmnz5+UAgiL
 c+Y/YImhlw0leIxAMWB7eDw0lWYXnexIGUT6MnWo=
Date: Tue, 10 Sep 2019 06:52:23 -0400
From: Sasha Levin <sashal@kernel.org>
To: Hangbin Liu <haliu@redhat.com>
Subject: Re: =?utf-8?B?4p2MIEZBSUw=?= =?utf-8?Q?=3A?= Stable queue: queue-5.2
Message-ID: <20190910105223.GG2012@sasha-vm>
References: <cki.77A5953448.UY7ROQ6BKT@redhat.com>
 <20190910081956.GG22496@dhcp-12-139.nay.redhat.com>
 <20190910085810.GA3593@kroah.com>
 <20190910093021.GK22496@dhcp-12-139.nay.redhat.com>
 <20190910094025.GM22496@dhcp-12-139.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910094025.GM22496@dhcp-12-139.nay.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_035227_230239_309D4677 
X-CRM114-Status: UNSURE (   5.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -5.2 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: Greg KH <greg@kroah.com>, Linux Stable maillist <stable@vger.kernel.org>,
 linux-afs@lists.infradead.org, David Howells <dhowells@redhat.com>,
 netdev@vger.kernel.org, CKI Project <cki-project@redhat.com>,
 Xiumei Mu <xmu@redhat.com>, Jan Stancek <jstancek@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, Sep 10, 2019 at 05:40:25PM +0800, Hangbin Liu wrote:
>On Tue, Sep 10, 2019 at 05:30:21PM +0800, Hangbin Liu wrote:
>> Xiumei Mu also forwarded me a mail. It looks Sasha has fixed something.
>> But I don't know the details.
>
>Oh, I checked that thread. It's the same issue. So Sasha should has fixed it. I
>just wonder the commit id now.

That was fixed by upstream commit
b00df840fb4004b7087940ac5f68801562d0d2de.

--
Thanks,
Sasha

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
