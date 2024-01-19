# Saleor Semgrep Rules

This repository contains Semgrep rules developed and made public by @Saleor.

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

| ID                                                                | Impact | Confidence | Description                                       |
|-------------------------------------------------------------------|--------|------------|---------------------------------------------------|
| [timing-attack-comparison](typescript/generic/timing_attack.yaml) | High   | Low        | Checks comparisons against secrets are time-safe. |

### Python

| ID                                                                     | Impact | Confidence | Description                                       |
|------------------------------------------------------------------------|--------|------------|---------------------------------------------------|
| [requests-disallow-redirects](python/requests/disallow-redirects.yaml) | High   | High       | Checks comparisons against secrets are time-safe. |
