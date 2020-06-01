Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D021EAF9B
	for <lists+linux-afs@lfdr.de>; Mon,  1 Jun 2020 21:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sHVXxZ83M2aXxAom/XlCzBgOqpMRpTaZHxRu2SixgNk=; b=HNXdauF4j72+tg
	JZAKVV5wgYYI46x2mC/2RCdjQUHXeiVYg0oOh7DvJvKfs2FCIl4NLA/x9GCMROyup5lg2mglF3K2W
	ulCrPDN0CY1ecL7UWms74WNj7UyOJ0u8Vuj/n/UBuGv2q0aX24yaYfXO73ixRm4UsWX2LyeDWhvhw
	Ywkm++enm+EMPwlq7Xn9719C4kIbiLLDgtnkSznpNX2LsIL7APXWdbIdqqn/vrvkJpsOJpJVwlUBi
	OwLRBA+p3RN+sozk/mgHdzAY9gX1lXR1+VN6UJlT1c7ynm5+Sa9o7mQIdOoZvejBiz2vkN2XaH2ln
	E9+o9ytE7sv8/N7I8vhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfqCi-0002Vg-L1; Mon, 01 Jun 2020 19:34:36 +0000
Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfqCf-0002TL-Is
 for linux-afs@lists.infradead.org; Mon, 01 Jun 2020 19:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591040068;
 bh=RQT2hgG3ye9ChFXCc7DFKoyy8067mICriLmWE1kM2DM=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=DLapmClKj8+US68Wi6HxFgkS7qhKh1QNRBB++1CQ44x+IW4Q+tavvZ00ony42JGKB
 DrbkT2Z33SaMdV6UqOsbzcsGJeMWPxdqydtfF2BP5Z518oF57QNj1OcV3W8NAT6SQt
 TEVHyxfnigW9/JX5uOXxnzeaCv3V1DoUTsBJFC40=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.133.32]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LbImQ-1jIMIQ0fvu-00kzS5; Mon, 01
 Jun 2020 21:34:28 +0200
To: linux-afs@lists.infradead.org, David Howells <dhowells@redhat.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: afs: Improve exception handling in afs_net_init()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <3cc663a5-088d-4d26-34cd-c96e362c1eb2@web.de>
Date: Mon, 1 Jun 2020 21:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:pA3J1QFiS8SXqhRadltf4fe8Sw6t7AEcYoAsQNHXdA+8O6xlf3g
 TM9B4zb5Rd0rRGQV82j71nkQ9SMVGv6w1k9clZdDt6Wz7rePgXruuKvtNCf2SWlnHs8oKd3
 U82QavzZ24i0EP+Tx0/DcpuMmfc17IcPEE+OsVAQAYVInGGWYYuxMcISwMeEoEgtqRY6au0
 S0xLif79l3N2ZkR0TYKSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vz+s/81UXUI=:jCnK6+Rcg+hE56ZnffbUXF
 oaa42jTyqXTdrNXeouhEBprN5JwzWWUQyGotr2NfGbwXCPA4EJBihnJy3Hxh/mpSGbXPZ8cb7
 9zcq1+0+ouQKL5Eo4z/v/D2IVu94FwQU0oElxoX6tLrWrWanFhPWWmOaeQeMrNyv37ekAAJOD
 eczEDAoq9ZwzAySTLsS6FuxXKXhc5D+sfpqRA6wXFCg2GqQCYr0cBMFB7aVezo4GuS0CxIye8
 xmC9ZTn406P6bJI/F1JaYzxDlAVPEuKsqpt9+o6ywRMzEJiSh0EJCH1d/+iROjQVd+WKqi5F8
 8Us27P7EinkZtoof01+dSmI2GKJn+WdXixBW/JuF0xikIdr/RkOOIf+8kzLxan+3/QJPAEk2K
 SFnGCdhU/+dI2ypWDGlQik6aoqaBMI8YnTYBh/WuRv0dedq6sCg7Kvh4eGxAZ3n1kwEzrutny
 yVoQClQFNiB3UORmS8fvdNPlYSd0o/dT+8MGsvnHMNj4Jdg4d/VWcG+dL2hEwGpJmK1rRUHEm
 gM3RI6n99mUbCdTT3ubB5wKxckg9Ckm/9rqHldG3pjB4vtPk4xLzXC71Iz6Jp6YW6B5yxjqqb
 8JlTy/EzPPYIti3NbyS3ve1aaXzCPmXPA5JJGXKzRIbRb56z4b1FhjuclpT+1Woh1AIw/aYVk
 H70CJ0M64tEl+fPN3VU2SkIQSABybc84dDaq/V3TmUTpap37w7VSUAlQ8gCvdfKVsO+F4CB/o
 D4qQ6C6Y1akPf15KHc2PO9MvUcVkp597i2SGB4/GsUfG3p33irSGOVax+w0IXVaw7coZFKNv/
 8NCGQHXROiUgQ6vl3nkqiieEc2LcWs+yKC1VvDVoUE15IeoFRABwVCkGUZ/ErwFJeZ+0Elo3k
 mE7Q8DWE2Mt/F+jsDvbzkmvgDtBEbXcxp7PL/SlYwLKrTYW1saTlJfXt7f+xZkAZTXPEdUDq8
 Ph/68FTi8tJrpmS6acQZx3nJIIxJIe//tFvixgsdezjA07a2o7dgH2QnTcn0RWe1O0SaA1FML
 RGElRaNjISUEXl/5z5Fb229y6O50CdNI855Mq+G9OQaqcbFIRhfP9jY9kj/PHp7HNas5Dz1jo
 dKNCMqmerE8Qoy0jY9UHvmJNIqlPnKi472vXf7gnmUwKoVlPsfur1B/AF36O2Gx0RsICGbg6X
 03lmgjntHLk48Rcjp0Uw2VTQKHbumRSAm1B+gsbftuhlVQCXaKY/PdKZXCzqrd34g6utu4lkR
 INmluLV0he7bS/91G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_123433_960264_000EB9FC 
X-CRM114-Status: UNSURE (   5.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.15.3 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [markus.elfring[at]web.de]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Cc: LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

SGVsbG8sCgpJIGhhdmUgYWNjaWRlbnRhbGx5IHRha2VuIGFub3RoZXIgbG9vayBhdCB0aGUgaW1w
bGVtZW50YXRpb24gb2YKdGhlIGZ1bmN0aW9uIOKAnGFmc19uZXRfaW5pdOKAnS4KSSBub3RpY2Vk
IHRoYXQgdGhlIHN0YXRlbWVudCDigJxuZXQtPmxpdmUgPSBmYWxzZTvigJ0gd2FzIHNwZWNpZmll
ZCB0aHJlZSB0aW1lcwpmb3IgZXhjZXB0aW9uIGhhbmRsaW5nIGF0IHRoZSBlbmQuCmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1Ljcvc291cmNlL2ZzL2Fmcy9tYWluLmMjTDEyNwpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9mcy9hZnMvbWFpbi5jP2lkPTliZjk1MTFlM2Q5ZjMyOGMwM2Y2Zjc5YmZi
NzQxYzNkMThmMmYyYzAjbjEyNwoKQ2FuIGl0IGJlIHRoYXQgdHdvIG9mIHRoZXNlIGFzc2lnbm1l
bnRzIGFyZSByZWR1bmRhbnQgdGhlbj8KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFmcwo=
