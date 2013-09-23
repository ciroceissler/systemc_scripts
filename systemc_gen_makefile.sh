#!/bin/bash

###########################################################################
#
# Brief: creating Makefile for SystemC for Mac OS X 10.8.4 using
#
#        - Automake 1.14 
#        - Autoconf 2.2 
#
# Version: 0.1
#
# Author: Ciro Ceissler
#
# Email: ciro.ceissler at gmail.com
#
# Copyright 2013 Ciro Ceissler
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#############################################################################

# create file configure.scan
autoscan

# do some modifications do configuration.scan and copy do configure.ac
awk '{ print; }
     /AC_INIT/ { print "AM_INIT_AUTOMAKE([subdir-objects])\n" ; }' configure.scan > configure.ac
rm configure.scan

# executing flow of autoconf and automake
aclocal
autoheader
autoconf

# creating files used on automake
echo '' >> NEWS
echo '' >> AUTHORS
echo '' >> README
echo '' >> ChangeLog
automake -a

# executing
./configure
