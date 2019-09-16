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

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@io_bazel_rules_docker//contrib/automatic_container_release:packages_metadata.bzl", "packages_metadata")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//docker/package_managers:download_pkgs.bzl", "download_pkgs")
load(
    "@io_bazel_rules_docker//docker/toolchain_container:toolchain_container.bzl",
    "language_tool_layer",
)

licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

exports_files(glob(["*.yaml"]))

bzl_library(
    name = "lib",
    srcs = glob(["*.bzl"]),
)

download_pkgs(
    name = "webtest_debs",
    image_tar = "@ubuntu1604//image",
    packages = [
        "bzip2",
        "libasound2",
        "libatk-bridge2.0-0",
        "libatk1.0-0",
        "libdbus-glib-1-2",
        "libgtk-3-0",
        "libnss3",
        "libpangocairo-1.0-0",
        "libx11-xcb1",
        "libxrandr2",
        "libxss1",
        "libxt6",
        "libxtst6",
    ],
)

# Transform the packages metadata csv produced by download_pkgs into a YAML
# file.
packages_metadata(
    name = "metadata",
    metadata_csv = ":webtest_debs_metadata.csv",
)

language_tool_layer(
    name = "webtest-ltl",
    base = "@ubuntu1604//image",
    installables_tar = "@ubuntu1604_webtest_debs//file",
    installation_cleanup_commands = "rm -rf /var/cache/fontconfig/*",
)

container_test(
    name = "test",
    configs = [
        ":tests.yaml",
    ],
    image = ":webtest-ltl",
    verbose = True,
)
