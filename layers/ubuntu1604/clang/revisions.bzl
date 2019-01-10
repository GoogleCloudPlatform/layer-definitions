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

# Ubuntu1604 Clang tarball pulled from the GCS bucket.
CLANG_INSTALLER = struct(
    revision = "r342117",
    sha256 = "ee84daf8acffc4a702205a378e8dbdd0e580c58b53ef1381bb35694cae935963",
)

# Ubuntu1604 libcxx tarball pulled from the GCS bucket.
LIBCXX_INSTALLER = struct(
    revision = "r342117",
    sha256 = "3c814866724768a4e331f75dd015e4dcc9ae894dc4a320b7f332d5238e41e956",
)

# The debian packages tarball pulled from the GCS bucket required for the
# Ubuntu1604 Clang layer.
DEBS_TARBALL = struct(
    revision = "20181212",
    sha256 = "5b93508c153904ccc6ea391f077cd90b5d11062cd0d282e51aa786ec486eed77",
)
