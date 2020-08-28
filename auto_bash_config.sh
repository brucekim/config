ln -s ${PWD}/.bashrc $HOME/.bashrc

if [[ $OSTYPE == "darwin"* ]]; then
    ln -s ${PWD}/.profile.macos $HOME/.profile
fi
