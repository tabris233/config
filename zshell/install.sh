echo "=============================="
echo "Begin to config zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo "add .zshrc to ~/"
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/p10k.zsh ~/.p10k.zsh
echo ""
echo "END : zsh config"
echo "=============================="
