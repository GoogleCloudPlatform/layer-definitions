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

load(
    "@io_bazel_rules_docker//contrib/automatic_container_release:configs_test.bzl",
    "configs_test",
)

licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

# This is the platform used by presubmit tests that enables
# docker capabilities for spinning up sibling containers.
# Used by CI only.
platform(
    name = "platform_docker",
    parents = ["@rbe_toolchain_config//config:platform"],
    remote_execution_properties = """
        {PARENT_REMOTE_EXECUTION_PROPERTIES}
        properties: {
          name: "dockerSiblingContainers"
          value: "true"
        }
        """,
)

configs_test(
    name = "configs_test",
    dependency_update_specs = [
        "//layers/ubuntu1604/java:deps_spec.yaml",
        "//layers/ubuntu1604/bazel:deps_spec.yaml",
        "//layers/ubuntu1604/python_rbe:deps_spec.yaml",
        "//layers/ubuntu1604/python:deps_spec.yaml",
        "//layers/ubuntu1604/rbe_tools:deps_spec.yaml",
        "//layers/ubuntu1604/base:deps_spec.yaml",
        "//layers/ubuntu1604/go:deps_spec.yaml",
        "//layers/ubuntu1604/android_test:deps_spec.yaml",
        "//layers/ubuntu1604/clang:deps_spec.yaml",
        "//layers/ubuntu1604/docker:deps_spec.yaml",
        "//layers/ubuntu1604/webtest:deps_spec.yaml",
        "//layers/ubuntu1604/gcloud:deps_spec.yaml",
    ],
    file_update_specs = [
        "file_updates.yaml",
    ],
)
