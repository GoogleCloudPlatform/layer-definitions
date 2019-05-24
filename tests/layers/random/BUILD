# Copyright 2018 Google LLC
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
"""
A layer that depends on a GCS target that always has an update.
"""

licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

exports_files(glob(["*.yaml"]))

genrule(
    name = "random_file",
    outs = ["random_file.txt"],
    # Print the date. This is by definition non-deterministic. It should result
    # in a new file every time the file update service runs this target.
    cmd = "date > $@",
)

genrule(
    name = "metadata",
    srcs = ["metadata_src.yaml"],
    outs = ["metadata.yaml"],
    cmd = "cp $(location metadata_src.yaml) $@",
)
