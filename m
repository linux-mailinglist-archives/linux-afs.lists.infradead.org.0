Return-Path: <linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org>
X-Original-To: lists+linux-afs@lfdr.de
Delivered-To: lists+linux-afs@lfdr.de
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DA91AD02
	for <lists+linux-afs@lfdr.de>; Sun, 12 May 2019 18:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:MIME-Version:From:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1SZrMbaex4l0d3n5a0EQK22kYNBeCibFlGfqwTwQPY=; b=RwF/Nd/Xd+w2OI
	9FKn9KZdyj+/WwY4OBdK8lUlQgl2woduc78evuYnGOu9sEz9HrwD5USkiT9FvugZIwc/tUOEHW+SD
	qH3SvjB7zB4aX5C0CJGCexqROG4HLlgsysH9m66/JhbweBPiVZNaNDsuzImWy+rLNc2mMNAGtBjZt
	AVpziyj8vLN90ixrHZ6RUPKVcdY5bxhI1kvoc4Z9Lkl81QaW+HiVfkDvlKdlGrSy6bkACHySb/sHf
	frZzmkxJFRENjqDvBcSnb92XPAndTp9DxFhg1ai5X8Bnz6QcCmiq2hQ54pRPiM9C6dCGMgcxrHN9r
	Sq8mNfJIMUEdNF5khlYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPr9p-0000Dm-5U; Sun, 12 May 2019 16:17:01 +0000
Received: from mx01-fr.bfs.de ([193.174.231.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPr9l-0000DP-UJ
 for linux-afs@lists.infradead.org; Sun, 12 May 2019 16:16:59 +0000
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
 by mx01-fr.bfs.de (Postfix) with ESMTPS id 3838F202F9;
 Sun, 12 May 2019 18:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901; 
 t=1557677233;
 h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9lIIrxqzPfMJtNjxYdjjp0sTF1N/4LjdHyl2m7Zouc=;
 b=ClIgapr3lJTQBGuJFnVflN127lsjn3Of+XZPKOKnhtcXJjHSz6v/3u7nmK5F2kQJFoDDzD
 AhEkVYRem4iFHvEknK28FRcNhTHL7VafXvPSCEW14rfjvVlo9BNJpx7VDL8q9YiWFnfaWN
 G9SfyW4ajkzvwwkPOjRIOjlkAACamwauVg+QnUP/jqjJASo7CFdPyKNquVberDrNr6fn2w
 CXV6Zu15NoDVYJEUM2wOzxeuP3UsPnE8P4wmU7pCkpHqD+KTfFrnAYPZxMzW5sHlOKuPKA
 9+l+gx6HjWB02hi9Ut8VAuGZb70ONYMaQdvLeRcVxrQgsMXQfekU0Q3FiNidQQ==
Received: from [134.92.181.33] (unknown [134.92.181.33])
 by mail-fr.bfs.de (Postfix) with ESMTPS id 80894BEEBD;
 Sun, 12 May 2019 18:07:12 +0200 (CEST)
Message-ID: <5CD844B0.5060206@bfs.de>
Date: Sun, 12 May 2019 18:07:12 +0200
From: walter harms <wharms@bfs.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
 rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 2/2] afs: Fix afs_xattr_get_yfs() to not try freeing an
 error value
References: <155764714099.24080.1233326575922058381.stgit@warthog.procyon.org.uk>
 <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk>
In-Reply-To: <155764714872.24080.15171754166782593095.stgit@warthog.procyon.org.uk>
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
 HAS_REPLYTO(0.00)[wharms@bfs.de]; TO_DN_SOME(0.00)[];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_091658_299561_257D4ABF 
X-CRM114-Status: GOOD (  21.57  )
X-Spam-Score: 2.4 (++)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (2.4 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.6 RCVD_IN_SBL            RBL: Received via a relay in Spamhaus SBL
 [134.92.181.33 listed in zen.spamhaus.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-BeenThere: linux-afs@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: "Linux AFS client discussion list." <linux-afs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-afs/>
List-Post: <mailto:linux-afs@lists.infradead.org>
List-Help: <mailto:linux-afs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-afs>,
 <mailto:linux-afs-request@lists.infradead.org?subject=subscribe>
Reply-To: wharms@bfs.de
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 joe@perches.com, colin.king@canonical.com, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-afs" <linux-afs-bounces@lists.infradead.org>
Errors-To: linux-afs-bounces+lists+linux-afs=lfdr.de@lists.infradead.org



Am 12.05.2019 09:45, schrieb David Howells:
> afs_xattr_get_yfs() tries to free yacl, which may hold an error value (say
> if yfs_fs_fetch_opaque_acl() failed and returned an error).
> 
> Fix this by allocating yacl up front (since it's a fixed-length struct,
> unlike afs_acl) and passing it in to the RPC function.  This also allows
> the flags to be placed in the object rather than passing them through to
> the RPC function.
> 
> Fixes: ae46578b963f ("afs: Get YFS ACLs and information through xattrs")
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
> 
>  fs/afs/internal.h  |    2 +
>  fs/afs/xattr.c     |   86 ++++++++++++++++++++++++++++------------------------
>  fs/afs/yfsclient.c |   29 ++++--------------
>  3 files changed, 53 insertions(+), 64 deletions(-)
> 
> diff --git a/fs/afs/internal.h b/fs/afs/internal.h
> index b3cd6e8ad59d..74ee0f8ef8dd 100644
> --- a/fs/afs/internal.h
> +++ b/fs/afs/internal.h
> @@ -1382,7 +1382,7 @@ struct yfs_acl {
>  };
>  
>  extern void yfs_free_opaque_acl(struct yfs_acl *);
> -extern struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *, unsigned int);
> +extern struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *, struct yfs_acl *);
>  extern int yfs_fs_store_opaque_acl2(struct afs_fs_cursor *, const struct afs_acl *);
>  
>  /*
> diff --git a/fs/afs/xattr.c b/fs/afs/xattr.c
> index b6c44e75b361..d12bcda911e1 100644
> --- a/fs/afs/xattr.c
> +++ b/fs/afs/xattr.c
> @@ -148,9 +148,8 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  	struct afs_vnode *vnode = AFS_FS_I(inode);
>  	struct yfs_acl *yacl = NULL;
>  	struct key *key;
> -	unsigned int flags = 0;
>  	char buf[16], *data;
> -	int which = 0, dsize, ret;
> +	int which = 0, dsize, ret = -ENOMEM;
>  
>  	if (strcmp(name, "acl") == 0)
>  		which = 0;
> @@ -163,20 +162,26 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  	else
>  		return -EOPNOTSUPP;
>  
> +	yacl = kzalloc(sizeof(struct yfs_acl), GFP_KERNEL);
> +	if (!yacl)
> +		goto error;
> +
>  	if (which == 0)
> -		flags |= YFS_ACL_WANT_ACL;
> +		yacl->flags |= YFS_ACL_WANT_ACL;
>  	else if (which == 3)
> -		flags |= YFS_ACL_WANT_VOL_ACL;
> +		yacl->flags |= YFS_ACL_WANT_VOL_ACL;
>  
>  	key = afs_request_key(vnode->volume->cell);
> -	if (IS_ERR(key))
> -		return PTR_ERR(key);
> +	if (IS_ERR(key)) {
> +		ret = PTR_ERR(key);
> +		goto error_yacl;
> +	}
>  
>  	ret = -ERESTARTSYS;
>  	if (afs_begin_vnode_operation(&fc, vnode, key)) {
>  		while (afs_select_fileserver(&fc)) {
>  			fc.cb_break = afs_calc_vnode_cb_break(vnode);
> -			yacl = yfs_fs_fetch_opaque_acl(&fc, flags);
> +			yfs_fs_fetch_opaque_acl(&fc, yacl);
>  		}
>  
>  		afs_check_for_remote_deletion(&fc, fc.vnode);
> @@ -184,44 +189,45 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>  		ret = afs_end_vnode_operation(&fc);
>  	}
>  
> -	if (ret == 0) {
> -		switch (which) {
> -		case 0:
> -			data = yacl->acl->data;
> -			dsize = yacl->acl->size;
> -			break;
> -		case 1:
> -			data = buf;
> -			dsize = snprintf(buf, sizeof(buf), "%u",
> -					 yacl->inherit_flag);
> -			break;
> -		case 2:
> -			data = buf;
> -			dsize = snprintf(buf, sizeof(buf), "%u",
> -					 yacl->num_cleaned);
> -			break;
> -		case 3:
> -			data = yacl->vol_acl->data;
> -			dsize = yacl->vol_acl->size;
> -			break;
> -		default:
> -			ret = -EOPNOTSUPP;
> -			goto out;
> -		}
> +	if (ret < 0)
> +		goto error_key;
> +
> +	switch (which) {
> +	case 0:
> +		data = yacl->acl->data;
> +		dsize = yacl->acl->size;
> +		break;
> +	case 1:
> +		data = buf;
> +		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
> +		break;
> +	case 2:
> +		data = buf;
> +		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
> +		break;
> +	case 3:
> +		data = yacl->vol_acl->data;
> +		dsize = yacl->vol_acl->size;
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		goto error_key;
> +	}
>  
> -		ret = dsize;
> -		if (size > 0) {
> -			if (dsize > size) {
> -				ret = -ERANGE;
> -				goto out;
> -			}
> -			memcpy(buffer, data, dsize);
> +	ret = dsize;
> +	if (size > 0) {
> +		if (dsize > size) {
> +			ret = -ERANGE;
> +			goto error_key;
>  		}
> +		memcpy(buffer, data, dsize);
>  	}
>  

i am confused: if size is <= 0 then the error is in dsize ?

re,
 wh

> -out:
> -	yfs_free_opaque_acl(yacl);
> +error_key:
>  	key_put(key);
> +error_yacl:
> +	yfs_free_opaque_acl(yacl);
> +error:
>  	return ret;
>  }
>  
> diff --git a/fs/afs/yfsclient.c b/fs/afs/yfsclient.c
> index 6cf7d161baa1..d3e9e3fe0b58 100644
> --- a/fs/afs/yfsclient.c
> +++ b/fs/afs/yfsclient.c
> @@ -2333,12 +2333,6 @@ void yfs_free_opaque_acl(struct yfs_acl *yacl)
>  	}
>  }
>  
> -static void yfs_destroy_fs_fetch_opaque_acl(struct afs_call *call)
> -{
> -	yfs_free_opaque_acl(call->reply[0]);
> -	afs_flat_call_destructor(call);
> -}
> -
>  /*
>   * YFS.FetchOpaqueACL operation type
>   */
> @@ -2346,18 +2340,17 @@ static const struct afs_call_type yfs_RXYFSFetchOpaqueACL = {
>  	.name		= "YFS.FetchOpaqueACL",
>  	.op		= yfs_FS_FetchOpaqueACL,
>  	.deliver	= yfs_deliver_fs_fetch_opaque_acl,
> -	.destructor	= yfs_destroy_fs_fetch_opaque_acl,
> +	.destructor	= afs_flat_call_destructor,
>  };
>  
>  /*
>   * Fetch the YFS advanced ACLs for a file.
>   */
>  struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
> -					unsigned int flags)
> +					struct yfs_acl *yacl)
>  {
>  	struct afs_vnode *vnode = fc->vnode;
>  	struct afs_call *call;
> -	struct yfs_acl *yacl;
>  	struct afs_net *net = afs_v2net(vnode);
>  	__be32 *bp;
>  
> @@ -2370,19 +2363,15 @@ struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
>  				   sizeof(__be32) * 2 +
>  				   sizeof(struct yfs_xdr_YFSFetchStatus) +
>  				   sizeof(struct yfs_xdr_YFSVolSync));
> -	if (!call)
> -		goto nomem;
> -
> -	yacl = kzalloc(sizeof(struct yfs_acl), GFP_KERNEL);
> -	if (!yacl)
> -		goto nomem_call;
> +	if (!call) {
> +		fc->ac.error = -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
> +	}
>  
> -	yacl->flags = flags;
>  	call->key = fc->key;
>  	call->reply[0] = yacl;
>  	call->reply[1] = vnode;
>  	call->reply[2] = NULL; /* volsync */
> -	call->ret_reply0 = true;
>  
>  	/* marshall the parameters */
>  	bp = call->request;
> @@ -2396,12 +2385,6 @@ struct yfs_acl *yfs_fs_fetch_opaque_acl(struct afs_fs_cursor *fc,
>  	trace_afs_make_fs_call(call, &vnode->fid);
>  	afs_make_call(&fc->ac, call, GFP_KERNEL);
>  	return (struct yfs_acl *)afs_wait_for_call_to_complete(call, &fc->ac);
> -
> -nomem_call:
> -	afs_put_call(call);
> -nomem:
> -	fc->ac.error = -ENOMEM;
> -	return ERR_PTR(-ENOMEM);
>  }
>  
>  /*
> 
> 

_______________________________________________
linux-afs mailing list
http://lists.infradead.org/mailman/listinfo/linux-afs
