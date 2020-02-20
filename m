Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B7165A7C
	for <lists+linux-afs@lfdr.de>; Thu, 20 Feb 2020 10:50:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6NmwyQsnfzmGQnbD+yY9keFRWDj3L70m16yRJ6gmug=; b=WiKChWNVHK7loT
	yBVukZT/aTkoJ2gzA0bN0E+rLQEUA7Bcw10lmuC2l2rW21LDSUPvLPo0+kGpmD3V1D3YZ+Ptq8UzW
	+Db9SCXKK+N7spmy6b5rkh7036PldabDh3AtrLbTH/9LYOIpayqRKmn8Te3gI7kDbcbAO6t50sK/i
	NcppPIlFcLo0LKfe7XkT85aFSYKmibMhua9SM39BQ364kp4l0ewOkwaGbOv0BI6WYEpDIrKxwOiKd
	FKXoBTAWr+vV8Dd9O0wQDxWdQI0k3G9RDPQZEzIS3Qcn92XhwEnnnk2Ryw5HAk4OESDpsgWT1MM9x
	da+9osQDZ1ObU/jTPYCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4iR2-0004on-Vw; Thu, 20 Feb 2020 09:47:56 +0000
Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4iR0-0004oJ-Ad
 for linux-afs@lists.infradead.org; Thu, 20 Feb 2020 09:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1582192068;
 bh=wl/aZIA99spxq2fPJff5G+67hT1lhjUYhAP2Bhe8Gzc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=qQtZNbnTFwElwH+yt9vZxPI/kSXoldtIhaPZqR+wE0ZaiOP0ByJg28huBkutblAXh
 ljUJ209VhCF32hpavgpcOeOBs4VPXn6ekDEnSu35q/lZgIpC8Uzdfkijcb2j8K+6w5
 XyQssnPCvcKHb1jFTOc8gXjRqjDpZffLSkbMhCig=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from schienar ([128.141.85.92]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MarZy-1ikJCg1VaU-00KScC; Thu, 20
 Feb 2020 10:47:48 +0100
Date: Thu, 20 Feb 2020 10:47:46 +0100
From: Julian Wollrath <jwollrath@web.de>
To: David Howells <dhowells@redhat.com>
Subject: Re: NULL pointer dereference v5.6.0-rc2
Message-ID: <20200220104746.15bca53a@schienar>
In-Reply-To: <231889.1582128329@warthog.procyon.org.uk>
References: <20200219113929.6f55aa3e@schienar>
 <231889.1582128329@warthog.procyon.org.uk>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BroaM5Gb2jFP3Gg5MSHH0ikTu9SzkK4+s51zExGycnEiKUoeQIR
 3AbPUNYuioWAc0nIEbnGqcXECFprc1xEtDWzbDcUcwsin+CWjcTUdVinmCuk2ricU0eezeY
 eORqIoILbuxg1oEZiZfNhZKiC9hz1hIGDD5f3wP8Tgbe9C+9tbk/M4WjM2FaCFDoFx5qDgJ
 IbK6hCVAZrPy7kubI2WyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vONBaAzepWU=:8vJQDpT9o5fws8CR5p00RV
 2WV2NJHhSy6e9iIOP5ENCMDekhvBxnYJgr6Fl/XeaSLxH15FNC78wEKZbnzK7qyPOsyUlI24i
 r2bh4clynfxhW3+1xlxwN4qQt3254/OQw9aeN4I4mf01vpz+uFtvBLUAna86/t/wBQNKBXJ2l
 Ot6EBOdSleR5XSd0poylg4W0FG8tSp93DwmEk9jv1RZglmyH3wbTpFzMTPaqEYEd3fqs7iQoV
 uUgADQEp9fWawn4d62AlT4N8pVtP641y3AI0iOvdudzAT3Hbz4FeFmpWGlNiO9t8EahwYM6Xq
 HbLxKzXnFceGpnw9t3OJR43FYYPC5GP7c8WHbIrpyM/l5OziCFOlqokGK9j13zfg03ZiebJwH
 Cec0TJ+Ez4ssIfm1u6ITl3hzD4zXOdYqbtVAO0luUdzyaWIdcGcJOjOlb8D4Dt2XG8PW5tPSC
 sXPKHa8nQ+ZHLZUuxJkt1TeOuVBvZO6cKOOrvCeUouTWhWKN5FiwqK2btZ+zy5VAdAqNeoQyc
 40uAUlVL4rANq/xwhOD6UqWsXO9LYf7dYlhhcjdOCwyr6iW0b/KeS810OliiO3mWC2M7f9JF6
 JmyqUpKimwEwMjqqLyf/rHwnIIYKE48dMQvgtVb5QFx9pPgSX46NVqt/K2fpYcPrvS5aawMNI
 MqnSoC6TLgf7Ag9b+OlNHx8iOLvTq1sKGRN8rUXClTPsP9pnCvnUKrWa4N+5HuJksffBDW2h4
 MU4mJA8q3u2y2ofgaWEkc1g9wac0yBY2+WmUJDHvGBRDflnyrw9NGYnaqykNHkjJoSq1wPhTN
 lJ/WjmMo6Q8b7G+pGNlpZEfDm+NhxG/sHwMVCtRLC+TD8gumKbhxyUfa6ctJNRP8m4n+BVhaw
 E9rDnRe/OwyxEeMrmFP/WSbvkbnWRYiG9I3BZp3LAlqqy9IxDsOCk1ykU/+hQtseCUYBTbZx0
 T69w3GwCVxDzYHJlFOgYDzJdyf5/MJmLjqgRTHzCyZDtAvC4frEhvN7JUUNGU3d03o663ucsj
 epBPuYVYhA0gFH6myZZ/v74B4R8eNAqaSrXUxVtmxGYEDn5LqwtpOlWyhGvOqde0MLcpBZ3MF
 gjstQ1MOJPhpf4qURI/vMO5w5jLobE74I+XmZaZCQHSXnOokdL4/+RiqbzsV0ZztWm1LZWA4c
 Re4jhsObnSF92/4AJxSMNFBS5NBCEKgTPASaocUyz6FgAhf0EsbnP1YRutOnh0Z2N1Ek2fnO+
 BBt3d0vCZuSeAa/z9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_014754_664046_0361F932 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.15.14 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jwollrath[at]web.de]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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

Hi David,

> > RIP: 0010:afs_update_server_record+0x45/0x120 [kafs]
>
> It would be useful to know the line on which this occurred.  Would it
> be possible for you to load the kafs module into gdb and do:
>
> 	i li *afs_update_server_record+0x45
>
> Is this a packaged distribution kernel?  If so, you might need to
> install the debuginfo package for it first.

it is self-compiled but there seem to be no debugging symbols available:

Reading symbols from fs/afs/kafs.ko...
(No debugging symbols found in fs/afs/kafs.ko)
(gdb) i li *afs_update_server_record+0x45
No line number information available for address 0x195a5
<afs_update_server_record+69>

If I would recompile it with debugging symbols (how would I enable
them?), would I still get the correct line number?


Cheers,
Julian

--
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
