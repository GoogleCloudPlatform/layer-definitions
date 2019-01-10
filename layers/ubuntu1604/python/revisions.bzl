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

# The debian packages tarball pulled from the GCS bucket required for the
# Ubuntu1604 Python layer.
DEBS_TARBALL = struct(
    revision = "20181212",
    sha256 = "b94030fb826a6e8a3c45005b6e764ced69ac2a768280dedd4b71824004f719cd",
)
