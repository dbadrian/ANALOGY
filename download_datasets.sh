#!/bin/bash
# Copyright 2018 David B. Adrian, Mercateo AG (http://www.mercateo.com)

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#   http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# PLEASE USE WITH CARE. Verify the downloaded datasets! There have been mistakes in the ConvE repository, which were manually fixed.
# We can not guarantee that the data is correct.

packagelist=(
    'https://everest.hds.utc.fr/lib/exe/fetch.php?media=en:wordnet-mlj12.tar.gz'
    'https://everest.hds.utc.fr/lib/exe/fetch.php?media=en:fb15k.tgz'
    'https://raw.githubusercontent.com/TimDettmers/ConvE/master/nations.tar.gz'
    'https://raw.githubusercontent.com/TimDettmers/ConvE/master/umls.tar.gz'
    'https://raw.githubusercontent.com/TimDettmers/ConvE/master/kinship.tar.gz'
    'https://raw.githubusercontent.com/TimDettmers/ConvE/master/WN18RR.tar.gz'
    'https://raw.githubusercontent.com/TimDettmers/ConvE/master/FB15k-237.tar.gz'
    'https://raw.githubusercontent.com/TimDettmers/ConvE/master/YAGO3-10.tar.gz'
)

rename_files () {
   mv $1/*test.txt $1/test.txt
   mv $1/*train.txt $1/train.txt
   mv $1/*valid.txt $1/valid.txt
}

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

for i in ${packagelist[*]}
do
  wget --directory-prefix=${SCRIPTPATH}/ --content-disposition --trust-server-names $i 2>&1  #$JEF is defined in my ~/.bashrc script
done

tar -zxf fb15k.tgz && mv FB15k fb15k && rename_files fb15k
tar -zxf wordnet-mlj12.tar.gz && mv wordnet-mlj12 wn18 && rename_files wn18
mkdir wn18rr && tar -zxf WN18RR.tar.gz -C wn18rr
mkdir yago3_10 && tar -zxf YAGO3-10.tar.gz -C yago3_10
mkdir fb15k_237 && tar -zxf FB15k-237.tar.gz -C fb15k_237
mkdir umls && tar -zxf umls.tar.gz -C umls
mkdir kinship && tar -zxf kinship.tar.gz -C kinship
mkdir nations && tar -zxf nations.tar.gz -C nations