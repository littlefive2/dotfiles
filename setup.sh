#!/bin/bash

# locale
mkdir $HOME/.config
echo "
LANG=ja_JP.UTF-8
LC_CTYPE=ja_JP.UTF-8
LC_NUMERIC=ja_JP.UTF-8
LC_TIME=ja_JP.UTF-8
LC_COLLATE=ja_JP.UTF-8
LC_MONETARY=ja_JP.UTF-8
LC_MESSAGES=ja_JP.UTF-8
LC_PAPER="ja_JP.UTF-8"
LC_NAME="ja_JP.UTF-8"
LC_ADDRESS="ja_JP.UTF-8"
LC_TELEPHONE="ja_JP.UTF-8"
LC_MEASUREMENT="ja_JP.UTF-8"
LC_IDENTIFICATION="ja_JP.UTF-8"
LC_ALL=
" > $HOME/.config/locale.conf

# clone my rcfiles
git clone https://github.com/frkwy/dotfiles.git $HOME/rcfiles

# create dir
mkdir ~/tmp
mkdir ~/bin
mkdir ~/Memo

# put file
mv $HOME/rcfiles/git-prompt.sh $HOME/bin/git-prompt.sh
mv $HOME/rcfiles/git-completion.bash $HOME/bin/git-completion.bash
mv $HOME/rcfiles/cdd $HOME/bin/cdd

# put bash file
for file in bash_profile bashrc bashrc_mininum
do
    FILE=$HOME/.$file
    if [ -a $FILE ]; then
        rm $FILE
    fi
    ln -sf $HOME/rcfiles/$file $HOME/.$file
done

#put vimrc file
for file in vimrc vimrc.basic vimrc.bundle vimrc.color vimrc.comment vimrc.statusline
do
    FILE=$HOME/.$file
    if [ -a $FILE ]; then
        rm $FILE
    fi
    ln -sf $HOME/rcfiles/$file $HOME/.$file
done

# Simplenote
echo "new create vim.secret"
touch $HOME/.vim.secret 
chmod +x $HOME/.vim.secret 
$HOME/.vim.secret << EOF
let g:SimplenoteUsername = 
let g:SimplenotePassword = 
let g:SimplenoteNoteFormat="[%D] %N%>%T"
EOF
echo "*Please input password for Simplenote"

# vundle settings
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# tmux
git clone https://github.com/tmux-plugins/tmux-yank ~/rcfiles/tmux-yank
echo "tmux settings....."
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf


sed -i s/\"// $HOME/rcfiles/vimrc.color
source /usr/bin/virtualenvwrapper.sh
source ~/.bash_profile
