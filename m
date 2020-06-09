Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 410231F497B
	for <lists+linux-afs@lfdr.de>; Wed, 10 Jun 2020 00:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4e5GoKTZaEiEJPhsSZMlB1ZD3HMuYqtj3X9v1sL4TM=; b=VEeC1dWXnfmGwa
	Gww7Yu8h+ks+NqvyqA7BI1qCA8yXRM/eaJxcgPsKHVI3pJOPeY+o4ETnTls27xLwmnZejpKlteC9q
	iyDCpqk36m1Q7cLiZR/ojljgWS6xQGFvPkmHJekZI625Lr6ET5dllwo7JGQGZKrqAk3CjOFxkRf5P
	DJCTwx4tcM6Jnu5JmUc4apXIBuCa694gV9LUs4q+GR2Z/dfHXoGibQeZo4xGZn8SiaEknFCosxrza
	YxajDUANy3k5kj8VU7XYMaYhVivmFvRjwtOK+Jxn+1jX34agozUwuLIkNo0sDTnzsQ3zlnQUQAH25
	rDZV18tLQfzOvB9fVl0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jimvI-0003bi-8q; Tue, 09 Jun 2020 22:40:48 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jimvF-0003aY-Jd
 for linux-afs@lists.infradead.org; Tue, 09 Jun 2020 22:40:46 +0000
Received: by mail-lj1-x241.google.com with SMTP id e4so75746ljn.4
 for <linux-afs@lists.infradead.org>; Tue, 09 Jun 2020 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P1TRNNjJlvLVpkzYtiyuKXMMAtHYz93D6qUBO+R17NY=;
 b=K1f23i0fqTaybBaIL91PC/uUGVhXSo8qFOrRZ6HkWINEL8dEywUK3T3EhTHBQo1onI
 W2B23FJguSy+2BibfIkn2DkdpPgkPHbOxwkYkGJwdrS+/ZW6LOzw/y+emhKjQsn4I6lP
 cbjUZmLILbknLg40OFWdmE+Q2u7LZ3zRFbcGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1TRNNjJlvLVpkzYtiyuKXMMAtHYz93D6qUBO+R17NY=;
 b=Gzh/6apQN0uTNa4vGctXCK9n9m80SmQp5YfECvMRRYk7ztN2/3Iayevwc4S3yanTiv
 YGxYj+q0MzxIphjz4Icyldse/jm0NfqGPmcqMUGSc+5seMt9EjK6RfHy03PsV1Ww+G8K
 LfcbTQ50iCo27ty3iHsx1bAVx4OS8PasgyENgIMUzvm1D97G35hteU4LVbg6cc9BpyjP
 txDRRB0UhToI6pNjscihpVIgNUty4Sw4X8nAKl7WNHO/ErZfyuMn380qsrm6Hy/vhNw1
 vSx9mOCyJORtUn/andQqJu2qvPcKlYcWQPkEOFnZhqDdDA03g+xeEGb8y8QoM0Vl0BBv
 bX4Q==
X-Gm-Message-State: AOAM531+F/FRuLj2Qs6MnNioXN3N+PO5l/OgeWZddap8aatnAOnHd/+p
 u1n5RSWKogS4WBAGLFTEOnuMcE2WWo0=
X-Google-Smtp-Source: ABdhPJxi32ZBoH1QO0KpTrcFy+p4aR/0XWLITOpkasfgLG/KhHJs8+O9bqxpjrUVdRmw+g3rub0fNA==
X-Received: by 2002:a2e:8250:: with SMTP id j16mr236249ljh.140.1591742442681; 
 Tue, 09 Jun 2020 15:40:42 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id 130sm5290168lfl.37.2020.06.09.15.40.41
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 15:40:41 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id x22so287966lfd.4
 for <linux-afs@lists.infradead.org>; Tue, 09 Jun 2020 15:40:41 -0700 (PDT)
X-Received: by 2002:a19:ae0f:: with SMTP id f15mr73046lfc.142.1591742441027;
 Tue, 09 Jun 2020 15:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <3071963.1591734633@warthog.procyon.org.uk>
In-Reply-To: <3071963.1591734633@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Jun 2020 15:40:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4VjVHkMcALg3T4A+Vwfyo0NBWtPoKwvO8pWe_v=NF6Q@mail.gmail.com>
Message-ID: <CAHk-=wi4VjVHkMcALg3T4A+Vwfyo0NBWtPoKwvO8pWe_v=NF6Q@mail.gmail.com>
Subject: Re: [GIT PULL] afs: Misc small fixes
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_154045_651067_CB60A48E 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, Jun 9, 2020 at 1:30 PM David Howells <dhowells@redhat.com> wrote:
>
> Would you prefer I defer and submit it again after -rc1?

No, I'll take fixes at any time, and the better shape rc1 is in, the
happier everybody will be and the more likely we'll have testers..

             Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
