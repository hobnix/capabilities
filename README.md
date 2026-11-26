<p align="center"><img src="https://raw.githubusercontent.com/hobnix/core/HEAD/.github/branding/banner@2x.webp" alt="hobnix" width="100%"></p>

> **Retired.** Development moved to [hobnix/official](https://github.com/hobnix/official). A server on core 0.13 or later moves over by itself (`hs pkg repo migrate`, also run by `hs update`); a server on core 0.12 still reads this repository until it updates.

# hobnix/capabilities

Optional capabilities for [Hobnix](https://github.com/hobnix/server), the NixOS home server. A capability is a package with
`kind = "capability"`: a manifest (`package.toml`), optionally a Nix module, commands, options and a web page. The setup wizard of the
core installs the ones you pick; `hs pkg` fetches them at a signed release tag and verifies the signature.

**Status: scaffold.** No capability lives here yet; the first one will be `testlab` (pilot, hobnix/server#225, plan decision O1). This
repository joins the core's list of default repositories (`config/package-repos.toml`) only after its first signed tag. The design is
[ADR 0017](https://github.com/hobnix/server/blob/develop/docs/adr/0017-capabilities-repository-and-channels.md) (Proposed) and builds on ADR 0008 and 0009.

## Layout

```
index.toml                         versions of every package (must equal each package.toml)
capabilities/<name>/package.toml   manifest of one capability
capabilities/<name>/module.nix     optional Nix module (default repository only)
examples/example/package.toml      a manifest to copy from (not a package, not in the index)
tests/run-all.sh                   runs the tests against a checkout of the core (HS_CORE=...)
```

## Branches and releases

Same model as hobnix/server (ADR 0007): `develop` is the default branch and takes pull requests from `feature/<topic>` and `fix/<topic>`;
`main` holds released code only and takes a release pull request (merge commit, no squash) followed by a signed `vX.Y.Z` tag. Servers
install tags, never branch heads.

## Licence

GNU Affero General Public License v3.0, as hobnix/server (see `LICENSE`). A `module.nix` is evaluated into the core's system.
hobnix/recipes and hobnix/extensions are MIT; the difference is deliberate.
