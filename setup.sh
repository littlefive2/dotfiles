#!/bin/bash

# bash
echo "bashfile settigns....."
for file in bash_profile bashrc bashrc_mininum
do
    FILE=$HOME/.$file
    if [ -a $FILE ]; then
        rm $FILE
    fi
    ln -s $HOME/dotfiles/bash/$file $HOME/.$file
done
source $HOME/.bashrc

#vim
echo "vimrcfile settigns....."
for file in vimrc vimrc.basic vimrc.bundle vimrc.color vimrc.comment vimrc.statusline
do
    FILE=$HOME/.$file
    if [ -a $FILE ]; then
        rm $FILE
    fi
    ln -s $HOME/dotfiles/vimrc/$file $HOME/.$file
done

echo "new create vim.secret"
touch $HOME/.vim.secret 
chmod +x $HOME/.vim.secret 
$HOME/.vim.secret << EOF
let g:SimplenoteUsername = 
let g:SimplenotePassword = 
let g:SimplenoteNoteFormat="[%D] %N%>%T"
EOF
echo "*Please input password for Simplenote"

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
