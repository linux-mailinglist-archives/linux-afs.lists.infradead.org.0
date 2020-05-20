Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 587021DC720
	for <lists+linux-afs@lfdr.de>; Thu, 21 May 2020 08:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0g77u/vFoSdBAZDI1DilfFEfbcI5ecH9H5NGmHuBmU=; b=SHI3/Odvnj3tAk
	gcxdJl7kHXxRHgxZv7MWPNVc4tveQqZaQIXELzkLKR940b3iCxQ49sEa0iOAtNjxIk/3Oi5jYFMu2
	63r31ghb1Q8oG7QKDQ01h/DfeMqbmx4totH5jTvAr12BA5y52JS2hZcCucDIbUvZMTwQfWPeoRvuM
	UW0QrXeyEZdNQScKettrZneXFNJ8gEoz9nfRlM3VY4MkoHvSOpfDvBRbJyptIGKHouA3D7wuvp/sF
	6OxlWzRQLk3FM2rwOjswVKnniWSCuD0NtlpME0JhroIcJ4z7NndcFR60XOAM4YnHbQXk8nV/VhT8/
	OdWsCWIkRfNAVy/hdamw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbex5-0006iw-WA; Thu, 21 May 2020 06:45:12 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbYIw-0007cf-Cf; Wed, 20 May 2020 23:39:19 +0000
Received: by mail-qt1-x841.google.com with SMTP id o19so4081482qtr.10;
 Wed, 20 May 2020 16:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=usgVE9wGsTmR3Ul4KmzuJXmMmNEoxcCV+K4pKCDDnEw=;
 b=FsipvN1GuGM9UbR7VsW4XkubLiUqC8Dqtu7L937s2qadx/bxbgPsMl9fWYiJlizujH
 c9qxkVWOxpVMlAT7nNkHzdOL6XRXbCOpar1C4DQC47Sws3swXaaqI9YAuQyLubSZ0OK0
 rRko/wzRAKCkIy15w/nWQBRVBLwMvtGjJCE2gisIPTfPY2zdgnpj1FMzVNCnVI10QH79
 YBAX7tezDRj2K0TOr70GJg9yP9kYgu14VxvOjzih8uvep1FVSB5EojcU0QtKwd0T+IdB
 hjRKTNxmgJ9liw0vUGr1peJpzaW/R/f+lsktCjxXTndLxOoBi3/frCJqvNi3QaPXR6GX
 kpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=usgVE9wGsTmR3Ul4KmzuJXmMmNEoxcCV+K4pKCDDnEw=;
 b=Zag0grC5Yb9ko1JUuSINyXvdAXNFsK8FOWawLUx4atU1VY5tFZvVWynnXmHPvH6RLq
 7qlsUqmJDEEpBAsMh2A6osamygGsq6c2ASDZbnDL1k2EpQLZ2qN8tcTNudpyxJmT4DhU
 jLKuag5+LDeetIRCu0YP6rScm2lIUnUDP+nNo9ZMEI9sdUrsogzdqAOUzVF9pJBW/wc1
 btQYZxHEomw3G0v/dtWZyU2DCjgPteFTWCAfs0dtNH4AO8EToFLIXBf2RQ0+Rp5xN9G5
 uDreItfwyEuiUl0m/RweCGrvoi8/MaXtPOH5Ek+yKs+lnTPoZFLYoTQ6IWyI/mveLO5Y
 A1Ww==
X-Gm-Message-State: AOAM533x+EGuxsFJDHZSrxwopLvFjHDl8rgssoAMo3Nf0U7EAo1xx/am
 Ds6/VNrF4JQhTBYBo8rvNPk=
X-Google-Smtp-Source: ABdhPJzb0RQavdlFPdZ2esbonBQnAnxuJh+Wdn80ZrxdL0NcIMXKvb5xhinFWySzKcTGVqX7yVkgxA==
X-Received: by 2002:ac8:1af3:: with SMTP id h48mr7625941qtk.371.1590017956516; 
 Wed, 20 May 2020 16:39:16 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
 by smtp.gmail.com with ESMTPSA id z10sm3685208qtu.22.2020.05.20.16.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 16:39:15 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
 id 43E1FC0DAC; Wed, 20 May 2020 20:39:13 -0300 (-03)
Date: Wed, 20 May 2020 20:39:13 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 31/33] sctp: add sctp_sock_set_nodelay
Message-ID: <20200520233913.GV2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
 <20200520195509.2215098-32-hch@lst.de>
 <20200520231001.GU2491@localhost.localdomain>
 <20200520.162355.2212209708127373208.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520.162355.2212209708127373208.davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_163918_446361_D4A08281 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:841 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [marcelo.leitner[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Mailman-Approved-At: Wed, 20 May 2020 23:45:09 -0700
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
Cc: edumazet@google.com, linux-nvme@lists.infradead.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, hch@lst.de, cluster-devel@redhat.com,
 kuznet@ms2.inr.ac.ru, kuba@kernel.org, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, nhorman@tuxdriver.com, yoshfuji@linux-ipv6.org,
 netdev@vger.kernel.org, vyasevich@gmail.com, linux-kernel@vger.kernel.org,
 jmaloy@redhat.com, ying.xue@windriver.com, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, May 20, 2020 at 04:23:55PM -0700, David Miller wrote:
> From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> Date: Wed, 20 May 2020 20:10:01 -0300
> 
> > The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
> > Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
> > API could be a bit more complete than that.
> 
> The APIs are being designed based upon what in-tree users actually
> make use of.  We can expand things later if necessary.

Sometimes expanding things later can be though, thus why the worry.
But ok, I get it. Thanks.

The comment still applies, though. (re the duplication)

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
