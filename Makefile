DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .config
DOTFILES_TARGET   := $(wildcard .??*) bin $(wildcard .config/*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy:
	    @$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	    @$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
