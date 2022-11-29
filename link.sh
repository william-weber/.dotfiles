DOTFILES=.dotfiles
OLD=$HOME/${DOTFILES}/backup/`date  +%Y%m%d%H%M%S`

cd $HOME
mkdir -p $OLD

files=( .ctags .vim .vimrc .gitconfig .irbrc .dir_colors .gemrc .tmux.conf .zshrc .zshrc-e iTerm2-Color-Schemes )

for file in ${files[*]}
do
    touch $file
    if [ -f $file ]; then
        echo "Saved $file in $OLD"
        cp -L $file $OLD
        ln -nfs $DOTFILES/$file $file 
    fi
done

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

cd -
