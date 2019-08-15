Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0248C8F70F
	for <lists+linux-afs@lfdr.de>; Fri, 16 Aug 2019 00:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hm1QqKhX+n19VWcUi2NPCtByySobBo4G8EbqcApcFDs=; b=OI1DQBqzl9/TvN
	n+X73XSBVY7pfSIZa907yZErbG3enFBk6nnqu1fpzJ2hyxaTeJvv//qKyvM8AayYMTo2qfZ70yXeD
	fT1dvh+e11sYN/M90v6kIxMO7WrBPLjN8/qF8ubhX5Ude35+t1/eCeRxwtD/OaVsawHiL1FdABgXB
	Era0tAzLKC7aboSC4wmq40ogLep6hAO5gR28II8vh7T/gPpNFIwKZbJlObufbFzZy6wSA5t968zOV
	miIvljQye5kx7aJWb3kcc66L2TpNK85HKdZCjXgIlCFRvF1DVfIv3T8If3QKeQkWKzSct/gDZ1KBl
	fNtgoQqnAvhOrMZnAELA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyOKx-0007P0-HM; Thu, 15 Aug 2019 22:35:15 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyOKu-0007OB-U6
 for linux-afs@lists.infradead.org; Thu, 15 Aug 2019 22:35:14 +0000
Received: by mail-pf1-x442.google.com with SMTP id c81so2027832pfc.11
 for <linux-afs@lists.infradead.org>; Thu, 15 Aug 2019 15:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0bj6abrMr4gCECqmCrBbgDjp+biz3GEYW7dznHQhuE=;
 b=YTthKozNU0AfAmGeC18iVc7BIN6HgPzw/Mywcvzg084v19wE7vfkfBXXeFOerumZ36
 0vu4LpID2z5qtebuIEITL8e/ewoSd/9Rln5xJngDRB3ViYMtXHoP7e8HCuWPEbbBc2jt
 1bLiEDndGuFCLigxaDdAPF24z/adjNfwKV1mudg7ON6L12tuK6l02Kqrtfs80JcudB/g
 Nuci2mXBy9uh30+RB2OK1HbjQucQzhCdnaBZYYJ5BiQYbQr7iXjJAfPUZKYwbg5/7Lvk
 KcKGEAuba57IXbU9n1tK/057cfUmSpOqR3pq4NXuSitGgIGkA7lWSrnqjuh11Z9qOo8f
 IOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0bj6abrMr4gCECqmCrBbgDjp+biz3GEYW7dznHQhuE=;
 b=NVh+WxM5u/v1kyffaAAuN035d8jaW/IhSMmPFDYkAsej1PZZ6HnUM3Wr2Iod8yCHV+
 4RlTQDcGVIa2tJIke46OqXOUv+BB+RAI2tsbTU6Hi4/QaWSTJh7KG+ycpNZjITpmWZ6E
 b7SomNiHB7jBhdddVBEP27rH6aZaUawEi4dDwb0/8qS6t0pX02yTTNpiV1S8H7Ln7yvA
 lmiunnTvSckRyhV6iJbl5kyXEtwXpd9cPEWW1xuRIMqvgvSt/YmY3PJomdZDgEC1aUqN
 77jya8c4CH+AIZ1ACy9pGBpccUDdnx3N0LTJvS1ZyvLYjESHgsB9E7aS66mjqDuxN8R3
 GzKg==
X-Gm-Message-State: APjAAAWBu/pr3hunKLMw4B6i+t5CSmj/3DHMXl3Jv9vs94q4ShruF+Em
 Zc2cDJs7fJFjt4Wkl2fp6ywXI34ui5ZTDYIRTiLhsA==
X-Google-Smtp-Source: APXvYqzuKDvt26gREh27cHM5QMkm6TaTTPQEqRgLBYLaqlpTH0mOKwI9PVLAnXNbVTf5AyCzTcLT6Bvcak2m+CkrpXg=
X-Received: by 2002:a63:61cd:: with SMTP id v196mr5282760pgb.263.1565908508797; 
 Thu, 15 Aug 2019 15:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
In-Reply-To: <e77b0f32a2ce97c872eede52c88b84aa78094ae5.1565836130.git.joe@perches.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Aug 2019 15:34:57 -0700
Message-ID: <CAKwvOdmuReaFgFK+=aib6rRfAb_GTGubLyJ3sAH-tnkKYHASqQ@mail.gmail.com>
Subject: Re: [PATCH] afs: Move comments after /* fallthrough */
To: Joe Perches <joe@perches.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_153512_997839_132CEDCF 
X-CRM114-Status: GOOD (  15.82  )
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-15.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:442 listed in]
 [list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 white-list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
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
Cc: David Howells <dhowells@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-afs@lists.infradead.org,
 Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Aug 14, 2019 at 7:36 PM Joe Perches <joe@perches.com> wrote:
>
> Make the code a bit easier for a script to appropriately convert
> case statement blocks with /* fallthrough */ comments to a macro by
> moving comments describing the next case block to the case statement.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  fs/afs/cmservice.c | 10 +++-------
>  fs/afs/fsclient.c  | 51 +++++++++++++++++----------------------------------
>  fs/afs/vlclient.c  | 50 +++++++++++++++++++++++++-------------------------
>  fs/afs/yfsclient.c | 51 +++++++++++++++++----------------------------------

So these changes are across just fs/afs, how many patches like this
would you need across the whole tree to solve this problem?

>  4 files changed, 62 insertions(+), 100 deletions(-)
>
> diff --git a/fs/afs/cmservice.c b/fs/afs/cmservice.c
> index b86195e4dc6c..2270fe9325da 100644
> --- a/fs/afs/cmservice.c
> +++ b/fs/afs/cmservice.c
> @@ -282,10 +282,8 @@ static int afs_deliver_cb_callback(struct afs_call *call)
>         case 0:
>                 afs_extract_to_tmp(call);
>                 call->unmarshall++;
> -
> -               /* extract the FID array and its count in two steps */
>                 /* fall through */
> -       case 1:
> +       case 1:         /* extract the FID array and its count in two steps */

Could these instead be on their own line as the first line within this
case?  (I don't feel particularly strongly about this).

...

> @@ -220,8 +220,8 @@ static int afs_deliver_vl_get_addrs_u(struct afs_call *call)
>                 count = min(call->count, 4U);
>                 afs_extract_to_buf(call, count * sizeof(__be32));
>
> -               /* Fall through - and extract entries */

Yikes! Mixing fall through and other comments...yeah that would be
hard to globally find and replace.

> -       case 2:
> +               /* Fall through */
> +       case 2:         /* extract entries */
>                 ret = afs_extract_data(call, call->count > 4);
>                 if (ret < 0)
>                         return ret;


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
