Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3E1E21BD
	for <lists+linux-afs@lfdr.de>; Tue, 26 May 2020 14:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h84zJYpiFrsVSXgHeegRji17hMWOTZAshtqkNcpGEeg=; b=P2k8zvowJNA/96
	8/lYWJIyLGk9gZJOFE9VY2PqoXeSt8O8B+r46cJAIuxT9YVqiKhTlD9edTOWE7Ifu0W2Gj/HubT7k
	z9S3VpiI8FnQKVASno9qRZjGx9WA1BttuOYSDeA5fzN4xNdeBTwE7WOVwIZRPoihPke3scopwclPv
	mFPxPCs3jGusVP+v2GiaEMo4pccxTS3JV0gLnDBfIH4wKkrq5RQuVDlyu2xiS12XeeKewWvKu7cRH
	bILji+XoiDApHzomlyOSJ6xRSGDxVJztEnTDQCjq2Xmco/biPLb3Lru8Ma2a3rxxFFd00wBwTYZ0X
	IsRMQUdqi1ioMdobDLjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdYaU-0005ES-77; Tue, 26 May 2020 12:21:42 +0000
Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc1D4-0006pU-78
 for linux-afs@lists.infradead.org; Fri, 22 May 2020 06:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590129053;
 bh=splb0+8WO7eITGBItBY2nf0FXUphvqRnGPW6mcoqZRI=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=joZp6nPykM7tQDqcNWz73N+zg3aiT9XPFRIVm8lPB560kluFFjhUWDXDBw/tQFydT
 lTvBGIBCC/e3stR+pklMedCTzj3A+4HyHqzoKXmiPNR3BjTAUyQRSM26Oo4ysIDCic
 dxtp/6OJ+yx9iQYpKnywMHHhUEthSHYCO/0eapTA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.165.155]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8zRF-1jlcWW00oH-00CUGJ; Fri, 22
 May 2020 08:30:53 +0200
To: Qiushi Wu <wu000273@umn.edu>, linux-afs@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH] rxrpc: Fix a memory leak in rxkad_verify_response()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <262bd413-9be4-3abe-9565-ac37a2e2e719@web.de>
Date: Fri, 22 May 2020 08:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:GfxxN4lHt6KTDFfauaVELUU1qqXCKh3Ql1yCNUCMrUVTc2lItE/
 oT4lrOk8IMiiZYozPTefGPkkQ9Ray4VbJWqDXQFydYT1DE3q3ApUBmYVw2JCFENchQX4D+9
 exb6mtVMiMYFNsPcVR6vOZopL9tL+n83nXbzPAQ9xiXsHBhcd9A3h5pVkOBOozOlZSo+SLa
 AnVd+MaKMqZyMpBB5bKNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bGHI3wngxjc=:lzCGparOYED79VHEzmIwrn
 bgOJc+Ma3LAgokHQGzC75JuwHyTLx96GkKXgy2cVi48QX0Mf9+hEZrsKvI/EkNgh4MubZxL2h
 vmd+eN4a87YLABiXQ3yQAMIw38O4nPjFF4KOtfj0AjfuUXwzeEp6oNfisssx4ppwZkiYuPXRv
 PBMpo+R/G4nCvd0X5oqxkU+VjOHUEzPy0DywocvI9KSIYPVwdwKfUl52w0ldcwHdMkr0ZuZg4
 H3B4w8dh9o2YTpOiZqRqLpNpZ4AHNoJerAVDEmFm30gPmbjcq72efwkg2tEX2+ewGXjk6kMVO
 u+4ZlT7guNZ8u5FlnvpXXpkYHviGP6vyLg+RF8bq08beOia2oiWl4UiPNyrPGXy3bgs0NO8nC
 e0HXkBzi9Atp0CiOfvbMPHbFInxyuE3/E61jj+EiJcAAzJY+H+bTwssLlnHr8QNFwtceXe7pt
 LfJp3fKKY86QGimsl1Xk61xkdcOeyjbtF3jV/eNHL6CBdNQ1vvC1ccn2KWbAa1aqB/Mp8k4aq
 UJJLVAry+EzoWaN6ajmRNoTh0qmVByTXIo1j6nzmwzMXJsKe48qeWQLReSqn79DaMOANBQexf
 ADVyAPWNPOD5NZZ1W9iEadK2+k3WEbnfIIv0RNfv+1RVa9Mjgtko2jcUrnSzZU4ImZCXmZ5d+
 JeDlxW9WNAQwyfkF+epqkLnb0eJRUuXvXzPpzB6PyxKh/Md4HBEtyjFASOeFNDZKQBvqehhvz
 /9Q38yb2Jj9QrzErt8biHpQWYnbTnc1kpoaxMaO1XHDX8MdmymPap8bgBoQ+bVktrV0s0NMjr
 pFtTmX5f69GezlH4Fe+OJRTeL/nRntzoVt5A9PTrDgcYoee3qlP9nO5zkW94XRgokoYdoi6i6
 iRBNymc2o/9JooT94pXSeR0C0xI9NYwPIaeD0bK5b+4HRcr73hVP96mMnWGuYbeOJww00hZsy
 28VAF4fdf+icf/VnKUtfVWm93WzrOqG1MnLlaRNza0cXeFgoxzuA5G6Nt/KW9XQRUnBh5VctI
 vx0aybJLcwfnP+Evp1sAL5uIKqoYEJ2jNF6DRisnng40VQw2EIgPLk1F74MlraVBN4IO5HWVv
 g5K8vi+7ApTY1fR/ty3V+RCVrqhdmP9ML1Qu8D7W70NuLAwD/LHtPsa0FH3eypLFqGsov5vti
 WGsj8Kz9EBBjXIrQz7E6fMWb9C8DFSIrNXSQA2A4cEnphLZJuKw6gcM/LXRFkJJaJncAZ6WIO
 Elob7Om8U43ogf9Ng
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_233110_552185_6BA2F17C 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on bombadil.infradead.org summary:
 Content analysis details:   (-0.9 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [212.227.15.14 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [212.227.15.14 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [markus.elfring[at]web.de]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Mailman-Approved-At: Tue, 26 May 2020 05:21:39 -0700
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
Cc: David Howells <dhowells@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

PiBJbiBmdW5jdGlvbiByeGthZF92ZXJpZnlfcmVzcG9uc2UoKSwgcG9pbnRlciAidGlja2V0IiBp
cyBub3QgcmVsZWFzZWQsCj4gd2hlbiBmdW5jdGlvbiByeGthZF9kZWNyeXB0X3RpY2tldCgpIHJl
dHVybnMgYW4gZXJyb3IsIGNhdXNpbmcgYQo+IG1lbW9yeSBsZWFrIGJ1Zy4KCkkgc3VnZ2VzdCB0
byBpbXByb3ZlIGFsc28gdGhpcyBjaGFuZ2UgZGVzY3JpcHRpb24uCkhvdyBkbyB5b3UgdGhpbmsg
YWJvdXQgYSB3b3JkaW5nIHZhcmlhbnQgbGlrZSB0aGUgZm9sbG93aW5nPwoKICAgQSB0aWNrZXQg
d2FzIG5vdCByZWxlYXNlZCBhZnRlciBhIGNhbGwgb2YgdGhlIGZ1bmN0aW9uIOKAnHBsYXRmb3Jt
X2dldF9pcnHigJ0gZmFpbGVkLgogICBUaHVzIHJlcGxhY2UgdGhlIGp1bXAgdGFyZ2V0IOKAnHRl
bXBvcmFyeV9lcnJvcl9mcmVlX3Jlc3DigJ0KICAgYnkg4oCcdGVtcG9yYXJ5X2Vycm9yX2ZyZWVf
dGlja2V04oCdLgoKClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFmcwo=
