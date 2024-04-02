# -a appends, so clear first
set -e _fisher_plugins

# fisher manages itself
set -g _fisher_upgraded_to_4_4
set -ga _fisher_plugins jorgebucaran/fisher

set -g _fisher_jorgebucaran_2F_fisher_files ~/config/fish/functions/fisher.fish
set -ga _fisher_jorgebucaran_2F_fisher_files ~/config/fish/completions/fisher.fish


# hydro
set -ga _fisher_plugins jorgebucaran/hydro
