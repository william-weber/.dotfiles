DOTFILES=.dotfiles
OLD=${DOTFILES}/backup/`date  +%Y%m%d%H%M%S`

cd $HOME
mkdir -p $OLD

mv -f .profile $OLD
mv -f .bashrc $OLD
mv -f .bash_logout $OLD
mv -f .ctags $OLD
mv -f .gvimrc $OLD
mv -f .signature $OLD
mv -f .vim $OLD
mv -f .vimrc $OLD
mv -f .gitconfig $OLD
mv -f .autotest $OLD

ln -s $DOTFILES/.profile .profile
ln -s $DOTFILES/.bashrc .bashrc
ln -s $DOTFILES/.bash_logout .bash_logout
ln -s $DOTFILES/.ctags .ctags
ln -s $DOTFILES/.gvimrc .gvimrc
ln -s $DOTFILES/.signature .signature
ln -s $DOTFILES/.gitconfig .gitconfig
ln -s $DOTFILES/.vim .vim
ln -s $DOTFILES/.vimrc .vimrc
ln -s $DOTFILES/.autotest .autotest
