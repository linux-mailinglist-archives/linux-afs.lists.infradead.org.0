Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F1314489B
	for <lists+linux-afs@lfdr.de>; Wed, 22 Jan 2020 00:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=3+5DI80v0/XOpG/5OuP6U/Mnz84QEBY+Lk6WvE//tvw=; b=dh2
	LPjQZcLNyphHROHTj8u3mQDWAU+ssHNpgDA036K/0cWF6l8GQlgs2Ci/rmsHi9oSkyHldkkdDR9+p
	WLHAWHWdQQKx5YNd1HYVXn9iR9gmWHxjqXdXm+W2GNer2Ymxg4jsxXFcGr2pZLa8Q60VlZ8FuCEa9
	JvO/Pz4VFjdMwg5b9uRxNwumCjNraIpqJchSH7NhffjtVuyJ8sJjlSusl9n3VrkILR8c5Y/BPlrBI
	z/3Bi9wdJm8sjex3VDV6r47YZdn8zdttd2iawDU+Osn/NFripmRDB9g1uB9ADr/7uNitXQMsJUvOs
	mxkdcAxiHw9cCqSWjKyrBz5GE/Czu1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu3NV-0002U0-VC; Tue, 21 Jan 2020 23:56:13 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu3NT-0002TE-2Q
 for linux-afs@lists.infradead.org; Tue, 21 Jan 2020 23:56:12 +0000
Received: by mail-il1-f200.google.com with SMTP id c5so3478467ilo.9
 for <linux-afs@lists.infradead.org>; Tue, 21 Jan 2020 15:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to
 :content-transfer-encoding;
 bh=FP19rMCZrA8aEYztsjM0/NcqndOiX+PGABvAiUHnfqc=;
 b=loQVfD99L/aL8SZ6ilqKtSuvykqWNhPFVY2EvhXoScQ7NrKnKOASRb29tMb+XdEYcW
 l+qeDJgpVsVdNJOnrRJuob7wVAye93q8uRNuOkVcVnjfx26YSO/yP19lXUD4SMJIoLZH
 chRkDtb5edjugMnwW505hOXtAe9uUU70LH2+K504wMnLCnPrMdu3RDTWOpHGXNR1IvMq
 aY6DdBQ64dPBoi4Alp7vTGGzL8QFn/3M2S0j4VipKOdyxa8R+ZSvRR/SG3pukOFOvwTK
 BFITEy0OV6VBCkCNOjYkThKhY8wMZ/HnqrnLm4JMD3DrvH66tlpvFjnDeXSZdPd1jtnB
 reBA==
X-Gm-Message-State: APjAAAUIoLz08d1z5XRrFyhN0zFqZiFjhH9uOS1IX2Ft8W/hlRdjmkHU
 Ppo7Uu9FZEJP/mRNa1Tneo4JxK72I6pMARAWZxO/M47KZdjo
X-Google-Smtp-Source: APXvYqymwTKfclatTuAPFNQc//9Mq4Cfj0YLxr8Id5jOR9C12eseDN6UMCR/SfcMmBZfnlnza7ruT/x8kczjuGhPyumIcvUsEo6K
MIME-Version: 1.0
X-Received: by 2002:a6b:731a:: with SMTP id e26mr4920571ioh.254.1579650968613; 
 Tue, 21 Jan 2020 15:56:08 -0800 (PST)
Date: Tue, 21 Jan 2020 15:56:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000da7a79059caf2656@google.com>
Subject: WARNING in __proc_create (2)
From: syzbot <syzbot+b904ba7c947a37b4b291@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_155611_111731_9EDBC17D 
X-CRM114-Status: UNSURE (   4.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

SGVsbG8sCgpzeXpib3QgZm91bmQgdGhlIGZvbGxvd2luZyBjcmFzaCBvbjoKCkhFQUQgY29tbWl0
OiAgICBkOTZkODc1ZSBNZXJnZSB0YWcgJ2ZpeGVzX2Zvcl92NS41LXJjOCcgb2YgZ2l0Oi8vZ2l0
Lmtlcm5lLi4KZ2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCmNvbnNvbGUgb3V0cHV0OiBodHRwczov
L3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xM2I3YjgwZGUwMDAwMAprZXJuZWwg
Y29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC8uY29uZmlnP3g9ODNjMDBh
ZmNhOWNmNTE1MwpkYXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
YnVnP2V4dGlkPWI5MDRiYTdjOTQ3YTM3YjRiMjkxCmNvbXBpbGVyOiAgICAgICBjbGFuZyB2ZXJz
aW9uIDEwLjAuMCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0LyBjMjQ0MzE1
NWEwZmIyNDVjOGYxN2YyYzFjNzJiNmVhMzkxZTg2ZTgxKQpzeXogcmVwcm86ICAgICAgaHR0cHM6
Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5zeXo/eD0xMmM5NjE4NWUwMDAwMApDIHJl
cHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTRm
ODU5YzllMDAwMDAKCklNUE9SVEFOVDogaWYgeW91IGZpeCB0aGUgYnVnLCBwbGVhc2UgYWRkIHRo
ZSBmb2xsb3dpbmcgdGFnIHRvIHRoZSBjb21taXQ6ClJlcG9ydGVkLWJ5OiBzeXpib3QrYjkwNGJh
N2M5NDdhMzdiNGIyOTFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQoKLS0tLS0tLS0tLS0tWyBj
dXQgaGVyZSBdLS0tLS0tLS0tLS0tCm5hbWUgJ++/ve+/vS9ddXdvLCLvv70WY++/vWFj77+977+9
77+977+977+9W++/vRgk77+9NXh+77+9c++/vSbvv710d33vv73vv73vv716Fe+/vWNwEignCldB
Uk5JTkc6IENQVTogMCBQSUQ6IDM0ODkgYXQgZnMvcHJvYy9nZW5lcmljLmM6MTc4IF9feGxhdGVf
cHJvY19uYW1lIGZzL3Byb2MvZ2VuZXJpYy5jOjE3OCBbaW5saW5lXQpXQVJOSU5HOiBDUFU6IDAg
UElEOiAzNDg5IGF0IGZzL3Byb2MvZ2VuZXJpYy5jOjE3OCB4bGF0ZV9wcm9jX25hbWUgZnMvcHJv
Yy9nZW5lcmljLmM6MTk0IFtpbmxpbmVdCldBUk5JTkc6IENQVTogMCBQSUQ6IDM0ODkgYXQgZnMv
cHJvYy9nZW5lcmljLmM6MTc4IF9fcHJvY19jcmVhdGUrMHgyNWEvMHhiNjAgZnMvcHJvYy9nZW5l
cmljLmM6Mzg3Cktlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBwYW5pY19vbl93YXJuIHNldCAu
Li4KQ1BVOiAwIFBJRDogMzQ4OSBDb21tOiBrd29ya2VyLzA6OCBOb3QgdGFpbnRlZCA1LjUuMC1y
Yzctc3l6a2FsbGVyICMwCkhhcmR3YXJlIG5hbWU6IEdvb2dsZSBHb29nbGUgQ29tcHV0ZSBFbmdp
bmUvR29vZ2xlIENvbXB1dGUgRW5naW5lLCBCSU9TIEdvb2dsZSAwMS8wMS8yMDExCldvcmtxdWV1
ZTogYWZzIGFmc19tYW5hZ2VfY2VsbApDYWxsIFRyYWNlOgogX19kdW1wX3N0YWNrIGxpYi9kdW1w
X3N0YWNrLmM6NzcgW2lubGluZV0KIGR1bXBfc3RhY2srMHgxZmIvMHgzMTggbGliL2R1bXBfc3Rh
Y2suYzoxMTgKIHBhbmljKzB4MjY0LzB4N2E5IGtlcm5lbC9wYW5pYy5jOjIyMQogX193YXJuKzB4
MjA5LzB4MjEwIGtlcm5lbC9wYW5pYy5jOjU4MgogcmVwb3J0X2J1ZysweDFiNi8weDJmMCBsaWIv
YnVnLmM6MTk1CiBmaXh1cF9idWcgYXJjaC94ODYva2VybmVsL3RyYXBzLmM6MTc0IFtpbmxpbmVd
CiBkb19lcnJvcl90cmFwKzB4ZGEvMHg0NDAgYXJjaC94ODYva2VybmVsL3RyYXBzLmM6MjY3CiBk
b19pbnZhbGlkX29wKzB4MzYvMHg0MCBhcmNoL3g4Ni9rZXJuZWwvdHJhcHMuYzoyODYKIGludmFs
aWRfb3ArMHgyMy8weDMwIGFyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlM6MTAyNwpSSVA6IDAwMTA6
X194bGF0ZV9wcm9jX25hbWUgZnMvcHJvYy9nZW5lcmljLmM6MTc4IFtpbmxpbmVdClJJUDogMDAx
MDp4bGF0ZV9wcm9jX25hbWUgZnMvcHJvYy9nZW5lcmljLmM6MTk0IFtpbmxpbmVdClJJUDogMDAx
MDpfX3Byb2NfY3JlYXRlKzB4MjVhLzB4YjYwIGZzL3Byb2MvZ2VuZXJpYy5jOjM4NwpDb2RlOiAw
NyAwMCAwMCA0OSA4OSBjNiBlOCBmNSA0OCA5NCBmZiBlOSA1NiBmZSBmZiBmZiBlOCBlYiA0OCA5
NCBmZiA0OCA4YiA3NSBiOCA0NSAzMSBlZCA0OCBjNyBjNyAzOSA1MiBlMSA4OCAzMSBjMCBlOCAz
NiA1NSA2NiBmZiA8MGY+IDBiIDQ4IGM3IGM3IDg4IDQzIDExIDg5IGU4IDA4IGRlIDFhIDA2IGU5
IGJjIDAwIDAwIDAwIGU4IGJlIDQ4ClJTUDogMDAxODpmZmZmYzkwMDBiNjE3YTkwIEVGTEFHUzog
MDAwMTAyNDYKUkFYOiBkNWU1YjY1ZTE2NWM5YzAwIFJCWDogMDAwMDAwMDAwMDAwMDAwNSBSQ1g6
IGZmZmY4ODgwOWJiM2UxNDAKUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAw
MDAwMSBSREk6IDAwMDAwMDAwMDAwMDAwMDAKUkJQOiBmZmZmYzkwMDBiNjE3YjAwIFIwODogZmZm
ZmZmZmY4MTVmOWQyNCBSMDk6IGZmZmZmYmZmZjEzY2QxMWUKUjEwOiBmZmZmZmJmZmYxM2NkMTFl
IFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IGRmZmZmYzAwMDAwMDAwMDAKUjEzOiAwMDAwMDAw
MDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAwMiBSMTU6IDAwMDAwMDAwMDAwMDAwMDAKIHBy
b2NfbWtkaXJfZGF0YSsweDhiLzB4MTUwIGZzL3Byb2MvZ2VuZXJpYy5jOjQ3MwogcHJvY19uZXRf
bWtkaXIgaW5jbHVkZS9saW51eC9wcm9jX2ZzLmg6MTM5IFtpbmxpbmVdCiBhZnNfcHJvY19jZWxs
X3NldHVwKzB4OWQvMHgxNTAgZnMvYWZzL3Byb2MuYzo2MTAKIGFmc19hY3RpdmF0ZV9jZWxsIGZz
L2Fmcy9jZWxsLmM6NTkxIFtpbmxpbmVdCiBhZnNfbWFuYWdlX2NlbGwrMHg3NTAvMHgxNTAwIGZz
L2Fmcy9jZWxsLmM6NjczCiBwcm9jZXNzX29uZV93b3JrKzB4N2Y1LzB4MTBkMCBrZXJuZWwvd29y
a3F1ZXVlLmM6MjI2NAogd29ya2VyX3RocmVhZCsweGJiYy8weDE2MzAga2VybmVsL3dvcmtxdWV1
ZS5jOjI0MTAKIGt0aHJlYWQrMHgzMzIvMHgzNTAga2VybmVsL2t0aHJlYWQuYzoyNTUKIHJldF9m
cm9tX2ZvcmsrMHgyNC8weDMwIGFyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlM6MzUyCktlcm5lbCBP
ZmZzZXQ6IGRpc2FibGVkClJlYm9vdGluZyBpbiA4NjQwMCBzZWNvbmRzLi4KCgotLS0KVGhpcyBi
dWcgaXMgZ2VuZXJhdGVkIGJ5IGEgYm90LiBJdCBtYXkgY29udGFpbiBlcnJvcnMuClNlZSBodHRw
czovL2dvby5nbC90cHNtRUogZm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgc3l6Ym90LgpzeXpi
b3QgZW5naW5lZXJzIGNhbiBiZSByZWFjaGVkIGF0IHN5emthbGxlckBnb29nbGVncm91cHMuY29t
LgoKc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlzIGJ1ZyByZXBvcnQuIFNlZToKaHR0cHM6
Ly9nb28uZ2wvdHBzbUVKI3N0YXR1cyBmb3IgaG93IHRvIGNvbW11bmljYXRlIHdpdGggc3l6Ym90
LgpzeXpib3QgY2FuIHRlc3QgcGF0Y2hlcyBmb3IgdGhpcyBidWcsIGZvciBkZXRhaWxzIHNlZToK
aHR0cHM6Ly9nb28uZ2wvdHBzbUVKI3Rlc3RpbmctcGF0Y2hlcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFmcwo=
