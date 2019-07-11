Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC1071237
	for <lists+linux-afs@lfdr.de>; Tue, 23 Jul 2019 08:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BnG1jqLCnB/g+YHni3jUiq5coZ8cRqFmle/jpBGaykg=; b=ixLM/GfffFUlkt1N49wLJJYhqc
	rDpsJk1eQvXXfwYQntIvQWPx254FMwlA7+OrgNVFdBkdulmv+fmHiux300pjS491A/FdFGm3Cuiq+
	I0wu9qLi+YIJIT/1wjbEyB8Bl2RExPYj6vUss6EJA26ta27+6BIJcEDMUtYrgvGc0sAQ9WZzY1GNr
	wRrYDAsrSPjenLh0uxbzYZFtRkhR9Bp+3Q5zO5BEeB5UgLsGPDJtG7asjIOiKHG0Bsjwaa1IJeyDT
	GBmJ9IQnB9MfPsm6PPTjClVzQxY2SEtUAHQBC6fyDRVvse24wn/VgV05K6ZMylvRL0rsPuxT7qfLt
	ZEDbsuXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpol6-00089V-II; Tue, 23 Jul 2019 06:58:48 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlOMq-0002rW-Ho
 for linux-afs@lists.infradead.org; Thu, 11 Jul 2019 01:59:29 +0000
Received: by mail-lf1-x141.google.com with SMTP id s19so2892118lfb.9
 for <linux-afs@lists.infradead.org>; Wed, 10 Jul 2019 18:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=NiaFfYJ216nYjgBrBY5JKQAHNiRjdATog8sl2JxZW+g=;
 b=MQOzZI79mvoiVs1sgBWHfqE+YJM9b7M05jQpHMpAAyRFe0Cs7GZ1SKjYmbrPj6ztHM
 B7Jmo2E1tOKxmtYLHAeJfiv0Yw5iWNpJ6su3Aywbxq++FWe46hRTt1FaTYFdrs51gDai
 Fc+1NUhQh/izklmNT0WE5mkHqoWlVg+hybjs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=NiaFfYJ216nYjgBrBY5JKQAHNiRjdATog8sl2JxZW+g=;
 b=UmG65rAtqesQcyoX11yG0Nz0iXPE5Lks7wk/lGfoJ9NbaFD1zfTCSORn4ImYmvf0Fb
 OwGHtiqWn8iod7HX5w16AMqTAn3PiODr0BONYhowIQ4tuJSPBY3pUw/ZmewrzrSkxTUo
 3j0gVS0AjE2sVftU1fo8Ref5AzvAcxowpAxhHgIP3CJ/Ckwr84tslptRf8UVsrnJEbqe
 Cuwhf6dxPqrDWg1CNS+jUQV94TOFZPhtpj9lyJSX2BMqFvZUKpOEGqdTLZcg9haGRkwi
 IbjMA/1eLx8j8RH8CsHW/+HsZSgORwuf1DCrM3p2rw6ux+V/wosyNF34EmXWy854rtSu
 WCbQ==
X-Gm-Message-State: APjAAAUm6N4ZT4T7xWXCm+GrehHDvkBrOFcYSCsA8ZxLTwiZ6Ou+ees6
 rvLOU9oprN7gwV5r+VR0Sued3OUOep0=
X-Google-Smtp-Source: APXvYqxUrsrkKUniJlkI0/YMeMBZL+3ZD/9KtrbyFOzkkMO7tjB9U5CHvamEKHO77nxaR55a0hkhBg==
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr372950lfm.120.1562810363535; 
 Wed, 10 Jul 2019 18:59:23 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id p12sm734173lja.23.2019.07.10.18.59.21
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 18:59:22 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 62so2908796lfa.8
 for <linux-afs@lists.infradead.org>; Wed, 10 Jul 2019 18:59:21 -0700 (PDT)
X-Received: by 2002:ac2:4839:: with SMTP id 25mr355474lft.79.1562810361547;
 Wed, 10 Jul 2019 18:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <28477.1562362239@warthog.procyon.org.uk>
 <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
 <20190710194620.GA83443@gmail.com> <20190710201552.GB83443@gmail.com>
In-Reply-To: <20190710201552.GB83443@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Jul 2019 18:59:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
Message-ID: <CAHk-=wiFti6=K2fyAYhx-PSX9ovQPJUNp0FMdV0pDaO_pSx9MQ@mail.gmail.com>
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
To: Linus Torvalds <torvalds@linux-foundation.org>,
 David Howells <dhowells@redhat.com>, 
 James Morris <jmorris@namei.org>, keyrings@vger.kernel.org, 
 Netdev <netdev@vger.kernel.org>, linux-nfs@vger.kernel.org, 
 CIFS <linux-cifs@vger.kernel.org>, linux-afs@lists.infradead.org, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-integrity@vger.kernel.org,
 LSM List <linux-security-module@vger.kernel.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_185928_602457_BF4A265D 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.4 (+)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (1.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:141 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
X-Mailman-Approved-At: Mon, 22 Jul 2019 23:58:43 -0700
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Wed, Jul 10, 2019 at 1:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> Also worth noting that the key ACL patches were only in linux-next for 9 days
> before the pull request was sent.

Yes. I was not entirely happy with the whole key subsystem situation.
See my concerns in

  https://lore.kernel.org/lkml/CAHk-=wjEowdfG7v_4ttu3xhf9gqopj1+q1nGG86+mGfGDTEBBg@mail.gmail.com/

for more. That was before I realized it was buggy.

So it really would be good to have more people involved, and more
structure to the keys development (and, I suspect, much else under
security/)

Anyway, since it does seem like David is offline, I've just reverted
this from my tree, and will be continuing my normal merge window pull
requests (the other issues I have seen have fixes in their respective
trees).

                 Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
