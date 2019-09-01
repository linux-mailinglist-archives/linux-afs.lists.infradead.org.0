Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609EA47FD
	for <lists+linux-afs@lfdr.de>; Sun,  1 Sep 2019 08:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2alZoMRoem+y7vye8/d5yFW2RuJGCyMS97dcRGtS7Y=; b=VvZ9onIloDwFYM
	BfrWySF1b01CVWQgOvOqHR2aVU6O/CU0DGIrvpX4SLfKcdA2AmVtv/9qLeKLPbh1gv47zh991wZW6
	SyM/EAyWHjkNcmRnTszZwj7XVoX96Gv9S/L8WreXFITCIau5QR16QJxQC59RvPnQeE9zJmtyTbeNe
	T3DafpeVgp6QdxPvoEr3SuydroJ3Ak5KGP4oBmPOIQsGY1ZsioO+g1kqV8yOsluKEtCUq4ATg5ZEL
	Vxmc/EzlxjnF3hJju7pirtmlYgUHHEB2/2u2CiBrYrvg8U5093Yl+PtDM3lQsiCD15B8yH11W1i7A
	nt2YNiHZcRSJn7Kbr2HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4Jml-0002EG-8H; Sun, 01 Sep 2019 06:56:27 +0000
Received: from r3-19.sinamail.sina.com.cn ([202.108.3.19])
 by bombadil.infradead.org with smtp (Exim 4.92 #3 (Red Hat Linux))
 id 1i4Jmh-0002DE-8C
 for linux-afs@lists.infradead.org; Sun, 01 Sep 2019 06:56:25 +0000
Received: from unknown (HELO localhost.localdomain)([114.254.173.51])
 by sina.com with ESMTP
 id 5D6B6B8D00021556; Sun, 1 Sep 2019 14:56:14 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 78177415078535
From: Hillf Danton <hdanton@sina.com>
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH net 7/7] rxrpc: Use skb_unshare() rather than
 skb_cow_data()
Date: Sun,  1 Sep 2019 14:56:03 +0800
Message-Id: <20190901065603.432-1-hdanton@sina.com>
In-Reply-To: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
References: <156708405310.26102.7954021163316252673.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190831_235623_503995_FA2D5CE1 
X-CRM114-Status: UNSURE (   7.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (hdanton[at]sina.com)
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
Cc: netdev@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


On Thu, 29 Aug 2019 14:08:22 +0100 From:   David Howells <dhowells@redhat.com>
> 
> +		/* Unshare the packet so that it can be modified for in-place
> +		 * decryption.
> +		 */
> +		if (sp->hdr.securityIndex != 0) {
> +			struct sk_buff *nskb = skb_unshare(skb, GFP_ATOMIC);
> +			if (!nskb) {
> +				rxrpc_eaten_skb(skb, rxrpc_skb_unshared_nomem);
> +				goto out;
> +			}
> +
> +			if (nskb != skb) {
> +				rxrpc_eaten_skb(skb, rxrpc_skb_received);
> +				rxrpc_new_skb(skb, rxrpc_skb_unshared);
> +				skb = nskb;
> +				sp = rxrpc_skb(skb);
> +			}
> +		}

Unsharing skb makes it perilous to take a peep at it afterwards.


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
