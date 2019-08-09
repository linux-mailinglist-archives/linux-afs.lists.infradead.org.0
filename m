Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DEF8861C
	for <lists+linux-afs@lfdr.de>; Sat, 10 Aug 2019 00:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GAmc3bRse87loGrUuhe3eg04RhCMCckIWoY/rHS5P5M=; b=EyQ6bywhipRTKgzbbVKuM3Sb8
	kHc7hvRkdhI9Q+22/S1nPpAZGarY6ENG8TZtvkQ+UMqxW4cecdV2URcKnm3qe5jKgBjUvvL0rxH5C
	XVZPldae9azX6Yn2CwFc378WLQxHDMS+bqaX1R9svl9aAsJseNEGeEgX2uZbQGE3aL3WR6cNNmetK
	hFTCQz+3WEYCo03y3VyySn6CojsdU2y5AV1Eq6PnFYsKD72CjpajKYuALYVqH6z1OFm95OOiAXe98
	VVZNXOmRns3inCMasqEwZwwdD47fNj7oxSceyh1Hdof0t3RkUqveLTNSTjmUzSI74zzc2wA7QL9q9
	uXjy/lZFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwDTG-0003Wc-My; Fri, 09 Aug 2019 22:34:50 +0000
Received: from sequoia-grove.ad.secure-endpoints.com ([208.125.0.235]
 helo=smtp.secure-endpoints.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwDTD-0003W9-59
 for linux-afs@lists.infradead.org; Fri, 09 Aug 2019 22:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
 d=auristor.com; s=MDaemon; t=1565390084; x=1565994884;
 i=jaltman@auristor.com; q=dns/txt; h=VBR-Info:Subject:To:Cc:
 References:From:Openpgp:Autocrypt:Organization:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type; bh=NEeoWKi894M
 m1LxN5xz3lHSV4OOu0s5Q1RTjmWhiylk=; b=qFlAKLwcZND7wIosNu+pGeDNxn/
 RUSh/PrdgiJ40T8EiA1OccYlhArd/Luh7lS7RGzuKIcTiYQgZCtP+2QAySXWKo2m
 5QpkurvT67d3pmzdTzKpz6DQOG6y2OAtHMoQzBPOUtStE0pRvFT76UNZ7RXvoMlh
 mYUbP2munwRFO/7s=
X-MDAV-Result: clean
X-MDAV-Processed: smtp.secure-endpoints.com, Fri, 09 Aug 2019 18:34:44 -0400
Received: from [IPv6:2001:470:1f07:f77:c0fd:eae8:d216:e0ed] by auristor.com
 (IPv6:2001:470:1f07:f77:28d9:68fb:855d:c2a5) (MDaemon PRO v19.0.3) 
 with ESMTPSA id md50002191745.msg; Fri, 09 Aug 2019 18:34:44 -0400
VBR-Info: md=auristor.com; mc=all; mv=vbr.emailcertification.org;
X-Spam-Processed: smtp.secure-endpoints.com, Fri, 09 Aug 2019 18:34:44 -0400
 (not processed: message from trusted or authenticated source)
X-MDRemoteIP: 2001:470:1f07:f77:c0fd:eae8:d216:e0ed
X-MDHelo: [IPv6:2001:470:1f07:f77:c0fd:eae8:d216:e0ed]
X-MDArrival-Date: Fri, 09 Aug 2019 18:34:44 -0400
X-Authenticated-Sender: jaltman@auristor.com
X-Return-Path: prvs=1124d98d78=jaltman@auristor.com
X-Envelope-From: jaltman@auristor.com
X-MDaemon-Deliver-To: linux-afs@lists.infradead.org
Subject: Re: [PATCH net] rxrpc: Fix local refcounting
To: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
References: <156538726702.16201.13552536596121161945.stgit@warthog.procyon.org.uk>
From: Jeffrey E Altman <jaltman@auristor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jaltman@auristor.com; keydata=
 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
 akGVmjD5917A1HqWfMmiKA==
Organization: AuriStor, Inc.
Message-ID: <f37b4a68-1831-ed8b-d912-4bc46851a0a4@auristor.com>
Date: Fri, 9 Aug 2019 18:34:36 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156538726702.16201.13552536596121161945.stgit@warthog.procyon.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_153447_538505_5CCDC501 
X-CRM114-Status: GOOD (  13.40  )
X-Spam-Score: -0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
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
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============7204916791582657775=="
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

This is a cryptographically signed message in MIME format.

--===============7204916791582657775==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms000009060607080509030308"

This is a cryptographically signed message in MIME format.

--------------ms000009060607080509030308
Content-Type: multipart/mixed;
 boundary="------------1542A899EA9420535EE0030D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1542A899EA9420535EE0030D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

David,

Looks good to me.

You can add a Reviewed-by line.

Thanks.

Jeffrey Altman

On 8/9/2019 5:47 PM, David Howells wrote:
> Fix rxrpc_unuse_local() to handle a NULL local pointer as it can be cal=
led
> on an unbound socket on which rx->local is not yet set.
>=20
> The following reproduced (includes omitted):
>=20
> 	int main(void)
> 	{
> 		socket(AF_RXRPC, SOCK_DGRAM, AF_INET);
> 		return 0;
> 	}
>=20
> causes the following oops to occur:
>=20
> 	BUG: kernel NULL pointer dereference, address: 0000000000000010
> 	...
> 	RIP: 0010:rxrpc_unuse_local+0x8/0x1b
> 	...
> 	Call Trace:
> 	 rxrpc_release+0x2b5/0x338
> 	 __sock_release+0x37/0xa1
> 	 sock_close+0x14/0x17
> 	 __fput+0x115/0x1e9
> 	 task_work_run+0x72/0x98
> 	 do_exit+0x51b/0xa7a
> 	 ? __context_tracking_exit+0x4e/0x10e
> 	 do_group_exit+0xab/0xab
> 	 __x64_sys_exit_group+0x14/0x17
> 	 do_syscall_64+0x89/0x1d4
> 	 entry_SYSCALL_64_after_hwframe+0x49/0xbe
>=20
> Reported-by: syzbot+20dee719a2e090427b5f@syzkaller.appspotmail.com
> Fixes: 730c5fd42c1e ("rxrpc: Fix local endpoint refcounting")
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeffrey Altman <jaltman@auristor.com>
> ---
>=20
>  net/rxrpc/local_object.c |   12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
> index 9798159ee65f..c9db3e762d8d 100644
> --- a/net/rxrpc/local_object.c
> +++ b/net/rxrpc/local_object.c
> @@ -402,11 +402,13 @@ void rxrpc_unuse_local(struct rxrpc_local *local)=

>  {
>  	unsigned int au;
> =20
> -	au =3D atomic_dec_return(&local->active_users);
> -	if (au =3D=3D 0)
> -		rxrpc_queue_local(local);
> -	else
> -		rxrpc_put_local(local);
> +	if (local) {
> +		au =3D atomic_dec_return(&local->active_users);
> +		if (au =3D=3D 0)
> +			rxrpc_queue_local(local);
> +		else
> +			rxrpc_put_local(local);
> +	}
>  }
> =20
>  /*
>=20

--------------1542A899EA9420535EE0030D
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


--------------1542A899EA9420535EE0030D--

--------------ms000009060607080509030308
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
DGswggXSMIIEuqADAgECAhBAAWbTGehnfUuu91hYwM5DMA0GCSqGSIb3DQEBCwUAMDoxCzAJ
BgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQgQ0EgQTEy
MB4XDTE4MTEwMjA2MjYyMloXDTE5MTEwMjA2MjYyMlowcDEvMC0GCgmSJomT8ixkAQETH0Ew
MTQyN0UwMDAwMDE2NkQzMTlFODFBMDAwMDdBN0IxGTAXBgNVBAMTEEplZmZyZXkgRSBBbHRt
YW4xFTATBgNVBAoTDEF1cmlTdG9yIEluYzELMAkGA1UEBhMCVVMwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDqEYwjLORE23Gc8m7YgKqbGzWn/fmVGtoZkBNwOEYlrFOu84Pb
EhV4sxQrChhPyXVW2jquV2rg2/5dsVC8RO+RwlXuAkUvR9KhWJLu6GJXwUnZr83wtEzJ8nqp
THj6W+3velLwWx7qhADyrMnKN0bTYh+5M9HWt2We4qYi6i1/ejgKtM0arWYxVx6Iwb4xZpil
MDNqV15Dwuunnkq4vNEByIT81zDoClqylMxxKJpvc3tqC66+BHHM5RxF+z36Pt8fb3Q54Vry
txXFm+kVSclKGaWgjq5SqV4tR0FWv6OnMY8tAx1YrljfvgxW5npZgBbo+YVoYEfUrz77WIYQ
yzn7AgMBAAGjggKcMIICmDAOBgNVHQ8BAf8EBAMCBPAwgYQGCCsGAQUFBwEBBHgwdjAwBggr
BgEFBQcwAYYkaHR0cDovL2NvbW1lcmNpYWwub2NzcC5pZGVudHJ1c3QuY29tMEIGCCsGAQUF
BzAChjZodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2NlcnRzL3RydXN0aWRjYWEx
Mi5wN2MwHwYDVR0jBBgwFoAUpHPa72k1inXMoBl7CDL4a4nkQuwwCQYDVR0TBAIwADCCASsG
A1UdIASCASIwggEeMIIBGgYLYIZIAYb5LwAGAgEwggEJMEoGCCsGAQUFBwIBFj5odHRwczov
L3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmljYXRlcy9wb2xpY3kvdHMvaW5kZXguaHRt
bDCBugYIKwYBBQUHAgIwga0agapUaGlzIFRydXN0SUQgQ2VydGlmaWNhdGUgaGFzIGJlZW4g
aXNzdWVkIGluIGFjY29yZGFuY2Ugd2l0aCBJZGVuVHJ1c3QncyBUcnVzdElEIENlcnRpZmlj
YXRlIFBvbGljeSBmb3VuZCBhdCBodHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRp
ZmljYXRlcy9wb2xpY3kvdHMvaW5kZXguaHRtbDBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8v
dmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2NybC90cnVzdGlkY2FhMTIuY3JsMB8GA1UdEQQY
MBaBFGphbHRtYW5AYXVyaXN0b3IuY29tMB0GA1UdDgQWBBQevV8IqWfIUNkQqAugGhxR938z
+jAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwDQYJKoZIhvcNAQELBQADggEBAKsU
kshF6tfL43itTIVy9vjYqqPErG9n8kX5FlRYbtIVlWIYTxQpeqtDpUPur1jfBiNY+xT+9Pay
O2+XxXu9ZEykCz5T4+3q7s5t5RLsHu1dxYcMnAgfUqb13mhZxY8PVPE4PTHSvZLjPZ6Nt7j0
tXjddZJqjDhr7neNpmYgQWSe+oaIxbUqQ34rVW/hDimv9Y2DnCXL0LopCfABQDK9HDzmsuXd
bVH6LUpS6ncge9kQEh1QIGuwqEv2tHCWeauWM6h3BOXj3dlfbJEawUYz2hvc3nSXpscFlCN5
tGAyUAE8QbKnH1ha/zZVrJY1EglFhnDho34lWl35t7pE5NP4kscwggaRMIIEeaADAgECAhEA
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
VHJ1c3RJRCBDQSBBMTICEEABZtMZ6Gd9S673WFjAzkMwDQYJYIZIAWUDBAIBBQCgggGXMBgG
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE5MDgwOTIyMzQ0MFow
LwYJKoZIhvcNAQkEMSIEIOLM2WUW1XMKNs9hbxPAFRk0YXloLuPpMvGtRUt9bcw8MF0GCSsG
AQQBgjcQBDFQME4wOjELMAkGA1UEBhMCVVMxEjAQBgNVBAoTCUlkZW5UcnVzdDEXMBUGA1UE
AxMOVHJ1c3RJRCBDQSBBMTICEEABZtMZ6Gd9S673WFjAzkMwXwYLKoZIhvcNAQkQAgsxUKBO
MDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQg
Q0EgQTEyAhBAAWbTGehnfUuu91hYwM5DMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEAvaNKbFv97F1O
w6paVkSfEo3zSxpGjZ4hIR7PXoxffP3UuR4kznQZ+nGbRRRMA8e2splcIAhNRpwU/Rp9CXag
rDM59+IKQgAFBwoOv1QFmVeMtQXuEbJOuPUK7WAUlSwxs5RB1lFRP4kp4cUWCAbGcg2m/a1w
yirQfqL9/qpn5C5CJzbkMW7ZuoAH0kAXOWi/U7E344/mVHgGyo5ILghmipajjhoI4Nqvx38H
LnB+viFlHmq3ajdTun90Qvyq23lKnT3Za1n5mi+rfY3Tu8V3Dq3GsEXyepc0WKo/ycuk/GCA
4TigxeUMSs+/0L1SW8bNl6ns1gBGOP628iP27DmWTAAAAAAAAA==
--------------ms000009060607080509030308--



--===============7204916791582657775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs

--===============7204916791582657775==--


