#!/bin/bash

[[ $1 != "" ]] && target=$1 || target=~
dotfiles_path=$target/dotfiles
backup_path=$target/dotfiles_old
files="bashrc bash vimrc vim zshrc oh-my-zsh"

echo -n "Backing up old dotfiles..."
for file in $files; do
	if [[ -e $target/.$file ]] || [[ -h $target/.$file ]]; then
		mkdir -p $backup_path
		mv $target/.$file $backup_path/$file
	fi
done
echo "Done!"

echo -n "Creating symlinks..."
for file in $files; do
	ln -s $dotfiles_path/$file $target/.$file
done
echo "Done!"
