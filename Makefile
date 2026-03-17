.PHONY: stow unstow

stow:
	stow --restow -vv -t "$(HOME)" -d stow .

unstow:
	stow -D -vv -t "$(HOME)" -d stow .
