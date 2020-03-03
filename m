Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A901779C0
	for <lists+linux-afs@lfdr.de>; Tue,  3 Mar 2020 16:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2MS4UKZaYA6dTMPml3SSyXedCFb2HGL6lHYNU0kr504=; b=LR7pbama01P7bp
	1kZBoROZeI7ZbptMjCWqRTYjbA8xSMvMyvlzAV4X3wL0s629oJZLOAo7xM43n0SghGa20aXS4kSjJ
	EYfO7cbESDno9hSa4YsCxzJb0pyF66oPlw+zS14lLjIzAuj69oJhVCESpII3SXkAomWmyyqsx/K7s
	jjmbp8dmi2vSupCuKT4KeteuYYU4Ymye3K6KEZwFa/omrh4z92pJ2WSINQEqGhXwyi11KneOADvWs
	BYFfQgPA/YfzhxrDNOQtK6kmbDCoxkR4phINWlWeCHBx5+scaJXn6Wykk1Wx/J7hr1KpFJKKSV7Ax
	UX7QZuD57o5ELFsXyl7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j992Q-0001YK-Es; Tue, 03 Mar 2020 15:00:50 +0000
Received: from envoy.cnf.cornell.edu ([128.253.198.226])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j992N-0001Xt-Ul
 for linux-afs@lists.infradead.org; Tue, 03 Mar 2020 15:00:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by envoy.cnf.cornell.edu (Postfix) with ESMTP id BE5BA1FB3E
 for <linux-afs@lists.infradead.org>; Tue,  3 Mar 2020 09:55:35 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 envelope.cnf.cornell.edu; h=user-agent:content-disposition
 :content-type:content-type:mime-version:message-id:subject
 :subject:to:from:from:date:date; s=dkim; t=1583247333; x=
 1584111334; bh=JtnqUO2hweZ0Mrn+yactrbusYsx1+YAuRjl6l2dZQh0=; b=l
 k0AmnDKEHU1PGqORm8DVqYURBUGAK4Jba+Jc1pp0ILj5IvqdPLdrui5GDgjeH8wR
 mY5UlJPduE+hL8V02ImfWhyyIL6MBV/lVhz/SXDM/PSipN5nnJwMImYI+utpHPDT
 nuv8HyV6V1VrKxBh0eMRJqLVoFfYtA9q34OEJBX35w=
X-Virus-Scanned: amavisd-new at envoy.cnf.cornell.edu
Received: from envoy.cnf.cornell.edu ([127.0.0.1])
 by localhost (envoy.cnf.cornell.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rIW37JJSOnEn for <linux-afs@lists.infradead.org>;
 Tue,  3 Mar 2020 09:55:33 -0500 (EST)
Received: from cnf.cornell.edu (wave.cnf.cornell.edu [128.253.198.20])
 by envoy.cnf.cornell.edu (Postfix) with ESMTPSA id 0A05C1FB36;
 Tue,  3 Mar 2020 09:55:32 -0500 (EST)
Date: Tue, 3 Mar 2020 09:55:31 -0500
From: Dave Botsch <botsch@cnf.cornell.edu>
To: openafs-announce@openafs.org, openafs-info@openafs.org,
 openafs-devel@openafs.org, linux-afs@lists.infradead.org,
 foundation-discuss@openafs.org
Subject: Accepted Talks for 2020 AFS Technologies Workshop
Message-ID: <20200303145530.GA2394@cnf.cornell.edu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_070048_068952_A4648EF1 
X-CRM114-Status: UNSURE (   4.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Hi, all.

The list of accepted talks for the 2020 AFS Technologies Workshop is on
on the workshop website:

http://workshop.openafs.org/afsbpw20/talks/

(you may need to refresh your web browser for the most current list).

Thanks to Mike Meffie and Jeff Hutzelman for getting the website up.

And thanks to everyone who submitted a talk. We wish we could have
accepted all the wonderful talk topics! In the end, it was tough to
choose, and we did our best to balance topic and presenting institution.

Even if your talk was not accepted, please keep your talk in reserve in
case a current presenter has to pull out. And there will be additional
open discussion time during lunch, coffee breaks, and at the zoo!

Thanks!

-- 
********************************
David William Botsch
On behalf of the 
OpenAFS Foundation, Inc. Board
botsch@cnf.cornell.edu
********************************

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
