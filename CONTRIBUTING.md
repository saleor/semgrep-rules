# Contributing

In order to ensure consistency and usability, we follow the contribution guidelines from [Semgrep OSS Rules for writing rules] ([archived version][Semgrep OSS Rules for writing rules (archive)]).

Notably, and additionally:

- The directory structure is the following:
  ```
  <language-name>/<framework>/<category>[/subcategory]/<rule-id>.yaml
  ```
- The rule ID (`rules[*].id) should be unique and descriptive,
  we should be able to understand what it does without reading the description.
- We require to write tests.
- We highly encourage to include rationals and longer descriptions at the top of the YAML
  files (using YAML comments, i.e. `# <my comment>`) to help the users that
  will run the rules, and for the maintainers.
- We encourage putting references (`rules[*].metadata.references`) to allow users to
  easily find related and reliable resources.
- The [`README.md`](./README.md) document should be updated whenever a rule is added.

[Semgrep OSS Rules for writing rules]: https://semgrep.dev/docs/contributing/contributing-to-semgrep-rules-repository/#writing-a-rule-for-semgrep-registry
[Semgrep OSS Rules for writing rules (archive)]: https://github.com/semgrep/semgrep-docs/blob/12ff57628837535c6ffe65474347d1a48b558c22/docs/contributing/contributing-rules.md
