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

# Each item in this file corresponds to one GCS or GCR dependency that's being
# monitored by an automatic service.
# TODO(xingao): Add pointer to the dependency yaml file.

# Bazel release installer.
BAZEL_INSTALLER = struct(
    revision = "0.20.0",
    sha256 = "44aed3bd8e58a889ee36f187a4b1cb573a2b4cc7a3d7c0cf0696205764e45dec",
)

# The Debian packages tarball pulled from the GCS bucket required for the
# Ubuntu1604 Bazel layer.
DEBS_TARBALL = struct(
    revision = "20181212",
    sha256 = "e92ff22f044625d4517ab20486447c4711b8f1d9ceb84d1fc95315c1424a36bf",
)
