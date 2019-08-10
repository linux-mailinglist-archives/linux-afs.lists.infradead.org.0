Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC488B10
	for <lists+linux-afs@lfdr.de>; Sat, 10 Aug 2019 13:39:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5VGITI1oMyfXiKpcVaaPAHTuy05l3CA8yWAK5beLa34=; b=nwQ3SXdom27c+Z
	z+X7YooX7U6laXc8AdNTnB8/gpaGlT/4it0FkkFnfmND/gNDcMbH9PiHdqVFdvLGox9fjRSyo4m4Z
	IFGz+yQ4fCSk7/M1d7yeVzQs/yeSPvF8oZEcXEZrl62gxb+mIYSKClYdRG9zmBXISwrFC7pPEqi6Y
	l44WE2jzQTZ57oeG0AtceZ/B4hNqONwsKaIBTEGuaEJOi1cOySke0RTuFxYGYbB/suUTyGFGFo9xd
	JuQ83AiZsWirCt0wRDLmAWyIlTWGzqg6sDIiil+B2oSzWWN1NznGO9/xRQbTBQeki45MFrVBl8nKD
	Ap1xf7N/9VqmfS6VfR2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwPie-0000vN-S4; Sat, 10 Aug 2019 11:39:32 +0000
Received: from mout.web.de ([212.227.15.4])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwPib-0000uh-T4
 for linux-afs@lists.infradead.org; Sat, 10 Aug 2019 11:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1565437161;
 bh=pbX4Hv17W0eJyUnZOwm9WQrji0Qw2xiVsg3Nxi1AtNI=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=IMbtHPlzcVLCPytKt+15qD++4puJz8FNBaaXYuswpPaiaG4egykeH+bFmbLSBJuFp
 GKJANMzVo8cF1Qf7fquPT/CCUtFblrtY0k5G6x3OdVJA8e5LoTBci6dd7lUEC3xTz5
 0jRiyzxSiucxRFAeqHQN6lMralr0VU/WRzMTYJrc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from schienar ([194.12.154.17]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LwD3G-1iNGSd0DJm-0180If for
 <linux-afs@lists.infradead.org>; Sat, 10 Aug 2019 13:39:21 +0200
Date: Sat, 10 Aug 2019 13:39:18 +0200
From: Julian Wollrath <jwollrath@web.de>
To: linux-afs@lists.infradead.org
Subject: File changes from different client get not recognised
Message-ID: <20190810133918.3046fb6a@schienar>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qmP0fv94175WMdnhmTTvsXxYpjEWGZW24n1h2Iqs580AqIOGDzH
 M7L80djTkeNMFJ9sGgYOE/DLINrF96p4+CSeMyDtztUlhaQ4oN0nUdys1SNiiUbkVMpgGz/
 4NG/dRqilr95EaupKNCGGKfT5VmQY5duziwu9xMs2fv2EiB+SnC/RrQJrt6BNSfJSFKy6xJ
 +ENaBEQ88c+tYhSmdP/gQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a8RIFUizg+4=:Q/5ctn3Tb4b2pRrGH/8MZ8
 ehg8sAvC/+RUddHyK+DBI0WdoIvG4xp8vsr6bYHXTxQ3F2F9VDzUyCQdAQV83wYgRhETop7gG
 d/4d1L5oZDLyvDYI8yK6SVQxnIhRCz/mfze4d1jcokUngw1eNI8jTBLzeaTWJYDqcFe4EQORi
 ZhbEe/LNIwQbGjWqEjujhezQY2Pxx379duDEQAaX/qFh5y2hjPTEIvc1OROx9Y7jhkpAY1ar7
 SZr+M76u8fmAmh1egs9wLMlnHgiJvAwfKyarKayV0lZ+3kxqWY665LEULeKgNkZp50Kg/LDT9
 JFR7RQNUJs4gi0bYYsrXoqiaU2ogxbgjg9xPmQrp0mS1hWV0ue87ArOtIqfBWaFtJ5fVsiTRk
 WMDwxuWQIRYqnK0JDwfS7oqtegwU6dkcSEVr1CVJK6Mve7HM3lIlf7YEQwIvc68GyuccUSbrz
 IoKiDBsZTFDdkcT5JrSUqSGuMm8BP1VNV4g6UaK7X1MGaZ2VyIm9S8XyD3959wO6natd3eeRh
 rSsIYDYAhUSYABs926hq/2g9V5Q1fHY3KfHLwE0aRLXJHj8SLTStxUK/nO63i8knTiwIQet4f
 DZiN9n0jixECo+Fh9nc8FNJmt5f6z4woE+Cme3umGOn5GnKS3OycNynsD1/jKn3P6sE8dC2Hm
 noGJsbWVRNwnwLL+KmCWn2TIKstdLgS78thh+oxh0JlCI4WUogLJAWdMIBq/rWSr7TY55rK8H
 mNF/dV/9PjLNHxowF6ZRvfgCoqWgVORNXlcjDzO6wILiR9vfGmSpP6RSjht2SgLd7+Q8C0H/0
 AosanCS1dO4ZEgxJR583w0nJ/pd7Ch5qU/nlcBu2Oapi6vIlr1Z6lcN6VNhkZpnGcyTl2CGq/
 +VcOA7LAsW4MQmysltuORg/TJx/kSqrvdO2SslWwOnvlIuvglasUHC9XPpGCZhu79qNBHXElj
 6xeMRo1/nFI24ZWiKje+ksZgsW7o/qxe7a7BBaogebB76I66eu3Ca99UpWCC0N+jT0y/EaKgi
 SXJwWYama9efl53OxvkDaftBCP6CIq6rC8zVh8pTwTfVCuSMf354HvlyDCJeJwR5uJemZAS+e
 6pbaK3lHvzOylBYiQJI/M87ZAvI6IIZHao8bfkBkbK+5jjpFcK0ui6EwsPckWuFp3u4fQQgUx
 DYh7A=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190810_043930_271374_1E70E03C 
X-CRM114-Status: UNSURE (   4.12  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [212.227.15.4 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider (jwollrath[at]web.de)
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi,

I have the following setup: I mount an AFS filesystem on one computer
(C1) with kAFS and change into one of the folders in the filesystem do
an `ls` or open a file or something else.

Then, with a different computer (C2) I go into the same folder and make
some changes, e.g. change the content of one file in the folder, I
previously looked at with C1.

Now, with C1 I do `ls -l` again. The files last modification time is
unchanged. Trying to open the file will fail. Only unmounting and
remounting will show me the correct folder contents and makes it
possible for me to look into the file.


Cheers,
Julian

--
 ()  ascii ribbon campaign - against html e-mail
 /\                        - against proprietary attachments

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
