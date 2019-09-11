""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug plugin manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo "silent !mkdir -p ~/.config/nvim/autoload"
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)
" ============================================================================
call plug#begin('~/.config/nvim/autoload')

Plug 'yianwillis/vimcdoc'                          " Chinese help

Plug 'shougo/unite.vim'
" 代码补全
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/deol.nvim'
Plug 'jiangmiao/auto-pairs'                         " 括号自动补全
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'                        " 静态代码分析

" git help plugin
Plug 'tpope/vim-fugitive'                          " git plugin
Plug 'airblade/vim-gitgutter'                      "

Plug 'Yggdroot/indentLine'                         " 


if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

Plug 'liuchengxu/vista.vim'                        " tagbar 超集替代品
Plug 'mg979/vim-visual-multi'                      " 多光标
Plug 'mhinz/vim-startify'                          " start page
Plug 'neomake/neomake'                             " 语法检查
Plug 'luochen1990/rainbow'                         " 彩虹括号

Plug 'vim-scripts/fcitx.vim'" 输入法状态切换
" color/scheme/
Plug 'vim-airline/vim-airline'                     " 状态栏工具
Plug 'vim-airline/vim-airline-themes'              " 状态栏主题
Plug 'guns/xterm-color-table.vim'                  " 
Plug 'ap/vim-css-color'                            "

call plug#end()

" ============================================================================
" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number

set termguicolors                                  " true color
"colorscheme NeoSolarized                           " scheme
set background=dark

set encoding=utf-8

" 自动折行
set linebreak
set nowrap
"垂直滚动时，光标距离顶部/底部的位置（单位：行）。
set scrolloff=5

"set textwidth=80
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽,space:·

" 高亮当前行列
set cursorcolumn
set cursorline

" 搜索时忽略大小写。
set ignorecase
" 如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。
set smartcase

" 打开英语单词的拼写检查。
set spell spelllang=en_us

" 自动切换工作目录。这主要用在一个 Vim 会话之中打开多个文件的情况，默认的工作目录是打开的第一个文件的目录。该配置可以将工作目录自动切换到，正在编辑的文件的目录。
set autochdir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoSoolarized config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

let g:gitgutter_override_sign_column_highlight = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'
"let g:airline_theme='solarized'  " murmur配色也不错
"let g:airline_solarized_bg='dark'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_conf = {
    \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \    'operators': '_,_',
    \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \    'separately': {
    \        '*': {},
    \        'tex': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \        },
    \        'lisp': {
    \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \        },
    \        'vim': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \        },
    \        'html': {
    \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \        },
    \        'css': 0,
    \    }
    \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" defx config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call defx#custom#column('size','')
call defx#custom#column('icon', {
      \ 'directory_icon': '',
      \ 'opened_icon': '',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('filename', {
      \ 'min_width': 30,
      \ 'max_width': 30,
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '',
      \ 'selected_icon': '',
      \ })
call defx#custom#option('_',{
      \ 'columns'   : 'git:mark:indent:icon:filename:icons',
      \ 'split'     : 'vertical',
      \ 'direction' : 'rightbelow',
      \ 'winwidth'  : 40,
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ })

autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'defx') | quit | endif
autocmd VimEnter * call s:welcome()
" autocmd FileType startify :Defx
function s:welcome()
  if exists(':Startify') == 2
    Startify
    if isdirectory(bufname(1))
      bwipeout! 1
    endif
  endif
  if exists(':VimFiler') == 2
    VimFiler
    wincmd p
  elseif exists(':Defx') == 2
    Defx
    wincmd p
  endif
endfunction
autocmd FileType defx call s:defx_init()
function! s:defx_init()
  setl nonumber
  setl norelativenumber
  setl listchars=
  setl nofoldenable
  setl foldmethod=manual

  " disable this mappings
  nnoremap <silent><buffer> <3-LeftMouse> <Nop>
  nnoremap <silent><buffer> <4-LeftMouse> <Nop>
  nnoremap <silent><buffer> <LeftMouse> <LeftMouse><Home>

  silent! nunmap <buffer> <Space>
  silent! nunmap <buffer> <C-l>
  silent! nunmap <buffer> <C-j>
  silent! nunmap <buffer> E
  silent! nunmap <buffer> gr
  silent! nunmap <buffer> gf
  silent! nunmap <buffer> -
  silent! nunmap <buffer> s

  " nnoremap <silent><buffer><expr> st  vimfiler#do_action('tabswitch')
  " nnoremap <silent><buffer> yY  :<C-u>call <SID>copy_to_system_clipboard()<CR>
  nnoremap <silent><buffer><expr> '
        \ defx#do_action('toggle_select') . 'j'
  " TODO: we need an action to clear all selections
  nnoremap <silent><buffer><expr> V
        \ defx#do_action('toggle_select_all')
  " nmap <buffer> v       <Plug>(vimfiler_quick_look)
  " nmap <buffer> p       <Plug>(vimfiler_preview_file)
  " nmap <buffer> i       <Plug>(vimfiler_switch_to_history_directory)

  " Define mappings
  nnoremap <silent><buffer><expr> gx
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> h defx#do_action('call', 'DefxSmartH')
  nnoremap <silent><buffer><expr> <Left> defx#do_action('call', 'DefxSmartH')
  nnoremap <silent><buffer><expr> l defx#do_action('call', 'DefxSmartL')
  nnoremap <silent><buffer><expr> <Right> defx#do_action('call', 'DefxSmartL')
  nnoremap <silent><buffer><expr> o defx#do_action('call', 'DefxSmartL')
  nnoremap <silent><buffer><expr> <Cr>
        \ defx#is_directory() ?
        \ defx#do_action('open_directory') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> <2-LeftMouse>
        \ defx#is_directory() ? 
        \     (
        \     defx#is_opened_tree() ?
        \     defx#do_action('close_tree') :
        \     defx#do_action('open_tree')
        \     )
        \ : defx#do_action('drop')
  nnoremap <silent><buffer><expr> sg
        \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> sv
        \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> st
        \ defx#do_action('drop', 'tabedit')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy defx#do_action('call', 'DefxYarkPath')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-r>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer> <Home> :call cursor(2, 1)<cr>
  nnoremap <silent><buffer> <End>  :call cursor(line('$'), 1)<cr>
"  nnoremap <silent><buffer><expr> <C-Home>  defx#do_action('cd', SpaceVim#plugins#projectmanager#current_root())
endf
" in this function we should vim-choosewin if possible
function! DefxSmartL(_)
  if defx#is_directory()
    call defx#call_action('open_tree')
    normal! j
  else
    let filepath = defx#get_candidate()['action__path']
    if tabpagewinnr(tabpagenr(), '$') >= 3    " if there are more than 2 normal windows
      if exists(':ChooseWin') == 2
        ChooseWin
      else
        let input = input('ChooseWin No./Cancel(n): ')
        if input ==# 'n' | return | endif
        if input == winnr() | return | endif
        exec input . 'wincmd w'
      endif
      exec 'e' filepath
    else
      exec 'wincmd w'
      exec 'e' filepath
    endif
  endif
endfunction

function! DefxSmartH(_)
  " if cursor line is first line, or in empty dir
  if line('.') ==# 1 || line('$') ==# 1
    return defx#call_action('cd', ['..'])
  endif

  " candidate is opend tree?
  if defx#is_opened_tree()
    return defx#call_action('close_tree')
  endif

  " parent is root?
  let s:candidate = defx#get_candidate()
  let s:parent = fnamemodify(s:candidate['action__path'], s:candidate['is_directory'] ? ':p:h:h' : ':p:h')
  let sep = s:SYS.isWindows ? '\\' :  '/'
  if s:trim_right(s:parent, sep) == s:trim_right(b:defx.paths[0], sep)
    return defx#call_action('cd', ['..'])
  endif

  " move to parent.
  call defx#call_action('search', s:parent)

  " if you want close_tree immediately, enable below line.
  call defx#call_action('close_tree')
endfunction

function! DefxYarkPath(_) abort
  let candidate = defx#get_candidate()
  let @+ = candidate['action__path']
  echo 'yarked: ' . @+
endfunction

function! s:trim_right(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction

"defx-git config
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?',
  \ }

let g:defx_git#column_length = 1
let g:defx_git#raw_mode = 1
" defx-icons config 
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimfiler config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 默认文件管理器更改成vimfiler
"let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_tree_leaf_icon = '|'
"let g:vimfiler_tree_opened_icon = '▾'
"let g:vimfiler_tree_closed_icon = '▸'
"let g:vimfiler_file_icon = '-'
"let g:vimfiler_marked_file_icon = '*'
"
"let g:vimfiler_options_direction = 'right'
"
"call vimfiler#custom#profile('default', 'context', {
"      \ 'explorer' : 1,
"      \ 'winwidth' : 40,
"      \ 'winminwidth' : 30,
"      \ 'toggle' : 1,
"      \ 'auto_expand': 1,
"      \ 'direction' : 'rightbelow',
"      \ 'explorer_columns' : 'gitstatus',
"      \ 'parent': 0,
"      \ 'status' : 1,
"      \ 'safe' : 0,
"      \ 'split' : 1,
"      \ 'hidden': 1,
"      \ 'no_quit' : 1,
"      \ 'force_hide' : 0,
"      \ 'no_focus' : 1,
"      \ })
"autocmd VimEnter * if ! argc()
"               \ |   Startify
"               \ |   VimFiler
"               \ | endif
"
""
"autocmd BufEnter * if (!has('vim_starting') && winnr('$') == 1 && &filetype ==# 'vimfiler') | quit | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 默认开启彩虹括号
let g:rainbow_active = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" startify config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:startify_session_dir = $HOME .  '/.data/' . ( has('nvim') ? 'nvim' : 'vim' ) . '/session'
let g:startify_files_number = 5
let g:startify_list_order = [
      \ ['   My most recently used files in the current directory:'],
      \ 'dir',
      \ ['   My most recently used files:'],
      \ 'files',
      \ ['   These are my sessions:'],
      \ 'sessions',
      \ ['   These are my bookmarks:'],
      \ 'bookmarks',
      \ ]
""let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
"let g:startify_update_oldfiles = 1
"let g:startify_disable_at_vimenter = 1
"let g:startify_session_autoload = 1
"let g:startify_session_persistence = 1
""let g:startify_session_delete_buffers = 0
"let g:startify_change_to_dir = 0
""let g:startify_change_to_vcs_root = 0  " vim-rooter has same feature
"let g:startify_skiplist = [
"      \ 'COMMIT_EDITMSG',
"      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
"      \ 'bundle/.*/doc',
"      \ ]

"let g:autoloaded_startify = 1

let g:startify_custom_header_quotes = [
      \ ['tabris is handsome!','','Come on!tabris!'],
      \ ['I do not know what I can write here!'],
      \ ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_error_symbol = '✗'"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1"whether to show balloons

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

" tbodt/deoplete-tabnine
call deoplete#custom#var('tabnine', {
            \ 'line_limit': 500,
            \ 'max_num_results': 20,
            \ })

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keyboard map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ca w!! w !sudo tee "%"

tnoremap <ESC>    <C-\><C-n>

"去行首空格
":%s/^\s\+
"去行末空格
":%s/\s\+$



