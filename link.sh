DOTFILES=.dotfiles
OLD=${DOTFILES}/backup/`date  +%Y%m%d%H%M%S`

cd $HOME
mkdir -p $OLD

files=( .bash_profile .bashrc .bash_logout .ctags .gvimrc .signature .vim .vimrc .gitconfig .autotest .irbrc .dir_colors .gemrc .screenrc)

for file in ${files[*]}
do
    touch $file
    if [ -f $file ]; then
        echo "Saved $file in $OLD"
        mv -f $file $OLD
        ln -s $DOTFILES/$file $file 
    fi
done

cd -
