function install_with_brew
    # Check if brew is installed
    if command -v brew >/dev/null
        # Loop through passed arguments
        for pkg in $argv
            # Install the package using brew
            brew install $pkg
            
            # Append or update package information in the TOML file
            set installed_version (brew list --versions $pkg | awk '{print $NF}')
            set -q packages.$pkg
            if not test $status -eq 0
                echo "[$pkg]" >> brew_packages.toml
            end
            echo "version = \"$installed_version\"" >>| brew_packages.toml
        end
    else
        echo "Error: Homebrew is not installed."
    end
end
