#!/bin/bash
# bash
echo "bashfile settigns....."
for file in bash_profile bashrc bashrc_mininum
do
    FILE=/home/vagrant/.$file
    if [ -a $FILE ]; then
        rm $FILE
    fi
    ln -s /home/vagrant/dotfiles/bash/$file /home/vagrant/.$file
done

#vim
echo "vimrcfile settigns....."
for file in vimrc vimrc.basic vimrc.bundle vimrc.color vimrc.comment vimrc.statusline
do
    FILE=/home/vagrant/.$file
    if [ -a $FILE ]; then
        rm $FILE
    fi
    ln -s /home/vagrant/dotfiles/vimrc/$file /home/vagrant/.$file
done

echo "new create vim.secret"
touch /home/vagrant/.vim.secret 
chmod +x /home/vagrant/.vim.secret 
/home/vagrant/.vim.secret << EOF
let g:SimplenoteUsername = 
let g:SimplenotePassword = 
let g:SimplenoteNoteFormat="[%D] %N%>%T"
EOF
echo "*Please input password for Simplenote"

git clone https://github.com/gmarik/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

echo "tmux settings....."
ln -s /home/vagrant/dotfiles/tmux/tmux_ubuntu.conf /home/vagrant/.tmux.conf

