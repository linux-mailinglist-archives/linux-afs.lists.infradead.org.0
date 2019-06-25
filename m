Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA752700
	for <lists+linux-afs@lfdr.de>; Tue, 25 Jun 2019 10:47:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cTRWDfVQQgupPSIwberVE+pOnBshoXmHSa2p6jG2fM=; b=Z1XmoYXRVmthkD
	mM/bZpql1PiyrY7rM5rgJ7beVywenXdmDC9HnWiXkcQMyV3LMljIRRg71Szr4JWnLssSRBld536zi
	ysvVbUpfEKtCyiDXAlYN9HCIHbg30rIotNItXRLcVjuIdosCoyYIFn3jh97qUygxLt359NDAdhDjy
	MWWo7aEDX/BJEl5cM+XJQfVA8kMRwtmotBJ9aSVydqE7q0ERIsgh2dIIMQgKzkwtugdG0cYqh6S49
	xi5DwtH2dyHnfGby1tj60muTmAXJ2TeC9L1kNPdxLfA5/s+xK9w6Gwrr4Wi8/edGLJ90S/8xBKMOr
	Joch8bpUUFZxHWsoIRlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfh6m-0005BG-Dl; Tue, 25 Jun 2019 08:47:20 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfgXz-0005St-Uu; Tue, 25 Jun 2019 08:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FeL4YGXndhcHsWSAlte0b7Wx3ZKgDBGUgp4zwa60pPc=; b=tuUzdHIExne/eeS1c00vc7gjS
 AB3LJq0ZQ++Fg6J9CyRBrX4gTrDnwlDJ/Tlg4VwE9EZRX0L7mpJs2iWaNLbecP/UkjiJXVhaFuinv
 efEBhY3azsP53SGPaXLJ7K4+xH3UrVJBVbab7TYd/NhRi4NM6b2joLRQHY3MMZZkKc+ZdLVuLI7OE
 dre6EZ2IAwApDLiwNd+y6XYWNYjwUZwMMPYQNsdKeZs0D9c7jfiuKmdqNZ4YkOKC/SzkotBgMJg+i
 24yIjZQ5KzGpb++2nZrAY8EI3/jnnNxtQW1CqqPB5Krupk3Igd6R4aRfeq60YT3cfWKiHmI6GoOIp
 WwO2NS7gw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfgXg-0003Dx-KG; Tue, 25 Jun 2019 08:11:04 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 56053209FFF54; Tue, 25 Jun 2019 10:11:03 +0200 (CEST)
Date: Tue, 25 Jun 2019 10:11:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
Message-ID: <20190625081103.GU3436@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
 <32379.1561449061@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32379.1561449061@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 25 Jun 2019 01:47:18 -0700
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
Cc: Martin Brandenburg <martin@omnibond.com>, Mike Snitzer <snitzer@redhat.com>,
 linux-aio@kvack.org, David Airlie <airlied@linux.ie>,
 samba-technical@lists.samba.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, keyrings@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-afs@lists.infradead.org, Alasdair Kergon <agk@redhat.com>,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Andreas Gruenbacher <agruenba@redhat.com>,
 linux-rdma@vger.kernel.org, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, Antti Palosaari <crope@iki.fi>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paul McKenney <paulmck@linux.vnet.ibm.com>, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Sean Wang <sean.wang@mediatek.com>, Josef Bacik <josef@toxicpanda.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
 MauroCarvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Steve French <sfrench@samba.org>,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 Benjamin LaHaise <bcrl@kvack.org>, Daniel Vetter <daniel@ffwll.ch>,
 Bob Peterson <rpeterso@redhat.com>, linux-media@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


(sorry for cross-posting to moderated lists btw, I've since
 acquired a patch to get_maintainers.pl that wil exclude them
 in the future)

On Tue, Jun 25, 2019 at 08:51:01AM +0100, David Howells wrote:
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > I tried using wake_up_var() today and accidentally noticed that it
> > didn't imply an smp_mb() and specifically requires it through
> > wake_up_bit() / waitqueue_active().
> 
> Thinking about it again, I'm not sure why you need to add the barrier when
> wake_up() (which this is a wrapper around) is required to impose a barrier at
> the front if there's anything to wake up (ie. the wait queue isn't empty).
> 
> If this is insufficient, does it make sense just to have wake_up*() functions
> do an unconditional release or full barrier right at the front, rather than it
> being conditional on something being woken up?

The curprit is __wake_up_bit()'s usage of waitqueue_active(); it is this
latter (see its comment) that requires the smp_mb().

wake_up_bit() and wake_up_var() are wrappers around __wake_up_bit().

Without this barrier it is possible for the waitqueue_active() load to
be hoisted over the cond=true store and the remote end can miss the
store and we can miss its enqueue and we'll all miss a wakeup and get
stuck.

Adding an smp_mb() (or use wq_has_sleeper()) in __wake_up_bit() would be
nice, but I fear some people will complain about overhead, esp. since
about half the sites don't need the barrier due to being behind
test_and_clear_bit() and the other half using smp_mb__after_atomic()
after some clear_bit*() variant.

There's a few sites that seem to open-code
wait_var_event()/wake_up_var() and those actually need the full
smp_mb(), but then maybe they should be converted to var instread of bit
anyway.

> > @@ -619,9 +614,7 @@ static int dvb_usb_fe_sleep(struct dvb_frontend *fe)
> >  err:
> >  	if (!adap->suspend_resume_active) {
> >  		adap->active_fe = -1;
> 
> I'm wondering if there's a missing barrier here.  Should the clear_bit() on
> the next line be clear_bit_unlock() or clear_bit_release()?

That looks reasonable, but I'd like to hear from the DVB folks on that.

> > -		clear_bit(ADAP_SLEEP, &adap->state_bits);
> > -		smp_mb__after_atomic();
> > -		wake_up_bit(&adap->state_bits, ADAP_SLEEP);
> > +		clear_and_wake_up_bit(ADAP_SLEEP, &adap->state_bits);
> >  	}
> >  
> >  	dev_dbg(&d->udev->dev, "%s: ret=%d\n", __func__, ret);
> > diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
> > index cfe62b154f68..377ee07d5f76 100644
> > --- a/fs/afs/fs_probe.c
> > +++ b/fs/afs/fs_probe.c
> > @@ -18,6 +18,7 @@ static bool afs_fs_probe_done(struct afs_server *server)
> >  
> >  	wake_up_var(&server->probe_outstanding);
> >  	clear_bit_unlock(AFS_SERVER_FL_PROBING, &server->flags);
> > +	smp_mb__after_atomic();
> >  	wake_up_bit(&server->flags, AFS_SERVER_FL_PROBING);
> >  	return true;
> >  }
> 
> Looking at this and the dvb one, does it make sense to stick the release
> semantics of clear_bit_unlock() into clear_and_wake_up_bit()?

I was thinking of adding another helper, maybe unlock_and_wake_up_bit()
that included that extra barrier, but maybe making it unconditional
isn't the worst idea.

> Also, should clear_bit_unlock() be renamed to clear_bit_release() (and
> similarly test_and_set_bit_lock() -> test_and_set_bit_acquire()) if we seem to
> be trying to standardise on that terminology.

That definitely makes sense to me, there's only 157 clear_bit_unlock()
and 76 test_and_set_bit_lock() users (note the asymetry of that).


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
