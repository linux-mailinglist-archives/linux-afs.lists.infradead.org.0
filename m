Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8B9175FB6
	for <lists+linux-afs@lfdr.de>; Mon,  2 Mar 2020 17:33:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7poXgYE0JPNuBBME31aME7s1p7Q5lv6MUyLeNNBnAM=; b=tOjFN8vVSyA/5s
	tAC96vRqNab8q2M4t6Jr1kV0opwZuOuxkiqVCP0jeVNHBwkhHsVMqStvYo/FvYXL+MrvVipqidcc2
	7Q+hL03D8B19X94ps77UYB1Rx1q8D9R0UFvzg/fqHnwaMRIE6dhgKECgjgZEGAm0mEE0Tcg/gxwO0
	AO0bViA+zRAtUaQIWHTZs/A3ZpAK0maNq9I+aUqhful/Iu7n4UzZQDLTQfyFFDWrNF0fkjuMJvk3V
	phN+Eivtbpln9jE+EphIR2IPR3V/4iB4g8nt1oArnR3wI3isYb2MSbeEx9BtbIaQQT2G4eXRH94mU
	zkMHcpaELjZ0vyRcIi2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8nzu-0006hc-FJ; Mon, 02 Mar 2020 16:32:50 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8nzq-0006ga-P0
 for linux-afs@lists.infradead.org; Mon, 02 Mar 2020 16:32:48 +0000
Received: by mail-ed1-x543.google.com with SMTP id c62so597071edf.0
 for <linux-afs@lists.infradead.org>; Mon, 02 Mar 2020 08:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=md11bwOKEakFXKu3QY8x1RHti2GVIdi3Oo714Bw2GlQ=;
 b=Nk9uis29bVV2FlwcDpdHFVWRX02bbXYsjpVDQKkV7DdRRNuJ+ZPudiWTuEZvhcZwa8
 KWYYb89ep4HqONII1HPhwaUeg++iG0+WCjJjUlOQiD6xkgCFLCRHQm3frl1q07JiPzg2
 Qq4VKjfhkWjfNSyIxeNiIoxUi30k4SUlqHZsej705QPh9SpxKj4MjjZJ0DPQlLfBKHe8
 jPXpwmp/AmNDnYtQ1kSfoy9Y/goKavW87chQA/IcvIyJ7kDMO8+m97RU+7NcVpPb094q
 220DS2n7OWvho+auCOZHHvl7/WrU1dlsOIQMEVkd8ICyy1CCVOszWJHsXYNa9og5jBi6
 0ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=md11bwOKEakFXKu3QY8x1RHti2GVIdi3Oo714Bw2GlQ=;
 b=sKoRxe/qrkussnwV4XncilEMzWHucOBRxEcNQboPlKAKTwB0jh+urQNq+RjwBute/L
 ngMEb52bm8UOj/js0oO7fcIWUXfF9LLJuTL8jNtjuV80mOzASXu138GRbkYasvp54twg
 ssCcFwDnSohner+nJsiHCGPXDn1J1Ae8H5Tri3xjtRGsN0dNJNCcaeYiiyqRSaZT0ESY
 r1f6klXKhj6D3Rxjqio1ft+0o6daBwn6JF7GI8eYNoBNpCeLeBKUbylSdx/LsCpdXvWX
 FP/J2ITw+7hnOB+WksQSGevVPBOBNFJHesIL9s31o7j9P8De2p+E16oAcj47p5DQ4CpS
 MZug==
X-Gm-Message-State: ANhLgQ2c/8XuCeC+LJrKrbxX4EzX50kb3DtwqoJHbCqxAnLQ18+M5P3C
 /ihTtq5bKeSYaFrEAUftsNuXVcvoVoVHZ/rDJHFU/g==
X-Google-Smtp-Source: ADFU+vtZBXpvF7+PVoU4fnrDQ5j0G0/6ACUnnk05Knv8vijtaDgmr94GVFmF7TmlKjZWwlz7KnZUQgzjP1yBUZ7/h2k=
X-Received: by 2002:aa7:cf0a:: with SMTP id a10mr84815edy.333.1583166760589;
 Mon, 02 Mar 2020 08:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20200229092155.23965-1-olsonse@umich.edu>
 <005EF5A0-4D79-4355-9DD3-DEDF0FA68326@auristor.com>
 <5176a0ceacc80e2ac54b0865cd58b8b4@ca-zephyr.org>
 <CAOx9Pehr_s8vQuccvQ35ksveYYMAsE2B2Q6oDruvtcO-ev2tTg@mail.gmail.com>
 <949b4e71141cc66ed1dfcc9d35018506@ca-zephyr.org>
In-Reply-To: <949b4e71141cc66ed1dfcc9d35018506@ca-zephyr.org>
From: Spencer Olson <olsonse@umich.edu>
Date: Mon, 2 Mar 2020 09:32:29 -0700
Message-ID: <CAOx9PejTuEYDC3Nz2kp7p-9g5heVh6FrbX1TnbdBMsUyjVfxhw@mail.gmail.com>
Subject: Re: [PATCH] Add debian build package
To: Bill MacAllister <bill@ca-zephyr.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_083246_884452_75303524 
X-CRM114-Status: GOOD (  22.46  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:543 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Sun, Mar 1, 2020 at 2:59 AM Bill MacAllister <bill@ca-zephyr.org> wrote:
>
> On 2020-02-29 11:46, Spencer Olson wrote:
> > Not a problem.  In any case, the error that you are seeing is the same
> > error that I am seeing.  I hadn't been using kafs for some time, so I
> > can't tell when this started.  I've tried using the dyn mount option,
> > mounting the root.afs and root.cell, all with the same result.  I've
> > tried using existing afsdb entries and also manually specifying
> > servers.  I normally have my firewall very restrictive, but I tried
> > disabling it entirely.
> >
> > If you figure out what is going on, let me know.
> >
> >> $ ls /afs/cs.stanford.edu [2]
> >> ls: cannot open directory '/afs/cs.stanford.edu [2]': Destination
> >> address
> >> required
>
> The problem that I was having was because I moved kafs-dns to /usr/sbin
> and didn't adjust the kafs_dns.conf file. But, that wasn't the only
> configuration mistake I made. Once I got all the configuration files
> in the right directories magic happened.
>
> >> Your work made my progress possible. Thanks a lot for sharing it.
> >> Once we get a working package I will see that it gets pushed into
> >> Debian.
>
> I now have a working package.  I have tested on buster and bullseye.
> I will need to spin up a 20.04 ubuntu test system to make sure it works
> on Ubuntu.  There are still some rough edges that need to be addressed,
> but I am ready to start working with Russ Allbery to get it uploaded
> into Debian.
>
> Thanks again for your work.
>
> Bill
>
> --
> Bill MacAllister <bill@ca-zephyr.org>

These comments are probably as much for the entire group as for BIll.

Bottom line up front:
1) Status of my packaging (not combined with Bill's efforts)
2) Some feedback on debian packaging
3) Some feedback on redhat packaging

__
1) Status of my debian packaging:

My config did produce a working package:
  * On Ubuntu 20.04 : works great
  * On Ubuntu 18.04 : only works if you tweak request-key.d/kafs_dns.conf
     It looks like 18.04 is still using an older version of keyutils where
     the naming of the items in request-key.d/* are very important.
     To temporarily fix this, either:
     -  add contents of kafs_dns.conf to the top of request-key.conf
     *or*
     -  rename kafs_dns.conf or make a symlink to it with the name
"dnsresolver.conf"

    After doing this, my "Destination Address required" problem went away.

   Is it in order to attempt to push the updated version of keyutils
through to 18.04
   (I won't personally care much longer, since I'll move entirely to 20.04)

2) Debian Packaging feedback
Cloned Bill's repo and I have some feedback:
  - you missed installing some libraries that are necessary for the client
  - your debian config seems a bit more complicated than mine without producing
    significantly different results (aside from mine working and yours not)
  - you changed the location of various installed components differently from
    the normal install.  I don't think these changes are necessary and only
    make the packaging more complicated/different from the Makefile install.
    In any case, there does not seem to be a debian reason for making these
    changes.

Either I miscommunicated or you (and perhaps David) misunderstood the
purpose of my patch:

The reason for my patch/commits was *not* to help create a quilt solution
for kafs-cilent, where we have to update from upstream.  Rather, my
intention was to create a debian build configuration that can live *with*
the primary source code similar to the redhat/ subdirectory.  This is done by:
    - *not* duplicating any package information in the debian/ sub-directory
    -  only performing the actions that were necessary to take the
       installation, as given by the original Makefile, and produce from it a
       debian package meeting the debian layout and requirements.
       These actions include:
        *  Using my mk_changelog script to generate a changelog that is
           pulled directly from the git history (not wanting to duplicate any
           information)
        *  Copying over the license info from the root dir (yes, I realize that
           debian packages like to just have meta info on packages, but this
           was the easiest to do in short order following my rule:
           "dont' duplicate package info"
        *  Do *as little* manual packaging as possible.  In other words, use
           as much of deb_helper to package things appropriately.

2) Redhat Packaging:
  Following my personal rule of trying to avoid duplicating
information just for packaging,
  I'd like to recommend doing something to make the changelog
automatic in the rpm.spec file.
  Looking online, it seems that rpm.spec does support an %include
directive.  Might I suggest
  that an option be added to my mk_changelog script to output the
changelog formatted for
  redhat where the content of that output can be included by an
%include directive?

  Take these comments with a grain of salt, since I've not built any
redhat packages
  for several years and don't have an rpm system to test with.

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
