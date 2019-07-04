#!/bin/bash
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script accepts the following arguments:
# 1. The bazel version pointed to by :revisions.bzl.
# 2. Path to a tarball with the latest bazel binary available at
#    "usr/local/lib/bazel/bin".
# 3. Path to the output YAML file to generate.
# The script produces a YAML file with the bazel version
# which looks as follows:
# packages:
# - name: bazel
#   version: "<version string>"
# where <version string> is the Bazel version, e.g., 0.27.1
# Also, if the bazel version in revisions.bzl differs from the bazel binary
# in the given tarball, the script adds the following section in the YAML:
# tags:
# - new_bazel_release

set -e

current_version=$1
input_tar=$2
output_yaml=$3

echo "Current Bazel version: " $current_version
echo "Input tar: " $input_tar
echo "Output YAML: " $output_yaml

echo "Extracting the tarball into the current directory..."
tar xf $input_tar -C $PWD
echo "Running Bazel and extracting the version string"
# Runs the Bazel binary extracted above specifying a directory in the runfiles
# directory as the bazel user root so that the extract Bazel doesn't try to
# clobber the default bazel cache directory. The call to Bazel version has an
# output line that looks like:
# Build label: 0.27.1
# which is further processed to extract the version string ("0.27.1" in the
# above example).
version=$(./usr/local/lib/bazel/bin/bazel --output_user_root=$PWD/temp_bazel_user_root version | grep "Build label" | sed -e "s/^\s*Build label:\s*//")
echo "Extracted Bazel version '$version'"

# Add the package information first because it's always created. This ensures
# the output file gets replaced with the new contents.
cat > $output_yaml << EOF
packages:
- name: bazel
  version: $version
EOF

if [ "$current_version" != "$version" ]; then
    echo "New bazel release detected!"
    cat >> $output_yaml << EOF
tags:
- new_bazel_release
EOF
fi
