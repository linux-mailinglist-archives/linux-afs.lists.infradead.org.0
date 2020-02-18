Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED4162D11
	for <lists+linux-afs@lfdr.de>; Tue, 18 Feb 2020 18:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOiWw3Zhm6hXsRfe/olLp7AqcHRmDnm9OK95wkGEGEE=; b=U5nIT8jch4bxkU
	Jv+X+0mAGZEOtjuhzkxznKAutX84idbkLqf1X6SG87Lpm8oA3dMpwPymahLAjWerxXuxqqR7BMdKt
	rickmKcDcmO3eAtnSisnLPN6WaaFk2q8xNeFvVlFxTZuwkzxvFYWtZXFBSc4BpaeR0uS4lx7x/FVx
	vOD1oY2a3VbLh9lOj5sktb/tfPAIHjEEERy/9EMozRfnEfrhgzq33VZmz8/yvKQ5NcUjdHoMUWNZy
	IkobmDNsWdQyihWABcNQUv55RMo5Jk/g3C2ybwbZwwtXUA99G4sRWqAXGVjjNd46mO1u4Fe6oTRF1
	Mzt1kbf+Izp7mkNpfwRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j46lu-0006PR-OL; Tue, 18 Feb 2020 17:34:58 +0000
Received: from ip-109-41-129-189.web.vodafone.de ([109.41.129.189]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3zjq-0002gZ-Vj; Tue, 18 Feb 2020 10:04:23 +0000
Date: Tue, 18 Feb 2020 11:04:06 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 00/44] Manually convert filesystem FS documents to ReST
Message-ID: <20200218110406.098fdc09@kernel.org>
In-Reply-To: <20200218040146.GM7778@bombadil.infradead.org>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
 <20200218040146.GM7778@bombadil.infradead.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 09:34:56 -0800
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>, Jan Kara <jack@suse.cz>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, Christoph Hellwig <hch@infradead.org>,
 linux-nilfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devel@lists.orangefs.org, Chao Yu <chao@kernel.org>,
 Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Bob Peterson <rpeterso@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>, Johannes Thumshirn <jth@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Em Mon, 17 Feb 2020 20:01:46 -0800
Matthew Wilcox <willy@infradead.org> escreveu:

> On Mon, Feb 17, 2020 at 05:11:46PM +0100, Mauro Carvalho Chehab wrote:
> > There are lots of plain text documents under Documentation/filesystems.
> > 
> > Manually convert several of those to ReST and add them to the index file.  
> 
> I think at least 90% of this material needs to be in admin-guide.  Should
> we create Documentation/admin-guide/filesystems/ and move most of these
> files there?

It makes sense to me. Yet, there are some of those files that contains
both user-facing and kernel-facing docs at the same place. 

Btw, I found the same pattern on *several* other subsystems: when
someone is documenting some feature, it tends to document both kAPI,
uAPI and admin.

Right now, what we did so far on most places were to keep the stuff 
together, as splitting them could sometimes be painful.

As we are too close to finish the ReST conversion[1], I would prefer to
first finish it. 

Then, do a second pass at files outside the new directories (like
admin-guide), in order to better organize things, eventually splitting
some files into kAPI, uAPI and/or admin-guide.

[1] Looking at next-20200217, after my last doc patches applied on this tree:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=all_docs_merged

excluding (most) false positives, we have now only ~50 text files left to
convert:

$ dirname $(find Documentation/ -type f|grep -vE '\.(rst|svg|dot|py|awk|sh|pl|gitignore|S|yaml|c|inf|vim|modes)'|grep -vE '(Makefile|Kconfig|LICENSE|COPYING-logo|ChangeLog|CREDITS)'|grep -v devicetree/bindings|grep -vE 'Documentation/(ABI|features|output|SubmittingPatches|CodingStyle|logo.gif|dontdiff|sphinx/requirements.txt|admin-guide/kdump/gdbmacros.txt|admin-guide/aoe/udev.txt|EDID/hex|netlabel/draft-ietf-cipso-ipsecurity-01.txt|firmware_class/hotplug-script|target/target-export-device|networking/mac80211-auth-assoc-deauth.txt|sparc/oradax/dax-hv-api.txt)'|grep -v translations)|sort|uniq -c|sort -n
$ echo -n "Total: "
$ dirname $(find Documentation/ -type f|grep -vE '\.(rst|svg|dot|py|awk|sh|pl|gitignore|S|yaml|c|inf|vim|modes)'|grep -vE '(Makefile|Kconfig|LICENSE|COPYING-logo|ChangeLog|CREDITS)'|grep -v devicetree/bindings|grep -vE 'Documentation/(ABI|features|output|SubmittingPatches|CodingStyle|logo.gif|dontdiff|sphinx/requirements.txt|admin-guide/kdump/gdbmacros.txt|admin-guide/aoe/udev.txt|EDID/hex|netlabel/draft-ietf-cipso-ipsecurity-01.txt|firmware_class/hotplug-script|target/target-export-device|networking/mac80211-auth-assoc-deauth.txt|sparc/oradax/dax-hv-api.txt)'|grep -v translations)|wc -l

      1 Documentation/filesystems/cifs
      1 Documentation/filesystems/configfs
      1 Documentation/scsi
      1 Documentation/virt/kvm/devices
      2 Documentation/admin-guide
      3 Documentation
      6 Documentation/devicetree
      6 Documentation/filesystems/caching
      8 Documentation/RCU
     21 Documentation/filesystems
Total: 50

Once we get this series merged, I'm planning to prepare and submit a second
series doing the conversion for the other ~20 filesystem files.

Btw, if you want to look how things will become after my patch series,
I'm keeping a html build after all my patch series at:

	https://www.infradead.org/~mchehab/kernel_docs/

Cheers,
Mauro

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
