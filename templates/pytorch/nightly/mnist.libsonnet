local base = import "base.libsonnet";
local mixins = import "../../mixins.libsonnet";
local timeouts = import "../../timeouts.libsonnet";
local tpus = import "../../tpus.libsonnet";

{
  local mnist = base.PyTorchTest {
    modelName: "mnist",
    command: [
      "python3",
      "pytorch/xla/test/test_train_mp_mnist.py",
    ],
  },
  local convergence = mixins.Convergence {
    accelerator+: tpus.Preemptible,
    regressionTestConfig+: {
      metric_success_conditions+: {
        "Accuracy/test_final": {
          success_threshold: {
            fixed_value: 99.0,
          },
          comparison: "greater",
        },
      },
    },
  },
  local v2_8 = {
    accelerator: tpus.v2_8,
  },
  local v3_8 = {
    accelerator: tpus.v3_8,
  },

  configs: [
    mnist + v2_8 + convergence + timeouts.Hours(1),
    mnist + v3_8 + convergence + timeouts.Hours(1),
  ],
}