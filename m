Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 591E61F41C3
	for <lists+linux-afs@lfdr.de>; Tue,  9 Jun 2020 19:09:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TD4tzWbKfwv8YXoWEZ/Ayir8iKDMyjDhVbf+RlivVNY=; b=bfrqKC+dJzc+hp
	EQow7+N6tvizIX1Wr7k6fUELnqUwJCysxqm9WhkbEpjZCcCsrFrJJ1hX2WqWYvZklOG1ioQATa+lA
	rThg+icI38EimL15hQun/17naPbPiyj9RrU1TsbTX8xejDZMZFD35Lb+XRP6IrtgHpKI+LbR1rO3E
	m4j+oGSDvFUaKBNS6vniauNys24wYDPPcq1W/mmsQtwhd9Qql9iXOjt20a24UgIa1WU7ixfRpCwNJ
	W1RD680huOAQ0HMEy7vrE/ZyRdqG0Ai/U+dZJNxC1jZ2KxwEiGfL3ZaDYJEhn0ebvqDkOHsf/E1KG
	ziNYfnQiGEIafBqvAo/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jihkB-0004Kb-3G; Tue, 09 Jun 2020 17:08:59 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jihk8-0004Jv-R6
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 17:08:57 +0000
Received: by mail-ed1-x542.google.com with SMTP id m21so16945999eds.13
 for <linux-afs@lists.infradead.org>; Tue, 09 Jun 2020 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4p5Irg6Dzn2qLwF5HDdUraLZe46R8G3poyQBaNHtlzs=;
 b=kNlpBp6u6KVQEvJ4vmJM0+s8WDGqNnE4bKe6zBVx6HH31p4KJOpHoIspUOe4UlWv/q
 Md1608OMu1hHqQ6MV0jgH6BttxuQ7f75/wW2oZAPWr41bB0SotscqivF0NFngZ3HyPp3
 f55S0Q5aHP9WiWMFPW+8P/CgLC5S1OkOSX13ZjhAr0ztKHuWFnkVozDpFWHsBtQLO42T
 qwjkZVJ1iJXFdgkP0tNy1gaKle7IVaY8ADUM8tAgPycpRf0o2+jj5JTTBq+SN2TjI6SX
 TZacSnO7breOdu/e1yPCbSiF74Ywdi8kie1YA4r4zKQ/KWWJjww9xzBw0UcajZ1ph2C8
 RV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4p5Irg6Dzn2qLwF5HDdUraLZe46R8G3poyQBaNHtlzs=;
 b=spIwvFExqus5TJdLyQlmu23R2Z0cOi2M47y5w3LT6HnReIvSLAjP1asYWJICmmI0fb
 FZO4SGNzN92SFFsWAfwb/qpvSbsAojsrgDAXui7mLBCpajHQmHFYD0vuiTTyb41vfwnD
 HFxGM7oBd4O5/yO8Qw4/3gNRFLtyCpvFMOZWjJpztWkX6w6rrNeOVJu91hK60eYZKdD5
 /ouDHo3jY3MH2tSeTxstSyelJxWOUmAYGHLcvJrdbjdN5rgVK1HUoMtzJDxn+pF9VYUD
 RyfZVvbxVAtLyueES3H6LPsKIWIRYvof7cJuyBsXf2dQMPpxWzilxY0UVgc147GMkQ7D
 JfLg==
X-Gm-Message-State: AOAM53343Gg3py2/c+m+3Pj/7VHUPZNT9brhzE6XAlYmKovEVsPMPipm
 yRpaA4mvBvXAwKc3N99220O5SNQRB8NLriqZNCY=
X-Google-Smtp-Source: ABdhPJxIQpWRQjLFGlHZE6AbU18+SSFFpS2P6+r3lJPt3pUdjEciqDF05PyFD/cJ4DYgDVbiZ4EKc1Lw3JNlF4MA15E=
X-Received: by 2002:a05:6402:1ca2:: with SMTP id
 cz2mr26766668edb.15.1591722534934; 
 Tue, 09 Jun 2020 10:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <159171918506.3038039.10915051218779105094.stgit@warthog.procyon.org.uk>
 <159171921360.3038039.10494245358653942664.stgit@warthog.procyon.org.uk>
In-Reply-To: <159171921360.3038039.10494245358653942664.stgit@warthog.procyon.org.uk>
From: Marc Dionne <marc.c.dionne@gmail.com>
Date: Tue, 9 Jun 2020 14:08:43 -0300
Message-ID: <CAB9dFdv_a_EoWOAaULD3fJpmpZdUbquKAFV7=LaZ1udAuDkFEA@mail.gmail.com>
Subject: Re: [PATCH 4/6] afs: Fix debugging statements with %px to be %p
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_100856_875626_F0B7A481 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:542 listed in]
 [list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [marc.c.dionne[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: linux-fsdevel@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-afs@lists.infradead.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, Jun 9, 2020 at 1:13 PM David Howells <dhowells@redhat.com> wrote:
>
> Fix a couple of %px to be %x in debugging statements.
>

Nothing critical, but as in the patch subject this should be "%px to
be %p", not %x.

Marc

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
