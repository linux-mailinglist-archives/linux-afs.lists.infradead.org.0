Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42F1651CE
	for <lists+linux-afs@lfdr.de>; Wed, 19 Feb 2020 22:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDtHjUFhUwMysoysDpujmO12BLE9ShgjVn6MKHuq5fk=; b=ldsfbHypAc12kr
	/kHEYts1Ru2mZ4Ts1UmQP9c6Es4UPzDZT+vUVA5Wu3lmsCPiHrCA941CLGBZcP9ZU3B4tYNMVkNga
	2Ow05aVA8VjgnIau67OT1KRsNpTBoABkwIypBsFZg1P7Ix1s7dDdpr3KM7/nazUTcMIYaZWsvka/Y
	+QJPpaSoqD93yeoBlQ9PyHX6ZB4S3fps5crSkp/mvXypu3JMNORJdjMbEttC9wugmxdmi06/eEtmV
	PCI8qegouNfyG+WndkWnvM0DaVvYhL7U1ErisL5HvJxMcTqqaFblMUItsR5IfoJofA3+1VtsQkoIA
	dEsEQj8VljFszlzagO1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4X5J-0007Sd-GQ; Wed, 19 Feb 2020 21:40:45 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4UhJ-0007uw-Rf
 for linux-afs@lists.infradead.org; Wed, 19 Feb 2020 19:07:51 +0000
Received: by mail-lj1-x243.google.com with SMTP id q8so1552244ljb.2
 for <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PW7lNRLaUwWMkxjmDviGmCx98DZMFUxSA3+XY1xBUHc=;
 b=Hx1j/CCXthRsFcYUkCqUCZKHuALKrv53PhNO0/eSPdI55ETBuvMT4Bzt7Qa//aT+Xq
 pbz3LbAT0K7mf2O2wl4T+6nDRq33OiFGxtJRkEnoPAzmD/q8ILz+w8fB+i5OEbDM4aTv
 V5D7jcX/IJAfFXSwG3AgccJqFA6k9pBx+DkqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PW7lNRLaUwWMkxjmDviGmCx98DZMFUxSA3+XY1xBUHc=;
 b=OriPckKtxWz0grPPYDwErwBkBc1DShJjgBJJQuZtTGpVji/UrqeIuzfXkGPQks6mAG
 +gw2VrHOlHj9EcCnzp32s1E1OLLujwdb/5zTabXdHq4QqFLoAMBppUQVOOn4OWTBgkhB
 x6RreqwbU1cLV8Kdng1/f5EXw6huuD/nhfxSG+UQaCj97KytNK7VCvnC7iLSDIEqfVd9
 vyZ3wK2gPPGD2cdahmvprUa0UK62WTm9PBzZ3P5Vp5/CK6uIV8Kuwum/T6f9Xph7wPiI
 ppoLa7usdyX95qY0xTruohve3Gr/fLc9Oq1MNkh93l+kAjzgiAKV82I7R3c2RNVtKjuy
 CWVA==
X-Gm-Message-State: APjAAAWca8T3Oio/D4Lz+YsGqTK3zu9crqPGk99lZZh6POYegDVoUztj
 5gz3cRJpQI3ISeg87Y/WtcMlt/H5mQ0=
X-Google-Smtp-Source: APXvYqzCrrDcN8ihTuUyLfzDp0cj0aq3rr9Vs5r4j0KGRDDEj45xJohYAKMEUbu04FCm7LA3IjWF9A==
X-Received: by 2002:a05:651c:120d:: with SMTP id
 i13mr16657489lja.173.1582139266542; 
 Wed, 19 Feb 2020 11:07:46 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id t21sm334344ljh.14.2020.02.19.11.07.44
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 11:07:45 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id c23so994248lfi.7
 for <linux-afs@lists.infradead.org>; Wed, 19 Feb 2020 11:07:44 -0800 (PST)
X-Received: by 2002:a05:6512:687:: with SMTP id
 t7mr14685091lfe.30.1582139264476; 
 Wed, 19 Feb 2020 11:07:44 -0800 (PST)
MIME-Version: 1.0
References: <158212290024.224464.862376690360037918.stgit@warthog.procyon.org.uk>
 <CAMuHMdV+H0p3qFV=gDz0dssXVhzd+L_eEn6s0jzrU5M79_50HQ@mail.gmail.com>
 <227117.1582124888@warthog.procyon.org.uk>
 <CAHk-=wjFwT-fRw0kH-dYS9M5eBz3Jg0FeUfhf6VnGrPMVDDCBg@mail.gmail.com>
 <241568.1582134931@warthog.procyon.org.uk>
 <CAHk-=wi=UbOwm8PMQUB1xaXRWEhhoVFdsKDSz=bX++rMQOUj0w@mail.gmail.com>
In-Reply-To: <CAHk-=wi=UbOwm8PMQUB1xaXRWEhhoVFdsKDSz=bX++rMQOUj0w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Feb 2020 11:07:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=whfoWHvL29PPXncxV6iprC4e_m6CQWQJ1G4-JtR+uGVUA@mail.gmail.com>
Message-ID: <CAHk-=whfoWHvL29PPXncxV6iprC4e_m6CQWQJ1G4-JtR+uGVUA@mail.gmail.com>
Subject: Re: [RFC PATCH] vfs: syscalls: Add create_automount() and
 remove_automount()
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_110749_896774_5ACC48E7 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
X-Mailman-Approved-At: Wed, 19 Feb 2020 13:40:43 -0800
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
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
 AND..." <linux-nfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, coda@cs.cmu.edu,
 Geert Uytterhoeven <geert@linux-m68k.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux-afs@lists.infradead.org,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Feb 19, 2020 at 10:55 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Why don't you just use mkdir with S_ISVTX set, or something like that?

Actually, since this is apparently a different filetype, the _logical_
thing to do is to use "mknod()".

Yes, yes, it will require a new case (and maybe a per-filesystem
callback or a flag or something) in "may_mknod()" and "do_mknodat()"
to let those new kinds through, but it sounds like mknod() is actually
what you're doing.

You presumably need a new type _anyway_ for stat() and/or the filldir
d_type field. Or do you always want to make it look exactly like a
directory to all user space?

                  Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
