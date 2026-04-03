# dotfiles

## tools
- terminal: `ghostty`
- shell: `fish`
- prompt: `starship`
- multiplexer: `zellij`
- editor: `helix`
- version control: `git`, `gh`

## usage

### prerequisites

Install [GNU Stow](https://www.gnu.org/software/stow/):

```sh
# macOS
brew install stow

# linux
sudo apt install stow   # debian/ubuntu
sudo pacman -S stow      # arch
```

### install

Clone the repo and symlink all configs into your home directory:

```sh
git clone https://github.com/rcalimlim/dotfiles
cd dotfiles
make stow
```

This runs `stow --restow -t $HOME -d stow .`, which creates symlinks in
`~/.config/` pointing back to the files under `stow/.config/`. For example,
`stow/.config/ghostty/config` becomes `~/.config/ghostty/config`.

### uninstall

Remove all symlinks created by stow:

```sh
make unstow
```

### updating

After pulling new changes, re-run `make stow` to pick up any added or
renamed config files. Stow will update existing symlinks and create new ones
as needed.
