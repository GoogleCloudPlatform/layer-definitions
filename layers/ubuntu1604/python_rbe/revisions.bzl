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

# Google managed Python3 images: marketplace.gcr.io/google/python.
PY3_IMAGE = struct(
    sha256 = "sha256:ea5aa4f84336233ae6a1ca39ca3fd1608cc01ed865e777c58cbd99c45bbe2a1f",
)

# The debian packages tarball pulled from the GCS bucket required for the
# Ubuntu1604 Python RBE layer.
DEBS_TARBALL = struct(
    revision = "20181218",
    sha256 = "f1b6dea085e374052df9798b49a5d2d2e75c42373f603c6b0c7f31e1b42da2d5",
)
