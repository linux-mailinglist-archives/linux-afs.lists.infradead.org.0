Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A5616181D
	for <lists+linux-afs@lfdr.de>; Mon, 17 Feb 2020 17:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rVmgtvoI5rdSkJQhcd+oRr35haH9txIluLTWx1FcUD4=; b=GLVBdtLxm4nZ0D
	o5H5pXmIEZ2eM8IIE6WdcrO6waX8rZtwhGCK0HYMf4fai4tHTmaKXFJdmMKzW6JDFO+6LpJO1Zhfz
	xQWHz3RTqazB+udTsEZotZUovuWgRA2spv6T0ELZlEfHZa1V4HxCDx3ajLRxqc7XZ9Ye3IlbXgmPA
	0quPN1dkuufGbD3GJoysRqEury22nBi9iqllr8RBxb60N5s6fRwGzUYITy7zNvPBetj/7aX1YKtFE
	RQiW/mXKVI+InuPVHfLm3prucNdNIPF8AOh6yEQg5UXobxprh3doWXWjvy1neM+9/uRdreETG2ilJ
	0nqb4lpwg4rw+X1PuUFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3jSB-0003o3-7t; Mon, 17 Feb 2020 16:41:03 +0000
Received: from package.cnf.cornell.edu ([128.253.198.225])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3jS8-0003nG-76
 for linux-afs@lists.infradead.org; Mon, 17 Feb 2020 16:41:01 +0000
Received: from localhost (localhost [127.0.0.1])
 by package.cnf.cornell.edu (Postfix) with ESMTP id 027101FB46
 for <linux-afs@lists.infradead.org>; Mon, 17 Feb 2020 11:40:55 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 envelope.cnf.cornell.edu; h=content-transfer-encoding:user-agent
 :content-disposition:content-type:content-type:mime-version
 :message-id:subject:subject:to:from:from:date:date; s=dkim; t=
 1581957653; x=1582821654; bh=9MAsJ8yTvpNYUJGKpPhDQ6uMO0dMo0y7BVz
 n7HD4Plw=; b=Cwo/Dj23Txi6VtEnnIJk2hMA6a3XGx6VKandavYjdB/JLsX0hSA
 OQYso2QKAf23uyggjO1Xjx0Bw6dg9wo6IDdWWkByhSS1l3g9zg6xO8+FOKC4+Hhv
 AA6UPYu7Jm+xmOqmAtp3s2nTnjOo4n2EGbk7+vghZ/h208WaHw0NAHo0=
X-Virus-Scanned: amavisd-new at package.cnf.cornell.edu
Received: from package.cnf.cornell.edu ([127.0.0.1])
 by localhost (package.cnf.cornell.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ao8GXTvkJyOr for <linux-afs@lists.infradead.org>;
 Mon, 17 Feb 2020 11:40:53 -0500 (EST)
Received: from cnf.cornell.edu (wave.cnf.cornell.edu [128.253.198.20])
 by package.cnf.cornell.edu (Postfix) with ESMTPSA id E69DD1FB3F;
 Mon, 17 Feb 2020 11:40:14 -0500 (EST)
Date: Mon, 17 Feb 2020 11:40:13 -0500
From: Dave Botsch <botsch@cnf.cornell.edu>
To: openafs-announce@openafs.org, openafs-info@openafs.org,
 openafs-devel@openafs.org, linux-afs@lists.infradead.org,
 foundation-discuss@openafs.org
Subject: Last Call: Call for Talks for AFS Tech Workshop 2020
Message-ID: <20200217164013.GY2394@cnf.cornell.edu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_084100_417703_FD859B40 
X-CRM114-Status: UNSURE (   4.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [128.253.198.225 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
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

TGFzdCBjYWxsLi4uIGVuZCBvZiBkYXksIHRvZGF5LCBwbGVhc2UuCgpBbHNvIG5vdGUgdGhlIHdl
YnNpdGUgaXMgdXAgYW5kIHJlZ2lzdHJhdGlvbiBpcyBvcGVuIGF0CndvcmtzaG9wLm9wZW5hZnMu
b3JnIC4KClRhbGtzIHdpbGwgYmUgYW5ub3VuY2VkIHRoZSBmb2xsb3dpbmcgd2VlayBieSBGZWJy
dWFyeSAyMi4KClBsZWFzZSBzZW5kIHlvdXIgcHJvcG9zYWxzIGZvciBjb25zaWRlcmF0aW9uIHRv
Cm9wZW5hZnMud29ya3Nob3BAZ21haWwuY29tIHdpdGggdGhlIHN1YmplY3QgMjAyMCBjZnAuCgpU
aGUgMjAyMCBBRlMgVGVjaG5vbG9naWVzIFdvcmtzaG9wIGlzIGEgY29tbXVuaXR5IGJhc2VkIGVm
Zm9ydCB0bwpwcm9tb3RlIHRoZSBzdGFiaWxpdHkgYW5kIGdyb3d0aCBvZiB0aGUgQUZTIGRpc3Ry
aWJ1dGVkIGZpbGUgc3lzdGVtIGFuZApyZWxhdGVkIHRlY2hub2xvZ2llcy4gVGhlIHdvcmtzaG9w
IHRha2VzIHBsYWNlIE1vbmRheSwgSnVuZSAxNSAtCldlZG5lc2RheSwgSnVuZSAxNyBpbiBDb2x1
bWJ1cywgT0ggYXQgT2hpbyBTdGF0ZSBVbml2ZXJzaXR5LgoKV2UgYmVsaWV2ZSB0aGF0IGFsbCBt
ZW1iZXJzIG9mIHRoZSBBRlMgY29tbXVuaXR5IGhhdmUgc29tZXRoaW5nIHZhbHVhYmxlCnRvIHNo
YXJlIHdpdGggb3RoZXJzLiBXZSBpbnZpdGUgeW91IHRvIHN1Ym1pdCBhIHNlc3Npb24gcHJvcG9z
YWwgdG8Kc2hhcmUgeW91ciBleHBlcmllbmNlIHdpdGggY29sbGVhZ3VlcyBpbiB0aGUgQUZTIGNv
bW11bml0eS4gU2Vzc2lvbnMKdHlwZXMgYXQgdGhlIHdvcmtzaG9wIGluY2x1ZGUgcHJlc2VudGF0
aW9ucywgcGFuZWxzLCB0dXRvcmlhbHMsIGFuZApyb3VuZHRhYmxlIGRpc2N1c3Npb25zLgoKRXZl
cnlvbmUgaXMgZW5jb3VyYWdlZCB0byBzcGVhay4KCldoeSBQcmVzZW50CgrigKIgRnJpZW5kbHkg
QXVkaWVuY2VzCuKAoiBSZXdhcmRpbmcgRXhwZXJpZW5jZQrigKIgU2hhcmUgWW91ciBLbm93bGVk
Z2UK4oCiIENvbnRyaWJ1dGUgdG8gdGhlIENvbW11bml0eQoKVG9waWNzIG9mIEludGVyZXN0CgpI
YXZlIGEgbmVhdCBuZXcgdG9vbCB5b3Ugd3JvdGUgdGhhdCBzYXZlcyB5b3UgdGltZSBhbmQgZWZm
b3J0PyBUZWxsIHVzCmFib3V0IGl0LiBIYXZlIGFuIGlkZWEgeW91IHdhbnQgdG8gdHJ5IG91dCBv
biBhIGJ1bmNoIG9mIHBlb3BsZT8gVGVsbCB1cwphYm91dCBpdC4gSGF2ZSB5b3UgZG9uZSBzb21l
IHBlcmZvcm1hbmNlIHR1bmluZywgYmVuY2htYXJraW5nLCBvcgphdXRvbWF0ZWQgdGVzdGluZz8g
V2Ugd291bGQgbG92ZSB0byBoZWFyIG1vcmUhCgrigKIgU2l0ZSBSZXBvcnRzCuKAoiBCZXN0IFBy
YWN0aWNlcwrigKIgQ2FzZSBzdHVkaWVzIGFuZCB1c2UgY2FzZXMgZm9yIEFGUwrigKIg4oCcQmly
ZHMgb2YgYSBGZWF0aGVy4oCdIChCT0YpIHNlc3Npb25zCuKAoiBBRlMgcHJvamVjdHMK4oCiIFRy
YWluaW5nICYgdHV0b3JpYWxzCuKAoiBPciBhbnl0aGluZyBlbHNlIHlvdSB3b3VsZCBsaWtlIHRv
IGRpc2N1c3Mgb3Igc2hvd2Nhc2UuCgpQcm9wb3NhbHMgc2hvdWxkIGNvbnRhaW46CgrigKIgWW91
ciBuYW1lIGFuZCBhZmZpbGlhdGlvbgrigKIgU2Vzc2lvbiB0aXRsZQrigKIgQSBicmllZiBzdW1t
YXJ5IG9mIHRoZSB0b3BpYwrigKIgVGltZSByZXF1aXJlbWVudHMKCk11bHRpcGxlIHByb3Bvc2Fs
cyBhcmUgd2VsY29tZSBmcm9tIHRoZSBzYW1lIGluZGl2aWR1YWwgb3Igb3JnYW5pemF0aW9uLgpT
cGVha2VycyBzaG91bGQgYWxzbyByZWdpc3RlciBmb3IgdGhlIFdvcmtzaG9wLgoKUGxlYXNlIHNl
bmQgeW91ciBwcm9wb3NhbHMgZm9yIGNvbnNpZGVyYXRpb24gdG8Kb3BlbmFmcy53b3Jrc2hvcEBn
bWFpbC5jb20gd2l0aCB0aGUgc3ViamVjdCAyMDIwIGNmcC4KCgotLSAKKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKRGF2aWQgV2lsbGlhbSBCb3RzY2gKT24gYmVoYWxmIG9mIHRoZSBC
b2FyZApPcGVuQUZTIEZvdW5kYXRpb24sIEluYy4KYm90c2NoQGNuZi5jb3JuZWxsLmVkdQoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
