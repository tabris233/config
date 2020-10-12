"============
"基本键位设置
"============
"     ^
"     k
" < h   l >
"     j
"     v
let mapleader=" "  

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

map <C-s> :w<CR>
map <C-q> :q<CR>
map Q :wq<CR>
map <A-q> :qa<CR>

map <LEADER>/ :vsplit<CR>
map <LEADER>- :split<CR>

map <F1> :edit ~/.config/nvim/init.vim<CR>
map <F2> :source ~/.config/nvim/init.vim<CR>
map <F3> :PlugInstall<CR>
map <F4> :PlugUpdate<CR>

map <A-l> <C-w>l
map <A-k> <C-w>k
map <A-h> <C-w>h
map <A-j> <C-w>j

noremap tn :tabe<CR>
noremap ta :-tabnext<CR>
noremap td :+tabnext<CR>

noremap lg :FloatermNew lazygit<CR>
noremap <LEADER>ra :FloatermNew ranger<CR>

map <LEADER>sc :set spell!<CR>
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>j4d

vnoremap <C-c> "+y
