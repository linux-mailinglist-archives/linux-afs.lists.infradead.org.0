Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A6118E82B
	for <lists+linux-afs@lfdr.de>; Sun, 22 Mar 2020 11:57:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1hVbeW5Nn9WJqVy1BHL/YgWcKjdElGksoylWkbJuIk=; b=g5kB11a1XedmH8
	ACV/FL5RjIMq333F5EC2hkj78heawZMlW5Y2CGhC2PEaz5nx1aZfaBZH77KBZMDjrN6v68IKFGl8t
	aOC8LYrHmxwW4dqJ+WYnMGqVd+8Ple0SZkGL0VFO9K6dGXZ5MrS6/GtbIV4u2SvI0YlbvL3rnpbH2
	R6Uk2aE+uECozCF7HoymDg4Hgz7gKMYj8OPrtJlBAqJptMf1AswNHnhWUUlBbXX4R43i272Y/0gnb
	OKcgV9oYbQeVS5hHD8FpEUwx0S9jNAmFf+H99MYrngB1nqCUrbrvSOprycCOc3psLl4S7O5o+3FbR
	fZXVEk6nSr7J1a0qWL8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFyHq-0004ut-5F; Sun, 22 Mar 2020 10:56:58 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFolP-0001sH-JJ
 for linux-afs@lists.infradead.org; Sun, 22 Mar 2020 00:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584838009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXvBGWf4H3tlxTPY3JL9NJZyGrJzCSjYj7K4kPcMwd8=;
 b=fhGJotZk3JiJAUY1BKpvZ8ZtfeVE8ATqOj06sZ2dvoOybN/m8if96HxHUt02I0zTqAFgCd
 r8uM6IwqTZyKrgsnWgRSJoW590jsQDzovVWbDvNS4gmSfB0ENNgAWBu+MYqCnnamrs0g4W
 aBYIOkAqjUWVs4w/LnJNCNj5Q6aZSx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-I8Rx9gchNNiov0sHixcL3w-1; Sat, 21 Mar 2020 20:46:39 -0400
X-MC-Unique: I8Rx9gchNNiov0sHixcL3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32D37100550E;
 Sun, 22 Mar 2020 00:46:36 +0000 (UTC)
Received: from llong.remote.csb (ovpn-112-193.rdu2.redhat.com [10.10.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79FD91000325;
 Sun, 22 Mar 2020 00:46:33 +0000 (UTC)
Subject: Re: [PATCH v7 2/2] KEYS: Avoid false positive ENOMEM error on key read
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
References: <20200321184932.16579-1-longman@redhat.com>
 <20200321184932.16579-3-longman@redhat.com>
 <e3d7a227-8915-5c00-cd34-fe2db7fc7121@I-love.SAKURA.ne.jp>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <03c0c59e-a84b-bd75-6b3f-7f6467d806e2@redhat.com>
Date: Sat, 21 Mar 2020 20:46:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e3d7a227-8915-5c00-cd34-fe2db7fc7121@I-love.SAKURA.ne.jp>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200321_174651_722600_186B351C 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.3 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.205.24.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Mailman-Approved-At: Sun, 22 Mar 2020 03:56:45 -0700
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
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Chris von Recklinghausen <crecklin@redhat.com>, linux-afs@lists.infradead.org,
 Roberto Sassu <roberto.sassu@huawei.com>, Eric Biggers <ebiggers@google.com>,
 netdev@vger.kernel.org, Jerry Snitselaar <jsnitsel@redhat.com>,
 James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-integrity@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, "Serge E. Hallyn" <serge@hallyn.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 3/21/20 8:31 PM, Tetsuo Handa wrote:
> On 2020/03/22 3:49, Waiman Long wrote:
>> +	do {
>> +		if (ret > key_data_len) {
>> +			if (unlikely(key_data))
>> +				__kvzfree(key_data, key_data_len);
>> +			key_data_len = ret;
>> +			continue;	/* Allocate buffer */
> Excuse me, but "continue;" inside "do { ... } while (0);" means "break;"
> because "while (0)" is evaluated before continuing the loop.

You are right. My mistake. Will send out a new one for patch 2.

-Longman



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
