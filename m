Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C6B7007
	for <lists+linux-afs@lfdr.de>; Thu, 19 Sep 2019 02:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+D4FDf2jdfBGhD2fS+1m+xy7TFaVW7ngzlALndhij8=; b=YYJmfwYXRE/2RW
	Hg4hCAmAuzCmII+Us6nsq/PwLuuW29a5hadom4zGTcjcko8YDL0gfdTk2W0ZKCrOC1d48yDM8bJZw
	htZW/Wkb05mHOD9g0K+oIQUfvFXDhIMEq4VWQpGnx9lqdxfqdE/f9DDmYUmmIU0O9oPw7cV3ngQAY
	dtG6VIfob1alhVA9uynzYrRp+x1T2JmnkeQ3nK+wr01E5EkPZbq2VKKR7tQbNXDMJEYMzIxz/Yd+G
	0w5YGc5neWebO3OBq1M6Nz2OUFrGyayZFld4ewidaqyCqe7SE2iiTk2Y1yZqf8yJZo/aP57c2R2po
	D5ZJfdTlS8S8dLJCYMBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAkE9-0001rz-MV; Thu, 19 Sep 2019 00:23:17 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAkE6-0001ra-Bf
 for linux-afs@lists.infradead.org; Thu, 19 Sep 2019 00:23:15 +0000
Received: by mail-lj1-x243.google.com with SMTP id v24so1741047ljj.3
 for <linux-afs@lists.infradead.org>; Wed, 18 Sep 2019 17:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xCq/TbFsgyz/f5qDMbrPu7H+lk7tDCVio2gz6Xsr1jk=;
 b=MjWYHCf0lYOJu/QH9oUEwcZ4Xj+0pYEV8kGM+muk3l+vc2eBgT0GnILRm6E3K4upAv
 5wJi52x8CcGq4MaaKRKZbiGJU7VX9PpS0ne8bpsgPDNKYXV2yG3+G+2sYqoKkGTFDQaT
 0DBmxCjXSSuy8q0/7sfftCtDXqZMtkWb+bWtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xCq/TbFsgyz/f5qDMbrPu7H+lk7tDCVio2gz6Xsr1jk=;
 b=tFHhluZCGPHDYJDb1GT4kQLF1neg5dkcHVbkAQES/RCtyFEu/DIi2BJX+3yfn+fjlS
 3849VKUn3rge1sOz/TeCavCQyc0UdFLKJxrAn61abTLxesRM3bSOEX2VBiOcsCHq4ROF
 Kv3vpHmh5bZcbLwxOIUJDCaMnrllhZXUvEAu5+JJQ28Sy0GOwJoAQ/VWDobVVhohq83w
 7GGTG7pPzJOEiB3/uWqzxNOBVQMtn1p6+7oyb+ShaPZXMYqiIyPIRpk+H29WtIpYurh/
 DlrC4bx7y9FJz9rKkQWj2veAoMU7q9RMP7QJfStXdCK+hlNvzSyVxAz1Z+5qg88t/lwN
 TgBA==
X-Gm-Message-State: APjAAAXBrwbBlPKpiDgWu28pZvdofFmryLKDjwKWs+yf7312y5nQS+hG
 t6Uv4I5RAItUiJ+BgYYGRayfWpVm5+o=
X-Google-Smtp-Source: APXvYqyrt5boyEJfopK8ESj9wFO26KyLE6dmoVFuOZ4fuW6EenkjotmuA5/j7Cv77JRn00H9jx1mUg==
X-Received: by 2002:a2e:780a:: with SMTP id t10mr3795245ljc.119.1568852592097; 
 Wed, 18 Sep 2019 17:23:12 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id 4sm1311953ljv.87.2019.09.18.17.23.10
 for <linux-afs@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 17:23:11 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id y3so326521ljj.6
 for <linux-afs@lists.infradead.org>; Wed, 18 Sep 2019 17:23:10 -0700 (PDT)
X-Received: by 2002:a2e:9854:: with SMTP id e20mr3795217ljj.72.1568852590551; 
 Wed, 18 Sep 2019 17:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <16147.1568632167@warthog.procyon.org.uk>
In-Reply-To: <16147.1568632167@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Sep 2019 17:22:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
Message-ID: <CAHk-=wgJx0FKq5FUP85Os1HjTPds4B3aQwumnRJDp+XHEbVjfA@mail.gmail.com>
Subject: Re: [GIT PULL afs: Development for 5.4
To: David Howells <dhowells@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_172314_423917_BF7956AE 
X-CRM114-Status: GOOD (  12.47  )
X-Spam-Score: 0.1 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (0.1 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2a00:1450:4864:20:0:0:0:243 listed in]
 [list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
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
Cc: Marc Dionne <marc.dionne@auristor.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On Mon, Sep 16, 2019 at 4:09 AM David Howells <dhowells@redhat.com> wrote:
>
> Here's a set of patches for AFS.  The first three are trivial, deleting
> unused symbols and rolling out a wrapper function.

Pulled.

However, I was close to unpulling it again. It has a merge commit with
this merge message:

    Merge remote-tracking branch 'net/master' into afs-next

and that simply is not acceptable.

Commit messages need to explain the commit. The same is even more true
of merges!

In a regular commit, you can at least look at the patch and say "ok,
that  change is obvious and self-explanatory".

In a merge commit, the _only_ explanation you have is basically the
commit message, and when the commit message is garbage, the merge is
garbage.

If you can't explain why you are doing a merge, then you shouldn't do
the merge. It's that simple.

And if you can't be bothered to write the explanation down, I'm not
sure I can be bothered to then pull the end result.

             Linus

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
