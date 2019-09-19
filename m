Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C45AB7B7F
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 16:03:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nd7tQ/aTwFW42KOdhSowbFKz8BnVOnq09erkJeDx4U=; b=M3PuDQBygoAHjW
	JYp7Ulr9D9jc+I51TEDeDjLJVVwLOTpplF4Uxp3ri2FzsLX5dV2pROOjANeeuSAAXA99s97dTdkGk
	1OsEhv17is5j1BUFwRYU8GZSBTiAczVTZsx+qSXhcZv8gEheZu0TejGsLEjJb9rpyTSC7o9FCydbY
	+IWLP/niaJBOXNvrhrY2Qka8s47K6fxfRXx5Q0obieIfEHz1QqFpWBpgKU5waWbpGylRuQ051YZPp
	XLvJVvFAdRiBalXTTaPltNRF08h/Ftned3vrpHTpa8htXDlPA3OCvUi5wiaZXBqUi7uRNz9nmHlzC
	UhN7yl4TMermA/ruubdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAx20-0005P0-Ai; Thu, 19 Sep 2019 14:03:36 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAx1w-0005O1-E2
 for linux-afs@lists.infradead.org; Thu, 19 Sep 2019 14:03:33 +0000
Received: by mail-io1-xd44.google.com with SMTP id n197so7907040iod.9
 for <linux-afs@lists.infradead.org>; Thu, 19 Sep 2019 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5/2Z+xK26B0Qa9nBtssF8FRk9MDYmDZ7v204MIYrXPQ=;
 b=DLsWOHJytMjXzqdooDAScGRrLwolZBO1OrSvUyszMDhy2r9hjOgN48Q86vlfMu1nSJ
 vUPEsxhOFj3/m8893jlHMEw4TQFJzkJET1FO9NTZ8cnCgGhDj+JBUf4RzoeLPXHWdbrz
 DXAgqZ9ijGaS4N0tckhsEbH9W3jtcRQq5rnCJ1NooVNIYpL70KoObUOfYRPHdQYhjsGQ
 9ZASgQf6TGzeJITRB23Z2CuU9GtnVJCT1rm9N0YP4SOKKSGGrutz85sueZsV7SUB1ZaY
 //s1dQOZs07d2l55y9pa+biNMptcHOQDBvNZyD33Zum8+ESKRq609Ux8EaTE5ZVJq9Rt
 7CGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5/2Z+xK26B0Qa9nBtssF8FRk9MDYmDZ7v204MIYrXPQ=;
 b=qx6n0duXJZKwtNM8+ynZcHgrxyBxynMndaVC18KLOJHK7gHhFPqVyJJCK7rP5a87+5
 YygXzUofwg2iSIU3PKDrGwMRmvy9+aUYhGzC2ymbjV5PCWI9SVWeN6GjjY5YKNBfpa1J
 h2y/sfwPNIRx2C0cjwcq5xLfQ734vRNvUTPRyWVYC+zxZDPJ7OqzZU/k5BCWpS9198r4
 fYtTWPZ3QFKgIs2fhvSZqKJ0O9NeS9jlDRCjhY+L2FZ6QvZqOh2tT5Z7p2cuiO44GTQU
 jWjXNUzTgCNdgfAhlsUmIkp8D6XiEwFxZ3Gj2S9qHh16WtAzM/twTkAnjVsOZNvU2bOE
 IASw==
X-Gm-Message-State: APjAAAVT02rTcRVvEc3ThinqDdmA6FcvcF8BcCwFRYwWPhtskDScFRdM
 Ulv8vxZTpdd3wP1EyCVPftC+iuA5kK4JHgh/OyU=
X-Google-Smtp-Source: APXvYqxp6gW43kwN3LJPPeCY0tft6kg9EeyqSAnHqBoR8n6r3SlG9KzQt20lImzP6tnJo3niaXDYX5XuA+ZcXpZc25o=
X-Received: by 2002:a5d:9f4e:: with SMTP id u14mr12333009iot.106.1568901810170; 
 Thu, 19 Sep 2019 07:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <28368.1568875207@warthog.procyon.org.uk>
 <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
 <16147.1568632167@warthog.procyon.org.uk>
 <16257.1568886562@warthog.procyon.org.uk>
 <20190919131537.GA15392@bombadil.infradead.org>
In-Reply-To: <20190919131537.GA15392@bombadil.infradead.org>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 19 Sep 2019 16:03:20 +0200
Message-ID: <CAOi1vP-rQLhu=JF1H2Tmz21tM+FhTPYuKYjx05iSijv_QckVpQ@mail.gmail.com>
Subject: Re: [GIT PULL afs: Development for 5.4
To: Matthew Wilcox <willy@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_070332_470842_70D01417 
X-CRM114-Status: GOOD (  18.69  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:d44 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (idryomov[at]gmail.com)
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, Sep 19, 2019 at 3:55 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Sep 19, 2019 at 10:49:22AM +0100, David Howells wrote:
> > David Howells <dhowells@redhat.com> wrote:
> >
> > > > However, I was close to unpulling it again. It has a merge commit with
> > > > this merge message:
> > > >
> > > >     Merge remote-tracking branch 'net/master' into afs-next
> > > >
> > > > and that simply is not acceptable.
> > >
> > > Apologies - I meant to rebase that away.  There was a bug fix to rxrpc in
> > > net/master that didn't get pulled into your tree until Saturday.
> >
> > Actually, waiting for all outstanding fixes to get merged and then rebasing
> > might not be the right thing here.  The problem is that there are fixes in
> > both trees: afs fixes go directly into yours whereas rxrpc fixes go via
> > networking and I would prefer to base my patches on both of them for testing
> > purposes.  What's the preferred method for dealing with that?  Base on a merge
> > of the lastest of those fixes in each tree?
>
> Why is it organised this way?  I mean, yes, technically, rxrpc is a
> generic layer-6 protocol that any blah blah blah, but in practice no
> other user has come up in the last 37 years, so why bother pretending
> one is going to?  Just git mv net/rxrpc fs/afs/ and merge everything
> through your tree.
>
> I feel similarly about net/9p, net/sunrpc and net/ceph.  Every filesystem
> comes with its own presentation layer; nobody reuses an existing one.
> Just stop pretending they're separate components.

net/ceph is also being used by drivers/block/rbd.c.  net/ceph was split
out of fs/ceph when rbd was introduced.  We continued to manage them in
a single ceph-client.git tree though.

Thanks,

                Ilya

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
