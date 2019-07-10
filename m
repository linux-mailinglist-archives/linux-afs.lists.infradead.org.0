Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA1C71238
	for <lists+linux-afs@lfdr.de>; Tue, 23 Jul 2019 08:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=My8bMPC+Ff9u1QuhMzVw/HKyXgACrtPKwanRpSQTK8Y=; b=tn0UYDngDdcj0v
	nJlzx1++BDfUrndTWGfCD8Lapsz8P+wRRtwReVqGfJfQtZKpa6f9s/7AMt+kABCS0wf85SGdXElyF
	wCU0MTWeHBeXZVqERYeyQopwX65wfMAbwCiYx8HoDC2CrUZUngYzxfOjWHGldcYIP0ZMg+xZT84eG
	EAxKk7RWEzvHsrAYsyArBSEFKSNMf+stxVuybw4ec/EXf29bARB32KFOYAdISx0eiGCh7NuXdB3f1
	WvY96TCrTTk2aWZobUcThVhBxMAwU2BHUSZ8dsKBGdTZP/2Sf5BnKfBCH9JdhfYOkqGU4qYxHowcw
	1evm3hOVKpoZRkWj5qpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpol4-00087N-BK; Tue, 23 Jul 2019 06:58:46 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlHRA-0007Wj-Rd
 for linux-afs@lists.infradead.org; Wed, 10 Jul 2019 18:35:30 +0000
Received: by mail-lj1-x243.google.com with SMTP id v18so3094994ljh.6
 for <linux-afs@lists.infradead.org>; Wed, 10 Jul 2019 11:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=59LQqbVb+KQ/BMKWYDi9soPsvc3OIaSci70f6vwiQDg=;
 b=FqoWOUQDI8WMp245xx+rH6pVnDYOUvjDYs15fEQlF6pDz0NP8XsjV31N/mtE4tmezC
 j2UTUlQ1N7GdmP1kf74xSCxvIJJ+DHBtK3c6eKcgoseA+K8AhvGS/ovhJPv6+HASW4G8
 XOZuoCQHXi5bTBX95YG3a2jJFHuWkpZNYqeaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=59LQqbVb+KQ/BMKWYDi9soPsvc3OIaSci70f6vwiQDg=;
 b=nR2YoN80jEr0f8/LJi7ynRVWOS9TrgtfBQPksQkF3BbIyx9MzH7lbCS+v1s4RW7ooQ
 NX6fxVbjgfOBncsuOLl7pdmf7yFtVuJa6iTZkhMAYMgy7yx1qTYRIkF1NgWyz48K3QeC
 M3ypNbZNM+2PHCLcOoxOYFKr2pvogAcNBZpr3sNQxc7uJKXNvhdhT3wqRNfamCuQSeGP
 aqn56dg+6iq8szXsqrmiaslA+yA5D3WLdkGj5/1hKgGAL3HZx41McaTRssRPGgo+KPi2
 I6pV8O0fhJ2SAUEKdIYqnS083hl2RPA/ZqUDqWJ9rjqHTciMjonzboNzPPfqZVUOMuiv
 UQXA==
X-Gm-Message-State: APjAAAX3zsXD9i4HbbV9y6htRj/37cKdpIeU1W1ld/VrNp4zi6mqkyi0
 b3neb6j2Mu5WIbTgpnQqsJZiPpsCj+8=
X-Google-Smtp-Source: APXvYqwFgYdf/dA0afzSW8L7BdbOUBOn5ADgjyiWi721EE1RTrqaOxr4EyjOQRLRo+kIlhV2oiiFlg==
X-Received: by 2002:a2e:8756:: with SMTP id q22mr18775474ljj.108.1562783725440; 
 Wed, 10 Jul 2019 11:35:25 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id t21sm587773ljg.60.2019.07.10.11.35.24
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 11:35:24 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id h28so2291699lfj.5
 for <linux-afs@lists.infradead.org>; Wed, 10 Jul 2019 11:35:24 -0700 (PDT)
X-Received: by 2002:a19:641a:: with SMTP id y26mr14803967lfb.29.1562783723934; 
 Wed, 10 Jul 2019 11:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <28477.1562362239@warthog.procyon.org.uk>
In-Reply-To: <28477.1562362239@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Jul 2019 11:35:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
Message-ID: <CAHk-=wjxoeMJfeBahnWH=9zShKp2bsVy527vo3_y8HfOdhwAAw@mail.gmail.com>
Subject: Re: [GIT PULL] Keys: Set 4 - Key ACLs for 5.3
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190710_113528_901974_271BFF8D 
X-CRM114-Status: GOOD (  13.73  )
X-Spam-Score: 1.4 (+)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (1.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:243 listed in]
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
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, James Morris James Morris <jmorris@namei.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-integrity@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Fri, Jul 5, 2019 at 2:30 PM David Howells <dhowells@redhat.com> wrote:
>
> Here's my fourth block of keyrings changes for the next merge window.  They
> change the permissions model used by keys and keyrings to be based on an
> internal ACL by the following means:

It turns out that this is broken, and I'll probably have to revert the
merge entirely.

With this merge in place, I can't boot any of the machines that have
an encrypted disk setup. The boot just stops at

  systemd[1]: Started Forward Password Requests to Plymouth Directory Watch.
  systemd[1]: Reached target Paths.

and never gets any further. I never get the prompt for a passphrase
for the disk encryption.

Apparently not a lot of developers are using encrypted volumes for
their development machines.

I'm not sure if the only requirement is an encrypted volume, or if
this is also particular to a F30 install in case you need to be able
to reproduce. But considering that you have a redhat email address,
I'm sure you can find a F30 install somewhere with an encrypted disk.

David, if you can fix this quickly, I'll hold off on the revert of it
all, but I can wait only so long. I've stopped merging stuff since I
noticed my machines don't work (this merge window has not been
pleasant so far - in addition to this issue I had another entirely
unrelated boot failure which made bisecting this one even more fun).

So if I don't see a quick fix, I'll just revert in order to then
continue to do pull requests later today. Because I do not want to do
further pulls with something that I can't boot as a base.

                 Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
