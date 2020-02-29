Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2BC1746C6
	for <lists+linux-afs@lfdr.de>; Sat, 29 Feb 2020 13:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	In-Reply-To:References:Message-Id:Date:Subject:Mime-Version:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zKRvI4hquayFjh8d6bKe8vnFenoVLQfNqdIMLCPLnLM=; b=TetJ82L1uXa+w9RuGHrxGKeBu
	DNU23xz5g6AaGFAz9Ui+6+ljrVrc4ptT1+TDgPyKP+SQU8O0RPwNiCYqvj5YOSOf+ytOz3v3QMyVn
	yjbSBFdnVkBU3EL+37tEvny5wHK+wtsNgUdp0OEKJxgR1/iWumDQujdAHdqpufMLZ7Ez8MxCharyx
	ABPgpFZBlzJY8wQtDK88cK7ZIpzfHH6b65HBx1xMtODIYI3+fbboDU129bzO7Gm8KUFoddLn0CfG4
	ygLhpr/YLu2C6pwXp091Lpx4mGWbt97ty/poSQdpaRhcvjGSkwE+kHzQGKOPqaxtlVP7OwbvY7y3p
	EhSknK9ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j81A0-0007vC-P3; Sat, 29 Feb 2020 12:24:00 +0000
Received: from sequoia-grove.ad.secure-endpoints.com ([208.125.0.235]
 helo=sequoia-grove.secure-endpoints.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j819x-0007sT-DO
 for linux-afs@lists.infradead.org; Sat, 29 Feb 2020 12:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
 d=auristor.com; s=MDaemon; t=1582978993; x=1583583793;
 i=jaltman@auristor.com; q=dns/txt; h=VBR-Info:Content-Type:
 Content-Transfer-Encoding:From:Mime-Version:Subject:Date:
 Message-Id:References:Cc:In-Reply-To:To; bh=dytePpgNggrlF8J6mCuA
 MLvNi3NXyoK91e+lk6nHDnQ=; b=TFRTB07K3IRetZPsPgSAs5EKh3ma08snyoIm
 SWmSQL0Nu1+8gPMsWPhcHLve10B2pbVHtHACqOSbzWgA5Xze5BVbvoh3aJwTtmGs
 AUGQHgPN8XfdLBXDmllCchQggNELH66aInR9aLjcBxw2/5SACvWKJ0xf6gacrZgM
 jJqaulI=
X-MDAV-Result: clean
X-MDAV-Processed: sequoia-grove.secure-endpoints.com, Sat,
 29 Feb 2020 07:23:13 -0500
Received: from [IPv6:2604:2000:1741:8407:49ff:a2f7:7432:9263] by auristor.com
 (IPv6:2001:470:1f07:f77:28d9:68fb:855d:c2a5) (MDaemon PRO v19.5.4) 
 with ESMTPSA id md50002330260.msg; Sat, 29 Feb 2020 07:23:12 -0500
VBR-Info: md=auristor.com; mc=all; mv=vbr.emailcertification.org;
X-Spam-Processed: sequoia-grove.secure-endpoints.com, Sat,
 29 Feb 2020 07:23:12 -0500
 (not processed: message from trusted or authenticated source)
X-MDRemoteIP: 2604:2000:1741:8407:49ff:a2f7:7432:9263
X-MDHelo: [IPv6:2604:2000:1741:8407:49ff:a2f7:7432:9263]
X-MDArrival-Date: Sat, 29 Feb 2020 07:23:12 -0500
X-Authenticated-Sender: jaltman@auristor.com
X-Return-Path: prvs=1328045e1d=jaltman@auristor.com
X-Envelope-From: jaltman@auristor.com
X-MDaemon-Deliver-To: linux-afs@lists.infradead.org
From: Jeffrey Eric Altman <jaltman@auristor.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] Add debian build package
Date: Sat, 29 Feb 2020 07:22:52 -0500
Message-Id: <005EF5A0-4D79-4355-9DD3-DEDF0FA68326@auristor.com>
References: <20200229092155.23965-1-olsonse@umich.edu>
In-Reply-To: <20200229092155.23965-1-olsonse@umich.edu>
To: "Spencer E. Olson" <olsonse@umich.edu>
X-Mailer: iPad Mail (17E5241d)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_042357_723656_79035747 
X-CRM114-Status: GOOD (  10.70  )
X-Spam-Score: -0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [208.125.0.235 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: David Howells <dhowells@redhat.com>, Bill MacAllister <mac@ca-zephyr.org>,
 linux-afs@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7537251215260838108=="
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org


--===============7537251215260838108==
Content-Type: multipart/signed; boundary=Apple-Mail-140229FA-7C1D-4798-ACBB-6DCD11D8CBDD; protocol="application/pkcs7-signature"; micalg=sha-256
Content-Transfer-Encoding: 7bit


--Apple-Mail-140229FA-7C1D-4798-ACBB-6DCD11D8CBDD
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Feb 29, 2020, at 4:23 AM, Spencer E. Olson <olsonse@umich.edu> wrote:
>=20
> =EF=BB=BFSigned-off-by: Spencer E. Olson <olsonse@umich.edu>
> ---
>=20
> This patch adds debian packaging to kafs-client.  This patch also includes=
 an
> auto-changelog generator that creates the changelog required in the proper=

> format for debian packages.  This generator takes the changelog content di=
rectly
> from the git log (as such, it would be challenging to properly build this d=
ebian
> package without the git repository present).
>=20

Hi Spencer,

Thanks for the much needed contribution.=20

Is this patch identical to the one in github.com/Olson=E2=80=99s/kafs-client=
/ ?

If so, Bill MacAllister has a number of changes to it from his work during t=
he recent hackathon at Vault.  I=E2=80=99ve cc=E2=80=99d Bill on this reply.=


Jeffrey Altman=20


--Apple-Mail-140229FA-7C1D-4798-ACBB-6DCD11D8CBDD
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Disposition: attachment;
	filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCBdYw
ggXSMIIEuqADAgECAhBAAW0B1qVVQ32wvx2EXYU6MA0GCSqGSIb3DQEBCwUAMDoxCzAJBgNVBAYT
AlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQgQ0EgQTEyMB4XDTE5MDkw
NTE0MzE0N1oXDTIyMTEwMTE0MzE0N1owcDEvMC0GCgmSJomT8ixkAQETH0EwMTQxMEMwMDAwMDE2
RDAxRDZBNTQwMDAwMDQ0NDcxGTAXBgNVBAMTEEplZmZyZXkgRSBBbHRtYW4xFTATBgNVBAoTDEF1
cmlTdG9yIEluYzELMAkGA1UEBhMCVVMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCY
1TC9QeWnUgEoJ81FcAVnhGn/AWuzvkYRUG5/ZyXDdaM212e8ybCklgSmZweqNdrfaaHXk9vwjpvp
D4YWgb07nJ1QBwlvRV/VPAaDdneIygJJWBCzaMVLttKO0VimH/I/HUwFBQT2mrktucCEf2qogdi2
P+p5nuhnhIUiyZ71Fo43gF6cuXIMV/1rBNIJDuwMQ3H8zi6GL0p4mZFZDDKtbYq2l8+MNxFvMrYc
LaJqejQNQRBuZVfv0Fq9pOGwNLAk19baIw3Uxdwx+bGpTtS63Py1/57MQ0W/ZXE/Ocnt1qoDLpJe
ZIuEBKgMcn5/iN9+Ro5zAuOBEKg34wBS8QCTAgMBAAGjggKcMIICmDAOBgNVHQ8BAf8EBAMCBPAw
gYQGCCsGAQUFBwEBBHgwdjAwBggrBgEFBQcwAYYkaHR0cDovL2NvbW1lcmNpYWwub2NzcC5pZGVu
dHJ1c3QuY29tMEIGCCsGAQUFBzAChjZodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2Nl
cnRzL3RydXN0aWRjYWExMi5wN2MwHwYDVR0jBBgwFoAUpHPa72k1inXMoBl7CDL4a4nkQuwwCQYD
VR0TBAIwADCCASsGA1UdIASCASIwggEeMIIBGgYLYIZIAYb5LwAGAgEwggEJMEoGCCsGAQUFBwIB
Fj5odHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmljYXRlcy9wb2xpY3kvdHMvaW5k
ZXguaHRtbDCBugYIKwYBBQUHAgIwga0MgapUaGlzIFRydXN0SUQgQ2VydGlmaWNhdGUgaGFzIGJl
ZW4gaXNzdWVkIGluIGFjY29yZGFuY2Ugd2l0aCBJZGVuVHJ1c3QncyBUcnVzdElEIENlcnRpZmlj
YXRlIFBvbGljeSBmb3VuZCBhdCBodHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmlj
YXRlcy9wb2xpY3kvdHMvaW5kZXguaHRtbDBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8vdmFsaWRh
dGlvbi5pZGVudHJ1c3QuY29tL2NybC90cnVzdGlkY2FhMTIuY3JsMB8GA1UdEQQYMBaBFGphbHRt
YW5AYXVyaXN0b3IuY29tMB0GA1UdDgQWBBR7pHsvL4H5GdzNToI9e5BuzV19bzAdBgNVHSUEFjAU
BggrBgEFBQcDAgYIKwYBBQUHAwQwDQYJKoZIhvcNAQELBQADggEBAFlmJYk4Ff1v/n0foZkv661W
4LCRtroBaVykOXetrDDOQNK2N6JdTa146uIZVgBeU+S/0DLvJBKYtkUHQ9ovjXJTsuCBmhIIw3Yl
HoFxbku0wHEpXMdFUHV3tUodFJJKF3MbC8j7dOMkag59/MdzSjszdvit0av9nTxWs/tRKKtSQQlx
tH34TouIke2UgP/Nn901QLOrJYJmtjzVz8DW3IYVxfciSBHhbhJTdley5cuEzphELo5NR4gFjBNl
xH7G57Hno9+EWILpx302FJMwTgodIBJbXLbPMHouxQbOL2anOTUMKO8oH0QdQHCtC7hpgoQa7UJY
JxDBI+PRaQ/HObkxggKmMIICogIBATBOMDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1
c3QxFzAVBgNVBAMTDlRydXN0SUQgQ0EgQTEyAhBAAW0B1qVVQ32wvx2EXYU6MA0GCWCGSAFlAwQC
AQUAoIIBKTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMDAyMjkx
MjIyNTNaMC8GCSqGSIb3DQEJBDEiBCBgDvQ+UqjYnQ4buj/8OM66mL/HtaGMIz90cT5+GTXpODBd
BgkrBgEEAYI3EAQxUDBOMDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNV
BAMTDlRydXN0SUQgQ0EgQTEyAhBAAW0B1qVVQ32wvx2EXYU6MF8GCyqGSIb3DQEJEAILMVCgTjA6
MQswCQYDVQQGEwJVUzESMBAGA1UEChMJSWRlblRydXN0MRcwFQYDVQQDEw5UcnVzdElEIENBIEEx
MgIQQAFtAdalVUN9sL8dhF2FOjANBgkqhkiG9w0BAQEFAASCAQAnC9gvXk2QQHRJEqC84mhcWJhc
OJc2DHLCLd4z2BLDR1Gu82oBCImuF94bPt7fd9Z+HJ5Dv0CQEKJOZkkx2BLEpZyl/TvZ1sKT5e/x
T9nbOcEZ6oLvONand+vVf7r0OMGVTaelTf4VvJ38ciU5yDeXVGpdRv/aKIsxHKoeeKlDQlnKcOSH
+qLTSEuWPHo2oe5SITchm32JwHWHUs8CkosnPO+7J7QADT7soYt8XTzzyzz5Cq5KG6iWkdhKQCsG
g/c/fW61XIRYDbo8A/WTUlguKns7V7DsbtqkwOxuMquL0Oa7G+eY2/PDTfnHv4KopiZFW4/+3jl1
VeBE17ErY4v8AAAAAAAA
--Apple-Mail-140229FA-7C1D-4798-ACBB-6DCD11D8CBDD--



--===============7537251215260838108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs

--===============7537251215260838108==--


