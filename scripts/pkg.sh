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

brew install $brew_pkgs

# -----------------------------------------------------------------------------
# Install cargo pkgs
# -----------------------------------------------------------------------------
cargo_pkg_list=$(get_pkgs "cargo")
cargo_pkgs=$(cat_list "$cargo_pkg_list")

cargo install --locked $cargo_pkgs

# -----------------------------------------------------------------------------
# Install go pkgs
# -----------------------------------------------------------------------------
go_pkg_list=$(get_pkgs "go")
go_pkgs=$(cat_list "$go_pkg_list")

go install $go_pkgs
