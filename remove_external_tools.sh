#!/bin/bash
# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.
#
# LASER  Language-Agnostic SEntence Representations
# is a toolkit to calculate multilingual sentence embeddings
# and to use them for document classification, bitext filtering
# and mining
# 
#-------------------------------------------------------
#
# This bash script removes all installed third party software 
#

export LASER=`dirname "$(readlink -f $0)"`

bdir="${LASER}"
tools_ext="${bdir}/tools-external"

rm -rf ${tools_ext}
