# CookiesHQ Vim config

This is our stating point for our Vim config.

## Installation

### Clone the repo

    git clone git@github.com:cookieshq/cookieshq-vimrc.git ~/.vim/

Please make sure you backup your existing config if it exists.

### Powerline fonts

We use [vim airline](https://github.com/bling/vim-airline) that needs some fonts patching.

To patch your fonts, please follow the documentation on [powerline font](https://github.com/Lokaltog/powerline-fonts)

### Vundle

Vim plugins are managed using [Vundle](https://github.com/gmarik/Vundle.vim)

Run this to install it:

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Then run:

    vim +BundleInstall +qall

This will install all the plugins we use. Alternatively, if you're already in Vim, run:

    :BundleInstall

### Create a symbolic link to your .vimrc

    ln -s ./vim/vimrc ~/.vimrc

