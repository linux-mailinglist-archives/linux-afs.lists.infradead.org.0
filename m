Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4741B7CE6
	for <lists+linux-afs@lfdr.de>; Fri, 24 Apr 2020 19:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oEGGJHubsKlv/xBOxgz23yRLKpAGJ0tk1B5jK9nJCc=; b=u9fiXJYMI6oJZR
	/OadoDp0Dl7h04WU6hylLku/USs9odK/SlkBeGzyZ9OIiN0RVqxm9nXH917+YPD1V6RhkHglovg4E
	Iz+h44LTVa1+Yscx6HDk4sm5KJ+tppdqw8FzwmzziN/oWToDQI5NMGjzeUwlaqhs6vj48e9SciYXk
	SmNCyfyJRHeTLWJQ1SERSFjs/BsZekzBjiL5WewJJFcXsrYnJR/o87MOB/X9N74V5Uj6eecReOnfd
	OG/mqR+BZxP7WQgJ9AmrX5BU7gU6LYGs2eJpSjyySauOHKyVlMwV6gpXi63fN0YElJNtC/7NE/aWx
	oXoylsDAgn/cEPaJyajw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS2Ev-0005g1-Ie
	for lists+linux-afs@lfdr.de; Fri, 24 Apr 2020 17:35:49 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS2Et-0005eU-MA
 for linux-afs@lists.infradead.org; Fri, 24 Apr 2020 17:35:48 +0000
Received: by mail-lf1-x141.google.com with SMTP id u10so8362208lfo.8
 for <linux-afs@lists.infradead.org>; Fri, 24 Apr 2020 10:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=17Kg1dRas/M0sQXVRI4F1cdrQ//6hjmUk/mclI6heeY=;
 b=d+qcaZcbU1H0AzDGp+UTOcPWUOR9HjuA25jpYxyTWS0ttqCFnGFEDZb7W8gtA+8q7Q
 DUnPsJgjbJ8jo2hCYbfGpWCBX4F5xcNqH+cIGSxuDfBaMWgLONIW6hJ8WQHyGftwdtXB
 H8XP2ZEiiiYTC5NDB9zm0db/DQyW0/Ezlxt8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=17Kg1dRas/M0sQXVRI4F1cdrQ//6hjmUk/mclI6heeY=;
 b=ZoIA08wwVQzyFx9j4n3dTyb2wp3WIAmVPPtqYYDcYWGi6SPHnNMLacYRZnu1YUDFRu
 yjJsD59F/mzPawEC045UXDN1wyuKkt3KOO0/2HDtYxNAwHgRdF3L6npwaJCSwitxxM32
 798i8eIJUe0y7J+PQ4h1Jf5wNMGIVEnwyaY04wamPUCGHHHBKBYYMnPEIamt4+TVEl+Q
 /AJqX62WbORJFSNJq+8jYmUseI0/qeiVVqYlBnRQfsO8YLNRtSHnd08HbYxoX5SGFx1z
 XwkoSXpeBABsRhfAhYATAYqooH+2TH9ER75f1N2fNSGAfduZkduVbb5GEP3OXyCFuP7r
 wuMw==
X-Gm-Message-State: AGi0PuaPYT1PRg4iDgTGPsAeJ1bRTaxSJg8fsG9pUw4dxtFpBRRx7nPT
 6WRz164ge/J3Eef3woskFuQFNL1bf3k=
X-Google-Smtp-Source: APiQypKWMhOdsJ6ssL1I1eo3XL/YUGGx22xVcbdBjUCkBbq4ul/uke5igU3JTmkhFHI+2TSDe/cNOQ==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr7129498lfm.156.1587749744681; 
 Fri, 24 Apr 2020 10:35:44 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id t8sm5187732lfe.31.2020.04.24.10.35.43
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 10:35:43 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id r17so8378998lff.2
 for <linux-afs@lists.infradead.org>; Fri, 24 Apr 2020 10:35:43 -0700 (PDT)
X-Received: by 2002:a19:240a:: with SMTP id k10mr7152809lfk.30.1587749743463; 
 Fri, 24 Apr 2020 10:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <3632016.1587744742@warthog.procyon.org.uk>
In-Reply-To: <3632016.1587744742@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 24 Apr 2020 10:35:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_0Fye2U+AXjScpgd_hh=pFu3GJvgsUqCk-4=ckcHhhw@mail.gmail.com>
Message-ID: <CAHk-=wi_0Fye2U+AXjScpgd_hh=pFu3GJvgsUqCk-4=ckcHhhw@mail.gmail.com>
Subject: Re: [GIT PULL] afs: Miscellaneous fixes
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_103547_728570_7D8265D2 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:141 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, Apr 24, 2020 at 9:12 AM David Howells <dhowells@redhat.com> wrote:
>
>  (3) Make a couple of waits uninterruptible if they're done for an
>      operation that isn't supposed to be interruptible.

Should they not even be killable?

Anyway, pulled.

             Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
