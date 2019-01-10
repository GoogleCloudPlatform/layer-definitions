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

licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@bazel_toolchains//rules/container:docker_toolchains.bzl", "language_tool_layer")
load("@base_images_docker//package_managers:apt_key.bzl", "add_apt_key")
load("@base_images_docker//package_managers:download_pkgs.bzl", "download_pkgs")

exports_files(glob(["*.yaml"]))

bzl_library(
    name = "lib",
    srcs = glob(["*.bzl"]),
)

add_apt_key(
    name = "gcloud-key-image",
    image = "@ubuntu1604//image",
    keys = [
        "@gcloud_gpg//file",
    ],
)

download_pkgs(
    name = "gcloud_debs",
    additional_repos = [
        "deb http://packages.cloud.google.com/apt cloud-sdk-xenial main",
    ],
    image_tar = ":gcloud-key-image.tar",
    packages = [
        "google-cloud-sdk",
    ],
)

language_tool_layer(
    name = "gcloud-ltl",
    base = "@ubuntu1604//image",
    installables_tar = "@ubuntu1604_gcloud_debs//file",
)
