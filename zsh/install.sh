echo "=============================="
echo "Begin to config zsh"
if test -d ~/.oh-my-zsh
then
	echo 'oh-my-zsh already install'
else
	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	echo "Installed oh-my-zsh"
fi
echo "add .zshrc to ~/"
cp ./.zshrc ~/
echo "create dir: ~/.tmuxinator/.tmuxinator.zsh"
mkdir -p ~/.tmuxinator
echo "copy .tmuxinator.zsh to ~/.tmuxinator/"
cp ./.tmuxinator.zsh ~/.tmuxinator/

echo "installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "installed zsh-autosuggestions"

echo "installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "installed zsh-syntax-highlighting"

echo ""
echo "END : zsh config"
echo "=============================="
