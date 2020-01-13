Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9BE139569
	for <lists+linux-afs@lfdr.de>; Mon, 13 Jan 2020 17:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:Message-ID:To:Subject:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vq8zotm1HNQE3mnx1vKJPVJWp6Rja0qLLNQuhmvIsVM=; b=oDW
	X8wQq+GJsok2GlwPGb6aWnrAToGjXo2Chmrv50uYy3EYLtr5nWyM3qRPdC7R+SskK3Aje0Woakfco
	M7Z95zgUbXKUR+ycD1R76JFof5L6IAe2B5+1UnvmPv7ZIg3zazhP10rPvF0oA7s7+ckenPHKXW4VK
	eiPyvwY/eXbJPcm6b9IkMlhOny7BbkTOKh4LUqWr3KzSVjtrGccEaun/1ifcnXKoTmMcCkrT1aUQq
	IYF2wNbxe+92H0u7ttw87Z/rVeJrmcHoQ2UXciKftat4U65L2GMVEfjCPpcBTcP16oebOha3VhJM1
	0tc0EXFurpYivkfXa4R3NIP0OD4IEdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir2AM-0008CX-Dy; Mon, 13 Jan 2020 16:02:10 +0000
Received: from sequoia-grove.ad.secure-endpoints.com ([208.125.0.235]
 helo=smtp.secure-endpoints.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir2AI-00087x-8K
 for linux-afs@lists.infradead.org; Mon, 13 Jan 2020 16:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
 d=auristor.com; s=MDaemon; t=1578931285; x=1579536085;
 i=jaltman@auristor.com; q=dns/txt; h=VBR-Info:From:Subject:To:
 Organization:Message-ID:Date:User-Agent:MIME-Version:
 Content-Type; bh=34GuKE9qy3ferBzooqQb12bZZ5PuMrgQ/NGzQP0vjWY=;
 b=GvA8cvU0pSxdSeNT/KlhnlTNDlc6FadFa8pVmuCP/dCtBKhT613rq5TV5Fglqp
 WWMfp0TbOpnv+TKpdN9ptaQL0jSPxKb42TNe1iN3xeNLbeHaDk0nSxBeHUQ5Yzay
 faaf9vINZ4QEsj+EOk++JyxHTgpAeouh+VFUVmOZESH6A=
X-MDAV-Result: clean
X-MDAV-Processed: smtp.secure-endpoints.com, Mon, 13 Jan 2020 11:01:25 -0500
Received: from [IPv6:2001:470:1f07:f77:c13a:fe4d:361d:bf6c] by auristor.com
 (IPv6:2001:470:1f07:f77:28d9:68fb:855d:c2a5) (MDaemon PRO v19.5.3) 
 with ESMTPSA id md50002285798.msg; Mon, 13 Jan 2020 11:01:23 -0500
VBR-Info: md=auristor.com; mc=all; mv=vbr.emailcertification.org;
X-Spam-Processed: smtp.secure-endpoints.com, Mon, 13 Jan 2020 11:01:23 -0500
 (not processed: message from trusted or authenticated source)
X-MDRemoteIP: 2001:470:1f07:f77:c13a:fe4d:361d:bf6c
X-MDHelo: [IPv6:2001:470:1f07:f77:c13a:fe4d:361d:bf6c]
X-MDArrival-Date: Mon, 13 Jan 2020 11:01:23 -0500
X-Authenticated-Sender: jaltman@auristor.com
X-Return-Path: prvs=1281fc6ab3=jaltman@auristor.com
X-Envelope-From: jaltman@auristor.com
X-MDaemon-Deliver-To: linux-afs@lists.infradead.org
From: Jeffrey E Altman <jaltman@auristor.com>
Subject: Linux Kernel AFS Hackathon, Future of AFS/AuriStorFS BoF, and Vault
 '20, Santa Clara CA - Feb 24/25
To: OpenAFS <OpenAFS-info@openafs.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>
Organization: AuriStor, Inc.
Message-ID: <e81a256a-4ce2-c664-6416-f3c69becaceb@auristor.com>
Date: Mon, 13 Jan 2020 11:01:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_080206_639713_4F9146E5 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [208.125.0.235 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Content-Type: multipart/mixed; boundary="===============7960695596385225930=="
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

This is a cryptographically signed message in MIME format.

--===============7960695596385225930==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms080708070401020103050109"

This is a cryptographically signed message in MIME format.

--------------ms080708070401020103050109
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

AuriStor is proud to once again sponsor the Linux Kernel AFS Hackathon &
BoF and the USENIX Vault '20 conference (co-located with FAST '20 and
NSDI '20).  Here are a few schedule highlights

Monday Feb 24th 9:00am to 5:00pm PST

Linux Kernel AFS Hackathon.  David Howells, the AuriStor developers,
other Linux kernel filesystem/network developers and Linux distribution
packagers participate in a hackathon to enhance/test:

 1. the functionality of the native Linux afs filesystem module (kafs)
    https://www.infradead.org/~dhowells/kafs/

 2. the functionality of the rxrpc network module and AF_RXRPC
    socket class

 3. the functionality of FS-Cache, the persistent caching layer
    that can be used by kafs, nfs, cifs, plan9, and cephfs.

 4. the kafs-client configuration and systemd integration for
    automatically mounting kafs and tools for managing authentication.

Linux Kernel AFS and AF_RXRPC are a standard part of the Fedora Core 31
Linux distribution.  One explicit goal of this year's hackathon is
packaging kafs-client for use with Debian and Ubuntu.

  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D933326

The hackathon is open to all.  Register at

  https://www.auristor.com/events/kafsvault20


Monday Feb 24th 6:30pm to 8:30pm PST

Birds of a Feather Meeting: The Future of AFS / AuriStorFS

Join us for pizza, status reports on the development of Linux Kernel AFS
and AuriStorFS, and open discussion of the future of only true global
file namespace.  All existing AuriStorFS and AFS end users and
administrators are encouraged to attend.


Tuesday Feb 25th 3:00pm to 3:30pm PST
"Using kAFS on Linux for Network Home Directories"
Jonathan Billings, University of Michigan, College of Engineering, CAEN
(Vault '20 registration required)

The AFS filesystem has been widely in use at educational and research
institutions since the mid-80s, and continues to be a service that many
universities, including the University of Michigan, provides to
students, staff and faculty. The Linux kernel has recently improved
support for the AFS filesystem, and now some Linux distributions provide
support for AFS out of the box. I will discuss the history of AFS, the
in-kernel AFS client, and its performance compared to the out-of-kernel
OpenAFS client. I will demonstrate some of the benefits and limitations
when using AFS as a home directory in a modern Linux distribution such
as Fedora, including working with systemd and GNOME.


Tuesday Feb 25th 4:00pm to 4:30pm PST
"Understanding Kubernetes Storage: Getting in Deep by Writing a CSI Drive=
r"
Gerry Seidman, AuriStor
(Vault '20 registration required)

Understanding the many Kubernetes storage =E2=80=98objects=E2=80=99 along=
 with their
not-always-obvious interaction and life-cycles can be daunting (Volumes,
Persistent Volumes, Persistent Volume Claims, Volume Attachments,
Storage Classes, Volume Snapshots, CSIDriver, CSINode, oh my...)

Perhaps the best ways to gleen a deep understand of these storage
objects and how storage-related scheduling works in Kubernetes is to
write a Container Storage Initiative (CSI) driver. While most of us will
never need to write a CSI driver, in this session we will make storage
with Kubernetes more accessible by exploring it from an inside-out
approach learned by writing a CSI Driver.

Gerry Seidman has a long career having designed and implemented many
complex, secure, high-performance, high-availability and fault tolerant
distributed systems. He is President at AuriStor where he is still very
hands-on including the design and implementation of the AuriStor/AFS
Kubernetes/CSI Driver.


As a sponsor, AuriStor is thrilled to offer a 20% discount on Vault '20
registration.  Provide the code "ASFSVLT20" when completing your online
registration to receive the discount.

  https://www.usenix.org/conference/241743/registration/form

We hope to see you there.






--------------ms080708070401020103050109
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
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDExMzE2MDExOFow
LwYJKoZIhvcNAQkEMSIEII7f0p1g56eodDJkAoc5D2cMwekr8ebba7PLKLWXLAHcMF0GCSsG
AQQBgjcQBDFQME4wOjELMAkGA1UEBhMCVVMxEjAQBgNVBAoTCUlkZW5UcnVzdDEXMBUGA1UE
AxMOVHJ1c3RJRCBDQSBBMTICEEABbQHWpVVDfbC/HYRdhTowXwYLKoZIhvcNAQkQAgsxUKBO
MDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQg
Q0EgQTEyAhBAAW0B1qVVQ32wvx2EXYU6MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEAguEilcGc1ImC
AThEzRudsFomRq4O7LzDIif+MKT4Q6RGu6tOTGEkZ5KQLb/U5VvdkDaCij6+mgeur1Md3RdY
RKCBL9KlDkwo4NXnbWsVqAVFEPLotim3zR+8r7uRrdY+RwH9KWUYlq8aq/IaSXd4md1mKsr3
W9DSGjnQqbPXNksiUk1pyYMMbgi9npVQbjTzicCDYlLsc1qBXtZNAZJNIgKns9CmxO/fxEEL
oLe2K6+rPhVpfFbObrXAtT0ReDmrMR90o5AKgAWJ1AOJF/heUg+JL39t/7ZWMsKWDgq4EVPK
P52LYKKwgEIuvmDS5wrpM0FAVQWN4i2vlssGMiUMDAAAAAAAAA==
--------------ms080708070401020103050109--



--===============7960695596385225930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs

--===============7960695596385225930==--


