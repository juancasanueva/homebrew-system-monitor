# homebrew-system-monitor

**This tap has moved.** [System Monitor](https://github.com/juancasanueva/SWIFTUI_system_monitor) now
ships from `juancasanueva/tap`, together with
[Home Cellar](https://github.com/juancasanueva/SWIFTUI_cellar) — one tap, one trust grant, one
`brew upgrade` for both.

Nothing is served from here any more. The cask file is gone and a `tap_migrations.json` at the root
sends the `system-monitor` token to the new tap.

## New here?

```sh
brew trust juancasanueva/tap
brew tap juancasanueva/tap
brew install --cask system-monitor
```

The fully-qualified form, `brew install --cask juancasanueva/tap/system-monitor`, is unambiguous if
another tap ever claims the token — and naming the tap on the command line is itself the grant, so it
needs no `brew trust` at all.

See the [new tap's README](https://github.com/juancasanueva/homebrew-tap) for adoption of an existing
`/Applications/System-Monitor.app`, uninstall, zap and the rest.

## Already installed from this tap?

Three commands finish the move:

```sh
brew trust juancasanueva/tap
brew tap juancasanueva/tap
brew upgrade
```

The trust grant and the tap have to come first. `brew upgrade` follows the migration into a tap you
already have, but it will not add a tap for you, and Homebrew will not load a cask from an untrusted
third-party tap — so a bare `brew upgrade` without those two lines simply does nothing.

Once `brew info --cask system-monitor` reports `From: https://github.com/juancasanueva/homebrew-tap/...`, this tap has no further job:

```sh
brew untap juancasanueva/system-monitor
```

Untapping does **not** uninstall anything, and nothing about the installed app changes. The migration
rebinds which tap owns the token, not the bundle on disk.

## Licence

MIT, the same licence as the app.
