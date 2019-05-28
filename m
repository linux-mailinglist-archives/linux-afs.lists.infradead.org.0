Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 618632CB1C
	for <lists+linux-afs@lfdr.de>; Tue, 28 May 2019 18:08:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yR1vrWtxTF+b6Z9mxASRtYCqjJtXH5NwY5HnUUUmbdA=; b=UEvYKeNg6YpDqI
	a66tKNkOOnZY8W7+rUNeWDrxv8UtjkuCuBEN6Jsyg06Wow7nt6hKhRt+RfEx1hLxNHrY/yCoQQmgl
	vc+wJVK3QVVmBB6KuuHqlY35tKF/yuLFzScxjer2HzvrlSuYUTqh2j8SSxavFrHZrGgH66E+nVRQU
	gb4Mg0ITljZkxPzSUsdHVd35QYmsAu/h8hxXkgbRFl5vGFwKIxe297hm7hQb//9w6yQvP3HgRAWCf
	2+ZxeR679DOOQ4Z45qVz/zguNDvaZtZ0SBgYRMiFHPksRAMBEY2A2RLexYxhjl/Pdf9bBU7sLYuzA
	fXy8fZPeyPj1JliVeXmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeeb-0002Co-QB; Tue, 28 May 2019 16:08:45 +0000
Received: from mail-db5eur03on0624.outbound.protection.outlook.com
 ([2a01:111:f400:fe0a::624]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVdGw-0001LE-2i
 for linux-afs@lists.infradead.org; Tue, 28 May 2019 14:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGDwWypZZ4eJ/C1s8L1Asfv3QGVTeLnW226BrN1Qhsc=;
 b=YQGVulZ5z7NJ6Y+7Ncw81kQTJTMvi/yaAkx9J6Lfh3Cln1v8qpTAA7t6WmcKRuWBsr9Xhd8Ve0zHECa6KNfSRl+nNrnKw/YH+LeyjG+lv4ts/dGuNSbQ9MYT54CdkgCWeoVne2I9il9y6KlEJcaZgUtI7sgSK8WbCPXEhY+rBEA=
Received: from AM0PR0502MB4068.eurprd05.prod.outlook.com (52.133.38.142) by
 AM0PR0502MB3892.eurprd05.prod.outlook.com (52.133.50.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Tue, 28 May 2019 14:40:08 +0000
Received: from AM0PR0502MB4068.eurprd05.prod.outlook.com
 ([fe80::6073:86f:d8a5:e427]) by AM0PR0502MB4068.eurprd05.prod.outlook.com
 ([fe80::6073:86f:d8a5:e427%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 14:40:08 +0000
From: Eran Ben Elisha <eranbe@mellanox.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Igor Konopko
 <igor.j.konopko@intel.com>, David Howells <dhowells@redhat.com>, "Mohit P .
 Tahiliani" <tahiliani@nitk.edu.in>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Matias Bjorling <mb@lightnvm.io>, Jiri Pirko
 <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Jamal Hadi
 Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Clemens
 Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Joe Perches <joe@perches.com>, Arnd Bergmann
 <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 5/5] [RFC] devlink: Fix uninitialized error code in
 devlink_fmsg_prepare_skb()
Thread-Topic: [PATCH 5/5] [RFC] devlink: Fix uninitialized error code in
 devlink_fmsg_prepare_skb()
Thread-Index: AQHVFWEYr6PWoO5LskiotnwgE/6kraaAm7cA
Date: Tue, 28 May 2019 14:40:08 +0000
Message-ID: <0f92eb11-20b5-c50b-1577-d3896f28c73b@mellanox.com>
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-6-geert@linux-m68k.org>
In-Reply-To: <20190528142424.19626-6-geert@linux-m68k.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P192CA0056.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::33) To AM0PR0502MB4068.eurprd05.prod.outlook.com
 (2603:10a6:208:d::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=eranbe@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a896751-60d3-4369-5f3e-08d6e37a616d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR0502MB3892; 
x-ms-traffictypediagnostic: AM0PR0502MB3892:
x-microsoft-antispam-prvs: <AM0PR0502MB38928ECA25430C114C430CC3BA1E0@AM0PR0502MB3892.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(305945005)(4326008)(6512007)(66946007)(66446008)(64756008)(66556008)(66476007)(7736002)(73956011)(7416002)(6436002)(6246003)(229853002)(2171002)(6486002)(25786009)(14454004)(53936002)(31686004)(316002)(54906003)(110136005)(6116002)(3846002)(6506007)(386003)(52116002)(99286004)(66066001)(2906002)(8936002)(5660300002)(8676002)(53546011)(81166006)(2616005)(81156014)(476003)(71200400001)(71190400001)(186003)(102836004)(256004)(446003)(478600001)(14444005)(68736007)(36756003)(86362001)(26005)(11346002)(486006)(76176011)(31696002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR0502MB3892;
 H:AM0PR0502MB4068.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lE27RtcEefp9ltSt6Kv+xlAnNQ3LF7Dytl0hgc7GSB/ClPcCgdkne7kqy1z3lQ59g1O0T7jLwbt47LXR0y4P2uvx7jIyFnHNXeibMbMxVtrBJ6cJus8d/fb11Po7iHU8DDSOQMTK0iWyvQcDkjvMwkrGwY1aFe+sD/K6npafjBu/fovDJVP0GroIG83LBn1tXbshl19+i69yntq9bMc6D9pWH/YRNdwVLi4bwXt1JFLvarMwqImNAQx9QyJP9/IPiAEkm7pk4kzscHEuml1xqZMKamVoUv9zE52z8ZwdBmZgf9Yc/Bar7MLYat3KUJpcMy2lEplcyBQZvPG4BkT+kz6B/JpjoD8kZMj9nTnPx/DzewsjApugXV3tjMEiyppOXeF18i4fKDjQAHjf+kvluhiZMiTTO9yjKdKjEFjg6xE=
Content-ID: <CEDEDE15ABD92A47A1D0AAA6F6441A4F@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a896751-60d3-4369-5f3e-08d6e37a616d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 14:40:08.5523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eranbe@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0502MB3892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_074014_174244_F34CA7D7 
X-CRM114-Status: GOOD (  18.02  )
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a01:111:f400:fe0a:0:0:0:624 listed in]
 [list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Mailman-Approved-At: Tue, 28 May 2019 09:08:42 -0700
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

DQoNCk9uIDUvMjgvMjAxOSA1OjI0IFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+IFdp
dGggZ2NjIDQuMToNCj4gDQo+ICAgICAgbmV0L2NvcmUvZGV2bGluay5jOiBJbiBmdW5jdGlvbiDi
gJhkZXZsaW5rX2Ztc2dfcHJlcGFyZV9za2LigJk6DQo+ICAgICAgbmV0L2NvcmUvZGV2bGluay5j
OjQzMjU6IHdhcm5pbmc6IOKAmGVycuKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRo
aXMgZnVuY3Rpb24NCj4gDQo+IEluZGVlZCwgaWYgdGhlIGxpc3QgaGFzIGxlc3MgdGhhbiAqc3Rh
cnQgZW50cmllcywgYW4gdW5pbml0aWFsaXplZCBlcnJvcg0KPiBjb2RlIHdpbGwgYmUgcmV0dXJu
ZWQuDQoNClRoZSBsb2dpYyBndWFyYW50ZWVzIHRoYXQgc3RhcnQgaXMgc21hbGxlciB0aGFuIHRo
ZSBsZW5ndGggb2YgdGhlIGxpc3QuDQpidXQgSSBndWVzcyB0aGF0IHRoZSBjb21waWxlciBjYW4n
dCBkZXRlY3QgdGhhdC4NCg0KUmV2aWV3ZWQtYnk6IEVyYW4gQmVuIEVsaXNoYSA8ZXJhbmJlQG1l
bGxhbm94LmNvbT4NCg0KPiANCj4gRml4IHRoaXMgYnkgcHJlaW5pdGlhbGl6aW5nIGVyciB0byB6
ZXJvLg0KPiANCj4gRml4ZXM6IDFkYjY0ZTg3MzNmNjUzODEgKCJkZXZsaW5rOiBBZGQgZGV2bGlu
ayBmb3JtYXR0ZWQgbWVzc2FnZSAoZm1zZykgQVBJIikNCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gLS0tDQo+IEkgZG9uJ3Qga25v
dyBpZiB0aGlzIGNhbiByZWFsbHkgaGFwcGVuLCBhbmQgaWYgdGhpcyBpcyB0aGUgcmlnaHQgZml4
Lg0KPiBQZXJoYXBzIGVyciBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgdG8gc29tZSB2YWxpZCBlcnJv
ciBjb2RlIGluc3RlYWQ/DQo+IC0tLQ0KPiAgIG5ldC9jb3JlL2RldmxpbmsuYyB8IDIgKy0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9uZXQvY29yZS9kZXZsaW5rLmMgYi9uZXQvY29yZS9kZXZsaW5rLmMNCj4gaW5k
ZXggZDQzYmM1MmI4ODQwZDc2Yi4uOTEzNzdlNGVhZTlhNDNjMSAxMDA2NDQNCj4gLS0tIGEvbmV0
L2NvcmUvZGV2bGluay5jDQo+ICsrKyBiL25ldC9jb3JlL2RldmxpbmsuYw0KPiBAQCAtNDMyMSw4
ICs0MzIxLDggQEAgZGV2bGlua19mbXNnX3ByZXBhcmVfc2tiKHN0cnVjdCBkZXZsaW5rX2Ztc2cg
KmZtc2csIHN0cnVjdCBza19idWZmICpza2IsDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZGV2bGlua19m
bXNnX2l0ZW0gKml0ZW07DQo+ICAgCXN0cnVjdCBubGF0dHIgKmZtc2dfbmxhdHRyOw0KPiArCWlu
dCBlcnIgPSAwOw0KPiAgIAlpbnQgaSA9IDA7DQo+IC0JaW50IGVycjsNCj4gICANCj4gICAJZm1z
Z19ubGF0dHIgPSBubGFfbmVzdF9zdGFydF9ub2ZsYWcoc2tiLCBERVZMSU5LX0FUVFJfRk1TRyk7
DQo+ICAgCWlmICghZm1zZ19ubGF0dHIpDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYWZzIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFmcwo=
