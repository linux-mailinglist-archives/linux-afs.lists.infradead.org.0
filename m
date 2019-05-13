Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 977CB1B3B4
	for <lists+linux-afs@lfdr.de>; Mon, 13 May 2019 12:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:MIME-Version:From:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfcCcexCo/TG/JLbcYjucaGHIVrfcx1l7jlhP7Lwt7A=; b=tyM76i4XgfIPX/
	jChn3a0eAPgupVgV+TB3mKpUUyyHl8Yr1302Rw4lqtZIx8pQnzhWQ1sGDy8TUy6wv892/2G5JSXiM
	1fjmQ1KJoAVfOtqzaju42hmQbFTHXcNJFNDqN+UbYcLYB1JowTp9rCusIk3FI4djjdlwiqk3jJzjP
	uoo+mVWimxNZwq7mOwvE8Ds15fZmNhIrBY9RiPwXXPZdETi2Z33P95TDiiS4Is+0l6Djm7LH/FPpJ
	btCVtXxYHgT/oUK12qCkUDyUN7n1K3adJZQrDPj2Kj7hyu4ELI9WQhermDwS8C3cUavSdsO8kn2bB
	ADe7YEEOcDzbMySj1AwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ7xy-0003Vy-8X; Mon, 13 May 2019 10:13:54 +0000
Received: from mx01-fr.bfs.de ([193.174.231.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ7xu-0003Uy-EE
 for linux-afs@lists.infradead.org; Mon, 13 May 2019 10:13:53 +0000
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
 by mx01-fr.bfs.de (Postfix) with ESMTPS id 6BDA2202D3;
 Mon, 13 May 2019 12:13:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901; 
 t=1557742420;
 h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5mgh4KCp63jsksPf9LEb/AYezgTUIq/azbAEZv5xKE=;
 b=KlhpbFtMT08WmEzekabJJrNbF0LR2M+P3ImvaqOsqMLfInyF0CAv7a5CaDN4nMLcKqpfQW
 kF0rf5m6UGFheax/OWvvGwQSWrsQQAOds5NNpeIdKhiL4YLdcxj4PUoh3dFuS/ZDzx5dws
 ZZtoPp8nlzU43Fq9gJDMLrP9Omel3Za6CibOdwRIio2GXJqmcR5MHYeGHArc0eBbb0AJGn
 UxE4VILzpGilsG6EMyjwKrhhi18JXRYJJSM3qtvMGmRQdxW8EUXJ/ehPnBRYnG5ueIWKyN
 AFF3WZ6GZvCnyRoMGp4BhEXqiFJmFdFKTpia0GEgijVVCY9jvT21KXIEcBlAkg==
Received: from [134.92.181.33] (unknown [134.92.181.33])
 by mail-fr.bfs.de (Postfix) with ESMTPS id 12F82BEEBD;
 Mon, 13 May 2019 12:13:40 +0200 (CEST)
Message-ID: <5CD94353.90702@bfs.de>
Date: Mon, 13 May 2019 12:13:39 +0200
From: walter harms <wharms@bfs.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
 rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an
 error value
References: <5CD8697B.6010004@bfs.de> <5CD844B0.5060206@bfs.de>
 <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk>
 <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk>
 <31808.1557684645@warthog.procyon.org.uk>
 <6819.1557691584@warthog.procyon.org.uk>
In-Reply-To: <6819.1557691584@warthog.procyon.org.uk>
X-Spam-Status: No, score=-3.08
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.08 / 7.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.00)[wharms@bfs.de]; BAYES_HAM(-2.98)[99.91%];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_031351_502911_59BAAD5D 
X-CRM114-Status: GOOD (  13.21  )
X-Spam-Score: 2.4 (++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (2.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.6 RCVD_IN_SBL            RBL: Received via a relay in Spamhaus SBL
 [134.92.181.33 listed in zen.spamhaus.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Reply-To: wharms@bfs.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org



Am 12.05.2019 22:06, schrieb David Howells:
> walter harms <wharms@bfs.de> wrote:
> 
>> Sorry, you misunderstood me, my fault, i did not see that size is unsigned.
>> NTL i do not think size=0 is useful.
> 
> Allow me to quote from the getxattr manpage:
> 
>        If size is specified as zero, these calls return the  current  size  of
>        the  named extended attribute (and leave value unchanged).  This can be
>        used to determine the size of the buffer that should be supplied  in  a
>        subsequent  call.   [...]
>  
ok, sorry for the noise i did not know, for me that look unintended.



>> while you are there:
>>   flags |= YFS_ACL_WANT_ACL is always flags = YFS_ACL_WANT_ACL;
>> since flags is 0 at this point.
>> IMHO that sould be moved to the strcmp() section.
> 
> Why?  It makes the strcmp() section more complicated and means I now either
> have to cache flags in a variable or do the allocation of yacl first.
> 

no need to cache, the idea was only to make the correlation between the name
and flags more obvious. (no need to hurry, i just noticed it)

if (strcmp(name, "acl") == 0) {
		which = 0;
                flags = YFS_ACL_WANT_ACL;
	}
else if (strcmp(name, "acl_inherited") == 0) {
		which = 1;
                flags = 0;
        }
else if (strcmp(name, "acl_num_cleaned") == 0) {
		which = 2;
                flags = 0;
	}
else if (strcmp(name, "vol_acl") == 0) {
		which = 3;
                flags = YFS_ACL_WANT_VOL_ACL;
}
....

re,
 wh
> David
> 

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
