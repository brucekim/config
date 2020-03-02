echo "Copying.. .vimrc under \$HOME"
ln -sf ${PWD}/.vimrc $HOME/.vimrc

echo "Installing .. plugin"

echo "p bundle"
mkdir -p ~/.vim/autoload ~/.vim/bundle
echo "p patheogen"
cd ~/.vim/autoload/ && wget https://tpo.pe/pathogen.vim

echo "p sensible"
cd ~/.vim/bundle && git clone git://github.com/tpope/vim-sensible.git
echo "p srcexpl"
cd ~/.vim/bundle/  && git clone https://github.com/wesleyche/SrcExpl
echo "p nerdtree"
cd ~/.vim/bundle/ && git clone https://github.com/scrooloose/nerdtree
echo "p trinity"
cd ~/.vim/bundle/ && git clone https://github.com/wesleyche/Trinity
echo "p taglist"
cd ~/.vim/bundle/ && wget https://sourceforge.net/projects/vim-taglist/files/vim-taglist/4.6/taglist_46.zip && unzip taglist_46.zip -d taglist

# fugitive.vim
cd ~/.vim/bundle/ && git clone https://github.com/tpope/vim-fugitive.git && vim -u NONE -c "helptags vim-fugitive/doc" -c q

# syntastic
cd ~/.vim/bundle && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

# vim-gitgutter
cd ~/.vim/bundle && git clone git://github.com/airblade/vim-gitgutter.git

# airline
cd ~/.vim/bundle && git clone https://github.com/vim-airline/vim-airline

# color scheme
cd ~/.vim/bundle && git clone https://github.com/flazz/vim-colorschemes.git

# kotlin vim
cd ~/.vim/bundle && git clone https://github.com/udalov/kotlin-vim ~/.vim/bundle/kotlin-vim

# python syntax
cd ~/.vim/bundle && git clone https://github.com/vim-python/python-syntax.git
