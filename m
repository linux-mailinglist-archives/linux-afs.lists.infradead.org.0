Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18B5B712
	for <lists+linux-afs@lfdr.de>; Mon,  1 Jul 2019 10:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VpDmUWWDW5qvbpcsDDs6AOLDwkt4ODk7SbNjqVJNV/g=; b=ka2a02oFpR2AXd
	9NTZqG0SrTJuW4Bk85H3ShOp1/VL82+wm7JF1jje97JLWWFnXc4xEuXeeyG1NeR63TCXvaGOe45LH
	JIvnXs71/RLsf6OM3exdul9NhKLoILdVgCZc8iZnX/F382hxD+Ns4ege0ss60F4PG1kumuman9FIf
	Kdi1h2btkazgLUXeO+9Lfl5F/kk3aiti5rAD+N4ipTYsPJ1zBGehKzSy+l2DIRB0b4eORn/eKgIbG
	IIDY6JqfSF1rZVTekUlPdh6WUOcWusXxen7H2WXKzOFPt8A49yWW5gKB6zV+Im93LCLQHeyIFHouM
	0EkXSleV5I0OGDsTeaiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhrvT-0007OC-Of; Mon, 01 Jul 2019 08:44:39 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhrvQ-0007N0-Fq
 for linux-afs@lists.infradead.org; Mon, 01 Jul 2019 08:44:38 +0000
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 458FB308222E;
 Mon,  1 Jul 2019 08:44:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-219.rdu2.redhat.com
 [10.10.120.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D3986F948;
 Mon,  1 Jul 2019 08:44:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH] afs: Add support for the UAE error table
From: David Howells <dhowells@redhat.com>
To: dariaphoebe@auristor.com
Date: Mon, 01 Jul 2019 09:44:22 +0100
Message-ID: <156197066210.7344.16692368581305080398.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 01 Jul 2019 08:44:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_014436_565007_7FFD87E1 
X-CRM114-Status: GOOD (  21.59  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
Cc: dhowells@redhat.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org

Add support for mapping AFS UAE abort codes to Linux errno values.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/misc.c         |   48 +++++++-----------
 fs/afs/protocol_uae.h |  132 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+), 28 deletions(-)
 create mode 100644 fs/afs/protocol_uae.h

diff --git a/fs/afs/misc.c b/fs/afs/misc.c
index 7f2af061ea06..b67a9c38dfa6 100644
--- a/fs/afs/misc.c
+++ b/fs/afs/misc.c
@@ -14,6 +14,7 @@
 #include <linux/errno.h>
 #include "internal.h"
 #include "afs_fs.h"
+#include "protocol_uae.h"
 
 /*
  * convert an AFS abort code to a Linux error number
@@ -69,34 +70,25 @@ int afs_abort_to_error(u32 abort_code)
 	case AFSVL_PERM:		return -EACCES;
 	case AFSVL_NOMEM:		return -EREMOTEIO;
 
-		/* Unified AFS error table; ET "uae" == 0x2f6df00 */
-	case 0x2f6df00:		return -EPERM;
-	case 0x2f6df01:		return -ENOENT;
-	case 0x2f6df04:		return -EIO;
-	case 0x2f6df0a:		return -EAGAIN;
-	case 0x2f6df0b:		return -ENOMEM;
-	case 0x2f6df0c:		return -EACCES;
-	case 0x2f6df0f:		return -EBUSY;
-	case 0x2f6df10:		return -EEXIST;
-	case 0x2f6df11:		return -EXDEV;
-	case 0x2f6df12:		return -ENODEV;
-	case 0x2f6df13:		return -ENOTDIR;
-	case 0x2f6df14:		return -EISDIR;
-	case 0x2f6df15:		return -EINVAL;
-	case 0x2f6df1a:		return -EFBIG;
-	case 0x2f6df1b:		return -ENOSPC;
-	case 0x2f6df1d:		return -EROFS;
-	case 0x2f6df1e:		return -EMLINK;
-	case 0x2f6df20:		return -EDOM;
-	case 0x2f6df21:		return -ERANGE;
-	case 0x2f6df22:		return -EDEADLK;
-	case 0x2f6df23:		return -ENAMETOOLONG;
-	case 0x2f6df24:		return -ENOLCK;
-	case 0x2f6df26:		return -ENOTEMPTY;
-	case 0x2f6df28:		return -EWOULDBLOCK;
-	case 0x2f6df69:		return -ENOTCONN;
-	case 0x2f6df6c:		return -ETIMEDOUT;
-	case 0x2f6df78:		return -EDQUOT;
+		/* Unified AFS error table */
+	case UAEPERM:			return -EPERM;
+	case UAENOENT:			return -ENOENT;
+	case UAEACCES:			return -EACCES;
+	case UAEBUSY:			return -EBUSY;
+	case UAEEXIST:			return -EEXIST;
+	case UAENOTDIR:			return -ENOTDIR;
+	case UAEISDIR:			return -EISDIR;
+	case UAEFBIG:			return -EFBIG;
+	case UAENOSPC:			return -ENOSPC;
+	case UAEROFS:			return -EROFS;
+	case UAEMLINK:			return -EMLINK;
+	case UAEDEADLK:			return -EDEADLK;
+	case UAENAMETOOLONG:		return -ENAMETOOLONG;
+	case UAENOLCK:			return -ENOLCK;
+	case UAENOTEMPTY:		return -ENOTEMPTY;
+	case UAELOOP:			return -ELOOP;
+	case UAENOMEDIUM:		return -ENOMEDIUM;
+	case UAEDQUOT:			return -EDQUOT;
 
 		/* RXKAD abort codes; from include/rxrpc/packet.h.  ET "RXK" == 0x1260B00 */
 	case RXKADINCONSISTENCY: return -EPROTO;
diff --git a/fs/afs/protocol_uae.h b/fs/afs/protocol_uae.h
new file mode 100644
index 000000000000..1b3d1060bd34
--- /dev/null
+++ b/fs/afs/protocol_uae.h
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Universal AFS Error codes (UAE).
+ *
+ * Copyright (C) 2003, Daria Phoebe Brashear
+ * Copyright (C) 2018 Red Hat, Inc. All Rights Reserved.
+ */
+
+enum {
+	UAEPERM			= 0x2f6df00, /* Operation not permitted */
+	UAENOENT		= 0x2f6df01, /* No such file or directory */
+	UAESRCH			= 0x2f6df02, /* No such process */
+	UAEINTR			= 0x2f6df03, /* Interrupted system call */
+	UAEIO			= 0x2f6df04, /* I/O error */
+	UAENXIO			= 0x2f6df05, /* No such device or address */
+	UAE2BIG			= 0x2f6df06, /* Arg list too long */
+	UAENOEXEC		= 0x2f6df07, /* Exec format error */
+	UAEBADF			= 0x2f6df08, /* Bad file number */
+	UAECHILD		= 0x2f6df09, /* No child processes */
+	UAEAGAIN		= 0x2f6df0a, /* Try again */
+	UAENOMEM		= 0x2f6df0b, /* Out of memory */
+	UAEACCES		= 0x2f6df0c, /* Permission denied */
+	UAEFAULT		= 0x2f6df0d, /* Bad address */
+	UAENOTBLK		= 0x2f6df0e, /* Block device required */
+	UAEBUSY			= 0x2f6df0f, /* Device or resource busy */
+	UAEEXIST		= 0x2f6df10, /* File exists */
+	UAEXDEV			= 0x2f6df11, /* Cross-device link */
+	UAENODEV		= 0x2f6df12, /* No such device */
+	UAENOTDIR		= 0x2f6df13, /* Not a directory */
+	UAEISDIR		= 0x2f6df14, /* Is a directory */
+	UAEINVAL		= 0x2f6df15, /* Invalid argument */
+	UAENFILE		= 0x2f6df16, /* File table overflow */
+	UAEMFILE		= 0x2f6df17, /* Too many open files */
+	UAENOTTY		= 0x2f6df18, /* Not a typewriter */
+	UAETXTBSY		= 0x2f6df19, /* Text file busy */
+	UAEFBIG			= 0x2f6df1a, /* File too large */
+	UAENOSPC		= 0x2f6df1b, /* No space left on device */
+	UAESPIPE		= 0x2f6df1c, /* Illegal seek */
+	UAEROFS			= 0x2f6df1d, /* Read-only file system */
+	UAEMLINK		= 0x2f6df1e, /* Too many links */
+	UAEPIPE			= 0x2f6df1f, /* Broken pipe */
+	UAEDOM			= 0x2f6df20, /* Math argument out of domain of func */
+	UAERANGE		= 0x2f6df21, /* Math result not representable */
+	UAEDEADLK		= 0x2f6df22, /* Resource deadlock would occur */
+	UAENAMETOOLONG		= 0x2f6df23, /* File name too long */
+	UAENOLCK		= 0x2f6df24, /* No record locks available */
+	UAENOSYS		= 0x2f6df25, /* Function not implemented */
+	UAENOTEMPTY		= 0x2f6df26, /* Directory not empty */
+	UAELOOP			= 0x2f6df27, /* Too many symbolic links encountered */
+	UAEWOULDBLOCK		= 0x2f6df28, /* Operation would block */
+	UAENOMSG		= 0x2f6df29, /* No message of desired type */
+	UAEIDRM			= 0x2f6df2a, /* Identifier removed */
+	UAECHRNG		= 0x2f6df2b, /* Channel number out of range */
+	UAEL2NSYNC		= 0x2f6df2c, /* Level 2 not synchronized */
+	UAEL3HLT		= 0x2f6df2d, /* Level 3 halted */
+	UAEL3RST		= 0x2f6df2e, /* Level 3 reset */
+	UAELNRNG		= 0x2f6df2f, /* Link number out of range */
+	UAEUNATCH		= 0x2f6df30, /* Protocol driver not attached */
+	UAENOCSI		= 0x2f6df31, /* No CSI structure available */
+	UAEL2HLT		= 0x2f6df32, /* Level 2 halted */
+	UAEBADE			= 0x2f6df33, /* Invalid exchange */
+	UAEBADR			= 0x2f6df34, /* Invalid request descriptor */
+	UAEXFULL		= 0x2f6df35, /* Exchange full */
+	UAENOANO		= 0x2f6df36, /* No anode */
+	UAEBADRQC		= 0x2f6df37, /* Invalid request code */
+	UAEBADSLT		= 0x2f6df38, /* Invalid slot */
+	UAEBFONT		= 0x2f6df39, /* Bad font file format */
+	UAENOSTR		= 0x2f6df3a, /* Device not a stream */
+	UAENODATA		= 0x2f6df3b, /* No data available */
+	UAETIME			= 0x2f6df3c, /* Timer expired */
+	UAENOSR			= 0x2f6df3d, /* Out of streams resources */
+	UAENONET		= 0x2f6df3e, /* Machine is not on the network */
+	UAENOPKG		= 0x2f6df3f, /* Package not installed */
+	UAEREMOTE		= 0x2f6df40, /* Object is remote */
+	UAENOLINK		= 0x2f6df41, /* Link has been severed */
+	UAEADV			= 0x2f6df42, /* Advertise error */
+	UAESRMNT		= 0x2f6df43, /* Srmount error */
+	UAECOMM			= 0x2f6df44, /* Communication error on send */
+	UAEPROTO		= 0x2f6df45, /* Protocol error */
+	UAEMULTIHOP		= 0x2f6df46, /* Multihop attempted */
+	UAEDOTDOT		= 0x2f6df47, /* RFS specific error */
+	UAEBADMSG		= 0x2f6df48, /* Not a data message */
+	UAEOVERFLOW		= 0x2f6df49, /* Value too large for defined data type */
+	UAENOTUNIQ		= 0x2f6df4a, /* Name not unique on network */
+	UAEBADFD		= 0x2f6df4b, /* File descriptor in bad state */
+	UAEREMCHG		= 0x2f6df4c, /* Remote address changed */
+	UAELIBACC		= 0x2f6df4d, /* Can not access a needed shared library */
+	UAELIBBAD		= 0x2f6df4e, /* Accessing a corrupted shared library */
+	UAELIBSCN		= 0x2f6df4f, /* .lib section in a.out corrupted */
+	UAELIBMAX		= 0x2f6df50, /* Attempting to link in too many shared libraries */
+	UAELIBEXEC		= 0x2f6df51, /* Cannot exec a shared library directly */
+	UAEILSEQ		= 0x2f6df52, /* Illegal byte sequence */
+	UAERESTART		= 0x2f6df53, /* Interrupted system call should be restarted */
+	UAESTRPIPE		= 0x2f6df54, /* Streams pipe error */
+	UAEUSERS		= 0x2f6df55, /* Too many users */
+	UAENOTSOCK		= 0x2f6df56, /* Socket operation on non-socket */
+	UAEDESTADDRREQ		= 0x2f6df57, /* Destination address required */
+	UAEMSGSIZE		= 0x2f6df58, /* Message too long */
+	UAEPROTOTYPE		= 0x2f6df59, /* Protocol wrong type for socket */
+	UAENOPROTOOPT		= 0x2f6df5a, /* Protocol not available */
+	UAEPROTONOSUPPORT	= 0x2f6df5b, /* Protocol not supported */
+	UAESOCKTNOSUPPORT	= 0x2f6df5c, /* Socket type not supported */
+	UAEOPNOTSUPP		= 0x2f6df5d, /* Operation not supported on transport endpoint */
+	UAEPFNOSUPPORT		= 0x2f6df5e, /* Protocol family not supported */
+	UAEAFNOSUPPORT		= 0x2f6df5f, /* Address family not supported by protocol */
+	UAEADDRINUSE		= 0x2f6df60, /* Address already in use */
+	UAEADDRNOTAVAIL		= 0x2f6df61, /* Cannot assign requested address */
+	UAENETDOWN		= 0x2f6df62, /* Network is down */
+	UAENETUNREACH		= 0x2f6df63, /* Network is unreachable */
+	UAENETRESET		= 0x2f6df64, /* Network dropped connection because of reset */
+	UAECONNABORTED		= 0x2f6df65, /* Software caused connection abort */
+	UAECONNRESET		= 0x2f6df66, /* Connection reset by peer */
+	UAENOBUFS		= 0x2f6df67, /* No buffer space available */
+	UAEISCONN		= 0x2f6df68, /* Transport endpoint is already connected */
+	UAENOTCONN		= 0x2f6df69, /* Transport endpoint is not connected */
+	UAESHUTDOWN		= 0x2f6df6a, /* Cannot send after transport endpoint shutdown */
+	UAETOOMANYREFS		= 0x2f6df6b, /* Too many references: cannot splice */
+	UAETIMEDOUT		= 0x2f6df6c, /* Connection timed out */
+	UAECONNREFUSED		= 0x2f6df6d, /* Connection refused */
+	UAEHOSTDOWN		= 0x2f6df6e, /* Host is down */
+	UAEHOSTUNREACH		= 0x2f6df6f, /* No route to host */
+	UAEALREADY		= 0x2f6df70, /* Operation already in progress */
+	UAEINPROGRESS		= 0x2f6df71, /* Operation now in progress */
+	UAESTALE		= 0x2f6df72, /* Stale NFS file handle */
+	UAEUCLEAN		= 0x2f6df73, /* Structure needs cleaning */
+	UAENOTNAM		= 0x2f6df74, /* Not a XENIX named type file */
+	UAENAVAIL		= 0x2f6df75, /* No XENIX semaphores available */
+	UAEISNAM		= 0x2f6df76, /* Is a named type file */
+	UAEREMOTEIO		= 0x2f6df77, /* Remote I/O error */
+	UAEDQUOT		= 0x2f6df78, /* Quota exceeded */
+	UAENOMEDIUM		= 0x2f6df79, /* No medium found */
+	UAEMEDIUMTYPE		= 0x2f6df7a, /* Wrong medium type */
+};


_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
