Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B913E162D12
	for <lists+linux-afs@lfdr.de>; Tue, 18 Feb 2020 18:35:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kexV2MmUfciRQl2LhVgVoXvReVBfeaPF9JmiK3G8VIk=; b=PNHgjjqKZTzYUj
	Tb6Cjj6OMeAkTie3Ydv2p2mBpmund4CkEQ1TNLPiWE41R1SWaCfwuoLbXuNQM+/P74wuJpPRY068g
	oZ4vVSs54+/fiSBTZmSyZ+xfwgPBjQ+1pOhb7YEXbUrwl6qlanEqpek4unEy+pIvLpCk0qj6IyS9S
	JL+Yv9wRCRvGzXGghkErAdrxr1619fdz0/f/1ZNZTq7LT+imFPVzWdqzpDg7mlJ4LtaCnZP4i6ihz
	FNWmnLpEeXFL+mmlGbRel462VaVdwF8VILZZLSvbLW54e3mwqqklXPI4p0b6L7VSISzBrbdb6sWrk
	Y+eL3PsmffrrJDPgXc8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j46lu-0006P8-58; Tue, 18 Feb 2020 17:34:58 +0000
Received: from ip-109-41-129-189.web.vodafone.de ([109.41.129.189]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3j0c-0006ud-6y; Mon, 17 Feb 2020 16:12:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1j3j0Z-000fYx-H7; Mon, 17 Feb 2020 17:12:31 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 00/44] Manually convert filesystem FS documents to ReST
Date: Mon, 17 Feb 2020 17:11:46 +0100
Message-Id: <cover.1581955849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
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
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mtd@lists.infradead.org, Tyler Hicks <code@tyhicks.com>,
 linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, Christoph Hellwig <hch@infradead.org>,
 linux-nilfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Chris Mason <clm@fb.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
 Gao Xiang <xiang@kernel.org>, linux-ext4@vger.kernel.org,
 Salah Triki <salah.triki@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devel@lists.orangefs.org, ecryptfs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-fsdevel@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-ntfs-dev@lists.sourceforge.net, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, Johannes Thumshirn <jth@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

There are lots of plain text documents under Documentation/filesystems.

Manually convert several of those to ReST and add them to the index file.

Mauro Carvalho Chehab (44):
  docs: filesystems: convert 9p.txt to ReST
  docs: filesystems: convert adfs.txt to ReST
  docs: filesystems: convert affs.txt to ReST
  docs: filesystems: convert afs.txt to ReST
  docs: filesystems: convert autofs-mount-control.txt to ReST
  docs: filesystems: convert befs.txt to ReST
  docs: filesystems: convert bfs.txt to ReST
  docs: filesystems: convert btrfs.txt to ReST
  docs: filesystems: convert ceph.txt to ReST
  docs: filesystems: convert cramfs.txt to ReST
  docs: filesystems: convert debugfs.txt to ReST
  docs: filesystems: convert dlmfs.txt to ReST
  docs: filesystems: convert ecryptfs.txt to ReST
  docs: filesystems: convert efivarfs.txt to ReST
  docs: filesystems: convert erofs.txt to ReST
  docs: filesystems: convert ext2.txt to ReST
  docs: filesystems: convert ext3.txt to ReST
  docs: filesystems: convert f2fs.txt to ReST
  docs: filesystems: convert gfs2.txt to ReST
  docs: filesystems: convert gfs2-uevents.txt to ReST
  docs: filesystems: convert hfsplus.txt to ReST
  docs: filesystems: convert hfs.txt to ReST
  docs: filesystems: convert hpfs.txt to ReST
  docs: filesystems: convert inotify.txt to ReST
  docs: filesystems: convert isofs.txt to ReST
  docs: filesystems: convert nilfs2.txt to ReST
  docs: filesystems: convert ntfs.txt to ReST
  docs: filesystems: convert ocfs2-online-filecheck.txt to ReST
  docs: filesystems: convert ocfs2.txt to ReST
  docs: filesystems: convert omfs.txt to ReST
  docs: filesystems: convert orangefs.txt to ReST
  docs: filesystems: convert proc.txt to ReST
  docs: filesystems: convert qnx6.txt to ReST
  docs: filesystems: convert ramfs-rootfs-initramfs.txt to ReST
  docs: filesystems: convert relay.txt to ReST
  docs: filesystems: convert romfs.txt to ReST
  docs: filesystems: convert squashfs.txt to ReST
  docs: filesystems: convert sysfs.txt to ReST
  docs: filesystems: convert sysv-fs.txt to ReST
  docs: filesystems: convert tmpfs.txt to ReST
  docs: filesystems: convert ubifs-authentication.rst.txt to ReST
  docs: filesystems: convert ubifs.txt to ReST
  docs: filesystems: convert udf.txt to ReST
  docs: filesystems: convert zonefs.txt to ReST

 Documentation/filesystems/{9p.txt => 9p.rst}  |  114 +-
 .../filesystems/{adfs.txt => adfs.rst}        |   29 +-
 .../filesystems/{affs.txt => affs.rst}        |   62 +-
 .../filesystems/{afs.txt => afs.rst}          |   73 +-
 ...t-control.txt => autofs-mount-control.rst} |  102 +-
 .../filesystems/{befs.txt => befs.rst}        |   59 +-
 .../filesystems/{bfs.txt => bfs.rst}          |   37 +-
 .../filesystems/{btrfs.txt => btrfs.rst}      |    3 +
 .../filesystems/{ceph.txt => ceph.rst}        |   26 +-
 .../filesystems/{cramfs.txt => cramfs.rst}    |   19 +-
 .../filesystems/{debugfs.txt => debugfs.rst}  |   54 +-
 .../filesystems/{dlmfs.txt => dlmfs.rst}      |   28 +-
 .../{ecryptfs.txt => ecryptfs.rst}            |   44 +-
 .../{efivarfs.txt => efivarfs.rst}            |    5 +-
 .../filesystems/{erofs.txt => erofs.rst}      |  175 +-
 .../filesystems/{ext2.txt => ext2.rst}        |   41 +-
 .../filesystems/{ext3.txt => ext3.rst}        |    2 +
 .../filesystems/{f2fs.txt => f2fs.rst}        |  252 +--
 .../{gfs2-uevents.txt => gfs2-uevents.rst}    |   20 +-
 .../filesystems/{gfs2.txt => gfs2.rst}        |   20 +-
 .../filesystems/{hfs.txt => hfs.rst}          |   23 +-
 .../filesystems/{hfsplus.txt => hfsplus.rst}  |    2 +
 .../filesystems/{hpfs.txt => hpfs.rst}        |  239 ++-
 Documentation/filesystems/index.rst           |   46 +-
 .../filesystems/{inotify.txt => inotify.rst}  |   33 +-
 Documentation/filesystems/isofs.rst           |   64 +
 Documentation/filesystems/isofs.txt           |   48 -
 .../filesystems/{nilfs2.txt => nilfs2.rst}    |   40 +-
 .../filesystems/{ntfs.txt => ntfs.rst}        |  143 +-
 ...lecheck.txt => ocfs2-online-filecheck.rst} |   45 +-
 .../filesystems/{ocfs2.txt => ocfs2.rst}      |   31 +-
 Documentation/filesystems/omfs.rst            |  112 ++
 Documentation/filesystems/omfs.txt            |  106 --
 .../{orangefs.txt => orangefs.rst}            |  187 +-
 .../filesystems/{proc.txt => proc.rst}        | 1498 +++++++++--------
 .../filesystems/{qnx6.txt => qnx6.rst}        |   22 +
 ...itramfs.txt => ramfs-rootfs-initramfs.rst} |   54 +-
 .../filesystems/{relay.txt => relay.rst}      |  129 +-
 .../filesystems/{romfs.txt => romfs.rst}      |   42 +-
 .../{squashfs.txt => squashfs.rst}            |   60 +-
 .../filesystems/{sysfs.txt => sysfs.rst}      |  324 ++--
 .../filesystems/{sysv-fs.txt => sysv-fs.rst}  |  155 +-
 .../filesystems/{tmpfs.txt => tmpfs.rst}      |   44 +-
 .../filesystems/ubifs-authentication.rst      |   10 +-
 .../filesystems/{ubifs.txt => ubifs.rst}      |   25 +-
 .../filesystems/{udf.txt => udf.rst}          |   21 +-
 .../filesystems/{zonefs.txt => zonefs.rst}    |  106 +-
 47 files changed, 2739 insertions(+), 2035 deletions(-)
 rename Documentation/filesystems/{9p.txt => 9p.rst} (63%)
 rename Documentation/filesystems/{adfs.txt => adfs.rst} (85%)
 rename Documentation/filesystems/{affs.txt => affs.rst} (86%)
 rename Documentation/filesystems/{afs.txt => afs.rst} (90%)
 rename Documentation/filesystems/{autofs-mount-control.txt => autofs-mount-control.rst} (89%)
 rename Documentation/filesystems/{befs.txt => befs.rst} (83%)
 rename Documentation/filesystems/{bfs.txt => bfs.rst} (71%)
 rename Documentation/filesystems/{btrfs.txt => btrfs.rst} (96%)
 rename Documentation/filesystems/{ceph.txt => ceph.rst} (91%)
 rename Documentation/filesystems/{cramfs.txt => cramfs.rst} (88%)
 rename Documentation/filesystems/{debugfs.txt => debugfs.rst} (91%)
 rename Documentation/filesystems/{dlmfs.txt => dlmfs.rst} (86%)
 rename Documentation/filesystems/{ecryptfs.txt => ecryptfs.rst} (70%)
 rename Documentation/filesystems/{efivarfs.txt => efivarfs.rst} (85%)
 rename Documentation/filesystems/{erofs.txt => erofs.rst} (54%)
 rename Documentation/filesystems/{ext2.txt => ext2.rst} (91%)
 rename Documentation/filesystems/{ext3.txt => ext3.rst} (88%)
 rename Documentation/filesystems/{f2fs.txt => f2fs.rst} (84%)
 rename Documentation/filesystems/{gfs2-uevents.txt => gfs2-uevents.rst} (94%)
 rename Documentation/filesystems/{gfs2.txt => gfs2.rst} (76%)
 rename Documentation/filesystems/{hfs.txt => hfs.rst} (80%)
 rename Documentation/filesystems/{hfsplus.txt => hfsplus.rst} (95%)
 rename Documentation/filesystems/{hpfs.txt => hpfs.rst} (66%)
 rename Documentation/filesystems/{inotify.txt => inotify.rst} (83%)
 create mode 100644 Documentation/filesystems/isofs.rst
 delete mode 100644 Documentation/filesystems/isofs.txt
 rename Documentation/filesystems/{nilfs2.txt => nilfs2.rst} (89%)
 rename Documentation/filesystems/{ntfs.txt => ntfs.rst} (85%)
 rename Documentation/filesystems/{ocfs2-online-filecheck.txt => ocfs2-online-filecheck.rst} (77%)
 rename Documentation/filesystems/{ocfs2.txt => ocfs2.rst} (88%)
 create mode 100644 Documentation/filesystems/omfs.rst
 delete mode 100644 Documentation/filesystems/omfs.txt
 rename Documentation/filesystems/{orangefs.txt => orangefs.rst} (83%)
 rename Documentation/filesystems/{proc.txt => proc.rst} (65%)
 rename Documentation/filesystems/{qnx6.txt => qnx6.rst} (98%)
 rename Documentation/filesystems/{ramfs-rootfs-initramfs.txt => ramfs-rootfs-initramfs.rst} (91%)
 rename Documentation/filesystems/{relay.txt => relay.rst} (91%)
 rename Documentation/filesystems/{romfs.txt => romfs.rst} (86%)
 rename Documentation/filesystems/{squashfs.txt => squashfs.rst} (91%)
 rename Documentation/filesystems/{sysfs.txt => sysfs.rst} (56%)
 rename Documentation/filesystems/{sysv-fs.txt => sysv-fs.rst} (73%)
 rename Documentation/filesystems/{tmpfs.txt => tmpfs.rst} (86%)
 rename Documentation/filesystems/{ubifs.txt => ubifs.rst} (91%)
 rename Documentation/filesystems/{udf.txt => udf.rst} (83%)
 rename Documentation/filesystems/{zonefs.txt => zonefs.rst} (90%)

-- 
2.24.1



_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
