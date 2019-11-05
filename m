Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1D2F01FA
	for <lists+linux-afs@lfdr.de>; Tue,  5 Nov 2019 16:56:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D9g4QYxkuoZbycRhjHjUFwLZVyluIuSvUUYauC/XHkw=; b=Ag8LSXnMaQn353FIQA922Cxjr
	RlPGn+rfqRsRw0V11uiatRNHeNPCYIUWt6i4uXrtiE6bxdjZ/QeYWSJHxXPu0i+0lvXXULV0eWjwe
	AgRfdtAar/A/nZvmRjQ5F3OFMlEEKhJfMQrfwrQmecJV9xQLzhZpkj1gHl3PHZKvmB7g3+zpXSJSS
	s2XP3iMOsSVzbJ70/72RTTAzAvCLfoH2qX2KysKXVE+K0qid71GXugUXn8lT/+9I+nINPZazJpU6+
	Pt1v/DdxGptCu6IgRE941icRWUmEIRoDc7Cc30XTIEpV66rAxNC/sDW821eIz7mL/r/YHhFfdWZVz
	Dk28GfFMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS1C5-0000aI-3k; Tue, 05 Nov 2019 15:56:33 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS1C2-0000Zq-Oz
 for linux-afs@lists.infradead.org; Tue, 05 Nov 2019 15:56:31 +0000
Received: by mail-pf1-x444.google.com with SMTP id c13so15816424pfp.5
 for <linux-afs@lists.infradead.org>; Tue, 05 Nov 2019 07:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XJsNFwwu/Jlc0782LDjp8YTgvefXfXVL1aCF2AU/E8g=;
 b=YC3ddAr4UdMhHKju55t/KzWOVycmq5e0nLbh8V+2V27jOLCD1mPETt2q2qkDMtFvXk
 b9j2uAop9Xq2J/+zt+LlJ4WrHmrLjL8IUXPrTvGC2YqgjNVPVATP1yeOWf8OR5n6It1u
 iADfOJ5OXYpcDOkKEI4IHSj7dD4N4wVECKIdfev45eXq1eAR9l71SWPvaYo/sQn7tVO2
 yjXhAairdX8rx49VY1RR9SVQjOHSSyXJwKw0VIU+Z8gZgSEhmVbiA/nf+FA2Asu66oMe
 k5m3GIymIo6mP74AOUIsh6+Qd27uJz3gK32eIlcVUf210WxtTIlBoqc3pDdN82ytGfYN
 2TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XJsNFwwu/Jlc0782LDjp8YTgvefXfXVL1aCF2AU/E8g=;
 b=hJzSm0/8DZjjY1HIX3Yjzfnj9gWFp5Eb3yroPbFLYek/mdN+yZaSKG8G3ydtRuBBDd
 zFT2Lnm7upqE2oHVAodpLwu8wixXB0bFf0lwHW4tF1cRZyVgKaNhw+E0G7kH6xJXjQb6
 ZwWb4lTPWCsKC3fDrlGlSTpNGBzGys8/kK4FSekUeL0i7gxbv3a1d0feMnEr7ymVHvuq
 dXWImfgeKahPf2iJANCSuOJM0Qm0zaYIg3RMGK9/KkIpcK9dHx/Tzo8L5ugnGXSlVBYW
 3wph7auN9/LpoNcR6afJJHHcL6rGealMuGj4LAb9Kc/ioVE6gEGuNCnHrIjnfFKH4KKO
 POow==
X-Gm-Message-State: APjAAAVoqXuClK7Ra+oYEqyR0MuuzhL6Y9ByGXq/Jijtl5SaXDm3TTs3
 H3PcPFt8uSz26lUWKXR+xAGS5+eIeFB6vA==
X-Google-Smtp-Source: APXvYqx865TcFioge9LAZA+i1UxRYOyJHhiIep6k07mIyKrFbOEQ1QQaUbGriZKXguMbJA39nlmSZQ==
X-Received: by 2002:a65:6482:: with SMTP id e2mr3901602pgv.20.1572969389855;
 Tue, 05 Nov 2019 07:56:29 -0800 (PST)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id x2sm7984553pfn.167.2019.11.05.07.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 07:56:29 -0800 (PST)
Subject: Re: [PATCH] afs: xattr: use scnprintf
To: linux-kernel@vger.kernel.org
References: <20191105154850.187723-1-salyzyn@android.com>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <2e530f62-89bc-4314-8e78-e5cc049c5d69@android.com>
Date: Tue, 5 Nov 2019 07:56:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105154850.187723-1-salyzyn@android.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_075630_813510_64F5AC1E 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-0.2 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [2607:f8b0:4864:20:0:0:0:444 listed in]
 [list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
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
Cc: linux-fsdevel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Jan Kara <jack@suse.cz>, kernel-team@android.com,
 linux-afs@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

On 11/5/19 7:48 AM, Mark Salyzyn wrote:
> sprintf and snprintf are fragile in future maintenance, switch to
> using scnprintf to ensure no accidental Use After Free conditions
> are introduced.

Urrrk Out of band stack access ...

-- Mark


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
