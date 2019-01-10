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
    sha256 = "07a81ee03f5feae354c9f98c884e8e886914856fb2b6a63cba4619ef10aaaf0b",
    strip_prefix = "bazel-toolchains-31b5dc8c4e9c7fd3f5f4d04c6714f2ce87b126c1",
    urls = ["https://github.com/bazelbuild/bazel-toolchains/archive/31b5dc8c4e9c7fd3f5f4d04c6714f2ce87b126c1.tar.gz"],
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "f3e5c0500533d58be079db1a24ac909f2e0cd98c9d760f5e506e4d05b56c42dd",
    strip_prefix = "rules_docker-a9bb1dab84cdf46e34d1b34b53a17bda129b5eba",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/a9bb1dab84cdf46e34d1b34b53a17bda129b5eba.tar.gz"],
)

http_archive(
    name = "base_images_docker",
    sha256 = "7d34d78c604472c33c4206a59b15cc3fdbc27df90d5bfa983af1844481d4602b",
    strip_prefix = "base-images-docker-4bb703bcc40dc9ca320ea2fb4c37e0ea31a565d4",
    urls = ["https://github.com/GoogleCloudPlatform/base-images-docker/archive/4bb703bcc40dc9ca320ea2fb4c37e0ea31a565d4.tar.gz"],
)

http_archive(
    name = "bazel_skylib",
    # Commit c00ef493869e2966d47508e8625aae723a4a3054 of 2018-12-10
    sha256 = "7363ae6721c1648017e23a200013510c9e71ca69f398d52886ee6af7f26af436",
    strip_prefix = "bazel-skylib-c00ef493869e2966d47508e8625aae723a4a3054",
    urls = ["https://github.com/bazelbuild/bazel-skylib/archive/c00ef493869e2966d47508e8625aae723a4a3054.tar.gz"],
)

load(
    "@io_bazel_rules_docker//container:container.bzl",
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
