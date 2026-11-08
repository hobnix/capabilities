# Contributing

Read the core's [CONTRIBUTING.md](https://github.com/hobnix/server/blob/develop/CONTRIBUTING.md) and the code of conduct first; the rules
there (English docs, no raw output, secrets never in argv) apply here too.

- **Sign off every commit** with `git commit -s` (Developer Certificate of Origin, https://developercertificate.org/). The exact policy is
  decided in hobnix/server#270 and will be enforced by CI here once it is.
- Work on `feature/<topic>` or `fix/<topic>` started from `develop`; open the pull request against `develop`. CI (`check`) must pass.
- One folder per capability under `capabilities/<name>/` with a `package.toml` (see `examples/example/package.toml`). Raise `version` in
  `package.toml` and `index.toml` together.
- A `module.nix` must evaluate without `--impure` and with the capability off, on its own and with all others on (the core's nix matrix
  runs it).
- A change that was not run on a real server says so in the pull request ("Not tested on hardware yet.").
- Releases are cut by a maintainer: pull request `develop` into `main` (merge commit), then a signed tag.
- Vulnerabilities: see [SECURITY.md](SECURITY.md), not an issue.
