Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDDDFB893
	for <lists+linux-afs@lfdr.de>; Wed, 13 Nov 2019 20:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q3VEnT78+gvsFlIIfTBdJrLMC5C1E7CFVwFsFfg9nlU=; b=rPWarIB9orwIaO
	876+rB/A3TkHDOzmrzJ6IWMpuJphEsBNI25Pxlk1cJO7FJEHM64pvBi1li2IUNLfVJ6mqyf6A3fbf
	yi/Ee0msvgeoLi1vS8kxI1B8PBoelgP40llD38SIeLYnNQFSy/W4Z+iGbIU0NsgsmDEQC8PLy47oW
	M/T04xpLjX/haP0pcZ7voFzknh049L2ezyxOy+VuufgygVxr9T86XKrsfvaIqyBzKk8UsJFqaELuq
	eLnJIo1IkBU3eQ789lkoevgaMTnkZdbXoJ2zC0rqD2AY2rxWpuNO6k+VvvlDTp1VtieVeUK15wW58
	Tb9GXX5cb1obFpN4ANig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUy5O-0001a2-Lr; Wed, 13 Nov 2019 19:13:50 +0000
Received: from package.cnf.cornell.edu ([128.253.198.225])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUy5L-0001Ze-OK
 for linux-afs@lists.infradead.org; Wed, 13 Nov 2019 19:13:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by package.cnf.cornell.edu (Postfix) with ESMTP id B6D671FB3F
 for <linux-afs@lists.infradead.org>; Wed, 13 Nov 2019 14:03:48 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 envelope.cnf.cornell.edu; h=content-transfer-encoding:user-agent
 :content-disposition:content-type:content-type:mime-version
 :message-id:subject:subject:to:from:from:date:date; s=dkim; t=
 1573671827; x=1574535828; bh=ugONwWPzZLwsFvdSAd0COqgbdr1rAEYDGNt
 cxDRE8NE=; b=aARrzv1V3TE7xHOR4vRggbPPv2OZkl4q+Sj+yYlirqeMPNzWtym
 TxXIZPDT/Brniszk287g9gNFrdEvw1mC+DGMWPMHGWJn3JwuQROVt+mst6nJm/9q
 wHLXumYrMsUdKxBG8igEnqIZfMekpobFzslTbo0w95fceOUG0LgG9Fzk=
X-Virus-Scanned: amavisd-new at package.cnf.cornell.edu
Received: from package.cnf.cornell.edu ([127.0.0.1])
 by localhost (package.cnf.cornell.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XTmYcebYFFhT for <linux-afs@lists.infradead.org>;
 Wed, 13 Nov 2019 14:03:47 -0500 (EST)
Received: from cnf.cornell.edu (wave.cnf.cornell.edu [128.253.198.20])
 by package.cnf.cornell.edu (Postfix) with ESMTPSA id B2CDD1FB3C;
 Wed, 13 Nov 2019 14:03:46 -0500 (EST)
Date: Wed, 13 Nov 2019 14:03:45 -0500
From: Dave Botsch <botsch@cnf.cornell.edu>
To: foundation-discuss@openafs.org, openafs-info@openafs.org,
 openafs-devel@openafs.org, openafs-announce@openafs.org,
 linux-afs@lists.infradead.org
Subject: Call for Talks - 2020 AFS Technologies Workshop
Message-ID: <20191113190343.GK2394@cnf.cornell.edu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_111347_869153_4E7E9205 
X-CRM114-Status: UNSURE (   3.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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

VGhlIDIwMjAgQUZTIFRlY2hub2xvZ2llcyBXb3Jrc2hvcCBpcyBhIGNvbW11bml0eSBiYXNlZCBl
ZmZvcnQgdG8KcHJvbW90ZSB0aGUgc3RhYmlsaXR5IGFuZCBncm93dGggb2YgdGhlIEFGUyBkaXN0
cmlidXRlZCBmaWxlIHN5c3RlbSBhbmQKcmVsYXRlZCB0ZWNobm9sb2dpZXMuIFRoZSB3b3Jrc2hv
cCB0YWtlcyBwbGFjZSBNb25kYXksIEp1bmUgMTUgLQpXZWRuZXNkYXksIEp1bmUgMTcgaW4gQ29s
dW1idXMsIE9IIGF0IE9oaW8gU3RhdGUgVW5pdmVyc2l0eS4KCldlIGJlbGlldmUgdGhhdCBhbGwg
bWVtYmVycyBvZiB0aGUgQUZTIGNvbW11bml0eSBoYXZlIHNvbWV0aGluZyB2YWx1YWJsZQp0byBz
aGFyZSB3aXRoIG90aGVycy4gV2UgaW52aXRlIHlvdSB0byBzdWJtaXQgYSBzZXNzaW9uIHByb3Bv
c2FsIHRvCnNoYXJlIHlvdXIgZXhwZXJpZW5jZSB3aXRoIGNvbGxlYWd1ZXMgaW4gdGhlIEFGUyBj
b21tdW5pdHkuIFNlc3Npb25zCnR5cGVzIGF0IHRoZSB3b3Jrc2hvcCBpbmNsdWRlIHByZXNlbnRh
dGlvbnMsIHBhbmVscywgdHV0b3JpYWxzLCBhbmQKcm91bmR0YWJsZSBkaXNjdXNzaW9ucy4KCkV2
ZXJ5b25lIGlzIGVuY291cmFnZWQgdG8gc3BlYWsuCgpXaHkgUHJlc2VudAoK4oCiIEZyaWVuZGx5
IEF1ZGllbmNlcwrigKIgUmV3YXJkaW5nIEV4cGVyaWVuY2UK4oCiIFNoYXJlIFlvdXIgS25vd2xl
ZGdlCuKAoiBDb250cmlidXRlIHRvIHRoZSBDb21tdW5pdHkKClRvcGljcyBvZiBJbnRlcmVzdAoK
SGF2ZSBhIG5lYXQgbmV3IHRvb2wgeW91IHdyb3RlIHRoYXQgc2F2ZXMgeW91IHRpbWUgYW5kIGVm
Zm9ydD8gVGVsbCB1cwphYm91dCBpdC4gSGF2ZSBhbiBpZGVhIHlvdSB3YW50IHRvIHRyeSBvdXQg
b24gYSBidW5jaCBvZiBwZW9wbGU/IFRlbGwgdXMKYWJvdXQgaXQuIEhhdmUgeW91IGRvbmUgc29t
ZSBwZXJmb3JtYW5jZSB0dW5pbmcsIGJlbmNobWFya2luZywgb3IKYXV0b21hdGVkIHRlc3Rpbmc/
IFdlIHdvdWxkIGxvdmUgdG8gaGVhciBtb3JlIQoK4oCiIFNpdGUgUmVwb3J0cwrigKIgQmVzdCBQ
cmFjdGljZXMK4oCiIENhc2Ugc3R1ZGllcyBhbmQgdXNlIGNhc2VzIGZvciBBRlMK4oCiIOKAnEJp
cmRzIG9mIGEgRmVhdGhlcuKAnSAoQk9GKSBzZXNzaW9ucwrigKIgQUZTIHByb2plY3RzCuKAoiBU
cmFpbmluZyAmIHR1dG9yaWFscwrigKIgT3IgYW55dGhpbmcgZWxzZSB5b3Ugd291bGQgbGlrZSB0
byBkaXNjdXNzIG9yIHNob3djYXNlLgoKUHJvcG9zYWxzIHNob3VsZCBjb250YWluOgoK4oCiIFlv
dXIgbmFtZSBhbmQgYWZmaWxpYXRpb24K4oCiIFNlc3Npb24gdGl0bGUK4oCiIEEgYnJpZWYgc3Vt
bWFyeSBvZiB0aGUgdG9waWMK4oCiIFRpbWUgcmVxdWlyZW1lbnRzCgpNdWx0aXBsZSBwcm9wb3Nh
bHMgYXJlIHdlbGNvbWUgZnJvbSB0aGUgc2FtZSBpbmRpdmlkdWFsIG9yIG9yZ2FuaXphdGlvbi4K
U3BlYWtlcnMgc2hvdWxkIGFsc28gcmVnaXN0ZXIgZm9yIHRoZSBXb3Jrc2hvcC4KClBsZWFzZSBz
ZW5kIHlvdXIgcHJvcG9zYWxzIGZvciBjb25zaWRlcmF0aW9uIHRvCm9wZW5hZnMud29ya3Nob3BA
Z21haWwuY29tIHdpdGggdGhlIHN1YmplY3QgMjAyMCBjZnAuCgoKCi0tIAoqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKgpEYXZpZCBXaWxsaWFtIEJvdHNjaApPbiBiZWhhbGYgb2YgdGhl
IEJvYXJkLApPcGVuQUZTIEZvdW5kYXRpb24sIEluYy4KKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hZnMgbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYWZzCg==
