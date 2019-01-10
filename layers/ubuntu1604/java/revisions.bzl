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

# OpenJDK installer.
OPENJDK_INSTALLER = struct(
    revision = "10.2+3-jdk10.0.1",
    sha256 = "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
)

# OpenJDK source code. (needed for licensing reason)
OPENJDK_SRC = struct(
    revision = "10.2+3-jdk10.0.1",
    sha256 = "0ab6c7a1a8fc32992bcec4d7c77a587c02b8816f67bcb7d16154a60de2dce8a4",
)

# The debian packages tarball pulled from the GCS bucket required for the
# Ubuntu1604 Java layer.
DEBS_TARBALL = struct(
    revision = "20181212",
    sha256 = "2a628297c79bc03777f4f40208b2372604f47c834aa831786a271f2436e3047f",
)

# cacerts.tar file which contains the /etc/ssl/certs/java/cacerts file.
#
# /etc/ssl/certs/java/cacerts is generated when `ca-certificates-java` is
# installed or `update-ca-certificates -f` is run. Because of the timestamp
# embedded, the file is not deterministic. We commit this file in a GCS bucket
# and reuse in layer or container creation so determinism can be achieved.
CACERTS = struct(
    revision = "20181212",
    sha256 = "3346d5dd66ecfeeb9f61bec7ae058cf45d6cee5b51f0722e89ed2f91b171312a",
)
