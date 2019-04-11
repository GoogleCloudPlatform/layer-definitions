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

load("@base_images_docker//package_managers:download_pkgs.bzl", "download_pkgs")

licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

exports_files(glob(["*.yaml"]))

bzl_library(
    name = "lib",
    srcs = glob(["*.bzl"]),
)

download_pkgs(
    name = "android_test_debs",
    additional_repos = [
        "deb [arch=i386] http://archive.ubuntu.com/ubuntu/ xenial main restricted",
        "deb [arch=i386] http://archive.ubuntu.com/ubuntu/ xenial-updates main restricted",
    ],
    image_tar = "@ubuntu1604//image",
    packages = [
        "cpio",
        "libpulse-dev",
        "libstdc++6:i386",
        "lsof",
        "xvfb",
        "zlib1g:i386",
    ],
)
