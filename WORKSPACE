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

workspace(name = "layer_definitions")

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
    "http_file",
)

http_archive(
    name = "bazel_toolchains",
    sha256 = "91db7cf3a400da264e9123bb3d070e80184d9e40a87fc38b50e1dbb002b212fc",
    strip_prefix = "bazel-toolchains-db36179f00b0b252a80824ed7dabc636c5e6c5fe",
    urls = ["https://github.com/bazelbuild/bazel-toolchains/archive/db36179f00b0b252a80824ed7dabc636c5e6c5fe.tar.gz"],
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "aed1c249d4ec8f703edddf35cbe9dfaca0b5f5ea6e4cd9e83e99f3b0d1136c3d",
    strip_prefix = "rules_docker-0.7.0",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.7.0.tar.gz"],
)

http_archive(
    name = "base_images_docker",
    sha256 = "ce6043d38aa7fad421910311aecec865beb060eb56d8c3eb5af62b2805e9379c",
    strip_prefix = "base-images-docker-7657d04ad9e30b9b8d981b96ae57634cd45ba18a",
    urls = ["https://github.com/GoogleContainerTools/base-images-docker/archive/7657d04ad9e30b9b8d981b96ae57634cd45ba18a.tar.gz"],
)

http_archive(
    name = "bazel_skylib",
    # Commit c00ef493869e2966d47508e8625aae723a4a3054 of 2018-12-10
    sha256 = "7363ae6721c1648017e23a200013510c9e71ca69f398d52886ee6af7f26af436",
    strip_prefix = "bazel-skylib-c00ef493869e2966d47508e8625aae723a4a3054",
    urls = ["https://github.com/bazelbuild/bazel-skylib/archive/c00ef493869e2966d47508e8625aae723a4a3054.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

# GCloud gpg key necessary to run the download_pkgs target (to build the tarball
# of debian packages) of the gcloud layer in this repo.
# This is NOT needed to use the language_tool_layer target of the gcloud layer.
http_file(
    name = "gcloud_gpg",
    sha256 = "226ba1072f20e4ff97ee4f94e87bf45538a900a6d9b25399a7ac3dc5a2f3af87",
    urls = ["https://packages.cloud.google.com/apt/doc/apt-key.gpg"],
)

# Docker gpg key necessary to run the download_pkgs target (to build the tarball
# of debian packages) of the docker layer in this repo.
# This is NOT needed to use the language_tool_layer target of the docker layer.
http_file(
    name = "docker_gpg",
    sha256 = "1500c1f56fa9e26b9b8f42452a553675796ade0807cdce11975eb98170b3a570",
    urls = ["https://download.docker.com/linux/ubuntu/gpg"],
)

load("//layers/ubuntu1604/base:deps.bzl", base_deps = "deps")

base_deps()

load("//layers/ubuntu1604/bazel:deps.bzl", bazel_deps = "deps")

bazel_deps()

load("//layers/ubuntu1604/clang:deps.bzl", clang_deps = "deps")

clang_deps()

load("//layers/ubuntu1604/docker:deps.bzl", docker_deps = "deps")

docker_deps()

load("//layers/ubuntu1604/gcloud:deps.bzl", gcloud_deps = "deps")

gcloud_deps()

load("//layers/ubuntu1604/java:deps.bzl", java_deps = "deps")

java_deps()

load("//layers/ubuntu1604/python:deps.bzl", python_deps = "deps")

python_deps()

load("//layers/ubuntu1604/go:deps.bzl", go_deps = "deps")

go_deps()

load("//layers/ubuntu1604/python_rbe:deps.bzl", python_rbe_deps = "deps")

python_rbe_deps()

load("//layers/ubuntu1604/rbe_tools:deps.bzl", rbe_tools_deps = "deps")

rbe_tools_deps()
