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
load(":revisions.bzl", "RULES_DOCKER")

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = RULES_DOCKER.sha256,
    strip_prefix = "rules_docker-" + RULES_DOCKER.commit,
    urls = ["https://github.com/bazelbuild/rules_docker/archive/" + RULES_DOCKER.commit + ".tar.gz"],
)

http_archive(
    name = "bazel_toolchains",
    sha256 = "0e402919fe73e4f030fc4fb03006597025cabfe6ebc0128c16c71441dc9d1460",
    strip_prefix = "bazel-toolchains-b2f8803700c0e40c8ec840a733e52d3bee651a1d",
    urls = ["https://github.com/bazelbuild/bazel-toolchains/archive/b2f8803700c0e40c8ec840a733e52d3bee651a1d.tar.gz"],
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

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//repositories:pip_repositories.bzl", "pip_deps")

pip_deps()

# GCloud gpg key necessary to run the download_pkgs target (to build the tarball
# of debian packages) of the gcloud layer in this repo.
# This is NOT needed to use the language_tool_layer target of the gcloud layer.
http_file(
    name = "gcloud_gpg",
    downloaded_file_path = "gcloud_gpg",
    # TODO (smukherj1): Re-enable sha256 digest once stable.
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

# These are used by CI only.
load("@bazel_toolchains//rules:rbe_repo.bzl", "rbe_autoconfig")
load("@bazel_toolchains//rules:environments.bzl", "clang_env")

# Used by FUS to run the metadata rules from bazel-toolchains.
load("@bazel_toolchains//repositories:repositories.bzl", bazel_toolchains_repos = "packages_metadata_repositories")

bazel_toolchains_repos()

load("@bazel_toolchains//repositories:go_repositories.bzl", bazel_toolchains_go_repos = "go_deps")

bazel_toolchains_go_repos()

rbe_autoconfig(
    name = "rbe_toolchain_config",
    base_container_digest = "sha256:3e98e2e1233de1aed4ed7d7e05450a3f75b8c8d6f6bf53f1b390b5131c790f6f",
    # Note that if you change the `digest`, you might also need to update the
    # `base_container_digest` to make sure asci-toolchain/nosla-ubuntu16_04-bazel-docker-gcloud:<digest>
    # and marketplace.gcr.io/google/rbe-ubuntu16-04:<base_container_digest> have the
    # same Clang and JDK installed.
    digest = "sha256:c38a2be3377f6ee98b8c64deab64b597aa4a8aef1944de67b1312e9d33393e3d",
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
