Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2350412519C
	for <lists+linux-afs@lfdr.de>; Wed, 18 Dec 2019 20:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+qo/X9IIxXQ229VcQsQZjkdxNXaEl4867bnz0BZnRPs=; b=SgQuoSqPlFzgSF9Kf14w2lCNM
	X0VCtQhAf/SA8YQ8Mh3wnTQlCE7Rubu7f1syEK2byEF+5pHUZPV5wqhpy3jpPiv3ymNiapgSZpVrP
	qVZW5HXcgBfYJJxo9PbCuhWSaF+v1VMKxh7N7/FEAZdnBgujynQsGI+tE2apgEmsBBmwzXiE4223s
	dPQE0BpRmy8dUGdQpYOcs3HiJ8rYWBd01Mg/+oHbW9qE2s0Frj86zOzr4m5XiqVMGtI3DMEsdnIQw
	u08JknxLMOYJ75Uddj5v0QguZ3752SubiXLibwEkd8PVE92L5dg+IPK3iDbXW7S3k2eA+egJzw2N/
	GCIbTjicg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihemy-0004J6-Um; Wed, 18 Dec 2019 19:15:16 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihemw-0003X2-Hc
 for linux-afs@lists.infradead.org; Wed, 18 Dec 2019 19:15:15 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C5471AC3E;
 Wed, 18 Dec 2019 19:15:04 +0000 (UTC)
Date: Wed, 18 Dec 2019 11:08:33 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rxrpc: struct mutex cannot be used for
 rxrpc_call::user_mutex
Message-ID: <20191218190833.ufpxjrvin5jvp3m5@linux-p48b>
References: <157659672074.19580.11641288666811539040.stgit@warthog.procyon.org.uk>
 <20191218135047.GS2844@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218135047.GS2844@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_111514_734160_D02DA58E 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-1.3 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.15 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-afs@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, 18 Dec 2019, Peter Zijlstra wrote:

>On Tue, Dec 17, 2019 at 03:32:00PM +0000, David Howells wrote:
>> Standard kernel mutexes cannot be used in any way from interrupt or softirq
>> context, so the user_mutex which manages access to a call cannot be a mutex
>> since on a new call the mutex must start off locked and be unlocked within
>> the softirq handler to prevent userspace interfering with a call we're
>> setting up.
>>
>> Commit a0855d24fc22d49cdc25664fb224caee16998683 ("locking/mutex: Complain
>> upon mutex API misuse in IRQ contexts") causes big warnings to be splashed
>> in dmesg for each a new call that comes in from the server.
>
>FYI that patch has currently been reverted.
>
>commit c571b72e2b845ca0519670cb7c4b5fe5f56498a5 (tip/locking/urgent, tip/locking-urgent-for-linus)

Will we ever want to re-add this warning (along with writer rwsems) at some point?

It seems that having it actually prompts things getting fixed, as opposed to
just sitting there forever borken (at least in -rt).

Thanks,
Davidlohr

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
