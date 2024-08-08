#!/bin/bash

# -----------------------------------------------------------------------------
# Utils
# -----------------------------------------------------------------------------
get_pkgs() {
    local prefix="$1"
    local cmd="taplo get -f pkgs.toml -o value '${prefix}.*.pkg'"
    eval "$cmd"
}

cat_list() {
  local list="$1"
  local cmd="tr '\n' ' ' <<< $list"
  eval "$cmd"
}

# -----------------------------------------------------------------------------
# Install brew packages
# -----------------------------------------------------------------------------
brew_pkg_list=$(get_pkgs "brew")
brew_pkgs=$(cat_list "$brew_pkg_list")

for brew_pkg in "${brew_pkgs[@]}"; do
    brew install $brew_pkg
done

# -----------------------------------------------------------------------------
# Install cargo pkgs
# -----------------------------------------------------------------------------
cargo_pkg_list=$(get_pkgs "cargo")
cargo_pkgs=$(cat_list "$cargo_pkg_list")

echo $cargo_pkgs

# cargo install --locked $cargo_pkgs
for cargo_pkg in "${cargo_pkgs[@]}"; do
    cargo install --locked $cargo_pkg
done

# -----------------------------------------------------------------------------
# Install go pkgs
# -----------------------------------------------------------------------------
go_pkg_list=$(get_pkgs "go")
go_pkgs=$(cat_list "$go_pkg_list")

for go_pkg in "${go_pkgs[@]}"; do
    go install $go_pkg
done
