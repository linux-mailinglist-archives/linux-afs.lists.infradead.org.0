Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 52176184DEB
	for <lists+linux-afs@lfdr.de>; Fri, 13 Mar 2020 18:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbkym3NrgMLZKTemBZhQdoIo+6vDFGSrs4erpGIyCCo=; b=sLc0yAdmjtfZKK
	tEExyEirpftxvaj3uQn23tDq/AAUQWCpBa/9zg1X093UvNM12bZVTiBCfJPkEGKzB60jLjGvaDNB3
	715L7iC5rC1AppnvoCsPg2f9TXecjHmLd5u7u9mFwQdzOuTK5z7fSiabKkpgmcpjaCAR2UZ35LjdS
	l+gmOtlsPrDq3rwSolHHlQ8jivE1344LZYVNd1x0a8BJJEeuBtwYdu0u0T5USr57LqILJq6sKk1Qp
	blLKBolhkUrQzcokOabAC8+bzw2llxVeaXHusfueGj/xHe2tIZPhwv1WijgBfwLz9QxF/gTnjuX02
	Fmv++EMcTMeNjsl1MsZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCoQE-0004bQ-83; Fri, 13 Mar 2020 17:48:34 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCoQB-0004au-Ol
 for linux-afs@lists.infradead.org; Fri, 13 Mar 2020 17:48:33 +0000
Received: by mail-lj1-x241.google.com with SMTP id g12so11509822ljj.3
 for <linux-afs@lists.infradead.org>; Fri, 13 Mar 2020 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vBLQZt8yXSmQFbpabglArI1vUJ7UPF/XypjmyBfvyVk=;
 b=DPlzu1PSzh+CHwPP/zN3dycxfFl9ZQkPe7eHqGyTGrPmz2GX+kTVwJrfWppBrAsi2F
 oD7Co+2bcJ9FjInhrR6aToEaP2w9vUXc0nphKSGAWXW+HMGODA+bMmLGYkYiZKmofQRd
 cvRhC1A5ChaKqZ+RaaPrjc/tF3zB+f1Aiios0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vBLQZt8yXSmQFbpabglArI1vUJ7UPF/XypjmyBfvyVk=;
 b=oXth1F+14/9rtEC8tqd8sVZ7nR13FYcJI02SJRoVN4U/GZgCco5sr+Za2gvq0XChRL
 7yChHcOfona61+OVWJw//K/p1qu2wAXoNWZSXOg1PPFn9WrtfVDluBt5Gjc3JzdPxS+6
 6503ag1Lh8VWY6TZ216sz3AGIKSsO9QTtRp8sfAX2HOmR4rW5M/ekxg1eZTXIt+EzpvS
 k7Td4qgQRjd3ZOxhNlc2A/81OC1hjQEiSse2ZlXJ2anWefe6j5rZnoZFQ4lbIHKZxWvw
 adpDkOdjyS8t+ilz8d1vC94ykxidVqTEEZW4LCdwVP3/BKC/tD75VC613EtDYD0z82TD
 4eoQ==
X-Gm-Message-State: ANhLgQ3ys8oCwpU5yzFg3FdIDGA88pLmGdYAmzTvKRZEoGKn6G8geQKK
 I1E4aFI5Iup3I6GOMiBniDP1lSCpO7o=
X-Google-Smtp-Source: ADFU+vsEwGimJK+5aCTUUSIscEKZo4GWMwCWnwnI4mb9KbV/Tmx7vXvXZMoskFLGl9R6w8aDW73GfA==
X-Received: by 2002:a2e:9094:: with SMTP id l20mr7617918ljg.285.1584121707671; 
 Fri, 13 Mar 2020 10:48:27 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id d4sm6167490lfa.75.2020.03.13.10.48.26
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 10:48:27 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id q10so8566243lfo.8
 for <linux-afs@lists.infradead.org>; Fri, 13 Mar 2020 10:48:26 -0700 (PDT)
X-Received: by 2002:ac2:5203:: with SMTP id a3mr9170677lfl.152.1584121706541; 
 Fri, 13 Mar 2020 10:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <158404901390.1220563.13542240512778767032.stgit@warthog.procyon.org.uk>
In-Reply-To: <158404901390.1220563.13542240512778767032.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Mar 2020 10:48:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0NiejjfLkcZaChHqEt9b+NzRjYWOsoC0vsRMHLYMs8A@mail.gmail.com>
Message-ID: <CAHk-=wj0NiejjfLkcZaChHqEt9b+NzRjYWOsoC0vsRMHLYMs8A@mail.gmail.com>
Subject: Re: [PATCH] afs: Use kfree_rcu() instead of casting kfree() to
 rcu_callback_t
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_104831_810372_4CEE71FE 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:241 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-afs@lists.infradead.org, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Thu, Mar 12, 2020 at 2:37 PM David Howells <dhowells@redhat.com> wrote:
>
> Use kfree_rcu() instead, it's simpler and more correct.

Applied,

            Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
