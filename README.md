# Welcome to my dotfiles

Feel free to use anything here. This repository is designed to be managed with [dfm](https://github.com/CGamesPlay/dfm).

```
# Install on a new machine
./bootstrap.sh
# Add a new config file to the repo
dfm add ~/.config/fish/functions/cool.fish
git add files/.config/fish/functions/cool.fish
git commit -m "Added cool function"
git push
# Update config on other machines
git pull
dfm link
```

# Details

The main entry point it `bootstrap.sh`, is a short script which runs all of the scripts in `tasks`. The tasks are run in order, and have comments documenting their function. All tasks are designed to be idempotent, so running them multiple times is safe.

The [fish](https://fishshell.com) configuration is probably the most important. It works like this:

- `files/.config/fish/defaults.fish` is run by `tasks/20-fish.sh` to set default universal variables like the color scheme. This file is idempotent.
- `files/.config/fish/conf.d/*` are run each fish startup, in order. Files here are designed to be short and single-purpose.
- `files/.config/fish/functions/*` are autoloaded by fish on demand. These can override installed and built-in commands. These commands provide their own help in some cases.

The Neovim configuration is also worth explaining.

- `files/.config/nvim/init.lua` is the main entry point for my nvim configuration. It is primarily responsible for ensuring the XDG environment variables are set, and then loads other files.
- `files/.config/nvim/lua/config/builtin.lua` sets all of the base configuration that doesn't depend on any plugins.
- `files/.config/nvim/lua/config/*.lua` are all loaded by lazy, and generally each correspond to a single plugin.
- `files/.config/nvim/ftplugin/*` are loaded when a file of the matching type is loaded. This is used to override default settings for the given file type.

I also have a collection of custom scripts available in this repository:

- `files/.local/bin/*` are all of my custom scripts which I keep installed by default.
- `files/.local/bin/@argc` is of special note. I keep high-level scripts in this file, it's like a documented collection of snippets. It is built on [argc](https://github.com/sigoden/argc) which is installed by the bootstrap script.
- `devserver/` contains a script that creates a scale-to-zero server on Hetzner with auto-shutdown capabilities.

And finally, the "share" directory contains files that are also generally useful to have.
