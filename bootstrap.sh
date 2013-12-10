echo -e "\e[32m"
echo -e "Preparing $HOME"
echo -e "\e[0m"

mkdir -p ~/{bin,code}

echo -e "\e[32m"
echo -e "Downloading addtional binaries."
echo -e "\e[0m"

curl -sL https://raw.github.com/djl/vcprompt/master/bin/vcprompt > ~/bin/vcprompt
curl -sL https://raw.github.com/funtoo/keychain/master/keychain.sh > ~/bin/keychain

chmod 755 ~/bin/*

git clone -q https://github.com/rupa/z.git ~/code/z
chmod +x ~/code/z/z.sh

# https://rvm.io
# https://github.com/programble/effuse
# rvm for ruby, effuse to manage dotfile symlinks
curl -sL https://get.rvm.io | bash -s stable --ruby --gems=effuse --ignore-dotfiles

effuse

echo -e "\e[32m"
echo -e "Symlinked dotfiles in $HOME"
echo -e "\e[0m"
