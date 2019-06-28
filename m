Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EE76F58F05
	for <lists+linux-afs@lfdr.de>; Fri, 28 Jun 2019 02:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c8i8a3HaF+ZU+yrVa5H2nfw3hXUK460xcvPFgk5beMo=; b=byzg/F94MXykBf
	/zbE0dOQ5sYqjhEG+NuCaMfCwRy+4amXt7NaW4AaZoXJLK3j0uwscWeulxKarW5BQHelrq7eKn9Ol
	r/w4GYRG4mg2ndKVgUXIbGOf+2piMeSSAYzpngNLytgBDHFom+eEqubzZicXA2KQPqhhj8fbhW6tY
	wRt4WHuibGfHm2OFJejCEvgUjmAju+LQKRCG4h0MGaZNtJ5mzcFegWav6QZk6Bjka+9lOLeGYRr8y
	TktYwBlxmeELa5Wnov1IiLhYQrhMs6Sulivcue4fILL76XIHpZ3HDQCzQunqbsPQ4b4TaHTGI7f+H
	Qvd5Dmpz3ZAfx4GAr/QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgeph-0003Ih-8t; Fri, 28 Jun 2019 00:33:41 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgepe-0003ID-M0
 for linux-afs@lists.infradead.org; Fri, 28 Jun 2019 00:33:40 +0000
Received: by mail-pl1-f177.google.com with SMTP id m7so2178586pls.8
 for <linux-afs@lists.infradead.org>; Thu, 27 Jun 2019 17:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=h/NwULkT8UAGA1JfexZXk2xHEhR/Uzxp/rp2djCOWmA=;
 b=Nq/+c9x4jQCpJRhRc0tBiHQ187uitUSdHJdic1RmPnPeEtYwaTXP8teSxUXJlSxQ73
 hLN8yEjBWv8hhY/XLSPVYzmZMlGjOt73xieiirCt+nAdU8Ant9KdFKYd7Qw4mZInO+GM
 9oXuzADqAlUR0DLVTuTknhblhi2asxznwdBglTp3wonfLgC6XPfdTk9lkRHoaKHUxunq
 8XlpPfdqtDMVNV7yyr0wPouo8RFhIZqeBwgkqOTJGb+CZOk2Tj02cFomXtGZvdhXg89m
 ncqMDgAmSkrqdMgATfbAPfEudnjkfTgSyKE/GY8/8YWd5DmvlA/KBMSJX6sRjvw0DwuC
 uSSw==
X-Gm-Message-State: APjAAAU1yfjH5yzXibexT3kb1zlgLi9Svtk8Rewf4i4oy7sTyKFbxVdP
 xPrITP12tE5qHDX0SoeKlJKlPHAp/rE=
X-Google-Smtp-Source: APXvYqxco0OgClPvMJ6D8m75dLvwpL8IE9NLOpg6b11GCNqY9Rutv5naYDSK05seYG6QPN+f7nWXgQ==
X-Received: by 2002:a17:902:26c:: with SMTP id
 99mr8271781plc.215.1561682017242; 
 Thu, 27 Jun 2019 17:33:37 -0700 (PDT)
Received: from fedora19.localdomain ([101.164.133.67])
 by smtp.gmail.com with ESMTPSA id y14sm336224pjr.13.2019.06.27.17.33.35
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 17:33:36 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:33:32 +1000
From: Ian Wienand <iwienand@redhat.com>
To: linux-afs@lists.infradead.org
Subject: 5.2.0-rc1-afs-next-9f4a9105 : volume is offline messages during
 release
Message-ID: <20190628003332.GA23470@fedora19.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_173338_719601_F6AA30B2 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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

Hello,

We are running a 5.2.0-rc1 kernel from the afs-next branch @ 9f4a9105
serving a number of AFS volumes with kafs (from a server running
openafs 1.6-ish) over Apache. On the node serving data we periodically
see:

  [19060.275861] kAFS: Volume 123456789 'mirror.xyz' is offline

for a range of volumes.  Looking closely, this appears to coincide
with "vos release" of the underlying volumes.  For example, to take
one in detail; the message with UTC and offset timestamps is:

  [Thu Jun 27 20:41:34 2019] kAFS: Volume 536870950 'mirror.ubuntu' is offline
  [19060.275861] kAFS: Volume 536870950 'mirror.ubuntu' is offline

The host updating this volume has just re-synced it's mirror and does
a vos release at this time; it's logs are:

  2019-06-27T20:41:14,902583784+00:00
  Kerberos initialization for service/reprepro@OPENSTACK.ORG
  reprepro completed successfully, running vos release.

  mirror.ubuntu 
      RWrite: 536870949     ROnly: 536870950 
      number of sites -> 3
         server afs01.dfw.openstack.org partition /vicepa RW Site 
         server afs01.dfw.openstack.org partition /vicepa RO Site 
         server afs02.dfw.openstack.org partition /vicepa RO Site 
  This is a complete release of volume 536870949
  Re-cloning permanent RO volume 536870950 ... done
  Getting status of parent volume 536870949... done
  Starting transaction on RO clone volume 536870950... done
  Setting volume flags for volume 536870950... done
  Ending transaction on volume 536870950... done
  Replacing VLDB entry for mirror.ubuntu... done
  Starting transaction on cloned volume 536870950... done
  Updating existing ro volume 536870950 on afs02.dfw.openstack.org ...
  Starting ForwardMulti from 536870950 to 536870950 on afs02.dfw.openstack.org (as of Thu Jun 27 18:48:35 2019).
  updating VLDB ... done
  Released volume mirror.ubuntu successfully
  Kerberos initialization for service/afsadmin@OPENSTACK.ORG
  2019-06-27T20:41:49,601685716+00:00
  Done.

We have a range of tracing turned on for the server (terse notes in
[1]).  It shows the following around this timestamp:

  # tracer: nop
  #
  # entries-in-buffer/entries-written: 54/54   #P:8
  #
  #                              _-----=> irqs-off
  #                             / _----=> need-resched
  #                            | / _---=> hardirq/softirq
  #                            || / _--=> preempt-depth
  #                            ||| /     delay
  #           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
  #              | |       |   ||||       |         |
            <idle>-0     [004] ..s. 19060.399389: rxrpc_rx_abort: c=0000bc25 ABORT 000054eb ac=106
            <idle>-0     [004] ..s. 19060.643409: rxrpc_rx_abort: c=0000bc2d ABORT 000054ec ac=106
            <idle>-0     [004] ..s. 19067.810913: rxrpc_rx_abort: c=0000bc38 ABORT 000054f7 ac=106
            <idle>-0     [004] ..s. 19067.913956: rxrpc_rx_abort: c=0000bc3a ABORT 000054f8 ac=106
            <idle>-0     [004] ..s. 19068.034541: rxrpc_rx_abort: c=0000bc3c ABORT 000054f9 ac=106
            <idle>-0     [004] ..s. 19068.125210: rxrpc_rx_abort: c=0000bc3e ABORT 000054fa ac=106
            <idle>-0     [004] ..s. 19068.220810: rxrpc_rx_abort: c=0000bc40 ABORT 000054fb ac=106
            <idle>-0     [004] ..s. 19068.366085: rxrpc_rx_abort: c=0000bc42 ABORT 000054fc ac=106
            <idle>-0     [004] ..s. 24539.560837: rxrpc_abort: c=00000000 722b2e34:00000022 s=0 a=-5 e=74 BAD
            <idle>-0     [004] ..s. 26695.082392: rxrpc_rx_abort: c=00010e63 ABORT 00033713 ac=106
            <idle>-0     [004] ..s. 26695.297150: rxrpc_rx_abort: c=00010e6b ABORT 00033714 ac=106
            <idle>-0     [004] ..s. 26695.357083: rxrpc_rx_abort: c=00010e6d ABORT 00033715 ac=106
            <idle>-0     [004] ..s. 26695.419402: rxrpc_rx_abort: c=00010e6f ABORT 00033716 ac=106
            <idle>-0     [004] ..s. 26695.480244: rxrpc_rx_abort: c=00010e71 ABORT 00033717 ac=106
 ... there is more, but from much later on ...

I'm not sure if that helps in that format?

I think probably the best help here would be to dump the rxrpc tracing
right at the time we see the message appear in the kernel logs?  We
could certainly have a script running to monitor for this and dump in
whatever format would be most helpful.

If I can get some advice on the broad strokes of what will be helpful
to see to help debug, I can implement this and follow up.

Thanks,

-i

[1] https://etherpad.openstack.org/p/opendev-mirror-afs

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
