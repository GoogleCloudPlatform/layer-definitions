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

load("@bazel_toolchains//rules:gcs.bzl", "gcs_file")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load(
    ":revisions.bzl",
    "CACERTS",
    "DEBS_TARBALL",
    "OPENJDK_INSTALLER",
    "OPENJDK_SRC",
)

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    # ============================ Azul OpenJDK packages ============================
    if "azul_open_jdk" not in excludes:
        http_file(
            name = "azul_open_jdk",
            downloaded_file_path = "zulu-linux.tar.gz",
            sha256 = OPENJDK_INSTALLER.sha256,
            urls = ["https://mirror.bazel.build/openjdk/azul-zulu" + OPENJDK_INSTALLER.revision + ".tar.gz"],
        )

    if "azul_open_jdk_src" not in excludes:
        http_file(
            name = "azul_open_jdk_src",
            downloaded_file_path = OPENJDK_SRC.revision.rpartition("/")[2] + ".zip",
            sha256 = OPENJDK_SRC.sha256,
            urls = ["https://mirror.bazel.build/openjdk/azul-zulu" + OPENJDK_SRC.revision + ".zip"],
        )

    if "ubuntu1404_java_debs" not in excludes:
        gcs_file(
            name = "ubuntu1404_java_debs",
            bucket = "gs://layer-deps/ubuntu1404/java/debs",
            file = "%s_java_debs.tar" % DEBS_TARBALL.revision,
            sha256 = DEBS_TARBALL.sha256,
        )

    if "ubuntu1404_java_cacerts" not in excludes:
        gcs_file(
            name = "ubuntu1404_java_cacerts",
            bucket = "gs://layer-deps/ubuntu1404/java/cacerts",
            file = "%s_cacerts.tar" % CACERTS.revision,
            sha256 = CACERTS.sha256,
        )
