echo "=============================="
echo "CONFIG TMUX BEGIN"
if test -d ~/.tmux
then
    echo 'gpakosz/.tmux is already install' 
else
    echo "Instaling gpakosz/.tmux"
    cd
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
    echo 'Installed gpakosz/.tmux'
fi
echo "CONFIG TMUX END"
echo "=============================="
