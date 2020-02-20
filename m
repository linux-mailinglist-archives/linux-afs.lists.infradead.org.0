Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D283816542F
	for <lists+linux-afs@lfdr.de>; Thu, 20 Feb 2020 02:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+F+bBnJhIY2hlNQA/EdHxnuAXBWAUeSyOuQfjhMxY/c=; b=HwqGjet398H+Qu
	tpgxFlbOc7vJk26We6GI0P071NAb3AnivLUaPGGdLBY2QOs9aQId2NKp810MMqZKyk9McciE1u5vd
	5inwG3nG+yNvMkSg9CO9pswn45qmsC8sj7JEkjPzPYU7+0ygjaG531bgUxgXUI0A4mpC+tjFuKQtd
	EBInhWKRBfkFC5urOT4p//FBul3rKzSsJG/1MVi7GTW0Gwwe4AvXgCjKHFT0Fyv8R7PxISEtV7Of0
	dT70oEbSa78Smtzr6ZAWCiCl17VMNXR3uDICQWiVFkGNoMaj5ByTNF1S8XDgGGk5DYHbLSlookRDM
	dXtJYwCv0BEeDd+aX9hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4aXM-0001uw-HW; Thu, 20 Feb 2020 01:21:56 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4aXJ-0001uR-St
 for linux-afs@lists.infradead.org; Thu, 20 Feb 2020 01:21:55 +0000
Received: by mail-lj1-x243.google.com with SMTP id x7so2451577ljc.1
 for <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 17:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbQuf+GtIv5ENkR5EOBV/0SjhBAjvOXcFmXLUjHR2lU=;
 b=XnycSrB0jCwOgjAd3Tk6WrvlvVoT7sGo/6hbjO/h17hHZbwSad2xHVSEurbThdfKcw
 IjbcEMvts9odqDAPeKQrOB+po4yNFk6ZQwUgiYxvXDRHn/9ZXwwMjrof8oZcnJ1NLe3F
 1a4LZIPhqkrmhgz/lVmfbuWYq8UagFoajp4YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbQuf+GtIv5ENkR5EOBV/0SjhBAjvOXcFmXLUjHR2lU=;
 b=KmVOcOixo96b2D3rH80dEGxcJBgzlxB8HOiW7U4DBFiQxiFjN0r97xhnKR/csNz17O
 T77qZWVeTusP8J+z4vH2j7I07mLBEgp70d5yEvGbunW5CyN5Df95jwkaAXuQXqflISOH
 fepHPqKhm+SABA2Ob1O4oQ9W0pE9//xnHdDFQtFw+QTXDZngQ3Q8iF8Z6jKE8GlosoE3
 RNb8CoRVP4K1+TO3t/rF99ugMe+t9Zj5t5zXmYCmRgzH5SP+ncppRfxf819rTNmkh6tN
 xKzdO0EI3L1sOB6I2ExFG0ZOT4YpaKDHFCiUPbZtAdj2Mvoz0NYTmtecVllpUFtG3SuV
 NV/Q==
X-Gm-Message-State: APjAAAV8eX+0hrMFjLvJh24PNMwm6g+CYbz5rrqEqKkNMLcfEdVXFfiq
 LVyXDteCpp96uR5+t6ClfdJPLsIiMYo=
X-Google-Smtp-Source: APXvYqzjWYwD5gOKMKgzUbasqjCkZ2DH9YLFXfjGqEu0bNcQpH/xa7kXge+wirz5TZn/VJVuyijJQg==
X-Received: by 2002:a2e:80d1:: with SMTP id r17mr17553834ljg.292.1582161711299; 
 Wed, 19 Feb 2020 17:21:51 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id j7sm686199ljg.25.2020.02.19.17.21.49
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 17:21:50 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id x14so2374319ljd.13
 for <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 17:21:49 -0800 (PST)
X-Received: by 2002:a2e:461a:: with SMTP id t26mr17213618lja.204.1582161709449; 
 Wed, 19 Feb 2020 17:21:49 -0800 (PST)
MIME-Version: 1.0
References: <158215745745.386537.12978619503606431141.stgit@warthog.procyon.org.uk>
In-Reply-To: <158215745745.386537.12978619503606431141.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Feb 2020 17:21:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=whOAg2EJycA=x=8RzBy3dnDFsgnyxrjREyNu6-8+eTTHA@mail.gmail.com>
Message-ID: <CAHk-=whOAg2EJycA=x=8RzBy3dnDFsgnyxrjREyNu6-8+eTTHA@mail.gmail.com>
Subject: Re: [RFC PATCH] afs: Create a mountpoint through symlink() and remove
 through rmdir()
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_172153_938059_B8FFBB02 
X-CRM114-Status: GOOD (  13.27  )
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:243 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Feb 19, 2020 at 4:11 PM David Howells <dhowells@redhat.com> wrote:
>
> If symlink() is given a magic prefix in the target string, turn it into a
> mountpoint instead.
>
> The prefix is "//_afs3_mount:".

That sounds sane.

Your argument that if the prefix is made really long it couldn't be a
valid symlink at all on AFS is fair, but seems somewhat excessive.

The only issue I see with this interface is that you can now create
these kinds of things by untarring a tar-ball etc.

I can see that being both very convenient and a possible security
pain. But I'm assuming that the real security is on the server side
anyway and not just anybody can create arbitrary things like these?

         Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
