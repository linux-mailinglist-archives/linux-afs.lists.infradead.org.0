Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD70342AF
	for <lists+linux-afs@lfdr.de>; Tue,  4 Jun 2019 11:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUxtdJ6fc+dViVLRd8A/eKX4irlqI6N4u+KHJR1AHNE=; b=hdwvPpbnDLqhG2
	VcZ1SFZbAYsKqHuY2Ix911ihtZslZbNsn+wnSHZufyUoy6etJgG19nIfyHF05E/PPoimcF10FOrzW
	SJKpdIcjqyC3ylmraIGQVYyMRX8wPs6eRlMnuYIpLD/HPgm4gax4WqK8+frV2KefICdSuWP0+Ll/j
	nxAv1uFOEqbQRXMr520O4VlU8QGoo6wKdp+AC4hjgtZGpBlbqHu+7efyZqZOwEQ7GErxTHtBUzHXh
	bS6G5fIQwSd2LUS4eyrUhKxuM4brmnexAGNkKvJ1Mhr0316OqlYV6vh2otgnzEsvN/wUkmGEXX6a1
	DkvibmDhlt6BWpl0uwqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY5Qd-00043u-He; Tue, 04 Jun 2019 09:08:23 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY3yl-0006CF-Rx
 for linux-afs@lists.infradead.org; Tue, 04 Jun 2019 07:35:33 +0000
Received: by mail-lf1-f67.google.com with SMTP id q26so15651903lfc.3
 for <linux-afs@lists.infradead.org>; Tue, 04 Jun 2019 00:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObbNbZR/72D98Vc550uzYyGenM0+DWmngeVzeXEi0ZM=;
 b=ThaKKbHwLjAiMVt0kihe8RdcY0v6wwhaYfceDqonWCHud7RozZ4ZoIjgRoQFYGwP9R
 F0PibKHQoeO4f/CybRdciPgNbz05KDUKsYQdOTXKJD5unczQV9o2G/9LIJqedix97ysq
 XhX0aY8yXkMj0/Aet5+fEoiqORGm+xIJ+t2nybL/6wbHNHJhRB+amIzc8RG0mR0lNvxD
 LTz5d0QeDTGf6wWxSHQWCCAIxYVzqPCjJtL5v0khCIIsmIHMkX41MJSjFrEd8iqdu6LU
 ttzrxcrnoFvZWsBpM26sbkyYSiGQ4PFiz2gW/rDZPYdvByatMEoFevYOTXPQcXzAuBLW
 wZDA==
X-Gm-Message-State: APjAAAXHcqNfMI3fbSESgwSFpSfFKxMTAcxGIL87jjDd4umlT39m8Emj
 5XeKCLaW3ctFFRHGfYEzF30ghOTBq53+zZfA3/I=
X-Google-Smtp-Source: APXvYqzZy7bAsh6aATIcduZ/ydlM1aKS4jqm+mf9GX84nUleah+LyhiDwD0TYIniqNJly32Ees0tY+eMT6LcuMOqD9Q=
X-Received: by 2002:a19:c142:: with SMTP id r63mr17039438lff.49.1559633729962; 
 Tue, 04 Jun 2019 00:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-3-geert@linux-m68k.org>
 <15499.1559298884@warthog.procyon.org.uk>
 <CAMuHMdX57DKCMpLXdtZPE-w0esUNVv9-SwYjmT5=m+u9ryAiHQ@mail.gmail.com>
 <9306.1559633653@warthog.procyon.org.uk>
In-Reply-To: <9306.1559633653@warthog.procyon.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2019 09:35:16 +0200
Message-ID: <CAMuHMdXOikfh56DAHGpNUoRefbhYSbh=VK3J8EzZCXVLqZtEVw@mail.gmail.com>
Subject: Re: [PATCH] rxrpc: Fix uninitialized error code in
 rxrpc_send_data_packet()
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_003531_907144_BCCADAED 
X-CRM114-Status: GOOD (  10.53  )
X-Spam-Score: -0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (geert.uytterhoeven[at]gmail.com)
 -0.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Mailman-Approved-At: Tue, 04 Jun 2019 02:08:21 -0700
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, linux-block@vger.kernel.org,
 Jiri Pirko <jiri@mellanox.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Joe Perches <joe@perches.com>, "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Jaroslav Kysela <perex@perex.cz>,
 Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi David,

On Tue, Jun 4, 2019 at 9:34 AM David Howells <dhowells@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > I'm not such a big fan of BUG(), so I'd go for ret = -EAFNOSUPPORT, but given
> > rxrpc is already full of BUG() calls, I guess it is an acceptable solution.
>
> Okay.  Are you okay with this going through net-next?

Yes, I am.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
