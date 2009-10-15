#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script runs "avrotool", with paths corresponding
# to a development checkout of AVRO.

BASE_DIR=$(dirname "$0")/../../
BUILD_DIR=${BASE_DIR}/build

# Add compiled classes to classpath
CLASSPATH="$BUILD_DIR/classes"

# Add libs to classpath
for lib in $BUILD_DIR/lib/*.jar; do
  CLASSPATH=${CLASSPATH}:$lib
done

if [ "$JAVA_HOME" = "" ]; then
  echo "Error: JAVA_HOME is not set."
  exit 1
fi

JAVA=$JAVA_HOME/bin/java

exec ${JAVA} -classpath $CLASSPATH org.apache.avro.specific.SpecificCompiler $*
