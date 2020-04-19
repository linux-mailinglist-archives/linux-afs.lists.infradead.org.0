Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA871AF718
	for <lists+linux-afs@lfdr.de>; Sun, 19 Apr 2020 06:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnHKwE1HbggZtl/744neGPr2A4jQ/uQ+5QwMQ6vwaEs=; b=JLF9B6F0hkFpeC
	701dPOHFtKAAQbb/g1vD47kOdvDejz+Cog7nSzfQtn2UKBKuJ0E0tfIlDdy95xhlDCyc4tkOZiXal
	W8mp7zJILu0/RO3jD7Wnm8E/XZw0w+6XHd8ByPdLGXj7yh2YoODpsKUEZ4/nkaIbVja1sdVB/Jzri
	CXz7HSJEDpA1+dAE/1mM8HyWJbrJZQFUXkIaUUQ4QAZkBBj/W2DZ4349wjSBGUKMWeNjOrlHyAFRQ
	Vvh9p2OuSMkbmllNr8hk03cuqy9h6SZKmERUp8bI69f3F3lySzpvQMOsnOz1ZCGXKvMjqQueQmrdh
	bmQIkuv7bkcugtJlm8jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ1y8-00036y-GB; Sun, 19 Apr 2020 04:54:12 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ1y5-00036K-La
 for linux-afs@lists.infradead.org; Sun, 19 Apr 2020 04:54:10 +0000
Received: by mail-yb1-xb42.google.com with SMTP id i16so3439742ybq.9
 for <linux-afs@lists.infradead.org>; Sat, 18 Apr 2020 21:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gog0dknM05EMtGVHWyU1DT7VuRc7nYwUpeTOmS66nno=;
 b=nHn0HnEoktBrbfUcj+ZOPirGnQncKk4bHCrDStjtphOSF7bEr+pXuF9TflkLymQDwU
 JLP9cTNkEi4eDTTijxfx8Lzqan2IONHkpataQ73Xi23AZLZKRTtqioenP1GMzUTW89F6
 L/ZnDRYzmODT6t4cQAbj8orEcwDmfiOdLHrLOiLzFrB/RLeWqvOXv+FV/RM9nBV2mPoe
 H7pGMrAI06Td1kFo9HT9S+PVFkqmIzWCrLdPJ1b1wVJgARkHy9dtWLdi1kLUySdJwXgQ
 Umj4VWNaUTQPYwFkbjJStreNlh8SMLlUtVA8UogqzA5/CDHHUzIi7m7OLJah7i6spynI
 MxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gog0dknM05EMtGVHWyU1DT7VuRc7nYwUpeTOmS66nno=;
 b=A1mo41j5977iNXi+IpKtGLFhqet2Wa10Qr0t+RPj2ACsUCKoDKRhcuGXm8yzFMA8AH
 fz+Iyp0pIQe+mjy6N+XpvKqWFasGQWog98SNXj0TL2KUmdyXsQ1L9S9nUxUQOpk/M+to
 N9WldAYGR8SiDGColKk7tm8iHlVjPAtaGzLRBq2N3WB4yOlJ3XQ0xS3QkooX4GSNH/fG
 5ztGpbUU4Q/YFUsIRTGxY+Dbp2kz+nnJd/uRKE0IL2tYVWeyOZTMk3jBFM6wMsNk3DEr
 49XIN41YFc4pROoxKVfHQCnmg/MpdArUYUgJvaTbCKLskp/9AekWeGUuZ3EKKHSgx5ZB
 vQbQ==
X-Gm-Message-State: AGi0PuZxYvsmCPRQqzrcig8lgFI6u7LOo9mJx7c3s8ucadOmcw5jhMpR
 eU+kOoTuz0814uejJxH5Jbtl/IgHuxAfJ7HRkiI=
X-Google-Smtp-Source: APiQypKexOfCMHJoNZ1DUDrRLe7fxIec4nFsf9towAfH9uHBxh8i1vwDgiNOHtLvi8jVmjXwsDfRpb2RLG/yU7rA8RU=
X-Received: by 2002:a25:cf12:: with SMTP id f18mr9682392ybg.167.1587272048258; 
 Sat, 18 Apr 2020 21:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <3865908.1586874010@warthog.procyon.org.uk>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <87a738aclu.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87a738aclu.fsf@oldenburg2.str.redhat.com>
From: Steve French <smfrench@gmail.com>
Date: Sat, 18 Apr 2020 23:53:57 -0500
Message-ID: <CAH2r5mth8Jc0dfAOP+hXTp-hJBHoNT4M=J8Ypcq+BhP4a_Wc6Q@mail.gmail.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
To: Florian Weimer <fweimer@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_215409_730610_82B7F414 
X-CRM114-Status: GOOD (  11.17  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:b42 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [smfrench[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: CIFS <linux-cifs@vger.kernel.org>, linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

commit 28eb24ff75c5ac130eb326b3b4d0dcecfc0f427d
Author: Paulo Alcantara <paulo@paulo.ac>
Date:   Tue Nov 20 15:16:36 2018 -0200

    cifs: Always resolve hostname before reconnecting

    In case a hostname resolves to a different IP address (e.g. long
    running mounts), make sure to resolve it every time prior to calling
    generic_ip_connect() in reconnect.
...

(Note that this patch may have some minor dependencies on a few other
DFS related patches that were merged immediately before it.
08744015492f cifs: Add support for failover in cifs_reconnect_tcon()
a3a53b760379 cifs: Add support for failover in smb2_reconnect()
23324407143d cifs: Only free DFS target list if we actually got one
e511d31753e3 cifs: start DFS cache refresher in cifs_mount()
93d5cb517db3 cifs: Add support for failover in cifs_reconnect()
4a367dc04435 cifs: Add support for failover in cifs_mount()
1c780228e9d4 cifs: Make use of DFS cache to get new DFS referrals

On Sat, Apr 18, 2020 at 1:11 PM Florian Weimer <fweimer@redhat.com> wrote:
>
> * Steve French:
>
> >>> The question remains what the expected impact of TTL expiry is.  Will
> >>> the kernel just perform a new DNS query if it needs one?
> >
> > For SMB3/CIFS mounts, Paulo added support last year for automatic
> > reconnect if the IP address of the server changes.  It also is helpful
> > when DFS (global name space) addresses change.
>
> Do you have reference to the source code implementation?  Thanks.
>
> Florian
>


-- 
Thanks,

Steve

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
