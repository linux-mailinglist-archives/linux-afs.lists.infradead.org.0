Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A01B1FC6
	for <lists+linux-afs@lfdr.de>; Tue, 21 Apr 2020 09:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JARJV8QYzigWxVk6KML4p6Y+YfuyFaDLE1cx4jUDzV0=; b=qobbFnI/q+0HGr
	gzP2oFxxgKZsKaUre0Wox/kJVQaZHytwnRYXY/tQjvNdx2AadAJi94G2t8S6WCUsRFyw2Raot8ffy
	69b6E5XRQOkDT1Iry5tr2uiGD+OLa0zwLK6y9AjN8lmIpqYSXZjwXpwf6nnZak0AxJ37vH8s+a9pW
	liBrtqATIUibp4k0nwCpPc+xwQzwU3bwW15fkhq6vFM88Z2GzG7AGB+84vR5YMlXG6IsR5kXpcR2G
	JgCPZ707LUcz9GiMH8xJ0RPPFzi8X6CTu5NKIdy1VsgBtV+ANLjS5Zb3ciK4YctPnEvaZNOihF4DB
	B7w1wdyjTxp09Mbaqoag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnLl-0007hn-KK; Tue, 21 Apr 2020 07:29:45 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQhm8-0002zb-5Z
 for linux-afs@bombadil.infradead.org; Tue, 21 Apr 2020 01:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=hXaCcY8JZK3t52m1dpaNXUh7xlv428jRqCXgWAIcjhA=; b=dlLgnZ6tGb4oHrHz24B5xNXbbt
 eThqp9RnKkk17PPecBy4SBdi6fPjedH+ncOlaIOStD4SfEBcjteI+uoszTuOW5YdW2hkLhTnf/aeA
 jWzxbnIQtcQBOHKxtsqw3tnCY3oUTqBCjG3/mUG3XwgoGkNhpy1mJq4oJ9t8v5/yGeF2kKHodB59z
 ZNCMlJI1J+6MIdpiZgFgwGhAdrZXWYJ95h+lEfyRpkZqWDTBNUjssmK7jGeneQxQLaPKbez77tfZa
 lhz/eya5G+1owbZED8aj/zO/PocqvDVf7vplIhi6WcGCuKAhYvc7fvuWCWXL9BgEpv3RzdlO25gvg
 HHUuMA4A==;
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQhm5-0004JN-Vg
 for linux-afs@lists.infradead.org; Tue, 21 Apr 2020 01:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587432612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXaCcY8JZK3t52m1dpaNXUh7xlv428jRqCXgWAIcjhA=;
 b=JL2RGyY8K2u4r8i1e6qyDWluFIarhXckOZLQbSPMce2P95I39mw8bLnIgCqcRNTqDK92Q6
 rJuVXHS4j2liSGcONk9NF96WZaJ661xlMbzJQBUQAztoXi4Hg4m1GUf+nFMrQI/z9Lyhvz
 95pAL5YmskuIML7ViRrC8wLL3LWE/98=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587432630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXaCcY8JZK3t52m1dpaNXUh7xlv428jRqCXgWAIcjhA=;
 b=NIIS6y7CL3BbEpE5JkvMqjQPFUXI/60D1F9c6RmghIjSnmyE416ImvSph7qRlLwzfdPVmj
 GxoQEPk2EKDaYBN2SIWiHYtH3ojAp27NwRjLQ1PRpUpLufrbLoSsDSCN8THEw51CDdIl1v
 u6W2/+3brE4dpBCTFAOXMxgl8oGcCT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-CgCJI-v7M6KksajxzHWp-Q-1; Mon, 20 Apr 2020 21:30:02 -0400
X-MC-Unique: CgCJI-v7M6KksajxzHWp-Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CCFA1005510;
 Tue, 21 Apr 2020 01:30:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B6D8BEA65;
 Tue, 21 Apr 2020 01:30:00 +0000 (UTC)
Received: from zmail25.collab.prod.int.phx2.redhat.com
 (zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04B2F18095FF;
 Tue, 21 Apr 2020 01:30:00 +0000 (UTC)
Date: Mon, 20 Apr 2020 21:29:59 -0400 (EDT)
From: Ronnie Sahlberg <lsahlber@redhat.com>
To: Jeff Layton <jlayton@redhat.com>
Message-ID: <194431215.23515823.1587432599559.JavaMail.zimbra@redhat.com>
In-Reply-To: <93e1141d15e44a7490d756b0a00060660306fadc.camel@redhat.com>
References: <878siq587w.fsf@cjr.nz> <87imhvj7m6.fsf@cjr.nz>
 <CAH2r5mv5p=WJQu2SbTn53FeTsXyN6ke_CgEjVARQ3fX8QAtK_w@mail.gmail.com>
 <3865908.1586874010@warthog.procyon.org.uk>
 <927453.1587285472@warthog.procyon.org.uk>
 <1136024.1587388420@warthog.procyon.org.uk>
 <1986040.1587420879@warthog.procyon.org.uk>
 <93e1141d15e44a7490d756b0a00060660306fadc.camel@redhat.com>
Subject: Re: cifs - Race between IP address change and sget()?
MIME-Version: 1.0
X-Originating-IP: [10.64.54.101, 10.4.195.9]
Thread-Topic: cifs - Race between IP address change and sget()?
Thread-Index: h/QZ5ARVf/JeS6sJ73LgvlwKgiRXoA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Spam-Note: CRM114 invocation failed
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.4 on merlin.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [207.211.31.120 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Tue, 21 Apr 2020 00:29:44 -0700
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
Cc: fweimer@redhat.com, CIFS <linux-cifs@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>, Paulo Alcantara <pc@cjr.nz>,
 LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 Steve French <smfrench@gmail.com>, keyrings@vger.kernel.org,
 viro@zeniv.linux.org.uk, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org





----- Original Message -----
> From: "Jeff Layton" <jlayton@redhat.com>
> To: "David Howells" <dhowells@redhat.com>, "Paulo Alcantara" <pc@cjr.nz>
> Cc: viro@zeniv.linux.org.uk, "Steve French" <smfrench@gmail.com>, "linux-nfs" <linux-nfs@vger.kernel.org>, "CIFS"
> <linux-cifs@vger.kernel.org>, linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org, keyrings@vger.kernel.org,
> "Network Development" <netdev@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, fweimer@redhat.com
> Sent: Tuesday, 21 April, 2020 8:30:37 AM
> Subject: Re: cifs - Race between IP address change and sget()?
> 
> On Mon, 2020-04-20 at 23:14 +0100, David Howells wrote:
> > Paulo Alcantara <pc@cjr.nz> wrote:
> > 
> > > > > > What happens if the IP address the superblock is going to changes,
> > > > > > then
> > > > > > another mount is made back to the original IP address?  Does the
> > > > > > second
> > > > > > mount just pick the original superblock?
> > > > > 
> > > > > It is going to transparently reconnect to the new ip address, SMB
> > > > > share,
> > > > > and cifs superblock is kept unchanged.  We, however, update internal
> > > > > TCP_Server_Info structure to reflect new destination ip address.
> > > > > 
> > > > > For the second mount, since the hostname (extracted out of the UNC
> > > > > path
> > > > > at mount time) resolves to a new ip address and that address was
> > > > > saved
> > > > > earlier in TCP_Server_Info structure during reconnect, we will end up
> > > > > reusing same cifs superblock as per
> > > > > fs/cifs/connect.c:cifs_match_super().
> > > > 
> > > > Would that be a bug?
> > > 
> > > Probably.
> > > 
> > > I'm not sure how that code is supposed to work, TBH.
> > 
> > Hmmm...  I think there may be a race here then - but I'm not sure it can be
> > avoided or if it matters.
> > 
> > Since the address is part of the primary key to sget() for cifs, changing
> > the
> > IP address will change the primary key.  Jeff tells me that this is
> > governed
> > by a spinlock taken by cifs_match_super().  However, sget() may be busy
> > attaching a new mount to the old superblock under the sb_lock core vfs
> > lock,
> > having already found a match.
> > 
> 
> Not exactly. Both places that match TCP_Server_Info objects by address
> hold the cifs_tcp_ses_lock. The address looks like it gets changed in
> reconn_set_ipaddr, and the lock is not currently taken there, AFAICT. I
> think it probably should be (at least around the cifs_convert_address
> call).

I think you are right. We need the spinlock around this call too.
I will send a patch to the list to add this.

> 
> > Should the change of parameters made by cifs be effected with sb_lock held
> > to
> > try and avoid ending up using the wrong superblock?
> > 
> > However, because the TCP_Server_Info is apparently updated, it looks like
> > my
> > original concern is not actually a problem (the idea that if a mounted
> > server
> > changes its IP address and then a new server comes online at the old IP
> > address, it might end up sharing superblocks because the IP address is part
> > of
> > the key).
> > 
> 
> I'm not sure we should concern ourselves with much more than just not
> allowing addresses to change while matching/searching. If you're
> standing up new servers at old addresses while you still have clients
> are migrating, then you are probably Doing it Wrong.

Agree. That is a migration process issue and not something we can/should
try to address in cifs.ko.



> 
> --
> Jeff Layton <jlayton@redhat.com>
> 
> 


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
