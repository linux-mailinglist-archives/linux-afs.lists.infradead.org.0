Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id A06221D9C76
	for <lists+linux-afs@lfdr.de>; Tue, 19 May 2020 18:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roST8vV6LmQBSycCJh0tKblg+PyrxSY0wwhcYrQqq20=; b=PIbX4FbKaKGm4I
	p2vKUMPJQM2HC+UM0nVzGfdxJdqt7crKP4jM0lFzGj5r7GAhuElqTMdFtR4nH58YfuXYZyK595Haf
	zk8kuFxWxBKkVT45/RDy5lFnDOxUxzfQhBK8GSZnq4tfEiELDmYPu8ixmnPU3DK2HXwcGgL0hcDDn
	UeEbN5R9FFrqFE+5/NiBkVDApRVe3pvH9gWobozycmJgFCjQuT8AZzw4CKE4oRSl4VW2wE9/YyQqI
	mFTpdY+1gehaEYSiQU1Q7YTbmiagGxiLXzoGPJQapMYTYxm646knc0AMJVRuhaCdpizTMarleOpHi
	FjO/+1O2UGI2RM77+Ltg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb53I-0003bz-Db; Tue, 19 May 2020 16:25:12 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb53F-000188-Hu
 for linux-afs@lists.infradead.org; Tue, 19 May 2020 16:25:10 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7CBCF5C00D1;
 Tue, 19 May 2020 12:24:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 19 May 2020 12:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=benboeckel.net;
 h=date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-type:in-reply-to; s=fm1; bh=7/52dq5GxyiFcd
 dCLps86QCxmzKufuJnLl7OH1657qI=; b=c1zsJqiWBgruzDh/25LryFc4I/tJS+
 KejzuOJ1efDWpsQMaT/iI4KAnDS8jXkboxzHQy4d076P8VZSYja7C1lqXzJAxwOU
 /hHqX9Vh52Pk30pdFhFxBvtUvWJnCkP/6ZXnwYHBHf/wv8gK+uHbv3hQusJ8DlUB
 tJgDY6o2zq2Rqj2G0aw14HNItLTKTgwuZCvTalwVu09DNN+r39xi3yiS0Fu4am2u
 TfYm1o6nbLAxFMsajd7qy/8HN6kEkoapPVwE2rrpHeNfQntfA85cDt453wuUY2nc
 4QmbMa00jCapZPZ8WeUbwAMb1HZBpHhCVqxFjQuXmt/PfKVCz/8cjO0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7/52dq5GxyiFcddCLps86QCxmzKufuJnLl7OH1657qI=; b=fZkGF6+s
 2NFay7YhJ+tKBb+twAe0shLDdn1FlFIJBQuxiomMjsGpQ/K8Vfjw7b8lrfWLGyAl
 ASpfsxFhO1xrM3d/4JB2/9oQl7GK0irtWZY4mvvQFOGTKR3qLeATNUztzFFkG9hj
 mJ3vXnWYEyhcD1gj+PJ/ijWHDqJpjpC7du7daw3nn+lGpeREw/9mjYfHF5MJMevQ
 W9+49sDoDe2ddx0oK72Pr/S30OX5LWMdFSoN+pM6Ge8CFhZoQIp1gtAr2Y+zWUY3
 gDuv/2jlCR3X3zZXxA3jj2W0qMeJMvTo2VfhJnb++3fCWmWkExulf7TzjItqUtM0
 MufBtLPvlovf7A==
X-ME-Sender: <xms:VQjEXlRLzugsFLKbHpleHm2R5P4Xz3dzQH6kstjIiDtNAwXKpJnfTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhrfhggtggujggfsehttdertddtreejnecuhfhrohhmpeeuvghn
 uceuohgvtghkvghluceomhgvsegsvghnsghovggtkhgvlhdrnhgvtheqnecuggftrfgrth
 htvghrnhepjedtvdffheetgfektdehvefgieelgeefheejvdehtdduieetgedtfedtleev
 vdffnecukfhppeeiledrvddtgedrudeikedrvdeffeenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgessggvnhgsohgvtghkvghlrdhnvght
X-ME-Proxy: <xmx:VQjEXuym6QgehtMSmMpoV9E7TnaLg9GXaX3mTvL85qC7i3EAwGH9uQ>
 <xmx:VQjEXq1yZDifEBgM-BnSBJ_sg8hMsS0yLWT_4Yka9-rkqVDOO7U70w>
 <xmx:VQjEXtCtK0SpOh7vIKzJBJRtA5Rsv4RchA3niV5yLgsDwRm_jqcpyw>
 <xmx:WgjEXga2rAiJlnRndipxaz5S5Xibw8t-qKafQBRhmbZN_wm9Ok0GLw>
Received: from localhost (cpe-69-204-168-233.nycap.res.rr.com [69.204.168.233])
 by mail.messagingengine.com (Postfix) with ESMTPA id 63B91306643B;
 Tue, 19 May 2020 12:24:53 -0400 (EDT)
Date: Tue, 19 May 2020 12:24:52 -0400
From: Ben Boeckel <me@benboeckel.net>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] dns: Apply a default TTL to records obtained from
 getaddrinfo()
Message-ID: <20200519162452.GA3010828@erythro.dev.benboeckel.internal>
References: <20200519141432.GA2949457@erythro.dev.benboeckel.internal>
 <20200518155148.GA2595638@erythro.dev.benboeckel.internal>
 <158981176590.872823.11683683537698750702.stgit@warthog.procyon.org.uk>
 <1080378.1589895580@warthog.procyon.org.uk>
 <1512927.1589904409@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1512927.1589904409@warthog.procyon.org.uk>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_092509_694796_A1269B8D 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [66.111.4.27 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [66.111.4.27 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
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
Reply-To: me@benboeckel.net
Cc: fweimer@redhat.com, linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Tue, May 19, 2020 at 17:06:49 +0100, David Howells wrote:
> Okay, how about this incremental change, then?  If fixes the typo, only prints
> the "READ CONFIG" line in verbose mode, filters escape chars in the config
> file and reduces the expiration time to 5s.

Thanks! Looks good to me.

Reviewed-by: Ben Boeckel <me@benboeckel.net>

--Ben

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
