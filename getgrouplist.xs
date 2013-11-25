/*
 * Copyright (C) 2007-2013 Collax GmbH
 *                    (Bastian Friedrich <bastian.friedrich@collax.com>)
 */
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <pwd.h>

MODULE = User::getgrouplist PACKAGE = User::getgrouplist

AV *
getgrouplist(username)
        const char *username
    PREINIT:
	int count = 0;
	int i;
	gid_t *groups = NULL;
	struct passwd *pw;
    PPCODE:
	pw = getpwnam(username);
	RETVAL = NULL;

	if (pw != NULL) { /* Only execute when user exists */
		if (getgrouplist(username, pw->pw_gid, NULL, &count) < 0) {
			groups = (gid_t *) malloc(count * sizeof (gid_t));
			getgrouplist(username, pw->pw_gid, groups, &count);

			for(i = 0; i < count; i++)
				XPUSHs(sv_2mortal(newSViv(groups[i])));
		}
	}
	/*
	if (count == 0) {
		XPUSHs(&PL_sv_undef);
	}
	*/
