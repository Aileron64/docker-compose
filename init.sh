#!/bin/bash

#
# Copyright (c) 2009-2020. Authors: see NOTICE file.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FILES=(
    configs/software_router/config.groovy
    configs/ims/ims-config.groovy
    start_deploy.sh
)

source <(sed -E -n 's/[^#]+/export &/ p' ./compose/.env)

for file in ${FILES[@]}; do
    echo "Populating environment variables in file" $file
    envsubst < $file.sample > $file
    if [[ "$file" == *.sh ]]; then
        chmod u+x $file
    fi
done

# VARIABLES=()
# while read LINE; do
#     if [[ $LINE == *"="* ]]; then
#         IFS='=' read -ra ADDR <<< "$LINE"
#         VARIABLES+=(${ADDR[0]})
#     fi
# done \
# # <<< "$(cat configuration.sh)" 

# for i in ${FILES[@]}; do
#     if [ -f "$i.sample" ]; then
#         cp $i.sample $i
#         if [[ "$i" == *.sh ]]; then
#             chmod u+x $i
#         fi

#         for j in ${VARIABLES[@]}; do
#             eval sed -i "s~\\\$$j~\$$j~g" $i
#         done
#     fi

echo "Files generated."
echo "In a production environment, it's recommended to generate your own ssh keys into the configs/software_router/keys folder."

