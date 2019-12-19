Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 366A1126871
	for <lists+linux-afs@lfdr.de>; Thu, 19 Dec 2019 18:51:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GVnmQyXN+Z9+LDU8AJV7w1ED5aQRU4eUsS4OYDq0ySM=; b=fnld809+Rr9J2qKJ6EHvVETl3
	6rj06pLHkv+mKFYZWj2X8XSMNq8R6DdPxATJqjsuKoDkpPPaTibzBqJhdnPG96zOk+DG/wdg1AfRz
	rIJdki3TYyE8qPK7mm3T3JlhMWqi6JbBSU6EPjxTxBNTkpU93vStp87XhgwjDFLeiomALa8FIP5eb
	9OmQcyZelzDoeyRYfwLAe3MxR9UkAsEiAr7xNKft5utuaY97Xb/7ctvKj5BmJKuECAvPFbaLpYcc1
	clljv3ccQM0I+zkJMAYVl7TSKBlWUkkku03hIWCnlq3+Jk21haiuxLtjyGuV+b9OFt/hjkDVxLE7r
	2hyrrmquQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihzwv-0006pY-U9; Thu, 19 Dec 2019 17:50:57 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihzwt-0006oy-2H
 for linux-afs@lists.infradead.org; Thu, 19 Dec 2019 17:50:56 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EFE88ACF2;
 Thu, 19 Dec 2019 17:50:52 +0000 (UTC)
Date: Thu, 19 Dec 2019 09:44:17 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] rxrpc: struct mutex cannot be used for
 rxrpc_call::user_mutex
Message-ID: <20191219174417.jax2fy3fvrvrrpsq@linux-p48b>
References: <157659672074.19580.11641288666811539040.stgit@warthog.procyon.org.uk>
 <20191218135047.GS2844@hirez.programming.kicks-ass.net>
 <20191218190833.ufpxjrvin5jvp3m5@linux-p48b>
 <20191218202801.wokf6hcvbafmjnkd@linux-p48b>
 <20191219090535.GV2844@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219090535.GV2844@hirez.programming.kicks-ass.net>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_095055_249278_71EF0028 
X-CRM114-Status: UNSURE (   6.72  )
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

On Thu, 19 Dec 2019, Peter Zijlstra wrote:

>Automate what exactly?

What I meant was automating finding cases that are 'false positives' such
as rxrpc and kexec _before_ re-adding the warn.

Thanks,
Davidlohr

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
