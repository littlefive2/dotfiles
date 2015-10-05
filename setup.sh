#!/bin/bash

git clone https://github.com/frkwy/dotfiles.git $HOME/rcfiles

############################## 
#bash
############################## 
echo "bashfile settigns....."
mkdir ~/tmp
mkdir ~/Memo
for file in bash_profile bashrc bashrc_mininum
do
    FILE=$HOME/.$file
    if [ -a $FILE ]; then
        rm $FILE
    fi
    ln -s $HOME/rcfiles/$file $HOME/.$file
done

############################## 
#vim
############################## 
echo "vimrcfile settigns....."
for file in vimrc vimrc.basic vimrc.bundle vimrc.color vimrc.comment vimrc.statusline
do
    FILE=$HOME/.$file
    if [ -a $FILE ]; then
        rm $FILE
    fi
    ln -s $HOME/rcfiles/$file $HOME/.$file
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

git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

git clone https://github.com/tmux-plugins/tmux-yank ~/rcfiles/tmux-yank

echo "tmux settings....."
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

sed s/"// $HOME/rcfiles/vimrc.color
