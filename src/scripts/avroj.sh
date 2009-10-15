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

# Runs "org.apache.avro.tool.Main", avro's Java tool catch-all.

# This tool might be run out of the source, tree, in which
# case we run in "development" mode against compiled jars,
# or out of the packaged tarball.
TOOL_DIR=$(dirname "$0")
DEV=true
if [ -d "${TOOL_DIR}/build/classes" ]; then
  CLASSPATH=${TOOL_DIR}/build/classes
  LIB_DIR=${TOOL_DIR}/build/lib
elif [ -d "${TOOL_DIR}/../../build/classes" ]; then
  CLASSPATH=${TOOL_DIR}/../../build/classes
  LIB_DIR=${TOOL_DIR}/../../build/lib
else
  AVRO_JAR=${TOOL_DIR}/avro-@VERSION@.jar
  if [ ! -f $AVRO_JAR ]; then
    echo "Could not find Avro jar file ($AVRO_JAR)."
    exit 1
  fi
  CLASSPATH=$AVRO_JAR
  LIB_DIR=${TOOL_DIR}/lib
  DEV=false
fi

# Add libs to classpath
for lib in $LIB_DIR/*.jar; do
  CLASSPATH=${CLASSPATH}:$lib
done

if [ "$JAVA_HOME" = "" ]; then
  echo "Error: JAVA_HOME is not set."
  exit 1
fi

JAVA=$JAVA_HOME/bin/java

if $DEV; then
  echo "Running development avro with classpath $CLASSPATH."
fi

exec ${JAVA} -classpath $CLASSPATH org.apache.avro.tool.Main $*
