Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9D8BA1C
	for <lists+linux-afs@lfdr.de>; Tue, 13 Aug 2019 15:26:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTBJ8Lpok3yoPLu7I11QsV6awQH+kwoWfSu7Zn3IyWA=; b=gEwU7FcFiNkeCM
	wHsZyOBn52UHYUqZuGpebFCWl6UOFle9zHrsKm+azVBsMjcwYSWdUsKePVUACVFJNGfymVhadAFU3
	ZtLXTtdu/A77NJKG2+N1qLKb7166EtMPUbHworK8dVuNm7/9Vc8prggAHjOZncNhsZItm3sQIfHW0
	/QxNYB1i1sfgLcpdrI3ZCRdqd3q2+gIgut1mGJVALQwuAO2MgftuNmCWqrTQRo1Io+FFgjJrM8iCz
	G+/p1/iZlH2UgX1S+eRU+rb3T30UIccjg+2rD10xd4J0NWvzfnQl5+ZKIsA5RdarV7qx1WTF4kOh7
	/0eGBUHyPsiESuk7+8ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxWoo-0002Cg-P7; Tue, 13 Aug 2019 13:26:30 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxIzq-0003hY-IY
 for linux-afs@lists.infradead.org; Mon, 12 Aug 2019 22:41:00 +0000
Received: by mail-qk1-x743.google.com with SMTP id 125so5221664qkl.6
 for <linux-afs@lists.infradead.org>; Mon, 12 Aug 2019 15:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=kdeR2ekazPPacbcNxY/1Vu/Or4DQHYsQYtQCeaE7Fv8=;
 b=1Ukepgq5x/sRZRBTKuW2bpxHjMqNBl9lA3fZd6ACoiOUlZrodm76pXyqZQHI6GOx+D
 xbi8W+2Hpek7iJlTtNsJ0n/GY3d0zOO/+hMncALdkrptGAausq8GAz02qlSLFUyGOnSO
 YlvcdLw19C5ddbsT4NyTYU2Ys9pnHk36jh3IQReKoKYk4E0NuhOsQtW4YkAswNeM+hwN
 VQ5jcq+D4+praHjSGgxeQNEdusvSTHHhoJudTQrpbNmO6PDHYQwVHDsGqtPCqCxOoq0D
 Sms3GbZiZCRjwtbV69MHRoIsDh6VqW7czkwAZ7TA/aKeQ3Gm2/2OKK1kdBPY20t8Bp+v
 6xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=kdeR2ekazPPacbcNxY/1Vu/Or4DQHYsQYtQCeaE7Fv8=;
 b=mlcZcNVQq+UneKIr2E1yKVNNHz6RcO5h8khaVVXoCoASe66ujekhGyCq2JbRmLPpm+
 ME/leoAj910hSzqL+3gYkCS2Oz0pdRWIBFDXZlEUy/iZqtk96Yk0/HUUSw/cWTrB5uXK
 bp1ISbyVpKtEl2Lz9fzxNaAvxt6bO+ISwZxbXa9avBVyZA3Ors2gkD/Hp8Ze38lCJt2G
 dui0lf/NxFKzeGeqYdMWtnpb+1rDVqiNdP9JTFAUNJF3Gnpv5SRAZ0/iN+w4zeEuy8zR
 bqO8r+C+wsl+OhE/yYcqwR9yMeKtrNKRy1jFOiuG9E5s+xFKgqFdnmrtEVgNhFRqyV5m
 jM2Q==
X-Gm-Message-State: APjAAAWYME9IsSy3tCNomoLBAg+9kxfVhDoRNUMR7p+R4WaP231UpYAt
 mTk+Sabsj5skrM8NoSYtfYb9EA==
X-Google-Smtp-Source: APXvYqyxtPM7GqksDlKwbnRQDvRzu7ixT+BoGcvf6Isa5kkNd+JSjdxb275tOajGZo7sCTYRRLzmuQ==
X-Received: by 2002:a37:b982:: with SMTP id j124mr2940613qkf.251.1565649657128; 
 Mon, 12 Aug 2019 15:40:57 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id p23sm47935782qke.44.2019.08.12.15.40.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 15:40:57 -0700 (PDT)
Date: Mon, 12 Aug 2019 15:40:47 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: syzbot <syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com>
Subject: Re: BUG: corrupted list in rxrpc_local_processor
Message-ID: <20190812154047.25d60679@cakuba.netronome.com>
In-Reply-To: <000000000000ac9048058ff3176e@google.com>
References: <000000000000492086058fad2979@google.com>
 <000000000000ac9048058ff3176e@google.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_154058_615069_9B51FC0E 
X-CRM114-Status: UNSURE (   6.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.5 (++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:743 listed in]
 [list.dnswl.org]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Mailman-Approved-At: Tue, 13 Aug 2019 06:26:26 -0700
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
Cc: john.hurley@netronome.com, edumazet@google.com, arvid.brodin@alten.se,
 oss-drivers@netronome.com, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, jiri@mellanox.com,
 linux-afs@lists.infradead.org, dhowells@redhat.com,
 dirk.vandermerwe@netronome.com, netdev@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, 12 Aug 2019 15:32:00 -0700, syzbot wrote:
> syzbot has bisected this bug to:
> 
> commit 427545b3046326cd7b4dbbd7869f08737df2ad2b
> Author: Jakub Kicinski <jakub.kicinski@netronome.com>
> Date:   Tue Jul 9 02:53:12 2019 +0000
> 
>      nfp: tls: count TSO segments separately for the TLS offload
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11d04eee600000
> start commit:   125b7e09 net: tc35815: Explicitly check NET_IP_ALIGN is no..
> git tree:       net
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=13d04eee600000
> console output: https://syzkaller.appspot.com/x/log.txt?x=15d04eee600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a4c9e9f08e9e8960
> dashboard link: https://syzkaller.appspot.com/bug?extid=193e29e9387ea5837f1d
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=159d4eba600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ba194a600000
> 
> Reported-by: syzbot+193e29e9387ea5837f1d@syzkaller.appspotmail.com
> Fixes: 427545b30463 ("nfp: tls: count TSO segments separately for the TLS  
> offload")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Is there a way perhaps to tell syzbot to discard clearly bogus
bisection results?

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
