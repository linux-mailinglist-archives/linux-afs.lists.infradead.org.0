Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8831AE89A
	for <lists+linux-afs@lfdr.de>; Sat, 18 Apr 2020 01:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8DnlIVBOybkhqKCcaYaKGHwbHYK83cdCu0m8X+KItY=; b=DSu0Epc4grgMjg
	TNxC/Q4kJrZnJnLRGWO9w2hLAJ79b/FlwTg7n6t8M8y1B7aJVf7uf2kXMCHK1PnIuedckzPmEAeKi
	H82DoCspjrb3br0NQNm+Mdm8IX+QlN+DWBb7iSwTC3XTlhhS1mjw6ECHHKBbjdRejL/pPRLx5WpXl
	uun4dYz3dKejS9bYtB0Ud4P0yfCmVYY1s2nAlGUOLsXlodzx24wqgqhngR2CGL6AaSb+s2/Gu3muV
	klY9J7nlaHhDUFdQDGHVGG0xuNn1b5eJGEWssIlpqiRPF2j5l80/7WeRbtGYV0sU3XFc5azopAGo0
	+w9p5FMTmx8anXV1qCGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPaLC-00020o-UG; Fri, 17 Apr 2020 23:24:10 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPaL9-0001zo-4c
 for linux-afs@lists.infradead.org; Fri, 17 Apr 2020 23:24:08 +0000
Received: by mail-yb1-xb31.google.com with SMTP id b17so1740993ybq.13
 for <linux-afs@lists.infradead.org>; Fri, 17 Apr 2020 16:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HoiSxHhSigFRcJk85mjSruoDJHuLkPKUFTIYImgm6Ug=;
 b=kJdb1cMFcngGa0qp/KwVwgNtuNxTmrDtjaIwLAJFoNFpQhRy6q5sHg5MTKyXeGjwWu
 vBHicJ4/2qO+c9u26+845klREFX9I5XdF+lkZsUOX2W59oXD0X0snxgaFfClthr3xbn7
 CSudiFAf2zSIPObwc6IUG29u/5JVnUYcHJCsdF3lhu2ldziUi5lRt1Q4zpTHq3PeSNwp
 Ng7+cMA/1D8kIComwJKKXIEVQliODb/0w0bKTuk3Wjf9vtPXDhcpIxgRPo+bitkuLBz8
 T/MyKESZ3xGPBcP7fJ3cdb8wdGhksJnnBUgXmE7OdCW6qXouR6PLxcE4Ehr2Pan6h5je
 ocIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HoiSxHhSigFRcJk85mjSruoDJHuLkPKUFTIYImgm6Ug=;
 b=T/uMJ73C4pJybBWP5CArnJbef7IRPXReftSrKctGzGAOszqCyceG/uuiZIQnYf9Pa8
 BHMjzqnGM2sjPJOoBDj+e8/Da0TwBHRzYMZ15xmbHlb3x/x0QBu164pVe5woCWRyKjNF
 JgXLee9qiHoR9BY8dciLEctyYkOmF5fksNNQz6k5b0jjjJqueYD6g49LM5YYZryC24uD
 00xxugGYBBVMWw0E9T+i9KwRAFE1C1qTQDhvqYno++5GoY7TelkWlkpdTE+8YkfVn/zv
 IusBS1WO/Vpl1J2gUNKecYK12hRyBXYtI9dowrNvb1jGRVcpzmC+w1H9yoGPDrhac5KS
 uZbA==
X-Gm-Message-State: AGi0PuaC5PLO5TFmsO7X71q06yoy4IyCE70Pcc6IfGjxtcIiwRqhDdJB
 k9Yh/SenxpmzbmTKFVMFG9pRS5NpWvdJalYG3Sk=
X-Google-Smtp-Source: APiQypIaoZNcLb0nbIIWdy9AexGlinfJyksDNrXL01uuwQ39JevXQ5RG2DIGZoNajN0gFWDBeQoLtKsPk7LcZ6YXDU0=
X-Received: by 2002:a25:aa0c:: with SMTP id s12mr2066981ybi.183.1587165844440; 
 Fri, 17 Apr 2020 16:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <3865908.1586874010@warthog.procyon.org.uk>
In-Reply-To: <3865908.1586874010@warthog.procyon.org.uk>
From: Steve French <smfrench@gmail.com>
Date: Fri, 17 Apr 2020 18:23:53 -0500
Message-ID: <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
Subject: Re: What's a good default TTL for DNS keys in the kernel
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_162407_206049_22CF3B87 
X-CRM114-Status: GOOD (  15.55  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:b31 listed in]
 [list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [smfrench[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

>> The question remains what the expected impact of TTL expiry is.  Will
>> the kernel just perform a new DNS query if it needs one?

For SMB3/CIFS mounts, Paulo added support last year for automatic
reconnect if the IP address of the server changes.  It also is helpful
when DFS (global name space) addresses change.

It does not require a remount for SMB3/CIFS

On Tue, Apr 14, 2020 at 11:09 AM David Howells <dhowells@redhat.com> wrote:
>
> Since key.dns_resolver isn't given a TTL for the address information obtained
> for getaddrinfo(), no expiry is set on dns_resolver keys in the kernel for
> NFS, CIFS or Ceph.  AFS gets one if it looks up a cell SRV or AFSDB record
> because that is looked up in the DNS directly, but it doesn't look up A or
> AAAA records, so doesn't get an expiry for the addresses themselves.
>
> I've previously asked the libc folks if there's a way to get this information
> exposed in struct addrinfo, but I don't think that ended up going anywhere -
> and, in any case, would take a few years to work through the system.
>
> For the moment, I think I should put a default on any dns_resolver keys and
> have it applied either by the kernel (configurable with a /proc/sys/ setting)
> or by the key.dnf_resolver program (configurable with an /etc file).
>
> Any suggestion as to the preferred default TTL?  10 minutes?
>
> David
>


-- 
Thanks,

Steve

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
