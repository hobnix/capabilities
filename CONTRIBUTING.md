# Contributing

Read the core's [CONTRIBUTING.md](https://github.com/hobnix/server/blob/develop/CONTRIBUTING.md) and the code of conduct first; the rules
there (English docs, no raw output, secrets never in argv) apply here too.

- **Sign off every commit** with `git commit -s` (Developer Certificate of Origin, https://developercertificate.org/). A person signs off
  their own commits; an AI tool never does. The exact policy is decided in hobnix/server#270 and will be enforced by CI here once it is.
- Work on `feature/<topic>` or `fix/<topic>` started from `develop`; open the pull request against `develop`. CI (`check`) must pass.
- One folder per capability under `capabilities/<name>/` with a `package.toml` (see `examples/example/package.toml`) and a row in
  `index.toml`.
- **Versions** (hobnix/server#615): a pull request does not raise a version. It carries the label `bump: minor` (a feature) or
  `bump: major` (a person has to act); no label means patch, and at most one bump label. The release preparation raises `version` in
  `package.toml` and `index.toml` together. Until that workflow exists, the maintainer does it with `release.sh bump <package>` of the
  core; the CI check keeps `package.toml` and `index.toml` equal.
- A `module.nix` must evaluate without `--impure` and with the capability off, on its own and with all others on (the core's nix matrix
  runs it).
- A change that was not run on a real server says so in the pull request ("Not tested on hardware yet.").
- Releases are cut by a maintainer: pull request `develop` into `main` (merge commit), then a signed tag.
- Vulnerabilities: see [SECURITY.md](SECURITY.md), not an issue.
