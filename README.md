# Saleor Semgrep Rules

This repository contains Semgrep rules developed and made public by @Saleor.

<!-- TOC -->

- [Saleor Semgrep Rules](#saleor-semgrep-rules)
  - [Usage](#usage)
  - [Rules](#rules)
    - [Typescript](#typescript)
  - [Contributing](#contributing)

<!-- TOC -->

## Usage

To be able to use the rules, the **git repository needs to be cloned**.

Then a single rule can be run from the clone repository, for example:

```
semgrep -c /path-to-the-clone-semgrep-rules/the-rule.yml .
```

Alternatively, all rules can be run:

```
semgrep -c /path-to-the-clone-semgrep-rules .
```

## Rules

### Typescript

| ID                                                                                                                      | Impact | Confidence | Description                                       |
| ----------------------------------------------------------------------------------------------------------------------- | ------ | ---------- | ------------------------------------------------- |
| [typescript.lang.security.audit.timing-attack-comparison](typescript/lang/security/audit/timing-attack-comparison.yaml) | HIGH   | LOW        | Checks comparisons against secrets are time-safe. |

### YAML

| ID                                                                                                                                                | Impact | Confidence | Description                                                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [yaml.github-actions.security.audit.shell-script-injection](yaml/github-actions/security/audit/shell-script-injection.yaml)                       | HIGH   | HIGH       | Ensures no string interpolations (`${{ ... }}`) are present inside `run` blocks of GitHub Actions.                                                                          |
| [yaml.github-actions.security.audit.secrets-without-environment](yaml/github-actions/security/audit/secrets-without-environment.yaml)             | HIGH   | HIGH       | Matches GitHub Workflows that use secrets (other than GITHUB_TOKEN) without providing a GitHub Environment (`environment` keyword).                                         |
| [yaml.github-actions.security.audit.global-permissions-used](yaml/github-actions/security/audit/global-permissions-used.yaml)                     | HIGH   | HIGH       | Prevents workflows from settings global permissions.                                                                                                                        |
| [yaml.github-actions.security.audit.oidc-id-token-without-environment](yaml/github-actions/security/audit/oidc-id-token-without-environment.yaml) | HIGH   | HIGH       | Ensures a `environment` key is provided whenever using OIDC to external systems are verifying the workflow run is authorized.                                               |
| [yaml.github-actions.security.audit.dangerous-event-type](yaml/github-actions/security/audit/dangerous-event-type.yaml)                           | HIGH   | LOW        | Blocks workflows that use dangerous events such as `pull_request_target` or `issue_comment` which can lead to unauthorized read-write access, as well as access to secrets. |

## Contributing

Refer to our guidelines:

- [CONTRIBUTING.md](CONTRIBUTING.md)
- [CODE_OF_CONDUCT.md](https://github.com/saleor/.github/blob/main/CODE_OF_CONDUCT.md)
