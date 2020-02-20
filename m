Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3A16638A
	for <lists+linux-afs@lfdr.de>; Thu, 20 Feb 2020 17:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e30nwdLn9NlTGxgpNDy1glDBJbrETYUcTQYY+qe239s=; b=d3UFGB69IIkQsN
	WfXWhT7wNccPIAOoVTnHX6ABBSVPW1d0WUcukdPB9h9RwvMPszL8bCL4EqMW5uEIZN3PPQ52HjPtF
	qtJYET50OrJDIBPM4m4RDcRi9snHRYNthUz0p2WGCFhhToREtH2e6gopbOp7x0F4Ql4qX37uPfyDc
	2Fh9M+h+r9KZ985VMVVgkO//w3S1mfaaeAKKUeDYdTp1Pw+4bBJ6wOiJnXa9iJ6fMXeb4BWSRIH9z
	9OeglbnLN2AnYt3lPv/PUDdW1SZ0FgTa4541KdlNZtzxHYFkWO4rDfgmaRfGW035jBk/pzC0WPAd2
	HQhfFW0KuWur3PJp0P4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4p4W-0003ho-9N; Thu, 20 Feb 2020 16:53:08 +0000
Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4p4T-0003hP-1i
 for linux-afs@lists.infradead.org; Thu, 20 Feb 2020 16:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1582217578;
 bh=EUtwm/yCoWjNFnFJroIHxjpPr3MVW+PPQ70DgHbese8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MDLtDbtpR0Q95ifb/t837evM+8Av71twvjLzOo590nd2HVhFbhkIAdjabbpT1TFSA
 w+KIFfaF5Vz4M+HyzVVKLG9X7QEKOtiz6GUBAlXK0bwLGh7puiowfL5dfRDPv5Qyb1
 5yTdaefCvjP6H4bKBkreIGzLsapIXWixzRuRFGdA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from schienar ([128.141.85.92]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LfReL-1jp65d0XHN-00p8GR; Thu, 20
 Feb 2020 17:47:48 +0100
Date: Thu, 20 Feb 2020 17:47:46 +0100
From: Julian Wollrath <jwollrath@web.de>
To: David Howells <dhowells@redhat.com>
Subject: Re: NULL pointer dereference v5.6.0-rc2
Message-ID: <20200220174746.15fe4909@schienar>
In-Reply-To: <590357.1582196860@warthog.procyon.org.uk>
References: <20200220104746.15bca53a@schienar>
 <20200219113929.6f55aa3e@schienar>
 <231889.1582128329@warthog.procyon.org.uk>
 <590357.1582196860@warthog.procyon.org.uk>
MIME-Version: 1.0
X-Provags-ID: V03:K1:I4ROejpOaCZBnOmegrucAeo4i8DTWTbUtCUSAwtmPi58vXTUTJB
 U1ynxCit/cR8mTyqdeJJQGPIf8HHbExSrQ/+iPlKnJfzjP2gELHq0q8H+CfR4+Yy/RrKTPR
 CqIMccArUP/ly1qu7nNxZ6NFpKvxPHr41KX3T0iJA2Whwwr2U/qIQJfPW+vfYsZ2odZG3IT
 lNUcsX+nkljK6s30hXb2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ojJEnu04C0s=:KnuP+j3G6CedOm7ZsRxpMV
 autSAT0LOJBGfWvSvQXO6BQ/6heWrzYpfLEe8zH5y739M3DnPep8B5RoeEY6KPUGkmXuU7g8/
 1E6ZQx1HhpCfrUE1dZcKml6FdKXfSoyPkoUS6Z2TXXrr+8ha1BJCeRoQQ91jIrk4ctJzvzrbn
 EC2nK3h9TMz/p0gr/Y2itOqj49fqSF90Cb15JP09L/KHoqxsmK3ivLUbyCs4BG+pgywHcIJJn
 vYXrvl8EU+hr+d7WeHaROq+RejrFMK7Rat+jJgUeYYFCV4jyvPzl62M5uReuayo4pXVkuGug+
 3KzEv+UjQw9fI1CWqXJfFdEzeA/j7Ikn1M5X/qoMoTZL0H/2m6Wf1nGNeMtXypdsgSSkzALhS
 xQN5V2b8k4cMchBSqU4yQ6xrCwQY2TWdX/duODHF/+Zb0BqQLuX1bTayCD5DLb2GpgEJP3ck2
 E42ymfDUbklCE/cVzlGjuJsAN6CYc6MMhQVgToQYXmbsB9NpHUWmHhmCtR90qr4XJA3XdS+2H
 cA2ugiT1ZurZSUilI64KyVJNd1NFTLtiZr2JGY35vyp28B7Q1X8zD7ezR9fRJZEEmYrVijY9N
 /MKeTSt3olEhHsgwjL4DmH1uxBX3jjEk+XWqtxstepRxCa0cQ1LaP63Mic+XVHFcxhSvYi65i
 E2YzEvwiF1I5/LZRvjki6NbCpCncTV+OapcLARi3cjWMQ7pqgonRx4FjSsOllgILefLCKc4CQ
 bAz3gtRH1df3IYEg+DUz7VWT8ASlNCygRa/EZJXCra4WN8emBP1hCLUo2hJXCdNmlPcz/+oMa
 LTu61fQxp/hPdzdxdlIspEjI6gXLiLeZTdbLy71okcCIy9is3/eMx86gBAJfTgvlOCPwZvTh8
 BpPHmJjI9AtmKhmKwC53g48+RGf42q7wZqKBe9bWYIia9IOkGxkatMwP7yz7le4CZH0BgHAXj
 pZgEY/M+nLmMhplvvkUf6ZPtO26885lPjg7nBL4oE2SeBwGhMzYUY+maQOa78gaS/E9Iv7NZr
 WTMWt8jeBmDmVabsTmSJsfZL0u57xlQIg2srISoIUs0mmQRKXDFgMaZHgEUCgKk46w0itEqPy
 ROpz7JervcsTXGWXRnUknvKyo2+pP1G5YH5lAYPOkkZvPiTpFns1e6xU3xpGxl2bHblMEoJlA
 zQdfvHX9pGWw1ttmIWsQ6Djd8LmTlTgxrvOlxLQgjcM2LgfF9bzGXS1a/8DM07LGH20+0J2Qm
 5KRtT2NXn7aW2Yizy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_085305_426345_471ABD06 
X-CRM114-Status: UNSURE (   4.05  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.15.3 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jwollrath[at]web.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.15.3 listed in wl.mailspike.net]
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
Cc: linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

> > If I would recompile it with debugging symbols (how would I enable
> > them?), would I still get the correct line number?
>
> You need to enable CONFIG_DEBUG_INFO.  It might work.

Seems like I am in luck:

(gdb) i li *afs_update_server_record+0x45
Line 552 of "fs/afs/server.c" starts at address 0x195a5
<afs_update_server_record+69> and ends at 0x195b0
<afs_update_server_record+80>.
(gdb) i li *afs_update_server_record+0x120 Line 494 of
"./include/linux/workqueue.h" starts at address 0x19680
<afs_servers_timer> and ends at 0x196a3 <afs_servers_timer+35>.
(gdb) i li *afs_update_server_record+0x45/0x120 Line 199 of
"./include/linux/compiler.h" starts at address 0x19560
<afs_update_server_record> and ends at 0x19573
<afs_update_server_record+19>


Cheers,
Julian

--
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
