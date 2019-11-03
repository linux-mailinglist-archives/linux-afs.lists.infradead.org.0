Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DECDAED4B8
	for <lists+linux-afs@lfdr.de>; Sun,  3 Nov 2019 21:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0QRI6H4NSnl7gBzgw+FzSFUlrU7ZIwqAxyV4mP+yKA4=; b=fUGnyc0lSX5qERlN5wZ1XzA0P
	do5I7nep7On6AbqVRaGzKVHF86lv+DoBmxzsKnp/zW0NjRhH057ascRzEUnc9ylBUFzomwNsPVX1Q
	1t7Dz6pctZy1IJ32EhR8ZCQBcqmyRrnST8VBgZQ+cApqFtObR9nGAA5TB2VqjTY+n0Jo81a0InKeo
	kfdyxRJHcysJ5JxoD8mmITBqPpxDqiuomKhS1jrADqg6F/0hvwdaX1aWu7YBeMO/W/K90xUV/XHT9
	vSbMqzeeC4/rRXZUqlnGMAwvjDhvajmf6ndSK2ZnIJIT844jnv/RwmMXlpgxN3q35iOda3k7OjJg+
	wsG9IuqeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRMbt-00018f-JW; Sun, 03 Nov 2019 20:36:29 +0000
Received: from sequoia-grove.ad.secure-endpoints.com ([208.125.0.235]
 helo=smtp.secure-endpoints.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRMbq-0000aN-47
 for linux-afs@lists.infradead.org; Sun, 03 Nov 2019 20:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
 d=auristor.com; s=MDaemon; t=1572813341; x=1573418141;
 i=jaltman@auristor.com; q=dns/txt; h=VBR-Info:Subject:To:Cc:
 References:From:Autocrypt:Organization:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type; bh=jCWjXN5eVh+
 0OdCyb1Y29rJQvEzcBzzMFoNNi0LcjK0=; b=RZwfEGrbnWMT9CAhXhgwuQ8soo8
 ztvvsEdKtjza0b2h3/4x3XtGveJNbL9F340BB1AIYusH7VHhT4ceCdAP9t9S6DQy
 IkWOlFMspbXbAzUg0J0kY2Q1dxllJ0QY5KtnsOz+mx4ZbOP0I7dptK7YKokYVHR/
 dEFRA24luEaufiKg=
X-MDAV-Result: clean
X-MDAV-Processed: smtp.secure-endpoints.com, Sun, 03 Nov 2019 15:35:41 -0500
Received: from [IPv6:2001:470:1f07:f77:e52b:be5b:172a:1d0f] by auristor.com
 (IPv6:2001:470:1f07:f77:28d9:68fb:855d:c2a5) (MDaemon PRO v19.5.1a) 
 with ESMTPSA id md50002251638.msg; Sun, 03 Nov 2019 15:35:40 -0500
VBR-Info: md=auristor.com; mc=all; mv=vbr.emailcertification.org;
X-Spam-Processed: smtp.secure-endpoints.com, Sun, 03 Nov 2019 15:35:40 -0500
 (not processed: message from trusted or authenticated source)
X-MDRemoteIP: 2001:470:1f07:f77:e52b:be5b:172a:1d0f
X-MDHelo: [IPv6:2001:470:1f07:f77:e52b:be5b:172a:1d0f]
X-MDArrival-Date: Sun, 03 Nov 2019 15:35:40 -0500
X-Authenticated-Sender: jaltman@auristor.com
X-Return-Path: prvs=121061e367=jaltman@auristor.com
X-Envelope-From: jaltman@auristor.com
X-MDaemon-Deliver-To: linux-afs@lists.infradead.org
Subject: Re: File changes from different client get not recognised
To: Julian Wollrath <jwollrath@web.de>
References: <20190810133918.3046fb6a@schienar>
 <a27c78f8-2b55-3410-4cbe-e5dcff9b2862@auristor.com>
 <20190810213106.571d70b4@saldaea>
From: Jeffrey E Altman <jaltman@auristor.com>
Autocrypt: addr=jaltman@auristor.com; keydata=
 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
 1HqWfMmiKA==
Organization: AuriStor, Inc.
Message-ID: <287cf394-d02a-7d38-5b10-e7213b0bb4ba@auristor.com>
Date: Sun, 3 Nov 2019 15:35:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20190810213106.571d70b4@saldaea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191103_123626_506564_94044B3D 
X-CRM114-Status: GOOD (  12.83  )
X-Spam-Score: -0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [208.125.0.235 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Content-Type: multipart/mixed; boundary="===============6806748763379150035=="
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

This is a cryptographically signed message in MIME format.

--===============6806748763379150035==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms010807000804090107080503"

This is a cryptographically signed message in MIME format.

--------------ms010807000804090107080503
Content-Type: multipart/mixed;
 boundary="------------BAA8E17C86B692F657F4E7C7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BAA8E17C86B692F657F4E7C7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Julian,

Are you still seeing the callback delivery problems with the v5.3 kernels=
?

Thanks.

Jeffrey Altman

On 8/10/2019 3:31 PM, Julian Wollrath wrote:
> Hi Jeffrey,
>=20
> sorry for forgetting that: I use Debian unstable but I have a self
> compiled kernel to include kAFS. The last test I did was with Linux
> kernel version 5.1.7 but the problem is there, since I tried out kAFS
> (which I believe, the first time was with 4.19).
>=20
>=20
> Cheers,
> Julian
>=20
> Am Sat, 10 Aug 2019 12:21:47 -0400
> schrieb Jeffrey E Altman <jaltman@auristor.com>:
>=20
>> Hi Julian,
>>
>> Please provide details of which Linux distribution and which kernel
>> you are using.
>>
>> Jeffrey Altman
>>
>> On 8/10/2019 7:39 AM, Julian Wollrath wrote:
>>> Hi,
>>>
>>> I have the following setup: I mount an AFS filesystem on one
>>> computer (C1) with kAFS and change into one of the folders in the
>>> filesystem do an `ls` or open a file or something else.
>>>
>>> Then, with a different computer (C2) I go into the same folder and
>>> make some changes, e.g. change the content of one file in the
>>> folder, I previously looked at with C1.
>>>
>>> Now, with C1 I do `ls -l` again. The files last modification time is
>>> unchanged. Trying to open the file will fail. Only unmounting and
>>> remounting will show me the correct folder contents and makes it
>>> possible for me to look into the file.
>>>
>>>
>>> Cheers,
>>> Julian
>>>
>>> --
>>>  ()  ascii ribbon campaign - against html e-mail
>>>  /\                        - against proprietary attachments
>>>
>>> _______________________________________________
>>> linux-afs mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-afs
>>>
>=20
>=20
>=20
> --
>  ()  ascii ribbon campaign - against html e-mail
>  /\                        - against proprietary attachments
>=20

--------------BAA8E17C86B692F657F4E7C7
Content-Type: text/x-vcard; charset=utf-8;
 name="jaltman.vcf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="jaltman.vcf"

begin:vcard
fn:Jeffrey Altman
n:Altman;Jeffrey
org:AuriStor, Inc.
adr:;;255 W 94TH ST STE 6B;New York;NY;10025-6985;United States
email;internet:jaltman@auristor.com
title:CEO
tel;work:+1-212-769-9018
url:https://www.linkedin.com/in/jeffreyaltman/
version:2.1
end:vcard


--------------BAA8E17C86B692F657F4E7C7--

--------------ms010807000804090107080503
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
DGswggXSMIIEuqADAgECAhBAAW0B1qVVQ32wvx2EXYU6MA0GCSqGSIb3DQEBCwUAMDoxCzAJ
BgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQgQ0EgQTEy
MB4XDTE5MDkwNTE0MzE0N1oXDTIyMTEwMTE0MzE0N1owcDEvMC0GCgmSJomT8ixkAQETH0Ew
MTQxMEMwMDAwMDE2RDAxRDZBNTQwMDAwMDQ0NDcxGTAXBgNVBAMTEEplZmZyZXkgRSBBbHRt
YW4xFTATBgNVBAoTDEF1cmlTdG9yIEluYzELMAkGA1UEBhMCVVMwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQCY1TC9QeWnUgEoJ81FcAVnhGn/AWuzvkYRUG5/ZyXDdaM212e8
ybCklgSmZweqNdrfaaHXk9vwjpvpD4YWgb07nJ1QBwlvRV/VPAaDdneIygJJWBCzaMVLttKO
0VimH/I/HUwFBQT2mrktucCEf2qogdi2P+p5nuhnhIUiyZ71Fo43gF6cuXIMV/1rBNIJDuwM
Q3H8zi6GL0p4mZFZDDKtbYq2l8+MNxFvMrYcLaJqejQNQRBuZVfv0Fq9pOGwNLAk19baIw3U
xdwx+bGpTtS63Py1/57MQ0W/ZXE/Ocnt1qoDLpJeZIuEBKgMcn5/iN9+Ro5zAuOBEKg34wBS
8QCTAgMBAAGjggKcMIICmDAOBgNVHQ8BAf8EBAMCBPAwgYQGCCsGAQUFBwEBBHgwdjAwBggr
BgEFBQcwAYYkaHR0cDovL2NvbW1lcmNpYWwub2NzcC5pZGVudHJ1c3QuY29tMEIGCCsGAQUF
BzAChjZodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2NlcnRzL3RydXN0aWRjYWEx
Mi5wN2MwHwYDVR0jBBgwFoAUpHPa72k1inXMoBl7CDL4a4nkQuwwCQYDVR0TBAIwADCCASsG
A1UdIASCASIwggEeMIIBGgYLYIZIAYb5LwAGAgEwggEJMEoGCCsGAQUFBwIBFj5odHRwczov
L3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmljYXRlcy9wb2xpY3kvdHMvaW5kZXguaHRt
bDCBugYIKwYBBQUHAgIwga0MgapUaGlzIFRydXN0SUQgQ2VydGlmaWNhdGUgaGFzIGJlZW4g
aXNzdWVkIGluIGFjY29yZGFuY2Ugd2l0aCBJZGVuVHJ1c3QncyBUcnVzdElEIENlcnRpZmlj
YXRlIFBvbGljeSBmb3VuZCBhdCBodHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRp
ZmljYXRlcy9wb2xpY3kvdHMvaW5kZXguaHRtbDBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8v
dmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2NybC90cnVzdGlkY2FhMTIuY3JsMB8GA1UdEQQY
MBaBFGphbHRtYW5AYXVyaXN0b3IuY29tMB0GA1UdDgQWBBR7pHsvL4H5GdzNToI9e5BuzV19
bzAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwDQYJKoZIhvcNAQELBQADggEBAFlm
JYk4Ff1v/n0foZkv661W4LCRtroBaVykOXetrDDOQNK2N6JdTa146uIZVgBeU+S/0DLvJBKY
tkUHQ9ovjXJTsuCBmhIIw3YlHoFxbku0wHEpXMdFUHV3tUodFJJKF3MbC8j7dOMkag59/Mdz
Sjszdvit0av9nTxWs/tRKKtSQQlxtH34TouIke2UgP/Nn901QLOrJYJmtjzVz8DW3IYVxfci
SBHhbhJTdley5cuEzphELo5NR4gFjBNlxH7G57Hno9+EWILpx302FJMwTgodIBJbXLbPMHou
xQbOL2anOTUMKO8oH0QdQHCtC7hpgoQa7UJYJxDBI+PRaQ/HObkwggaRMIIEeaADAgECAhEA
+d5Wf8lNDHdw+WAbUtoVOzANBgkqhkiG9w0BAQsFADBKMQswCQYDVQQGEwJVUzESMBAGA1UE
ChMJSWRlblRydXN0MScwJQYDVQQDEx5JZGVuVHJ1c3QgQ29tbWVyY2lhbCBSb290IENBIDEw
HhcNMTUwMjE4MjIyNTE5WhcNMjMwMjE4MjIyNTE5WjA6MQswCQYDVQQGEwJVUzESMBAGA1UE
ChMJSWRlblRydXN0MRcwFQYDVQQDEw5UcnVzdElEIENBIEExMjCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBANGRTTzPCic0kq5L6ZrUJWt5LE/n6tbPXPhGt2Egv7plJMoEpvVJ
JDqGqDYymaAsd8Hn9ZMAuKUEFdlx5PgCkfu7jL5zgiMNnAFVD9PyrsuF+poqmlxhlQ06sFY2
hbhQkVVQ00KCNgUzKcBUIvjv04w+fhNPkwGW5M7Ae5K5OGFGwOoRck9GG6MUVKvTNkBw2/vN
MOd29VGVTtR0tjH5PS5yDXss48Yl1P4hDStO2L4wTsW2P37QGD27//XGN8K6amWB6F2XOgff
/PmlQjQOORT95PmLkwwvma5nj0AS0CVp8kv0K2RHV7GonllKpFDMT0CkxMQKwoj+tWEWJTiD
KSsCAwEAAaOCAoAwggJ8MIGJBggrBgEFBQcBAQR9MHswMAYIKwYBBQUHMAGGJGh0dHA6Ly9j
b21tZXJjaWFsLm9jc3AuaWRlbnRydXN0LmNvbTBHBggrBgEFBQcwAoY7aHR0cDovL3ZhbGlk
YXRpb24uaWRlbnRydXN0LmNvbS9yb290cy9jb21tZXJjaWFscm9vdGNhMS5wN2MwHwYDVR0j
BBgwFoAU7UQZwNPwBovupHu+QucmVMiONnYwDwYDVR0TAQH/BAUwAwEB/zCCASAGA1UdIASC
ARcwggETMIIBDwYEVR0gADCCAQUwggEBBggrBgEFBQcCAjCB9DBFFj5odHRwczovL3NlY3Vy
ZS5pZGVudHJ1c3QuY29tL2NlcnRpZmljYXRlcy9wb2xpY3kvdHMvaW5kZXguaHRtbDADAgEB
GoGqVGhpcyBUcnVzdElEIENlcnRpZmljYXRlIGhhcyBiZWVuIGlzc3VlZCBpbiBhY2NvcmRh
bmNlIHdpdGggSWRlblRydXN0J3MgVHJ1c3RJRCBDZXJ0aWZpY2F0ZSBQb2xpY3kgZm91bmQg
YXQgaHR0cHM6Ly9zZWN1cmUuaWRlbnRydXN0LmNvbS9jZXJ0aWZpY2F0ZXMvcG9saWN5L3Rz
L2luZGV4Lmh0bWwwSgYDVR0fBEMwQTA/oD2gO4Y5aHR0cDovL3ZhbGlkYXRpb24uaWRlbnRy
dXN0LmNvbS9jcmwvY29tbWVyY2lhbHJvb3RjYTEuY3JsMB0GA1UdJQQWMBQGCCsGAQUFBwMC
BggrBgEFBQcDBDAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0OBBYEFKRz2u9pNYp1zKAZewgy+GuJ
5ELsMA0GCSqGSIb3DQEBCwUAA4ICAQAN4YKu0vv062MZfg+xMSNUXYKvHwvZIk+6H1pUmivy
DI4I6A3wWzxlr83ZJm0oGIF6PBsbgKJ/fhyyIzb+vAYFJmyI8I/0mGlc+nIQNuV2XY8cypPo
VJKgpnzp/7cECXkX8R4NyPtEn8KecbNdGBdEaG4a7AkZ3ujlJofZqYdHxN29tZPdDlZ8fR36
/mAFeCEq0wOtOOc0Eyhs29+9MIZYjyxaPoTS+l8xLcuYX3RWlirRyH6RPfeAi5kySOEhG1qu
NHe06QIwpigjyFT6v/vRqoIBr7WpDOSt1VzXPVbSj1PcWBgkwyGKHlQUOuSbHbHcjOD8w8wH
SDbL+L2he8hNN54doy1e1wJHKmnfb0uBAeISoxRbJnMMWvgAlH5FVrQWlgajeH/6NbYbBSRx
ALuEOqEQepmJM6qz4oD2sxdq4GMN5adAdYEswkY/o0bRKyFXTD3mdqeRXce0jYQbWm7oapqS
ZBccFvUgYOrB78tB6c1bxIgaQKRShtWR1zMM0JfqUfD9u8Fg7G5SVO0IG/GcxkSvZeRjhYcb
TfqF2eAgprpyzLWmdr0mou3bv1Sq4OuBhmTQCnqxAXr4yVTRYHkp5lCvRgeJAme1OTVpVPth
/O7HJ7VuEP9GOr6kCXCXmjB4P3UJ2oU0NqfoQdcSSSt9hliALnExTEjii20B2nSDojGCAxQw
ggMQAgEBME4wOjELMAkGA1UEBhMCVVMxEjAQBgNVBAoTCUlkZW5UcnVzdDEXMBUGA1UEAxMO
VHJ1c3RJRCBDQSBBMTICEEABbQHWpVVDfbC/HYRdhTowDQYJYIZIAWUDBAIBBQCgggGXMBgG
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE5MTEwMzIwMzUzNFow
LwYJKoZIhvcNAQkEMSIEIDrrsyo/mcJfHnQVGH+ErkNArAe8ILz4qGYvejJ57NhhMF0GCSsG
AQQBgjcQBDFQME4wOjELMAkGA1UEBhMCVVMxEjAQBgNVBAoTCUlkZW5UcnVzdDEXMBUGA1UE
AxMOVHJ1c3RJRCBDQSBBMTICEEABbQHWpVVDfbC/HYRdhTowXwYLKoZIhvcNAQkQAgsxUKBO
MDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQg
Q0EgQTEyAhBAAW0B1qVVQ32wvx2EXYU6MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEAAWFla5LKCYle
IFr3sMOfoc8iO4j//ZkrKVnC4TF13uhzVuen8kL1cBwJ65FxIHVOn6ocySjncTXlFgNKRUC5
NmCO+7LBa/W3i3ODztkpaERicsZ9WHoR3qmuHy60ZSlfVptdsv8gJTC+9mZ2gsTf3gRnZoet
uWQLN8vdRc3wYbivDPTZRJ1UKAx/P0WMDf6AD7KLpY8p6CPxhTQblO8xgpTXRbXtA2mhGQZ1
Y0UQOalLas0xgPt8ESAuuHiMZwJULCbd6/Q+1qDbBtkHoSEj25fmZAyXJHnHtUgy0gkGmT8h
0ObJjikcjGz7vDvDEDvMZd4qNHPjtQafkFozPssntQAAAAAAAA==
--------------ms010807000804090107080503--



--===============6806748763379150035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs

--===============6806748763379150035==--


