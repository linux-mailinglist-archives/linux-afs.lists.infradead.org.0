Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE53913CCEE
	for <lists+linux-afs@lfdr.de>; Wed, 15 Jan 2020 20:17:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tSjUQtm46khEVPASXVnnUmi+pPvs15miheME5+Uli68=; b=eGVGVtV/p0gVK1
	bQ5v67flD7CicE3yxN+ti91Eh/uOeNqv47lk2Nj4sVNVgpALTQJTVN2O/CVVrdVLJQnVEso5NNug9
	MWVWB9OI21RQQvOu0gY/sW+RuuH3w4+xbg5yHK9TQQI0bTDUmExXOL8g5xNFTE1fL4MU2byMZwqk+
	oikQqCKqaLu9ZFtVoEL+HVfm7Bp8X4NTkrOThKEHw7q+vxrsse+znbXUsUzhW57bMudTGrM5o8S3l
	db31/Y8FexE0nnChxhmozUiT1SV2u2HvVSSq8y9+RLiDTV+hSo89V48qbU17g7d8hyJEoCHN1J4lx
	LPu//ZPzjO0PpOYv8Spw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iroAR-00042h-Et; Wed, 15 Jan 2020 19:17:27 +0000
Received: from package.cnf.cornell.edu ([128.253.198.225])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iroAK-00041k-UF
 for linux-afs@lists.infradead.org; Wed, 15 Jan 2020 19:17:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by package.cnf.cornell.edu (Postfix) with ESMTP id EC2671FB3F
 for <linux-afs@lists.infradead.org>; Wed, 15 Jan 2020 14:17:16 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 envelope.cnf.cornell.edu; h=content-transfer-encoding:user-agent
 :content-disposition:content-type:content-type:mime-version
 :message-id:subject:subject:to:from:from:date:date; s=dkim; t=
 1579115835; x=1579979836; bh=ZNastMPxfDsxjyL8HlNjW9jNBkAb3Coh3jK
 cbCZdioM=; b=HMvVx7Yn8FHORFREbIpnpzEF+nHWGNhc/RNC+dFWYHciMKV0gpQ
 xOA8dP7MlgTns7Qx7SNIiAuJ0EYcLAUOGfGt4lVvXC7WY67X7eIWd9MIqPfYA3Wh
 qm7m3gfAsTDEvtOcTf8C6Wu/UcHohSsTJBtCvAuwOeeXh30QUmrHo5Bc=
X-Virus-Scanned: amavisd-new at package.cnf.cornell.edu
Received: from package.cnf.cornell.edu ([127.0.0.1])
 by localhost (package.cnf.cornell.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RIKznIYYV1Ju for <linux-afs@lists.infradead.org>;
 Wed, 15 Jan 2020 14:17:15 -0500 (EST)
Received: from cnf.cornell.edu (wave.cnf.cornell.edu [128.253.198.20])
 by package.cnf.cornell.edu (Postfix) with ESMTPSA id EBF6A1FB3C;
 Wed, 15 Jan 2020 14:17:13 -0500 (EST)
Date: Wed, 15 Jan 2020 14:17:12 -0500
From: Dave Botsch <botsch@cnf.cornell.edu>
To: openafs-announce@openafs.org, openafs-info@openafs.org,
 openafs-devel@openafs.org, linux-afs@lists.infradead.org
Subject: Call For Talks - Feb 15 Deadline *Note Change* - OpenAFS
 Technologies Workshop 2020
Message-ID: <20200115191711.GH2394@cnf.cornell.edu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_111721_130442_8FFC650F 
X-CRM114-Status: UNSURE (   4.00  )
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

U28gdGhhdCB3ZSBjYW4gYW5ub3VuY2UgdGFsa3Mgd2l0aCB0aW1lIGZvciBhdHRlbmRlZXMgdG8g
bWFrZSB0cmF2ZWwKcGxhbnMsIHdlIGhhdmUgbW92ZWQgdGhlIENhbGwgZm9yIFRhbGtzIGRlYWRs
aW5lIHRvICpGZWJydWFyeSAxNSogLgpUYWxrcyB3aWxsIGJlIGFubm91bmNlZCB0aGUgZm9sbG93
aW5nIHdlZWsgYnkgRmVicnVhcnkgMjIuCgpQbGVhc2Ugc2VuZCB5b3VyIHByb3Bvc2FscyBmb3Ig
Y29uc2lkZXJhdGlvbiB0bwpvcGVuYWZzLndvcmtzaG9wQGdtYWlsLmNvbSB3aXRoIHRoZSBzdWJq
ZWN0IDIwMjAgY2ZwLgoKVGhlIDIwMjAgQUZTIFRlY2hub2xvZ2llcyBXb3Jrc2hvcCBpcyBhIGNv
bW11bml0eSBiYXNlZCBlZmZvcnQgdG8KcHJvbW90ZSB0aGUgc3RhYmlsaXR5IGFuZCBncm93dGgg
b2YgdGhlIEFGUyBkaXN0cmlidXRlZCBmaWxlIHN5c3RlbSBhbmQKcmVsYXRlZCB0ZWNobm9sb2dp
ZXMuIFRoZSB3b3Jrc2hvcCB0YWtlcyBwbGFjZSBNb25kYXksIEp1bmUgMTUgLQpXZWRuZXNkYXks
IEp1bmUgMTcgaW4gQ29sdW1idXMsIE9IIGF0IE9oaW8gU3RhdGUgVW5pdmVyc2l0eS4KCldlIGJl
bGlldmUgdGhhdCBhbGwgbWVtYmVycyBvZiB0aGUgQUZTIGNvbW11bml0eSBoYXZlIHNvbWV0aGlu
ZyB2YWx1YWJsZQp0byBzaGFyZSB3aXRoIG90aGVycy4gV2UgaW52aXRlIHlvdSB0byBzdWJtaXQg
YSBzZXNzaW9uIHByb3Bvc2FsIHRvCnNoYXJlIHlvdXIgZXhwZXJpZW5jZSB3aXRoIGNvbGxlYWd1
ZXMgaW4gdGhlIEFGUyBjb21tdW5pdHkuIFNlc3Npb25zCnR5cGVzIGF0IHRoZSB3b3Jrc2hvcCBp
bmNsdWRlIHByZXNlbnRhdGlvbnMsIHBhbmVscywgdHV0b3JpYWxzLCBhbmQKcm91bmR0YWJsZSBk
aXNjdXNzaW9ucy4KCkV2ZXJ5b25lIGlzIGVuY291cmFnZWQgdG8gc3BlYWsuCgpXaHkgUHJlc2Vu
dAoK4oCiIEZyaWVuZGx5IEF1ZGllbmNlcwrigKIgUmV3YXJkaW5nIEV4cGVyaWVuY2UK4oCiIFNo
YXJlIFlvdXIgS25vd2xlZGdlCuKAoiBDb250cmlidXRlIHRvIHRoZSBDb21tdW5pdHkKClRvcGlj
cyBvZiBJbnRlcmVzdAoKSGF2ZSBhIG5lYXQgbmV3IHRvb2wgeW91IHdyb3RlIHRoYXQgc2F2ZXMg
eW91IHRpbWUgYW5kIGVmZm9ydD8gVGVsbCB1cwphYm91dCBpdC4gSGF2ZSBhbiBpZGVhIHlvdSB3
YW50IHRvIHRyeSBvdXQgb24gYSBidW5jaCBvZiBwZW9wbGU/IFRlbGwgdXMKYWJvdXQgaXQuIEhh
dmUgeW91IGRvbmUgc29tZSBwZXJmb3JtYW5jZSB0dW5pbmcsIGJlbmNobWFya2luZywgb3IKYXV0
b21hdGVkIHRlc3Rpbmc/IFdlIHdvdWxkIGxvdmUgdG8gaGVhciBtb3JlIQoK4oCiIFNpdGUgUmVw
b3J0cwrigKIgQmVzdCBQcmFjdGljZXMK4oCiIENhc2Ugc3R1ZGllcyBhbmQgdXNlIGNhc2VzIGZv
ciBBRlMK4oCiIOKAnEJpcmRzIG9mIGEgRmVhdGhlcuKAnSAoQk9GKSBzZXNzaW9ucwrigKIgQUZT
IHByb2plY3RzCuKAoiBUcmFpbmluZyAmIHR1dG9yaWFscwrigKIgT3IgYW55dGhpbmcgZWxzZSB5
b3Ugd291bGQgbGlrZSB0byBkaXNjdXNzIG9yIHNob3djYXNlLgoKUHJvcG9zYWxzIHNob3VsZCBj
b250YWluOgoK4oCiIFlvdXIgbmFtZSBhbmQgYWZmaWxpYXRpb24K4oCiIFNlc3Npb24gdGl0bGUK
4oCiIEEgYnJpZWYgc3VtbWFyeSBvZiB0aGUgdG9waWMK4oCiIFRpbWUgcmVxdWlyZW1lbnRzCgpN
dWx0aXBsZSBwcm9wb3NhbHMgYXJlIHdlbGNvbWUgZnJvbSB0aGUgc2FtZSBpbmRpdmlkdWFsIG9y
IG9yZ2FuaXphdGlvbi4KU3BlYWtlcnMgc2hvdWxkIGFsc28gcmVnaXN0ZXIgZm9yIHRoZSBXb3Jr
c2hvcC4KClBsZWFzZSBzZW5kIHlvdXIgcHJvcG9zYWxzIGZvciBjb25zaWRlcmF0aW9uIHRvCm9w
ZW5hZnMud29ya3Nob3BAZ21haWwuY29tIHdpdGggdGhlIHN1YmplY3QgMjAyMCBjZnAuCgoKLS0g
CioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCkRhdmlkIFdpbGxpYW0gQm90c2NoCk9u
IGJlaGFsZiBvZiB0aGUgQm9hcmQKT3BlbkFGUyBGb3VuZGF0aW9uLCBJbmMuCmJvdHNjaEBjbmYu
Y29ybmVsbC5lZHUKKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFmcyBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hZnMK
