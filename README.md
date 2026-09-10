# homebrew-system-monitor

The Homebrew tap for [System Monitor](https://github.com/juancasanueva/SWIFTUI_system_monitor), a
lightweight CPU, memory, disk and network monitor for the macOS menu bar.

## Install

```sh
brew tap juancasanueva/system-monitor
brew trust juancasanueva/system-monitor
brew install --cask system-monitor
```

That installs `/Applications/System-Monitor.app` — the same notarized, stapled build the project's
[Releases](https://github.com/juancasanueva/SWIFTUI_system_monitor/releases) page serves. The bundle is named
`System-Monitor.app` in both channels.

Homebrew 6 refuses to load a cask from a non-official tap until the tap is trusted, which is what the
middle line does. It grants nothing beyond this tap, and you can undo it with
`brew untrust juancasanueva/system-monitor`.

If another tap ever claims the `system-monitor` token, this fully-qualified form is unambiguous — and
naming the tap on the command line is itself the grant, so it needs no `brew trust` at all:

```sh
brew install --cask juancasanueva/system-monitor/system-monitor
```

### Already have `System-Monitor.app` in `/Applications`?

Homebrew refuses to overwrite an app it did not place, so a copy installed from the zip stops the
plain install with `It seems there is already an App at '/Applications/System-Monitor.app'`. Let brew
adopt the existing copy instead:

```sh
brew install --cask --adopt system-monitor
```

Adoption keeps the bundle and its data where they are and records it as brew-managed. Because the
cask declares `auto_updates`, brew does not compare versions before adopting — whatever Sparkle has
updated the copy to is the copy it takes over.

## Requirements

- macOS 15 (Sequoia) or later
- Apple Silicon (`arm64`)

## Updates

System Monitor updates itself with [Sparkle](https://sparkle-project.org) from an EdDSA-signed appcast, so the
cask declares `auto_updates true`. Homebrew will not report a self-updated copy as outdated and will
not reinstall over it. `brew upgrade` and System Monitor's own updater do not fight.

## Uninstall

```sh
brew uninstall --cask system-monitor
```

To remove System Monitor's caches, local data and preferences as well:

```sh
brew uninstall --cask --zap system-monitor
```

**A zap cannot remove Keychain items.** Homebrew's uninstall has no Keychain facility, so these two
generic-password items survive it, and they are the only things that do:

- `com.juancasanueva.system-monitor.nvd-api-key`
- `com.juancasanueva.system-monitor.github-pat`

Both exist only if you supplied those optional credentials. Delete them in **Keychain Access** if you
want them gone.

Untapping or deleting this tap does **not** uninstall anything. An installed copy keeps working and
keeps updating itself through Sparkle; it simply stops being managed by `brew`.

## How this tap stays current

`.github/workflows/bump.yml` reads the app repository's latest published release four times a day,
downloads the published asset, computes its checksum from those bytes, and commits the two-line bump
only after `brew style` and `brew audit --cask --online --strict` both pass. It makes no commit when
the cask already declares the published version, so at most one commit exists per release. The app
repository sends nothing to this one and holds no credential for it.

## Licence

MIT, the same licence as the app. A cask is a build recipe, not the application.
