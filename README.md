# Saleor Semgrep Rules

This repository contains Semgrep rules developed and made public by @Saleor.

<!-- TOC -->
* [Saleor Semgrep Rules](#saleor-semgrep-rules)
  * [Usage](#usage)
  * [Rules](#rules)
    * [Typescript](#typescript)
  * [Contributing](#contributing)
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

| ID                                                                                       | Impact | Confidence | Description                                       |
|------------------------------------------------------------------------------------------|--------|------------|---------------------------------------------------|
| [timing-attack-comparison](typescript/lang/security/audit/timing-attack-comparison.yaml) | HIGH   | LOW        | Checks comparisons against secrets are time-safe. |


## Contributing

Refer to our guidelines:
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [CODE_OF_CONDUCT.md](https://github.com/saleor/.github/blob/main/CODE_OF_CONDUCT.md)
