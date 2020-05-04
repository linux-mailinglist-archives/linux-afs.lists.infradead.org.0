Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4DC1C463D
	for <lists+linux-afs@lfdr.de>; Mon,  4 May 2020 20:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLByaCWLlx26Kq9BXg1tQYo/bh6PazP2xQXSLMR8J8c=; b=TYD3sHwDBwsNUz
	Z9vK4j2PekZVpkck80jv1Di+AeT6VGauQTXulZorAUzVmBQMnWVThd1wLZMuakpMLDuKwiwsQzFp4
	nQ1yajcvsHVh6OwBe6cH0f4pawIS/ONJ0vGmpbYtXl4Pm3LOlcB1hhqUmsJ4lcuJeUlNVE7yBQeHQ
	xnOlDPBDsLzZi03j++h4GS0bLu1pJGKS2WZcpLSLKZcMl+tM55GQpsy3EstHwrxW5ntzzfTu/BVFO
	eQyxdajPjeRz+QbGdq1u0uff4c8xagiXxqgiE0TTQbeuNhOCol6wP2rPi4lBDtD2X2RQ/KjhiYmPZ
	Bg/T1R4SlRKjydL15MLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVg5a-0004lM-50; Mon, 04 May 2020 18:45:14 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVfJL-0007rZ-3V
 for linux-afs@bombadil.infradead.org; Mon, 04 May 2020 17:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=+o4SdY0w3UouF91y2gLQuR1sVRgD2BPdPwIappEYt/U=; b=iuCqhkP/mnHMSOKqTSGP/KEzY/
 rap5jAqfHjO+CEUy/He2YTAUkSq9QF0hU+HshwS5B0ZEPWI7gO9XOgNSEjAJs7FxwRGMuMrdhLlK3
 zv3Y5tLFQ5+fw+KFOwsKLkBVpZVo3tvLW8r78/5nI/aW/5AyKdAGnB8fYySVIwEM1bmwejmZ/3BR9
 hzuSkrDZ9eyYqe7TcUujC+nXMqrwyvGghcb1m4CoCjQ7A8WIPSoF3mEKOju9vJhQT4o002TKEIcYq
 Wr7pU3QwGG6i2uoN9W+laYMzfpnpvzyxTzEVK3jjAI3pMXVkhv3l2aGM3A7J67yC3pBVVUjg0UdF8
 b3clgDjw==;
Received: from us-smtp-1.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVfJI-0006Bg-UQ
 for linux-afs@lists.infradead.org; Mon, 04 May 2020 17:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588614879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+o4SdY0w3UouF91y2gLQuR1sVRgD2BPdPwIappEYt/U=;
 b=T2mGk/HhnGz7gXrVP24P2iHgVVzdLEthQ+KdwC5Hq6IOPAxLxbrxnEWQopCszU0KA3Tu18
 f+FCoES1x8vibsZ6vh3JODelZbI5/Gxt0zzidw18XNkhzillnjPRNUN58XIwZWE6LNkW8k
 Y/LK5gsJrJZP/0RU5tjMMzVrjcTFMvg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588614898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+o4SdY0w3UouF91y2gLQuR1sVRgD2BPdPwIappEYt/U=;
 b=TJ4Wzmxvj3W6WlAdWg7bpS/GVz2OO2BSVQHgYsztsNDPoa1iRFs1BdxNsjKndm8rcMQxE1
 pxU7Qu5NiUQJVn2VebNZj3KmUXj12nSxo1dWGhfayM1DJbQ9Xkp7SJSWw2Bb+wB+fqyqPx
 LJrE0+dUWa6uLNiJtj28GOwDH279KL0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588614920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+o4SdY0w3UouF91y2gLQuR1sVRgD2BPdPwIappEYt/U=;
 b=ijveQmmUK7SPKEQa1hkt9FhVlGQQVDHUzu4v0EO9mnARV8Hqe1S5bbgxU+M8XO1Nsec3bJ
 w/oY7SU9WnHb4nTRbTU63Kr2kdAWxK3uqqdyN4aC6HrpyrnoHw7CIKNibkwibCu4KXbsch
 lyHUolotgs6CuwXyarlOrkadxgOndwU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-ikj63m_YMqmrpman5J7NGQ-1; Mon, 04 May 2020 13:54:36 -0400
X-MC-Unique: ikj63m_YMqmrpman5J7NGQ-1
Received: by mail-qk1-f197.google.com with SMTP id h1so111767qkl.6
 for <linux-afs@lists.infradead.org>; Mon, 04 May 2020 10:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=+o4SdY0w3UouF91y2gLQuR1sVRgD2BPdPwIappEYt/U=;
 b=QrI6l4Fb3oGXdpOhrzvHlD8Gvkow2ScRYLghFB6h2QPHDnb4MMjEwpl5laguenvZdO
 JiTBtylqhMxb9h6EGd0jVjZ4CKDHxYS95KeoySpW3a8+GM5ChunXZmjtv2q3Bl12xWo5
 DgDOXzBvmX1EQGnbx5kR0XOEjkbfeWjEHz4BP4oomEQs2Deim6BI9bbZs/Jp1ol6JFn/
 oZ7b6rDv9mO4+tNAPNjUD55TIky/skqG2kfsv1KjwoB/ocOB4YNPGsgbXdNNsZwJJkbb
 81O8LbDwmvBvjErivt4QBPhWZmSHYK1sW25ve1l3MNZm1itegjAbDY5Gi8qFO2ryND6c
 2VFA==
X-Gm-Message-State: AGi0PuYgUFles2lnAkJzMj3UtQyW6c2fXY5p+zEiWwmBfLABQH5uLuVM
 pwguQtc1JnBVn55gSuFxRumrcJ54keHcnw3VqJS5UdkZxKHNSy99IWvLmZ8GbyFAHR676r0qo7q
 +8P6O4IvW3R2CdewkUx3fxlfznQ==
X-Received: by 2002:a05:620a:7ca:: with SMTP id
 10mr370210qkb.131.1588614875627; 
 Mon, 04 May 2020 10:54:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypK3uCi6lFkdGRP90/JqMNVl2EPo4jU4+vUXICbUKWh5Z7zHzwK3PWjYZaZSl3+osjCddPgO1g==
X-Received: by 2002:a05:620a:7ca:: with SMTP id
 10mr370193qkb.131.1588614875436; 
 Mon, 04 May 2020 10:54:35 -0700 (PDT)
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net. [68.20.15.154])
 by smtp.gmail.com with ESMTPSA id q32sm12123066qta.13.2020.05.04.10.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 10:54:34 -0700 (PDT)
Message-ID: <63498a6eedc7994b1e96a59d12468bfd15e15ef4.camel@redhat.com>
Subject: Re: [RFC PATCH 00/61] fscache, cachefiles: Rewrite the I/O
 interface in terms of kiocb/iov_iter
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, Trond Myklebust
 <trondmy@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>,
 Steve French <sfrench@samba.org>
Date: Mon, 04 May 2020 13:54:33 -0400
In-Reply-To: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
References: <158861203563.340223.7585359869938129395.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.81 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [207.211.31.81 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Mon, 04 May 2020 11:45:12 -0700
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, 2020-05-04 at 18:07 +0100, David Howells wrote:
> 
>  (3) Make NFS, CIFS, Ceph, 9P work with it.  I'm hoping that Jeff Layton will
>      do Ceph.  As mentioned, I'm having a crack at NFS, but it's evolved a bit
>      since I last looked at it and it might be easier if I can palm that off
>      to someone more current in the NFS I/O code.
> 
> 

[...]

This looks like a really nice overhaul. I particularly love the
diffstat. Net removal of ~4000 lines!

I'll plan to draft up a patch for Ceph in the near future. The new API
seems to be quite different, so I imagine this will more or less be a
rip and replace on the old code.
-- 
Jeff Layton <jlayton@redhat.com>


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
