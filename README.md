# Homebrew tap for Silicon Cellar

[Silicon Cellar](https://github.com/NorseGaud/SiliconCellar) runs Windows Steam games that you own on Apple Silicon.

```sh
brew install --cask norsegaud/siliconcellar/siliconcellar
```

Or tap first:

```sh
brew tap norsegaud/siliconcellar
brew install --cask siliconcellar
```

`brew uninstall --zap --cask siliconcellar` also removes the Wine prefix, Steam, and games under `~/Library/Application Support/SiliconCellar`.

`make release` in the Silicon Cellar repo updates `Casks/siliconcellar.rb`. Commit the change here after the GitHub release is published.
