# Copyright 2020 Google LLC
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

local cifarInline = import "cifar-inline.libsonnet";
local cifarTorchvision = import "cifar-torchvision.libsonnet";
local fairseqTransformer = import "fairseq-transformer.libsonnet";
local mnist = import "mnist.libsonnet";
local resnet50 = import "resnet50.libsonnet";

# Add new models here
std.flattenArrays([
  cifarInline.configs,
  cifarTorchvision.configs,
  fairseqTransformer.configs,
  mnist.configs,
  resnet50.configs,
])
