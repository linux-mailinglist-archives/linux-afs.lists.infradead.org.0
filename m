Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E40377D9C9
	for <lists+linux-afs@lfdr.de>; Thu,  1 Aug 2019 13:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Du52RIDzDa61HXg0m6pezNLpAQQWjv6fGfAiLOEZNZ8=; b=HZRyXAnltdT2AL
	v1sz65CTTRPxRHbDo5CyUFDgMxPY+0rpvJXCmf99oZ/O9y7mO4uI1iYzHrak7CiZ2S8UojCvCmp39
	dQQlslckFM3K6Odxc3P90tdCUSc4U3vdHGZpbLokaLlzWaAH6kbOBresHn5bYv0HQGKSj3PcPQZ+j
	sbdmy2mzpx1wTQZ+AESH6ysWASAN1AiwxE0X+8bTdjlS9EX6PuIMDuDvIa1sbxR0Srf53x35Y8wpl
	C2nem902LT1ZeK6Hg+gAypRZ2JSFe+dTtDeBehXoT9jgfuRH7DZifBIhxvf49TQzA7jE/Q5D50te+
	qmJby7H+PNGtQPGq5NlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht8p3-0007nP-Pg; Thu, 01 Aug 2019 11:00:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsrvd-00077J-W0
 for linux-afs@lists.infradead.org; Wed, 31 Jul 2019 16:58:19 +0000
Received: by mail-pg1-x52e.google.com with SMTP id l21so32331340pgm.3
 for <linux-afs@lists.infradead.org>; Wed, 31 Jul 2019 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ec+TCYltRZ+0BbWthj8J/cCYhvIm8sHJdK79dSthSdY=;
 b=jvJzTZBlmSeEYN+aZgAO0eQUN/Tk2RrbbnkPYld1oxWv6SRiwJlYMsrXwGgUEYUa4O
 c8IP9mSiBWfPnPUoMsfcP+avh6N+yXfmsFTOhlk/oLSPrOg61dplHWROkWXV2YCWs182
 J1E7UMPHDHumM9VHcwzfpneV57lGJ2pZrUb9g6VVDdWdrNFamw+D+bnFF2HIsMO1otBP
 QaYE36dCS32zu5Yfvc5rPyb7yUgw4D3O28kjNq/esNyy56+NllVY419E9QCcXJj+lNZ9
 n1nsl1oo8VqunmZKSa2BQZLlBHcA0KpEmN1VJDvIZg0i5KfyYr6715FMiAk9Bj8dpLw/
 L5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ec+TCYltRZ+0BbWthj8J/cCYhvIm8sHJdK79dSthSdY=;
 b=qRotDA1B474iChWuJdQI8Hsbk62H+mULD3keXTkOli0Ar+kklOKIM1w6hJJ/j/Z4nK
 TUjgo21kdjsCgHn63yLZPd2nYL7kdiVho43C4aEgxvF3xtz5pGnnsFWg6B+6hY1xmk5Y
 IrwIAZgMB0n+A0IuTFFcf8mZKIakEjdsGMjX6uOdDTHr1hAh7RnAIUXs1DScBsnOWPOF
 D65QkTvqAVEYYk6n9/+qvGx71dCwrjaXjd8GZlB/2oQaHJXsNn4gQlu7EZ2RESVRmk3R
 +6NQkZR+fvhacFYCDKYHQ0j1/2JjzjsBs3/IBPZHDB0lz/+dPWcpirxJiwRAtdmlt5jv
 F5Hw==
X-Gm-Message-State: APjAAAV5TzPbpeM5sHPNM0rRmi8/EGF/O5tWx/hEnT6PwMB600bZaDPE
 t/qR7LISc43ClbDYyKmH+D0=
X-Google-Smtp-Source: APXvYqwAtm9Oi2dzrneje86zRIini04LNIAE0QYgVNa/tnC71lp2ENoOwAUjSIsPUfgwsF181KbaYg==
X-Received: by 2002:a62:6:: with SMTP id 6mr47453483pfa.159.1564592296986;
 Wed, 31 Jul 2019 09:58:16 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.gmail.com with ESMTPSA id f72sm2245954pjg.10.2019.07.31.09.58.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:58:16 -0700 (PDT)
From: Mark Salyzyn <salyzyn@android.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v13 1/5] overlayfs: check CAP_DAC_READ_SEARCH before issuing
 exportfs_decode_fh
Date: Wed, 31 Jul 2019 09:57:56 -0700
Message-Id: <20190731165803.4755-2-salyzyn@android.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190731165803.4755-1-salyzyn@android.com>
References: <20190731165803.4755-1-salyzyn@android.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_095818_033792_8A8D15BF 
X-CRM114-Status: GOOD (  13.13  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:52e listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Thu, 01 Aug 2019 04:00:35 -0700
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S . Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, ocfs2-devel@oss.oracle.com,
 netdev@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 linux-security-module@vger.kernel.org, cluster-devel@redhat.com,
 Vyacheslav Dubeyko <slava@dubeyko.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
 Vivek Goyal <vgoyal@redhat.com>, Chao Yu <yuchao0@huawei.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@gmail.com>,
 ecryptfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, reiserfs-devel@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-nfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mathieu Malaterre <malat@debian.org>,
 kernel-team@android.com, Miklos Szeredi <miklos@szeredi.hu>,
 Jeff Layton <jlayton@kernel.org>, linux-unionfs@vger.kernel.org,
 stable@vger.kernel.org, Mark Salyzyn <salyzyn@android.com>,
 Steve French <sfrench@samba.org>,
 =?UTF-8?q?Ernesto=20A=20=2E=20Fern=C3=A1ndez?=
 <ernesto.mnd.fernandez@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>, Jan Kara <jack@suse.com>,
 Bob Peterson <rpeterso@redhat.com>, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

QXNzdW1wdGlvbiBuZXZlciBjaGVja2VkLCBzaG91bGQgZmFpbCBpZiB0aGUgbW91bnRlciBjcmVk
cyBhcmUgbm90CnN1ZmZpY2llbnQuCgpTaWduZWQtb2ZmLWJ5OiBNYXJrIFNhbHl6eW4gPHNhbHl6
eW5AYW5kcm9pZC5jb20+CkNjOiBNaWtsb3MgU3plcmVkaSA8bWlrbG9zQHN6ZXJlZGkuaHU+CkNj
OiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PgpDYzogVml2ZWsgR295YWwgPHZnb3lh
bEByZWRoYXQuY29tPgpDYzogRXJpYyBXLiBCaWVkZXJtYW4gPGViaWVkZXJtQHhtaXNzaW9uLmNv
bT4KQ2M6IEFtaXIgR29sZHN0ZWluIDxhbWlyNzNpbEBnbWFpbC5jb20+CkNjOiBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KQ2M6IFN0ZXBoZW4gU21hbGxleSA8c2RzQHR5Y2hv
Lm5zYS5nb3Y+CkNjOiBsaW51eC11bmlvbmZzQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtZG9j
QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzoga2Vy
bmVsLXRlYW1AYW5kcm9pZC5jb20KQ2M6IEVyaWMgVmFuIEhlbnNiZXJnZW4gPGVyaWN2aEBnbWFp
bC5jb20+CkNjOiBMYXRjaGVzYXIgSW9ua292IDxsdWNob0Bpb25rb3YubmV0PgpDYzogRG9taW5p
cXVlIE1hcnRpbmV0IDxhc21hZGV1c0Bjb2Rld3JlY2sub3JnPgpDYzogRGF2aWQgSG93ZWxscyA8
ZGhvd2VsbHNAcmVkaGF0LmNvbT4KQ2M6IENocmlzIE1hc29uIDxjbG1AZmIuY29tPgpDYzogSm9z
ZWYgQmFjaWsgPGpvc2VmQHRveGljcGFuZGEuY29tPgpDYzogRGF2aWQgU3RlcmJhIDxkc3RlcmJh
QHN1c2UuY29tPgpDYzogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KQ2M6IFNhZ2Ug
V2VpbCA8c2FnZUByZWRoYXQuY29tPgpDYzogSWx5YSBEcnlvbW92IDxpZHJ5b21vdkBnbWFpbC5j
b20+CkNjOiBTdGV2ZSBGcmVuY2ggPHNmcmVuY2hAc2FtYmEub3JnPgpDYzogVHlsZXIgSGlja3Mg
PHR5aGlja3NAY2Fub25pY2FsLmNvbT4KQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpDYzog
VGhlb2RvcmUgVHMnbyA8dHl0c29AbWl0LmVkdT4KQ2M6IEFuZHJlYXMgRGlsZ2VyIDxhZGlsZ2Vy
Lmtlcm5lbEBkaWxnZXIuY2E+CkNjOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgpD
YzogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgpDYzogQm9iIFBldGVyc29uIDxycGV0ZXJz
b0ByZWRoYXQuY29tPgpDYzogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuYmFAcmVkaGF0LmNv
bT4KQ2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IFJpY2hhcmQg
V2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CkNjOiBEYXZlIEtsZWlrYW1wIDxzaGFnZ3lAa2Vy
bmVsLm9yZz4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CkNjOiBUZWp1biBIZW8gPHRqQGtlcm5lbC5vcmc+CkNjOiBUcm9uZCBNeWtsZWJ1c3QgPHRy
b25kLm15a2xlYnVzdEBoYW1tZXJzcGFjZS5jb20+CkNjOiBBbm5hIFNjaHVtYWtlciA8YW5uYS5z
Y2h1bWFrZXJAbmV0YXBwLmNvbT4KQ2M6IE1hcmsgRmFzaGVoIDxtYXJrQGZhc2hlaC5jb20+CkNj
OiBKb2VsIEJlY2tlciA8amxiZWNAZXZpbHBsYW4ub3JnPgpDYzogSm9zZXBoIFFpIDxqb3NlcGgu
cWlAbGludXguYWxpYmFiYS5jb20+CkNjOiBNaWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJvbmQu
Y29tPgpDYzogTWFydGluIEJyYW5kZW5idXJnIDxtYXJ0aW5Ab21uaWJvbmQuY29tPgpDYzogQWxl
eGFuZGVyIFZpcm8gPHZpcm9AemVuaXYubGludXgub3JnLnVrPgpDYzogUGhpbGxpcCBMb3VnaGVy
IDxwaGlsbGlwQHNxdWFzaGZzLm9yZy51az4KQ2M6IERhcnJpY2sgSi4gV29uZyA8ZGFycmljay53
b25nQG9yYWNsZS5jb20+CkNjOiBsaW51eC14ZnNAdmdlci5rZXJuZWwub3JnCkNjOiBIdWdoIERp
Y2tpbnMgPGh1Z2hkQGdvb2dsZS5jb20+CkNjOiBEYXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVt
bG9mdC5uZXQ+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpD
YzogTWF0aGlldSBNYWxhdGVycmUgPG1hbGF0QGRlYmlhbi5vcmc+CkNjOiBFcm5lc3RvIEEuIEZl
cm7DoW5kZXogPGVybmVzdG8ubW5kLmZlcm5hbmRlekBnbWFpbC5jb20+CkNjOiBWeWFjaGVzbGF2
IER1YmV5a28gPHNsYXZhQGR1YmV5a28uY29tPgpDYzogdjlmcy1kZXZlbG9wZXJAbGlzdHMuc291
cmNlZm9yZ2UubmV0CkNjOiBsaW51eC1hZnNAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgt
YnRyZnNAdmdlci5rZXJuZWwub3JnCkNjOiBjZXBoLWRldmVsQHZnZXIua2VybmVsLm9yZwpDYzog
bGludXgtY2lmc0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1i
YS5vcmcKQ2M6IGVjcnlwdGZzQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtZXh0NEB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0CkNjOiBs
aW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZwpDYzogY2x1c3Rlci1kZXZlbEByZWRoYXQuY29t
CkNjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogamZzLWRpc2N1c3Npb25AbGlz
dHMuc291cmNlZm9yZ2UubmV0CkNjOiBsaW51eC1uZnNAdmdlci5rZXJuZWwub3JnCkNjOiBvY2Zz
Mi1kZXZlbEBvc3Mub3JhY2xlLmNvbQpDYzogZGV2ZWxAbGlzdHMub3JhbmdlZnMub3JnCkNjOiBy
ZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzog
bmV0ZGV2QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc2VjdXJpdHktbW9kdWxlQHZnZXIua2Vy
bmVsLm9yZwpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDQuNCwgNC45LCA0LjE0ICYgNC4x
OQotLS0KdjExICsgdjEyICsgdjEzIC0gcmViYXNlCgp2MTA6Ci0gcmV0dXJuIE5VTEwgcmF0aGVy
IHRoYW4gRVJSX1BUUigtRVBFUk0pCi0gZGlkIF9ub3RfIGFkZCBpdCBvdmxfY2FuX2RlY29kZV9m
aCgpIGJlY2F1c2Ugb2YgY2hhbmdlcyBzaW5jZSBsYXN0CiAgcmV2aWV3LCBzdXNwZWN0IG5lZWRz
IHRvIGJlIGFkZGVkIHRvIG92bF9sb3dlcl91dWlkX29rKCk/Cgp2OCArIHY5OgotIHJlYmFzZQoK
djc6Ci0gVGhpcyB0aW1lIGZvciByZWFsegoKdjY6Ci0gcmViYXNlCgp2NToKLSBkZXBlbmRlbmN5
IG9mICJvdmVybGF5ZnM6IG92ZXJyaWRlX2NyZWRzPW9mZiBvcHRpb24gYnlwYXNzIGNyZWF0b3Jf
Y3JlZCIKLS0tCiBmcy9vdmVybGF5ZnMvbmFtZWkuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvb3ZlcmxheWZzL25hbWVpLmMgYi9mcy9v
dmVybGF5ZnMvbmFtZWkuYwppbmRleCBlOTcxN2MyZjdkNDUuLjk3MDJmMGQ1MzA5ZCAxMDA2NDQK
LS0tIGEvZnMvb3ZlcmxheWZzL25hbWVpLmMKKysrIGIvZnMvb3ZlcmxheWZzL25hbWVpLmMKQEAg
LTE2MSw2ICsxNjEsOSBAQCBzdHJ1Y3QgZGVudHJ5ICpvdmxfZGVjb2RlX3JlYWxfZmgoc3RydWN0
IG92bF9maCAqZmgsIHN0cnVjdCB2ZnNtb3VudCAqbW50LAogCWlmICghdXVpZF9lcXVhbCgmZmgt
PnV1aWQsICZtbnQtPm1udF9zYi0+c191dWlkKSkKIAkJcmV0dXJuIE5VTEw7CiAKKwlpZiAoIWNh
cGFibGUoQ0FQX0RBQ19SRUFEX1NFQVJDSCkpCisJCXJldHVybiBOVUxMOworCiAJYnl0ZXMgPSAo
ZmgtPmxlbiAtIG9mZnNldG9mKHN0cnVjdCBvdmxfZmgsIGZpZCkpOwogCXJlYWwgPSBleHBvcnRm
c19kZWNvZGVfZmgobW50LCAoc3RydWN0IGZpZCAqKWZoLT5maWQsCiAJCQkJICBieXRlcyA+PiAy
LCAoaW50KWZoLT50eXBlLAotLSAKMi4yMi4wLjc3MC5nMGYyYzRhMzdmZC1nb29nCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFmcwo=
