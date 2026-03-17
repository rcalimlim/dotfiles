# Fish completion for claude-access (ca)
# Install: Copy to ~/.config/fish/completions/ca.fish
#   cp ca.fish ~/.config/fish/completions/

# Disable file completions by default
complete -c ca -f
complete -c claude-access -f

# Main commands
complete -c ca -n '__fish_use_subcommand' -a 'run' -d 'Check credentials and launch Claude Code'
complete -c ca -n '__fish_use_subcommand' -a 'doctor' -d 'Run health check diagnostics'
complete -c ca -n '__fish_use_subcommand' -a 'update' -d 'Check for and apply updates'
complete -c ca -n '__fish_use_subcommand' -a 'install' -d 'Run full installation'
complete -c ca -n '__fish_use_subcommand' -a 'vscode' -d 'VS Code integration (launch, status, fix)'
complete -c ca -n '__fish_use_subcommand' -a 'help' -d 'Show help message'
complete -c ca -n '__fish_use_subcommand' -a 'version' -d 'Show version'

# Global options
complete -c ca -n '__fish_use_subcommand' -l help -d 'Show help message'
complete -c ca -n '__fish_use_subcommand' -l version -d 'Show version'
complete -c ca -n '__fish_use_subcommand' -s h -d 'Show help message'
complete -c ca -n '__fish_use_subcommand' -s v -d 'Show version'

# update subcommand
complete -c ca -n '__fish_seen_subcommand_from update' -l check -d 'Only check for updates, do not apply'

# vscode subcommand
complete -c ca -n '__fish_seen_subcommand_from vscode' -a 'launch' -d 'Launch VS Code with clean environment'
complete -c ca -n '__fish_seen_subcommand_from vscode' -a 'status' -d 'Check VS Code integration health'
complete -c ca -n '__fish_seen_subcommand_from vscode' -a 'fix' -d 'Auto-fix VS Code integration issues'
complete -c ca -n '__fish_seen_subcommand_from vscode' -a 'help' -d 'Show VS Code help'

# install subcommand
complete -c ca -n '__fish_seen_subcommand_from install' -l region -d 'AWS region for Bedrock' -r -a 'us-east-1 us-east-2 us-west-2 eu-west-1 eu-west-2 eu-west-3 eu-central-1 ap-northeast-1 ap-southeast-1 ap-southeast-2 ap-south-1 sa-east-1'
complete -c ca -n '__fish_seen_subcommand_from install' -l email -d 'Disney email for awsmyid' -r
complete -c ca -n '__fish_seen_subcommand_from install' -l skip-auth -d 'Skip initial authentication'
complete -c ca -n '__fish_seen_subcommand_from install' -l skip-prereq -d 'Skip prerequisites check'
complete -c ca -n '__fish_seen_subcommand_from install' -l verbose -d 'Show detailed output'
complete -c ca -n '__fish_seen_subcommand_from install' -s v -d 'Show detailed output'
complete -c ca -n '__fish_seen_subcommand_from install' -l help -d 'Show help'

# claude-access alias (same completions)
complete -c claude-access -n '__fish_use_subcommand' -a 'run' -d 'Check credentials and launch Claude Code'
complete -c claude-access -n '__fish_use_subcommand' -a 'doctor' -d 'Run health check diagnostics'
complete -c claude-access -n '__fish_use_subcommand' -a 'update' -d 'Check for and apply updates'
complete -c claude-access -n '__fish_use_subcommand' -a 'install' -d 'Run full installation'
complete -c claude-access -n '__fish_use_subcommand' -a 'vscode' -d 'VS Code integration (launch, status, fix)'
complete -c claude-access -n '__fish_use_subcommand' -a 'help' -d 'Show help message'
complete -c claude-access -n '__fish_use_subcommand' -a 'version' -d 'Show version'
complete -c claude-access -n '__fish_seen_subcommand_from vscode' -a 'launch' -d 'Launch VS Code with clean environment'
complete -c claude-access -n '__fish_seen_subcommand_from vscode' -a 'status' -d 'Check VS Code integration health'
complete -c claude-access -n '__fish_seen_subcommand_from vscode' -a 'fix' -d 'Auto-fix VS Code integration issues'
complete -c claude-access -n '__fish_use_subcommand' -l help -d 'Show help message'
complete -c claude-access -n '__fish_use_subcommand' -l version -d 'Show version'
complete -c claude-access -n '__fish_seen_subcommand_from update' -l check -d 'Only check for updates, do not apply'
complete -c claude-access -n '__fish_seen_subcommand_from install' -l region -d 'AWS region for Bedrock' -r -a 'us-east-1 us-east-2 us-west-2 eu-west-1 eu-west-2 eu-west-3 eu-central-1 ap-northeast-1 ap-southeast-1 ap-southeast-2 ap-south-1 sa-east-1'
complete -c claude-access -n '__fish_seen_subcommand_from install' -l email -d 'Disney email for awsmyid' -r
complete -c claude-access -n '__fish_seen_subcommand_from install' -l skip-auth -d 'Skip initial authentication'
complete -c claude-access -n '__fish_seen_subcommand_from install' -l skip-prereq -d 'Skip prerequisites check'
complete -c claude-access -n '__fish_seen_subcommand_from install' -l verbose -d 'Show detailed output'
complete -c claude-access -n '__fish_seen_subcommand_from install' -l help -d 'Show help'
