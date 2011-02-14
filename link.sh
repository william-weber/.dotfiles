DOTFILES=.dotfiles
OLD=$HOME/${DOTFILES}/backup/`date  +%Y%m%d%H%M%S`

cd $HOME
mkdir -p $OLD

files=( .bash_profile .bashrc .bash_logout .ctags .gvimrc .signature .vim .vimrc .gitconfig .autotest .irbrc .dir_colors .gemrc .screenrc .tmux.conf )

for file in ${files[*]}
do
    touch $file
    if [ -f $file ]; then
        echo "Saved $file in $OLD"
        cp --dereference $file $OLD
        ln -nfs $DOTFILES/$file $file 
    fi
done

cd -
