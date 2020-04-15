Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1420B1AC6F9
	for <lists+linux-afs@lfdr.de>; Thu, 16 Apr 2020 16:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvwA6XfQ2tLKG2hpGs8H85u3oVDpzWpvJiaITs+yegk=; b=hWL3ZEJ7/PHBTH
	dAJYunx22ypYm2w1ovfe1Q28cZ5JfXAAg19GAySLEn66KZwC9OLR4iLfL35OKtIV30u7FUvEJ2MEI
	o5S2VhhAwbPzl6qiJLIaLO+pgXr/8kPgyTl3ed+rYsUEp2mZxVTlJiZ207pWXE+aUgzbbjHsHJhHP
	2OJvhRNwrMpezo+M7T/p2h1/rNX8o30XNxQyHH8ATcNAapkTPOtUbITIuRZ+W4xW1o6ZUI3hq3+UE
	cy0nL93aUiT89faPXuYdC3ThGohQe5ycYNIGZbN/S1cgzMAbk/23RcOR3tpotAQESZiAPbm9wxlLO
	73+lpbPyzQF4u4NRQeYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP5nc-0001gb-TY; Thu, 16 Apr 2020 14:47:28 +0000
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOlVi-0001qh-R8
 for linux-afs@lists.infradead.org; Wed, 15 Apr 2020 17:07:40 +0000
Received: by mail-yb1-xb41.google.com with SMTP id l84so397962ybb.1
 for <linux-afs@lists.infradead.org>; Wed, 15 Apr 2020 10:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mEawja+POkeWDhdeSb2n3JPPbIrc1MBf0BcSpr4jXiw=;
 b=DW/aynPdwuOV0UulG8/7DG2OSJ6ky7m4cHJ+Gz21nR6FRRF2vhyh16CWluwim3SoYH
 Sa3l3B3FzcLzAWMfA6xNlEZa48cJ9CxVyXx9wg8ieAy8Y5M9yIqLVmci0t7KahDzEp3+
 0TqZwO9P5Molcs7XpM8HUylYXdhNKpm1l4A7g2qFfA3vk8FbXmQZ1hXFuN1x1RAhqt7v
 FwAoYkOyjNfRiOoUzhrbnRB1KWQFZ4mT1YcaV5pjQKptgjzp1AtP5iy5Tg2xG69PKdwT
 tTojddkg9JdojP/Tpl3xBs1VsghOKLCz4A+73Z27B3CA1QGRd0/CftSCiv79EQSHLi++
 fpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mEawja+POkeWDhdeSb2n3JPPbIrc1MBf0BcSpr4jXiw=;
 b=fmL7DR21AdgBM9jAOTsBLh+Lbk/lgWpyRquY2s0PK0I3W/hDGNIWpwy0H5Q8rQ2mPY
 8eN7RmCMrLdBLJ8SGWVEnJV9cJzOLeq99evkKWP7sCg9t1IZqTsoCJ8GyPwUys0vM5TH
 O2xR3UfEOAzRL8CCpQEdrcNwFsd6fAKK2Kl+wZ6dBmqDYdWmKkNIsxMQ5Mio1jeXSD0S
 nMHPjZF2wpg2ATsOVS/cfCPDh0jZtrriAKvj2IyzKofnmMWTqfXdWjNmct9XAwMpurQY
 zyrhMKkMXSQMWhvWzoPIxl49GNz4Vgq9IV/ANxORGFYkW46uvF+aLY+v8vmZKZKB1JIK
 Jmcg==
X-Gm-Message-State: AGi0PubvtglOHhXC/lhnSoF+DjPZgqw38orqjBsVaWyX3bypJsSpbSbN
 YPCUHb7djkBw8yT0q2TMGj+xyoOtyWSn3GU75B/FdQ8k
X-Google-Smtp-Source: APiQypIUYnCqlboeLXX498mvDUEkiFizMnzOWoFRqJIN9jX23XsZO6pmKNshpPPzZLdtasP8OYlYcSo7oKRRSZZK1Gc=
X-Received: by 2002:a25:cf12:: with SMTP id f18mr9443585ybg.167.1586970457348; 
 Wed, 15 Apr 2020 10:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <3865908.1586874010@warthog.procyon.org.uk>
 <e751977dac616d93806d98f4ad3ce144bb1eb244.camel@kernel.org>
In-Reply-To: <e751977dac616d93806d98f4ad3ce144bb1eb244.camel@kernel.org>
From: Steve French <smfrench@gmail.com>
Date: Wed, 15 Apr 2020 12:07:26 -0500
Message-ID: <CAH2r5mvj7GF3i8AE6E=+5f_Vigtb3uw=665F2uuBOgGzUhHObQ@mail.gmail.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
To: Jeff Layton <jlayton@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_100738_878989_D70424E6 
X-CRM114-Status: GOOD (  18.36  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:b41 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [smfrench[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Mailman-Approved-At: Thu, 16 Apr 2020 07:47:27 -0700
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Apr 15, 2020 at 8:22 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Tue, 2020-04-14 at 15:20 +0100, David Howells wrote:
> > Since key.dns_resolver isn't given a TTL for the address information obtained
> > for getaddrinfo(), no expiry is set on dns_resolver keys in the kernel for
> > NFS, CIFS or Ceph.  AFS gets one if it looks up a cell SRV or AFSDB record
> > because that is looked up in the DNS directly, but it doesn't look up A or
> > AAAA records, so doesn't get an expiry for the addresses themselves.
> >
> > I've previously asked the libc folks if there's a way to get this information
> > exposed in struct addrinfo, but I don't think that ended up going anywhere -
> > and, in any case, would take a few years to work through the system.
> >
> > For the moment, I think I should put a default on any dns_resolver keys and
> > have it applied either by the kernel (configurable with a /proc/sys/ setting)
> > or by the key.dnf_resolver program (configurable with an /etc file).
> >
> > Any suggestion as to the preferred default TTL?  10 minutes?
> >
>
> Typical DNS TTL values are on the order of a day but it can vary widely.
> There's really no correct answer for this, since you have no way to tell
> how long the entry has been sitting in the DNS server's cache before you
> queried for it.
>
> So, you're probably down to just finding some value that doesn't hammer
> the DNS server too much, but that allows you to get new entries in a
> reasonable amount of time.
>
> 10 mins sounds like a reasonable default to me.

I would lean toward slightly longer (20 minutes?) but aren't there
usually different timeouts for 'static' vs. 'dynamic' DNS records (so
static records would have longer timeouts)?


-- 
Thanks,

Steve

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
