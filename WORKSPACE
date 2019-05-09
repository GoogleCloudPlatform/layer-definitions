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
    sha256 = "bcaa7239f4692054a7abcbcdb1f296f200cbe8a6c8c37bde485b3f3a0929a3c8",
    strip_prefix = "bazel-toolchains-c6c7c4e850d9668d81aca2c7193b739755aa2fb5",
    urls = ["https://github.com/bazelbuild/bazel-toolchains/archive/c6c7c4e850d9668d81aca2c7193b739755aa2fb5.tar.gz"],
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "aed1c249d4ec8f703edddf35cbe9dfaca0b5f5ea6e4cd9e83e99f3b0d1136c3d",
    strip_prefix = "rules_docker-0.7.0",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.7.0.tar.gz"],
)

http_archive(
    name = "base_images_docker",
    sha256 = "26b6eb32e19deee8782bd734a2214c6a33dd5ec5b9fb3e92c69a2d5896ad89e3",
    strip_prefix = "base-images-docker-6830adea69c63a5bf3cf8b93b2f5e56422181839",
    urls = ["https://github.com/GoogleContainerTools/base-images-docker/archive/6830adea69c63a5bf3cf8b93b2f5e56422181839.tar.gz"],
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
    downloaded_file_path = "gcloud_gpg",
    sha256 = "226ba1072f20e4ff97ee4f94e87bf45538a900a6d9b25399a7ac3dc5a2f3af87",
    urls = ["https://packages.cloud.google.com/apt/doc/apt-key.gpg"],
)

# Docker gpg key necessary to run the download_pkgs target (to build the tarball
# of debian packages) of the docker layer in this repo.
# This is NOT needed to use the language_tool_layer target of the docker layer.
http_file(
    name = "docker_gpg",
    downloaded_file_path = "docker_gpg",
    sha256 = "1500c1f56fa9e26b9b8f42452a553675796ade0807cdce11975eb98170b3a570",
    urls = ["https://download.docker.com/linux/ubuntu/gpg"],
)

# Launchpad OpenJDK key used when install java in trusty.
# This is NOT needed to use the language_tool_layer target of the ubuntu1404 Java layer.
http_file(
    name = "launchpad_openjdk_gpg",
    downloaded_file_path = "launchpad_openjdk_gpg",
    sha256 = "54b6274820df34a936ccc6f5cb725a9b7bb46075db7faf0ef7e2d86452fa09fd",
    urls = ["http://keyserver.ubuntu.com/pks/lookup?op=get&fingerprint=on&search=0xEB9B1D8886F44E2A"],
)

# These are used by CI only.
load("@bazel_toolchains//rules:rbe_repo.bzl", "rbe_autoconfig")
load("@bazel_toolchains//rules:environments.bzl", "clang_env")

rbe_autoconfig(
    name = "rbe_toolchain_config",
    base_container_digest = "sha256:fbd499b53a377fe2c6c5e65c33bdecd9393871e19a64eaf785fb6491f31849d3",
    # Note that if you change the `digest`, you might also need to update the
    # `base_container_digest` to make sure asci-toolchain/nosla-ubuntu16_04-bazel-docker-gcloud:<digest>
    # and marketplace.gcr.io/google/rbe-ubuntu16-04:<base_container_digest> have the
    # same Clang and JDK installed.
    digest = "sha256:6e35c476559829b59530be8e984932279c177d91984455557bf1b66315cd7c7b",
    env = clang_env(),
    registry = "gcr.io",
    repository = "asci-toolchain/nosla-ubuntu16_04-bazel-docker-gcloud",
)

# ================================= Ubuntu1604 =================================

load("//layers/ubuntu1604/base:deps.bzl", ubuntu1604_base_deps = "deps")

ubuntu1604_base_deps()

load("//layers/ubuntu1604/bazel:deps.bzl", ubuntu1604_bazel_deps = "deps")

ubuntu1604_bazel_deps()

load("//layers/ubuntu1604/clang:deps.bzl", ubuntu1604_clang_deps = "deps")

ubuntu1604_clang_deps()

load("//layers/ubuntu1604/docker:deps.bzl", ubuntu1604_docker_deps = "deps")

ubuntu1604_docker_deps()

load("//layers/ubuntu1604/gcloud:deps.bzl", ubuntu1604_gcloud_deps = "deps")

ubuntu1604_gcloud_deps()

load("//layers/ubuntu1604/java:deps.bzl", ubuntu1604_java_deps = "deps")

ubuntu1604_java_deps()

load("//layers/ubuntu1604/python:deps.bzl", ubuntu1604_python_deps = "deps")

ubuntu1604_python_deps()

load("//layers/ubuntu1604/go:deps.bzl", ubuntu1604_go_deps = "deps")

ubuntu1604_go_deps()

load("//layers/ubuntu1604/python_rbe:deps.bzl", ubuntu1604_python_rbe_deps = "deps")

ubuntu1604_python_rbe_deps()

load("//layers/ubuntu1604/rbe_tools:deps.bzl", ubuntu1604_rbe_tools_deps = "deps")

ubuntu1604_rbe_tools_deps()

load("//layers/ubuntu1604/webtest:deps.bzl", ubuntu1604_webtest_deps = "deps")

ubuntu1604_webtest_deps()

load("//layers/ubuntu1604/android_test:deps.bzl", ubuntu1604_android_test_deps = "deps")

ubuntu1604_android_test_deps()

# ================================= Ubuntu1404 =================================

load("//layers/ubuntu1404/base:deps.bzl", ubuntu1404_base_deps = "deps")

ubuntu1404_base_deps()

load("//layers/ubuntu1404/bazel:deps.bzl", ubuntu1404_bazel_deps = "deps")

ubuntu1404_bazel_deps()

load("//layers/ubuntu1404/gcc:deps.bzl", ubuntu1404_gcc_deps = "deps")

ubuntu1404_gcc_deps()

load("//layers/ubuntu1404/docker:deps.bzl", ubuntu1404_docker_deps = "deps")

ubuntu1404_docker_deps()

load("//layers/ubuntu1404/gcloud:deps.bzl", ubuntu1404_gcloud_deps = "deps")

ubuntu1404_gcloud_deps()

load("//layers/ubuntu1404/java:deps.bzl", ubuntu1404_java_deps = "deps")

ubuntu1404_java_deps()

load("//layers/ubuntu1404/python:deps.bzl", ubuntu1404_python_deps = "deps")

ubuntu1404_python_deps()
