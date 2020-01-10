Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059D137649
	for <lists+linux-afs@lfdr.de>; Fri, 10 Jan 2020 19:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BhHh24P6x0AaHmUJQcEKghSxJPKPL7daUONkS5qel8U=; b=MwPB0lSD89vPwH
	Nlau2ewdmOjz6aKMZ5f6cD7LQ2JRWhw7ZIi0Kwb5dX/7gL9s8kbaMZJxg/dr/10650b/TaJttXgmP
	R1yTqHzN2u8sOwfPUAZwISl2LwK8TNmwItiEkrmvQFAQwmnG9tRU5MDvhIgSl0Aj3NFU4OYWBU17M
	641exQnJXXrNIlFq6OmCs9oD/Yz7Y5O+Wea1Hdko2t1yQX1RPhhuQ8OHTCusi+bch6PTtFqSGi+R7
	mPqwpnOTJlXqURcgCDlZU8GcGc6XrX7pNXn6a8/1XNc9UKuJ4SrodGwfXSq7eJA1Wg+ZuSbl0gXXz
	kjZBAYfGK80daEYdPkew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipzGc-0006R9-Dl; Fri, 10 Jan 2020 18:44:18 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipzGZ-0006PR-Bl
 for linux-afs@lists.infradead.org; Fri, 10 Jan 2020 18:44:17 +0000
Received: by mail-il1-f199.google.com with SMTP id h87so2136303ild.11
 for <linux-afs@lists.infradead.org>; Fri, 10 Jan 2020 10:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to
 :content-transfer-encoding;
 bh=TRXVUW5VdRfR8tbpVKkySd5KgoB+rtYOEj2qlqOy3d8=;
 b=CN70gESy6ntorxOn1Bg/G5/nVtP1Zg3E1xHEyBsu3QhMrrW59GNk9poP/XeeS3NlS3
 eCLiirAg3zCUnXh68iHS0uAmbqzDx/gtvASwRqQASc/DlPFD7DBwbzJWdJCEn50CnM9R
 WLBHiFa4RiZId1G1Ej+48J+JXLwfid3mOWwsNOiClAqyrhXrw67mpCYFVI2HnOX5nIYe
 IBJy4lcTw5M8Mj5CML28EbWXWLG+KV3VRYf6lJNEflGyO0lmblFqMRFJyHuBJzZnf2+T
 ipDyuAaNc8rKGe9VUmtw0IhNZFXcodv5eig2ZUKAuynP7laHEseISgt69EoKQ8UgClVH
 NqdA==
X-Gm-Message-State: APjAAAUJkqUfjpKyzJVCwPklqXYWWVQn9258Z8wFcC0otz5MNBD45tLZ
 I/wgZQw97XLkrLrbpqITRlT6KiBRx4Qt+HthvABbXTO7N6wb
X-Google-Smtp-Source: APXvYqztOglm25N3WF3mJHQF32KEiLuqz1sb1hpDTNozKqaL/axJkCoX9YYR3F10NTnBdFwXcfiQqcfzMl/AEDKxGEkoV3QsTkAn
MIME-Version: 1.0
X-Received: by 2002:a92:730d:: with SMTP id o13mr3882562ilc.174.1578681851134; 
 Fri, 10 Jan 2020 10:44:11 -0800 (PST)
Date: Fri, 10 Jan 2020 10:44:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f349be059bcd827a@google.com>
Subject: WARNING in __xlate_proc_name (2)
From: syzbot <syzbot+016c7186c1d55575bab8@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-afs@lists.infradead.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_104415_403229_9EC9F628 
X-CRM114-Status: UNSURE (   5.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.6 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.6 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

SGVsbG8sDQoNCnN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGNyYXNoIG9uOg0KDQpIRUFEIGNv
bW1pdDogICAgYjA3ZjYzNmYgTWVyZ2UgdGFnICd0cG1kZC1uZXh0LTIwMjAwMTA4JyBvZiBnaXQ6
Ly9naXQuaW5mci4uDQpnaXQgdHJlZTogICAgICAgdXBzdHJlYW0NCmNvbnNvbGUgb3V0cHV0OiBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xMjkzZjU0OWUwMDAwMA0K
a2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94
PTE4Njk4YzBjMjQwYmE2MTYNCmRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS9idWc/ZXh0aWQ9MDE2YzcxODZjMWQ1NTU3NWJhYjgNCmNvbXBpbGVyOiAgICAgICBn
Y2MgKEdDQykgOS4wLjAgMjAxODEyMzEgKGV4cGVyaW1lbnRhbCkNCnN5eiByZXBybzogICAgICBo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcHJvLnN5ej94PTEzYmFiYzg1ZTAwMDAw
DQpDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5j
P3g9MTRiMTRkMTVlMDAwMDANCg0KVGhlIGJ1ZyB3YXMgYmlzZWN0ZWQgdG86DQoNCmNvbW1pdCA5
ODk3ODJkY2RjOTFhNWU2ZDU5OTljN2E1MmE4NGE2MGEwODExZTU2DQpBdXRob3I6IERhdmlkIEhv
d2VsbHMgPGRob3dlbGxzQHJlZGhhdC5jb20+DQpEYXRlOiAgIFRodSBOb3YgMiAxNToyNzo1MCAy
MDE3ICswMDAwDQoNCiAgICAgYWZzOiBPdmVyaGF1bCBjZWxsIGRhdGFiYXNlIG1hbmFnZW1lbnQN
Cg0KYmlzZWN0aW9uIGxvZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0
LnR4dD94PTEyMDUyMTU2ZTAwMDAwDQpmaW5hbCBjcmFzaDogICAgaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20veC9yZXBvcnQudHh0P3g9MTEwNTIxNTZlMDAwMDANCmNvbnNvbGUgb3V0cHV0
OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xNjA1MjE1NmUwMDAw
MA0KDQpJTVBPUlRBTlQ6IGlmIHlvdSBmaXggdGhlIGJ1ZywgcGxlYXNlIGFkZCB0aGUgZm9sbG93
aW5nIHRhZyB0byB0aGUgY29tbWl0Og0KUmVwb3J0ZWQtYnk6IHN5emJvdCswMTZjNzE4NmMxZDU1
NTc1YmFiOEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tDQpGaXhlczogOTg5NzgyZGNkYzkxICgi
YWZzOiBPdmVyaGF1bCBjZWxsIGRhdGFiYXNlIG1hbmFnZW1lbnQiKQ0KDQotLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCm5hbWUgJ++/veWTojA977+977+977+9FiPvv716Bg0K
77+9L++/vWcS77+9IyF3EWph77+9KzInDQpXQVJOSU5HOiBDUFU6IDEgUElEOiAyNjY5IGF0IGZz
L3Byb2MvZ2VuZXJpYy5jOjE3OCBfX3hsYXRlX3Byb2NfbmFtZSAgDQpmcy9wcm9jL2dlbmVyaWMu
YzoxNzggW2lubGluZV0NCldBUk5JTkc6IENQVTogMSBQSUQ6IDI2NjkgYXQgZnMvcHJvYy9nZW5l
cmljLmM6MTc4ICANCl9feGxhdGVfcHJvY19uYW1lKzB4ZTcvMHgxMTAgZnMvcHJvYy9nZW5lcmlj
LmM6MTYxDQpLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogcGFuaWNfb25fd2FybiBzZXQgLi4u
DQpDUFU6IDEgUElEOiAyNjY5IENvbW06IGt3b3JrZXIvMToyIE5vdCB0YWludGVkIDUuNS4wLXJj
NS1zeXprYWxsZXIgIzANCkhhcmR3YXJlIG5hbWU6IEdvb2dsZSBHb29nbGUgQ29tcHV0ZSBFbmdp
bmUvR29vZ2xlIENvbXB1dGUgRW5naW5lLCBCSU9TICANCkdvb2dsZSAwMS8wMS8yMDExDQpXb3Jr
cXVldWU6IGFmcyBhZnNfbWFuYWdlX2NlbGwNCkNhbGwgVHJhY2U6DQogIF9fZHVtcF9zdGFjayBs
aWIvZHVtcF9zdGFjay5jOjc3IFtpbmxpbmVdDQogIGR1bXBfc3RhY2srMHgxOTcvMHgyMTAgbGli
L2R1bXBfc3RhY2suYzoxMTgNCiAgcGFuaWMrMHgyZTMvMHg3NWMga2VybmVsL3BhbmljLmM6MjIx
DQogIF9fd2Fybi5jb2xkKzB4MmYvMHgzZSBrZXJuZWwvcGFuaWMuYzo1ODINCiAgcmVwb3J0X2J1
ZysweDI4OS8weDMwMCBsaWIvYnVnLmM6MTk1DQogIGZpeHVwX2J1ZyBhcmNoL3g4Ni9rZXJuZWwv
dHJhcHMuYzoxNzQgW2lubGluZV0NCiAgZml4dXBfYnVnIGFyY2gveDg2L2tlcm5lbC90cmFwcy5j
OjE2OSBbaW5saW5lXQ0KICBkb19lcnJvcl90cmFwKzB4MTFiLzB4MjAwIGFyY2gveDg2L2tlcm5l
bC90cmFwcy5jOjI2Nw0KICBkb19pbnZhbGlkX29wKzB4MzcvMHg1MCBhcmNoL3g4Ni9rZXJuZWwv
dHJhcHMuYzoyODYNCiAgaW52YWxpZF9vcCsweDIzLzB4MzAgYXJjaC94ODYvZW50cnkvZW50cnlf
NjQuUzoxMDI3DQpSSVA6IDAwMTA6X194bGF0ZV9wcm9jX25hbWUgZnMvcHJvYy9nZW5lcmljLmM6
MTc4IFtpbmxpbmVdDQpSSVA6IDAwMTA6X194bGF0ZV9wcm9jX25hbWUrMHhlNy8weDExMCBmcy9w
cm9jL2dlbmVyaWMuYzoxNjENCkNvZGU6IDNmIGViIDkwIGZmIDQ0IDg5IGUwIDQ4IDgzIGM0IDA4
IDViIDQxIDVjIDQxIDVkIDQxIDVlIDQxIDVmIDVkIGMzIGU4ICANCjI4IGViIDkwIGZmIDRjIDg5
IGZlIDQ4IGM3IGM3IDQwIDE4IDM5IDg4IGU4IDg4IDk5IDYxIGZmIDwwZj4gMGIgNDEgYmMgZmUg
IA0KZmYgZmYgZmYgZWIgY2IgNGMgODkgZjcgZTggMzcgYTQgY2UgZmYgZTkgM2QgZmYgZmYNClJT
UDogMDAxODpmZmZmYzkwMDA3OWJmOWQwIEVGTEFHUzogMDAwMTAyODINClJBWDogMDAwMDAwMDAw
MDAwMDAwMCBSQlg6IGZmZmY4ODgwOTRlYTNkNDkgUkNYOiAwMDAwMDAwMDAwMDAwMDAwDQpSRFg6
IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiBmZmZmZmZmZjgxNWU4NTA2IFJESTogZmZmZmY1MjAwMGYz
N2YyYw0KUkJQOiBmZmZmYzkwMDA3OWJmYTAwIFIwODogZmZmZjg4ODBhMGFhNjQ4MCBSMDk6IGZm
ZmZmYmZmZjE2NWViYTYNClIxMDogZmZmZmZiZmZmMTY1ZWJhNSBSMTE6IGZmZmZmZmZmOGIyZjVk
MmYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwDQpSMTM6IGZmZmY4ODgwOTRlYTNkMzkgUjE0OiBmZmZm
YzkwMDA3OWJmYjA4IFIxNTogZmZmZjg4ODA5NGVhM2QzOQ0KICB4bGF0ZV9wcm9jX25hbWUgZnMv
cHJvYy9nZW5lcmljLmM6MTk0IFtpbmxpbmVdDQogIF9fcHJvY19jcmVhdGUrMHhhYy8weDg2MCBm
cy9wcm9jL2dlbmVyaWMuYzozODcNCiAgcHJvY19ta2Rpcl9kYXRhKzB4YmMvMHgxYjAgZnMvcHJv
Yy9nZW5lcmljLmM6NDczDQogIHByb2NfbmV0X21rZGlyIGluY2x1ZGUvbGludXgvcHJvY19mcy5o
OjEzOSBbaW5saW5lXQ0KICBhZnNfcHJvY19jZWxsX3NldHVwKzB4OTUvMHgxOTAgZnMvYWZzL3By
b2MuYzo2MTANCiAgYWZzX2FjdGl2YXRlX2NlbGwgZnMvYWZzL2NlbGwuYzo1OTEgW2lubGluZV0N
CiAgYWZzX21hbmFnZV9jZWxsKzB4NTRiLzB4MTQxMCBmcy9hZnMvY2VsbC5jOjY3Mw0KICBwcm9j
ZXNzX29uZV93b3JrKzB4OWFmLzB4MTc0MCBrZXJuZWwvd29ya3F1ZXVlLmM6MjI2NA0KICB3b3Jr
ZXJfdGhyZWFkKzB4OTgvMHhlNDAga2VybmVsL3dvcmtxdWV1ZS5jOjI0MTANCiAga3RocmVhZCsw
eDM2MS8weDQzMCBrZXJuZWwva3RocmVhZC5jOjI1NQ0KICByZXRfZnJvbV9mb3JrKzB4MjQvMHgz
MCBhcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TOjM1Mg0KS2VybmVsIE9mZnNldDogZGlzYWJsZWQN
ClJlYm9vdGluZyBpbiA4NjQwMCBzZWNvbmRzLi4NCg0KDQotLS0NClRoaXMgYnVnIGlzIGdlbmVy
YXRlZCBieSBhIGJvdC4gSXQgbWF5IGNvbnRhaW4gZXJyb3JzLg0KU2VlIGh0dHBzOi8vZ29vLmds
L3Rwc21FSiBmb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCBzeXpib3QuDQpzeXpib3QgZW5naW5l
ZXJzIGNhbiBiZSByZWFjaGVkIGF0IHN5emthbGxlckBnb29nbGVncm91cHMuY29tLg0KDQpzeXpi
b3Qgd2lsbCBrZWVwIHRyYWNrIG9mIHRoaXMgYnVnIHJlcG9ydC4gU2VlOg0KaHR0cHM6Ly9nb28u
Z2wvdHBzbUVKI3N0YXR1cyBmb3IgaG93IHRvIGNvbW11bmljYXRlIHdpdGggc3l6Ym90Lg0KRm9y
IGluZm9ybWF0aW9uIGFib3V0IGJpc2VjdGlvbiBwcm9jZXNzIHNlZTogaHR0cHM6Ly9nb28uZ2wv
dHBzbUVKI2Jpc2VjdGlvbg0Kc3l6Ym90IGNhbiB0ZXN0IHBhdGNoZXMgZm9yIHRoaXMgYnVnLCBm
b3IgZGV0YWlscyBzZWU6DQpodHRwczovL2dvby5nbC90cHNtRUojdGVzdGluZy1wYXRjaGVzDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMg
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYWZzCg==
