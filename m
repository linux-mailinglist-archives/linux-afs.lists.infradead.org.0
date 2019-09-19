Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D255B7019
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 02:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+VAfQ6aLmefsHNVNH3YTSdO4FWQ1cwrFM2dgM+GlTQ=; b=CmwzMLsz8AZw4g
	ea+qjdNgtXc4/8qkOEQN7Lig1ETutynswnQwxcbgrqrUUvlJZGqLLJiGL7uoRG71bfHjMt27rhQhL
	h5fIFxUu2mOvgHybcxB53NQn0vjCVdTnVkYoFla8yXLI5EBVSogLPcerJh5WO5606yy297v0ChKX/
	/P8brNEnqNXDOMqs/jT0xu8NrSXZTu/bM05QpTuo5h/tY2HBnbtG+mBpVXfHYoI9BtR1pbx1/cfuX
	Vfybs99aEhChkP4I48+lm0oToov8nalKQZvMXVXzE+N9Fud33Ty+Ob3Ufqb/JdjMh4OOgRqtmUyaJ
	e9Qgetr5lymmBViv9rIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAkG2-0003zq-V4; Thu, 19 Sep 2019 00:25:14 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAkG0-0003zT-Nm
 for linux-afs@lists.infradead.org; Thu, 19 Sep 2019 00:25:13 +0000
Received: by mail-lj1-x244.google.com with SMTP id d5so1687904lja.10
 for <linux-afs@lists.infradead.org>; Wed, 18 Sep 2019 17:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dBc/eYJTOLPPQiZ5t0llKwVn5FhzICC4mWTmMrXjDEU=;
 b=WIbuDCmG9hzDesKroizOBqRXGwONhNP4QrBll03slXqZ8b1BB3vzPCdVc22psjVksw
 jQmVL7xCO/XlhDKxOO0QWvn92j6bBHADgUhpwQrr60PpwgBbzneGC/apON1Wc9JDdf/B
 qoPD6tb+dylFDQ1HADe1c0C8c5aPCYN+8e5og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBc/eYJTOLPPQiZ5t0llKwVn5FhzICC4mWTmMrXjDEU=;
 b=M3ZSHiQebxakRwlGvKlYGibAjSe5HxqPmY4m4jMjpP8TBiaVca1jUd9t8ZA7XdWkED
 TlXxQbEI6xitRsRczI8O/lixb6wXPYW25amS8o+921XynTZlvXoyc+9otZYRcqlv1DVd
 P1JjYDEbeTtgSo0EU+S6K+rcVVZcwX7pB+3cUV7J2d6++zx2udVhaYdtocJAHeXd/CkA
 kVahMX5LExZte88t0WbklQN2nN7N16vuLLlZ5hXdnxXgq5kAIDQ62wtBtp473rccYdMR
 UrfroKhv+qjlFanRcqiK7votQrFR6cUps95U50tK5E7SVXibXhmV6gvJyWC2w3ECa636
 2FFw==
X-Gm-Message-State: APjAAAX/I07IeIzL5/O9xctwoyjSzA6n2ozw+9Z5Qx4zRk7u90PuEKmD
 w3hVbPQ1cbxWA6pOrHJ+cPwyxV624ak=
X-Google-Smtp-Source: APXvYqxmgYn+9gs45/GgnY5bFSiyfy44NO6cS3Md9l1iA7ZulOXgrd5lEJ2/tf/0E56Wtwmiy9hHtg==
X-Received: by 2002:a2e:2d5:: with SMTP id y82mr3837170lje.230.1568852709214; 
 Wed, 18 Sep 2019 17:25:09 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id w27sm1284355ljd.55.2019.09.18.17.25.08
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 17:25:08 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id e17so1668540ljf.13
 for <linux-afs@lists.infradead.org>; Wed, 18 Sep 2019 17:25:08 -0700 (PDT)
X-Received: by 2002:a2e:2c02:: with SMTP id s2mr3846937ljs.156.1568852707845; 
 Wed, 18 Sep 2019 17:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <16147.1568632167@warthog.procyon.org.uk>
 <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
In-Reply-To: <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Sep 2019 17:24:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiOw-YDpctcdTwsObUuwSv4+SC+O68kitxzPX-4nW74Kg@mail.gmail.com>
Message-ID: <CAHk-=wiOw-YDpctcdTwsObUuwSv4+SC+O68kitxzPX-4nW74Kg@mail.gmail.com>
Subject: Re: [GIT PULL afs: Development for 5.4
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_172512_777870_CBDF62DB 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:244 listed in]
 [list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: Marc Dionne <marc.dionne@auristor.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Sep 18, 2019 at 5:22 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Commit messages need to explain the commit. The same is even more true
> of merges!

Side note: that wasn't actually the only problem with that merge.

The other problem was that neither of the merge bases made any sense
what-so-ever. Neither parent was any kind of "this is a good starting
point" for anything. You literally merged two random trees.

So even an explanation isn't really sufficient. You need to start
looking at what you're doing, not doing random crazy stuff.

                Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
