Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD391B0DF4
	for <lists+linux-afs@lfdr.de>; Mon, 20 Apr 2020 16:08:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzBodfyfpYs35s7OwdzmuJowvEGEHYCRHBlboZKbW/A=; b=lA7H7DSi6/a3J4
	Xvy1pJyPrNrviEYGT/OQKYV8CG1o3jVCX1kC0bQlVnh0kavWuaB+P3Jx9psykoX2/jIfbHDDQa0Jn
	yPT5NYVEVGlTyx9RwI43jup0JJt7w3orX+kIa0W4V6pTztDK4qrbnbBYKZ8e6ebfg7w6MgSs/nfgy
	3mNn1Q91af1RVrs+LJJ4JwJxqMgARc0XYgot0ou/g2qHBCx6808sQbernPynrUKvC1RKNY3WCYWl8
	vW0xSwoLTDvTSfDusmArCfKhKlxpasUddkNLt5t5JNOpvo7Q/IKQpxHICFbPh/3szKvaByugINYG0
	aybe6uUXAGuVAlEhkWjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQX5K-0003B1-OT; Mon, 20 Apr 2020 14:07:42 +0000
Received: from mx.cjr.nz ([51.158.111.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQKlo-0001Qg-Dn
 for linux-afs@lists.infradead.org; Mon, 20 Apr 2020 00:58:45 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 4D1BC7FCFC;
 Mon, 20 Apr 2020 00:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1587344312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAr7dQ1lkh5Q0MOSA+C5E6a/FibwZsB/6txDi0hUANQ=;
 b=NDBi3jMq9coPi8YRdzSeQB0Y1zLZ5hA6rcD82Eutcxbaudjs5HacYYdLbi6/XFiHiW6JRa
 xjQLgknfdLihkIdqkp0WpVPftqBnWUtiIIxrPn+F+Wf/3dMwavyxXObm3+jjxI+Va6Hhvh
 U2FQE/cL0C4A+YZJnwXe0GMtk/HbCTg5XJ9hqhj1QketlwCv9ANViPQF66gOvZD3Nli1Kj
 EcyM3gGEZ6JHL0qzfei5TjQ73DVLh5pQJ0Z6OLuCUogsIsjcILpPR2vJzOlNqnIkpewArk
 TuiohUvQfc08jNbN9FPzp2dA5vcdK/vskwY+ueQhovb/36hVqlUgPs1IKPmm1Q==
From: Paulo Alcantara <pc@cjr.nz>
To: David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
In-Reply-To: <927453.1587285472@warthog.procyon.org.uk>
References: <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <927453.1587285472@warthog.procyon.org.uk>
Date: Sun, 19 Apr 2020 21:58:25 -0300
Message-ID: <87imhvj7m6.fsf@cjr.nz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_175844_601252_3F083558 
X-CRM114-Status: UNSURE (   5.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [51.158.111.142 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Mailman-Approved-At: Mon, 20 Apr 2020 07:07:41 -0700
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 keyrings@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

David Howells <dhowells@redhat.com> writes:

> Steve French <smfrench@gmail.com> wrote:
>
>> For SMB3/CIFS mounts, Paulo added support last year for automatic
>> reconnect if the IP address of the server changes.  It also is helpful
>> when DFS (global name space) addresses change.
>
> What happens if the IP address the superblock is going to changes, then
> another mount is made back to the original IP address?  Does the second mount
> just pick the original superblock?

It is going to transparently reconnect to the new ip address, SMB share,
and cifs superblock is kept unchanged.  We, however, update internal
TCP_Server_Info structure to reflect new destination ip address.

For the second mount, since the hostname (extracted out of the UNC path
at mount time) resolves to a new ip address and that address was saved earlier
in TCP_Server_Info structure during reconnect, we will end up
reusing same cifs superblock as per fs/cifs/connect.c:cifs_match_super().

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
