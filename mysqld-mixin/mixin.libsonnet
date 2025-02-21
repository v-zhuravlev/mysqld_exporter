(import 'config.libsonnet') +
(import 'dashboards/dashboards.libsonnet') +
{

  // Helper function to ensure that we don't override other rules, by forcing
  // the patching of the groups list, and not the overall rules object.
  local importRules(rules) = {
    groups+: std.native('parseYaml')(rules)[0].groups,
  },

  prometheusRules+: importRules(importstr 'rules/rules.yaml'),

  prometheusAlerts+:
    importRules(importstr 'alerts/general.yaml') +
    importRules(importstr 'alerts/galera.yaml'),
}
