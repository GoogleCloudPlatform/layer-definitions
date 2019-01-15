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
load("@io_bazel_rules_docker//container:container.bzl", "container_pull")
load(":revisions.bzl", "DEBS_TARBALL", "PY3_IMAGE")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu1604_python3" not in excludes:
        container_pull(
            name = "ubuntu1604_python3",
            digest = PY3_IMAGE.sha256,
            registry = "l.gcr.io",
            repository = "google/python",
        )

    if "ubuntu1604_python_rbe_debs" not in excludes:
        gcs_file(
            name = "ubuntu1604_python_rbe_debs",
            bucket = "gs://layer-deps/ubuntu1604/python_rbe/debs",
            file = "%s_python_rbe_debs.tar" % DEBS_TARBALL.revision,
            sha256 = DEBS_TARBALL.sha256,
        )
