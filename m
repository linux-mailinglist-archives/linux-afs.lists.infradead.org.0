Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A3144D11
	for <lists+linux-afs@lfdr.de>; Wed, 22 Jan 2020 09:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhfjaAAGwSt50eD4FIThgVbJbCmsk8cczztH3rai8sE=; b=oEmlqdnS53inxz
	v5EeFmomTJdzJlWKSfnnuPcdv0Sy3VM2aIlomKVBcqcnArhNE4ZHgHbSKX7+CPdKgvehjY55lm95K
	ISxwRlYXqDM60/2bf32p5xaUR5of9nZXN5AiylNLKzaSESXxoqaJoNa2Q+UVz6ElpyBB0qutj2mvv
	AUtMYit733tWRF65C8Nt7KtnmU+oW/F8F+HQo/JY+Acgiw4CGU/ZypGInnximul+gpTnFSPIVb2Dk
	TncXdtTpfnX3BmO2J28iBGKgDkN30mrPM60r4AkUkhdYm2nagXiqUrVej3thFMNLxTnLXOdfAi67I
	bgxs3ZAHZXsTd0G/sKsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuB9Y-0002Zj-6F; Wed, 22 Jan 2020 08:14:20 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuB9U-0002Yp-Oi
 for linux-afs@lists.infradead.org; Wed, 22 Jan 2020 08:14:18 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00M8DPMC193888;
 Wed, 22 Jan 2020 08:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=83DRZ5lvnyecxdZB0/wPFCJp9LCv2JjGJqQI51XrkwA=;
 b=KCsxNkbx1umn0gPsVd/zq9L7Al0fxcKzUkcGPQpZHMQdfL5c6iZwtAafC6LWPn59J9/a
 vRhwBJ+e0Rja3jOkorDb6GJ+uixhNEhuS6nFADC8Obm3nV2WW9kpmAiz0kSy9kLx7Jnv
 DueoHad5C5sLMpUFM5VqK+HmBdsqdPIrQrijTABbYE1qh9yfJTS0RV6LBswWPEqvERj3
 r61tDhCcGMXladw290sgTsqYOERCDBbiqM89iDsCpJeAXdMew7lBGLSv+83aF2tqp58u
 lzsXetYMrVM5GCdUFF/z6zTHnl8Z665EzGeij7V8OgiGQT4Ca6qo8Ua0XmnELt4sQzqO Rg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2xksyqa268-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 08:14:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00M8Dqrg177405;
 Wed, 22 Jan 2020 08:14:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2xnpfqqn85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 08:14:08 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00M8DlC4021757;
 Wed, 22 Jan 2020 08:13:48 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Jan 2020 00:13:47 -0800
Date: Wed, 22 Jan 2020 11:13:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: syzbot <syzbot+b904ba7c947a37b4b291@syzkaller.appspotmail.com>,
 dhowells@redhat.com
Subject: Re: WARNING in __proc_create (2)
Message-ID: <20200122081340.2bhx5jfezl55b3qb@kili.mountain>
References: <000000000000da7a79059caf2656@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000000000000da7a79059caf2656@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=918
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001220074
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=983 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001220074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_001416_897999_0E0FDC67 
X-CRM114-Status: GOOD (  12.77  )
X-Spam-Score: -2.5 (--)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-2.5 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [141.146.126.78 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
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
Cc: syzkaller-bugs@googlegroups.com, linux-afs@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDM6NTY6MDhQTSAtMDgwMCwgc3l6Ym90IHdyb3RlOgo+
IEhlbGxvLAo+IAo+IHN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGNyYXNoIG9uOgo+IAo+IEhF
QUQgY29tbWl0OiAgICBkOTZkODc1ZSBNZXJnZSB0YWcgJ2ZpeGVzX2Zvcl92NS41LXJjOCcgb2Yg
Z2l0Oi8vZ2l0Lmtlcm5lLi4KPiBnaXQgdHJlZTogICAgICAgdXBzdHJlYW0KPiBjb25zb2xlIG91
dHB1dDogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTNiN2I4MGRl
MDAwMDAKPiBrZXJuZWwgY29uZmlnOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC8u
Y29uZmlnP3g9ODNjMDBhZmNhOWNmNTE1Mwo+IGRhc2hib2FyZCBsaW5rOiBodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9YjkwNGJhN2M5NDdhMzdiNGIyOTEKPiBjb21waWxl
cjogICAgICAgY2xhbmcgdmVyc2lvbiAxMC4wLjAgKGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xs
dm0tcHJvamVjdC8gYzI0NDMxNTVhMGZiMjQ1YzhmMTdmMmMxYzcyYjZlYTM5MWU4NmU4MSkKPiBz
eXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5zeXo/
eD0xMmM5NjE4NWUwMDAwMAo+IEMgcmVwcm9kdWNlcjogICBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS94L3JlcHJvLmM/eD0xNGY4NTljOWUwMDAwMAo+IAo+IElNUE9SVEFOVDogaWYgeW91
IGZpeCB0aGUgYnVnLCBwbGVhc2UgYWRkIHRoZSBmb2xsb3dpbmcgdGFnIHRvIHRoZSBjb21taXQ6
Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCtiOTA0YmE3Yzk0N2EzN2I0YjI5MUBzeXprYWxsZXIuYXBw
c3BvdG1haWwuY29tCj4gCj4gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4g
bmFtZSAn77+977+9L111d28sIu+/vSBj77+9YWPvv73vv73vv73vv73vv71b77+9ICTvv701eH7v
v71z77+9Ju+/vXR3fe+/ve+/ve+/vXog77+9Y3AgKCcKICAgICAgICAgIF4KCkhpIERhdmlkLAoK
V2Ugc2hvdWxkIHByb2JhYmx5IGJhbiAnLycgY2hhcmFjdGVycyBmcm9tIHRoZSBjZWxsIG5hbWUg
aW4KYWZzX2FsbG9jX2NlbGwoKS4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hZnMgbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYWZz
Cg==
