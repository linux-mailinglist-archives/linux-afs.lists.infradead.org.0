Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0D61ADD8
	for <lists+linux-afs@lfdr.de>; Sun, 12 May 2019 20:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:MIME-Version:From:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svdePVwHTJlj/EqQEZxK+L0Y82f2XZOT8xtc7vZXxcs=; b=bOs8nMBluBZ2zw
	AXgIBhGpjdrVP9pyF4BNGdV4nJzptfFuX6e0M271uyHSbgTdsd465shTBhf5lxOhS4dKQTTPI+9fR
	q52dfTLPz948cxm7Y3HfFRXvR/PfL5cn+1uGMRb842BeWRdYuzTUGb9xo1TVzcKWvILcGbQKWBe/B
	6KjBtYGRGDCE2ZSeSUkELGeuzhx7KoAbM+RKNZ/B9zEOHEHkJNH6U+HSlZHk5jnRRsONH77w9c80c
	OeV7YTKPvXelQPKiO5Zmcv9AOyUGl/vPMMKFveBRahhCeZfdqVt8NjOJxPcB/I8AI8hAKfc32rHC5
	GUq8b9MT0Ilqev86/fhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPtST-00012K-NN; Sun, 12 May 2019 18:44:25 +0000
Received: from mx01-fr.bfs.de ([193.174.231.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPtSP-00011A-0r
 for linux-afs@lists.infradead.org; Sun, 12 May 2019 18:44:22 +0000
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
 by mx01-fr.bfs.de (Postfix) with ESMTPS id 1A78220366;
 Sun, 12 May 2019 20:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901; 
 t=1557686652;
 h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otGbpeOBUxPubh373VfctsNYuIcg2bUblAv6dqaMf+U=;
 b=Zi0SN6eD6GaX54lrqv1SUnB2TXa1kiIxMJbfaWBuWg9lMTdFZYu+54FfVG1WP9YeLgs6gg
 ds84cy9FxPewKnawtYrFvAkrGVaU1nviZz8yEw9g/7gNv72YN+u8/dsG4AXuflBA4yLETz
 SSjWvHN84sshvI9FqFOVvrFgiqCXWDH+sVWckJ1AITC2bsKNm0YYuKWMlG7d0VE2wwAcUF
 WRbOm2bkKYuWFuPCXz/YJE/IQAAd2x9SqZ5PEZYE/Qz9ZldGnzP0UzqIT9MoUX3yOoLjQD
 Hh/WzeKpFBHv9AZ8tPZI2B9USzAGTwZIqj6kaTsyuKspwii2Bmgcx7+dfoftAQ==
Received: from [134.92.181.33] (unknown [134.92.181.33])
 by mail-fr.bfs.de (Postfix) with ESMTPS id 99460BEEBD;
 Sun, 12 May 2019 20:44:11 +0200 (CEST)
Message-ID: <5CD8697B.6010004@bfs.de>
Date: Sun, 12 May 2019 20:44:11 +0200
From: walter harms <wharms@bfs.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
 rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an
 error value
References: <5CD844B0.5060206@bfs.de>
 <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk>
 <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk>
 <31808.1557684645@warthog.procyon.org.uk>
In-Reply-To: <31808.1557684645@warthog.procyon.org.uk>
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
 HAS_REPLYTO(0.00)[wharms@bfs.de]; TO_DN_SOME(0.00)[];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_114421_274659_CE52FB58 
X-CRM114-Status: GOOD (  10.99  )
X-Spam-Score: 2.4 (++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (2.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.6 RCVD_IN_SBL            RBL: Received via a relay in Spamhaus SBL
 [134.92.181.33 listed in zen.spamhaus.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 joe@perches.com, colin.king@canonical.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org



Am 12.05.2019 20:10, schrieb David Howells:
> walter harms <wharms@bfs.de> wrote:
> 
>>> +	ret = dsize;
>>> +	if (size > 0) {
>>> +		if (dsize > size) {
>>> +			ret = -ERANGE;
>>> +			goto error_key;
>>>  		}
>>> +		memcpy(buffer, data, dsize);
>>>  	}
>>>  
>>
>> i am confused: if size is <= 0 then the error is in dsize ?
> 
> See this bit, before that hunk:
> 
>> +	if (ret < 0)
>> +		goto error_key;
> 
> David
> 

Sorry, you misunderstood me, my fault, i did not see that size is unsigned.
NTL i do not think size=0 is useful.

You get size from outside, and if i follow the flow correct
the first use of it is to check size>0.
perhaps you can check size at start and simply return.
Now if size==0 it will return dsize and give the impression
that buffer is used (it is not).

while you are there:
  flags |= YFS_ACL_WANT_ACL is always flags = YFS_ACL_WANT_ACL;
since flags is 0 at this point.
IMHO that sould be moved to the strcmp() section.

hope that helps,

re,
 wh

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
