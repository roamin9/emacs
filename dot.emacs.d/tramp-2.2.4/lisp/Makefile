# -*- coding: utf-8; -*-
# Emacs Makefile for TRAMP
# lisp/Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 1998-2012 Free Software Foundation, Inc.

# Author: Kai Großjohann <kai.grossjohann@gmx.net>
#         Michael Albinus <michael.albinus@gmx.de>
# Keywords: comm, processes

# This file is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

# This Makefile requires GNU make.

EMACS		= emacs
EMACS_GVFS	= yes
EMACS_GW	= yes
EMACS_UTILS	= no
INSTALL		= install -m644
MKDIR		= @mkdir -p
RM		= -rm -f

builddir        = /home/roamin9/.emacs.d/tramp-2.2.4/lisp
prefix		= /usr/local
datarootdir	= ${prefix}/share
datadir		= ${datarootdir}
lispdir		= ${datadir}/emacs/site-lisp
DESTDIR		=

CONTRIB_FILES	= password.el 
CLEAN_FILES	= .\\\#* \\\#* .*~ *~ *.aux *.cp *.cps *.diff *.dvi *.elc *.fn *.fns *.html *.info *.ky *.log *.pg *.tmp *.toc *.tp *.vr *.vrs

# trampver.el and tramp.el must be handled first due to dependencies.
LISP_FILES	= trampver.el tramp.el tramp-cache.el tramp-cmds.el	\
		  tramp-compat.el tramp-sh.el tramp-smb.el tramp-uu.el

# tramp-gvfs.el needs Emacs 23 at least.
ifeq ($(EMACS_GVFS), yes)
  LISP_FILES += tramp-gvfs.el
endif

# tramp-gw.el needs Emacs 22 at least.
ifeq ($(EMACS_GW), yes)
  LISP_FILES += tramp-gw.el
endif

# tramp-util.el and tramp-vc.el are not needed with Emacs 23.
ifeq ($(EMACS_UTILS), yes)
  LISP_FILES += tramp-util.el tramp-vc.el
endif

# tramp-ftp.el and tramp-efs.el are useful for Emacs resp XEmacs only.
ifeq ($(EMACS_INFO), emacs)
  LISP_FILES += tramp-ftp.el
else
  LISP_FILES += tramp-efs.el
endif

INSTALL_FILES	= $(LISP_FILES) $(CONTRIB_FILES) tramp-loaddefs.el \
		  $(addsuffix .elc, $(basename $(LISP_FILES) $(CONTRIB_FILES)))

ifeq ($(EMACS_INFO), emacs)
  EM = $(EMACS) --no-site-file -batch
else
  EM = $(EMACS) -vanilla -batch
endif


.PHONY: all autoloads install clean distclean tramp xemacs

.SUFFIXES: .elc .el

all: autoloads $(addsuffix .elc, $(basename $(LISP_FILES) $(CONTRIB_FILES)))

autoloads: $(builddir)/tramp-loaddefs.el
$(builddir)/tramp-loaddefs.el: $(LISP_FILES)
# XEmacs must be advised to put tramp.el definitions at the beginning.
# We redefine `autoload-trim-file-name', therefore.
	$(EM) -l autoload						    \
	  --eval "(setq generate-autoload-cookie \";;;###tramp-autoload\")" \
	  --eval "(setq generated-autoload-file				    \
		    (expand-file-name \"tramp-loaddefs.el\"))"		    \
	  --eval "(setq make-backup-files nil)"				    \
	  --eval "(unless (string-equal \"$(EMACS_INFO)\" \"emacs\")	    \
		    (defalias 'autoload-trim-file-name			    \
			      'file-name-sans-extension))"		    \
	  -f batch-update-autoloads .
# XEmacs uses hard coded feature `lisp-autoloads'.
	@sed -e s/lisp-autoloads/tramp-loaddefs/g $@ >$@.$$$$ &&	    \
	  mv -f $@.$$$$ $@
# Emacs 22 does not add the `provide' form to the generated loaddefs.el.
	@grep -q provide $@ || echo "(provide 'tramp-loaddefs)" >>$@

%.elc: %.el
	$(EM) -l bytecomp \
	  --eval "(add-to-list 'load-path default-directory)"		\
	  -f batch-byte-compile $?

install: all
	$(MKDIR) $(DESTDIR)$(lispdir)
	$(INSTALL) $(INSTALL_FILES) $(DESTDIR)$(lispdir)

clean:
	$(RM) $(CLEAN_FILES)

distclean: clean
	$(RM) $(CONTRIB_FILES) tramp-loaddefs.el

# Maintainer targets.

tramp: all

xemacs:
	cp $(LISP_FILES) tramp-loaddefs.el ChangeLog $(XEMACS_TARGET)/lisp

### TODO:

## * Update Tramp's autoladed symbols in loaddefs.el during install.
