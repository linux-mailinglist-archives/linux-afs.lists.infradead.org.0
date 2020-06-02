Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0CB1EBFAE
	for <lists+linux-afs@lfdr.de>; Tue,  2 Jun 2020 18:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k3law5FWMvkt0hditRs16QEFuoM3GJxX3xnWTzOkHA8=; b=RX++yEcz137xNL
	xCmHfqLuxg5lN5KOouYwO2uTqTq4kPp6HrK6Iy3CrK8P3+9uyJu4HdNsfFj+F0BWcMRxiPgMMCyb7
	SO6RsnUlUrnO3BAFotMqHn5TP5SLWtm7g02hWvP3fCWAIff9mZ6yzti0/tw9BXOaikQ9N0az/uATF
	ce9XUnxHq3dxrrYTgUlgFSQlx9Sq7Uo0OIoJptv9QmhS5moGndvfsQa8KRxQgWhJxm/lkoGlSTPa0
	XP5c0UQPv7dEKsq+stmRuXQ3hPYFJTGqLWnFaipdAWwKm8E53rm6OYl6sMCFs9ZQ9Rs+00D+vw7dD
	1zee0C/BcqVKoLniH4/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg9Vv-0005GJ-S4; Tue, 02 Jun 2020 16:11:43 +0000
Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfzyw-0001qm-EL
 for linux-afs@lists.infradead.org; Tue, 02 Jun 2020 06:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591077647;
 bh=cS/9W9CXCgWwcg0d53s+ziCPsKxpjUUWXLeHZ+f0LOs=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=GizfZPVorUz9sJfIMAPeEpZlv1OtTiFm1GQQek8HN4n8POprGKMIC3KJC8TvVdg6E
 h9FRofacUOZH9YkcTFm3DofKj9dd6prskkFnUVQSeo4buqvq5a6BxpBRsU7qe+mLw/
 aRhvMfxUb+t/5s+f6VEeAqrtI4dYUB6JvEs8VQr0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.186.246]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTOlk-1jYByF2MsG-00TjD4; Tue, 02
 Jun 2020 08:00:47 +0200
Subject: Re: [PATCH v3] afs: Fix memory leak in afs_put_sysnames()
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <7ed2657a-bdef-2ce9-6a7e-7283e85e4e56@web.de>
Date: Tue, 2 Jun 2020 08:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:TqJYyepbDLQIjaIuRH8zgKRFrnKCwaZwcAoQtdD9HV2+bbKUev0
 uGuHeBUQniky7DpgJiODltbP97J4ZYVZLKln8dN2m4XKEifbbXi+fdwaeZ+33EmK29x3Hp7
 Ufo7/3S7Nevf9muKr7f1tG/HF25gm1DirPMFzBReeBxUNNCHypdhvXIR58l/YerjVad0Y99
 /rC+UMMA9Hb0ezhcMpaQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6IZ8qZTynSA=:rdftmXCRK6lrMXdcZ2kBBR
 66L02Y1w7MH0YqlTJlJp79nxfDQ1JhynkxAbhayq7Z+vAW0ydD7v04LohULbCSQPEqF2eqVWJ
 dVN9voU5Ps3fN7kWMp2a/1WQf869Y89E+nHTbvRxhrDHkbC0redmqOMiMdO7HUXnOg8s43zYW
 3ik3RGYvnocOcM0QS+OfF7EwbDXAWKHcB7nmpSf1Z4dnKVqv+QuiMlcO82tZOatOUJc76OY0w
 sLXxD0YEorGkvDZnNM9r3GQ97lifOdqYRPBhn/5TN/dzqFYd3GYnpr03lE94nZoqJBqjMVQHy
 Hv0aZN4CcN0jEVYz0Tma6zg6HAOO5LtuxEQbTnEnPXr5I7UfKO2xKTaWpAsfUWHvmLOan+ocT
 TkA0wziTaBK1JmutPe2y6HWyeuve9O3Cn4mtllNbdibmzcUGxqj5C9VBW5E4Pz41KNOHzo/ll
 6Hu5nVfq5QCEOQkhGInuPpqFrZ2QJbeG05KPdktsngv/RlAckkSz6vIDd/Kl+IWanrgUWPMpx
 MES0/I5q1Ebjfea4MCoG96DxiEVgjK5+O7L4fQfPzoehlSdmwZXyDAsODRi6LSKjg9rIUougn
 qL6RsnqTlDSz1CRZXQwSgo7h6v+JlhSd3yocrhEfuQ22XyM0gGNZLQ7byhBcNe/Po0bxsMG+q
 1cOe/s+vrUQbwnqMAt3kN/rSi+GWp17qraMba+pNjTAelZYjYEisG01+NbiL8wrjqbZRrGL2k
 ra7THHzyUX+4xdsdV+uiR1Jp+/7ScEE3efiP8CeoX3o8pMR3YWrpq3oXTgvbWwxLYvtXNDvBP
 su+nyo/3zFXLsZqJYozwu5sW5e3x49BWirKbhduufPflG7O8fvexYaHWueN70oz93I5zEHrVV
 rTn/hS5YeFtEcAxjpTtqKGy9WhWC6x1/16fnCw3fM7MrIC5txVppg+hms0SP206BKtzabwk3e
 jfyWST4+jcDuYamB+l2UjYRS17qw2yLpILah29h9lQhR1KcfUxjpbKwYRQ2oapTBiOozcOUBg
 j1614YvYiU08rrKNam0ziRM/BSjobc/0AYDjE637vvRtDp9DTcRY9t6nLVVIuYrEUb1MPSF8k
 G3MEF9skRLEPzz4xnP3YIBNV/8f4qWSUmpqcy+5xp5mReleZGAx1Jx3oTgaTJf9VzWxJPxplp
 FJ88Lv40uSgJ7s4XSgvwzKMA5vvSMOaYGkoKVjkDimpMqC+ukkOj8kh/HxcOqvLqZ/uHk5HSG
 7VeZTXBRJMFI6puoN
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_230102_773634_E238F836 
X-CRM114-Status: UNSURE (   4.73  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.15.4 listed in list.dnswl.org]
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
 [212.227.15.4 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:11:41 -0700
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
Cc: linux-kernel@vger.kernel.org, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

> Cc: <Stable@vger.kernel.org> # v4.17+

Are capital letters tolerated for this special email address?

Regards,
Markus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
