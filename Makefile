.PHONY: stow unstow stow-windows

stow:
	stow --restow -vv -t "$(HOME)" -d stow .

unstow:
	stow -D -vv -t "$(HOME)" -d stow .

WIN_USER ?= Ross
WIN_TERM_PATH = /mnt/c/Users/$(WIN_USER)/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState

stow-windows:
	cp "$(CURDIR)/windows-terminal/settings.json" "$(WIN_TERM_PATH)/settings.json"
