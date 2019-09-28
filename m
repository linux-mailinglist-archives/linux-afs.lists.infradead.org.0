Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C865C1043
	for <lists+linux-afs@lfdr.de>; Sat, 28 Sep 2019 10:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TyDXVxHhPolw7rIjztWxMPLYmodlaY69dQ6OvZQTuLk=; b=s78NIFlXBBc1tlKMZp0w9ch21
	ajxKkHCAQxdHkbIR6eF2LwaILNC/YTFELQB9I7KNFAkXXD4XQVa7OZ5+WazWSB/zsutHaACiUf5JK
	SF2EPh8OFh1Fb251EWvGN45hpZmDA+7sP8lD1vxzNcTl3muQoaG91spkNn6nDdCwWCFasNnae7CIC
	uvi/+utNWgwz+0SnJFsS3mPEQoraBW7JYfVO8aTLBy8Lg4YPRFu5mGRBwBB1Yg09qXB8Efw6q61bB
	JpuBRiVOBPx0M9G+ug1Cn83+4QPSXbuBphEK00uLholWOBTa11xI3yamKc/A99WK5IzPnxsixaXuZ
	p9iFx+UVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iE8W1-00057L-GW; Sat, 28 Sep 2019 08:55:45 +0000
Received: from 4.mo68.mail-out.ovh.net ([46.105.59.63])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iE8Vx-00056r-9s
 for linux-afs@lists.infradead.org; Sat, 28 Sep 2019 08:55:43 +0000
Received: from player731.ha.ovh.net (unknown [10.108.54.108])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 00FAF1446DA
 for <linux-afs@lists.infradead.org>; Sat, 28 Sep 2019 10:55:34 +0200 (CEST)
Received: from sk2.org (gw.sk2.org [88.186.243.14])
 (Authenticated sender: steve@sk2.org)
 by player731.ha.ovh.net (Postfix) with ESMTPSA id 6DB3AA260E0B;
 Sat, 28 Sep 2019 08:55:23 +0000 (UTC)
Date: Sat, 28 Sep 2019 10:55:57 +0200
From: Stephen Kitt <steve@sk2.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: use flexible array members, not zero-length
Message-ID: <20190928105557.221fb119@heffalump.sk2.org>
In-Reply-To: <20190928011639.7c983e77@lwn.net>
References: <20190927142927.27968-1-steve@sk2.org>
 <20190928011639.7c983e77@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2307531860306840965
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeekgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190928_015541_488743_530B4EA9 
X-CRM114-Status: GOOD (  14.08  )
X-Spam-Score: 0.7 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.7 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [46.105.59.63 listed in list.dnswl.org]
 0.1 URIBL_SBL_A Contains URL's A record listed in the Spamhaus SBL
 blocklist [URIs: sk2.org]
 0.6 URIBL_SBL Contains an URL's NS IP listed in the Spamhaus SBL
 blocklist [URIs: sk2.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, bpf@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2436899062645574971=="
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

--===============2436899062645574971==
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/6lwZ.M0KIAOHFlu0tCvHt6N"; protocol="application/pgp-signature"

--Sig_/6lwZ.M0KIAOHFlu0tCvHt6N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 28 Sep 2019 01:16:39 -0600, Jonathan Corbet <corbet@lwn.net> wrote:
> On Fri, 27 Sep 2019 16:29:27 +0200
> Stephen Kitt <steve@sk2.org> wrote:
> > diff --git a/Documentation/bpf/btf.rst b/Documentation/bpf/btf.rst
> > index 4d565d202ce3..24ce50fc1fc1 100644
> > --- a/Documentation/bpf/btf.rst
> > +++ b/Documentation/bpf/btf.rst
> > @@ -670,7 +670,7 @@ func_info for each specific ELF section.::
> >          __u32   sec_name_off; /* offset to section name */
> >          __u32   num_info;
> >          /* Followed by num_info * record_size number of bytes */
> > -        __u8    data[0];
> > +        __u8    data[];
> >       }; =20
>=20
> I only checked this one, but found what I had expected: the actual
> definition of this structure (found in tools/lib/bpf/libbpf_internal.h)
> says "data[0]".  We can't really make the documentation read the way we
> *wish* the source would be, we need to document reality.
>=20
> I'm pretty sure that most of the other examples will be the same.

Aargh, yes, of course, thanks for checking! I was locked in a =E2=80=9Cpres=
criptive=E2=80=9D
documentation mode, but this type of documentation has to be descriptive
since it=E2=80=99s documenting shared structures, not structures which deve=
lopers
have to write.

> If you really want to fix these, the right solution is to fix the offendi=
ng
> structures =E2=80=94 one patch per structure =E2=80=94 in the source, the=
n update the
> documentation to match the new reality.

Yes. I have a Coccinelle script which takes care of the code, but it doesn=
=E2=80=99t
work for docs ;-).

Wouldn=E2=80=99t it be better to update the docs simultaneously in each pat=
ch which
fixes a structure? Or is that unworkable with current development practices?

Regards,

Stephen

--Sig_/6lwZ.M0KIAOHFlu0tCvHt6N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl2PIB4ACgkQgNMC9Yht
g5zsMRAAlq0QqSRyK8SmkZrHHi9ZrsTUhy9uZ0IHYFiFaDl5/P9JHqCOMgWCqjLI
vjR/pTj6+Gc1h/87XgrOoWt72eqGmkP5TfqRFfrMmgTKyabiqnXjrhEEy/JpEegp
wI1qjOrs/y2gWacnVssUmbrprK7dZWQ9DxSA5glafzxWyZgLgT5dEGCQKdHQX+1v
QdYG7wZChDSuVUFxVryqIJM0zKGrOhbSlj3xHSGLDZa6+k6pvM+Sv+i7de0EJHkZ
qssPQCsxIXBvS0Md1f1NqHS5K+7y4inCoh3U88A/YfEw2zPH7CwGXo+NrD8ihKkp
aSAPICVP+ei48uuj8zGZcoCrCql7BiKSNgiTgguu3VZQ9+lIkzGuuidw84RcI4BU
OHo3sKz1HE9+QeMowg0QcEpE5RJflJDMb/9PFciMkpSjFTOAZHQvvA8zZkLjVm2Y
kSVmIoYAtGKb7PxqwBmZYyWGaHS090pie8PrdGAfo/KJPSHzPlK8ZnEwZJqGb2Ko
GUyw/xNFefziyA35xSptguK4K4sSsIeD+Z5+Vt6xvyATEf5PS+9pQsKL3uxczUEV
2WDYg6SXW2CU2nEpkGndHIQPcQSKZE2hASRwL7dtl89nM5tgviYAfOWdo1eBje0Q
HkXRsGAUe6tlnlUDBjYa4VYLJMZS5vYTjY551oHzlfMmGQErvQM=
=rxn4
-----END PGP SIGNATURE-----

--Sig_/6lwZ.M0KIAOHFlu0tCvHt6N--


--===============2436899062645574971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs

--===============2436899062645574971==--

