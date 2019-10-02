"                                         ▟▙
"                                         ▝▘
" ██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖
" ██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██
" ██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██
" ██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██
" ▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/plugged/deoplete.nvim'))
  silent !pip3 install --user pynvim jedi yapf pylint
endif
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'kien/ctrlp.vim' " fuzzy find files

    Plug 'fatih/vim-go', { 'tag': '*' }
    Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'powerline/fonts'
    Plug 'tpope/vim-surround'
    Plug 'fatih/vim-go'
    Plug 'chrisbra/Colorizer'

    Plug 'neomake/neomake'
    Plug 'zchee/deoplete-jedi'
    Plug 'davidhalter/jedi-vim'
    Plug 'sbdchd/neoformat'

    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme monokai

" Share clipboard between vim instances
set clipboard=unnamed

" Faster redrawing
set ttyfast

" Listchars
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" Use relative numbering
set relativenumber
set number

" Enable syntax highlighting
syntax on

" Use spaces as tabs
set expandtab
set tabstop=4 " the visible width of tabs
set shiftwidth=4 " number of spaces to use for indent and unindent

" Faster tmux
set ttimeoutlen=100

" Airline settings
set laststatus=2 " to allways show status bar
let g:airline_powerline_fonts = 1
let g:airline_theme = "bubblegum"
syntax on

" Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

" show hidden files
let g:ctrlp_show_hidden = 1

" config LaTeX
let g:vimtex_view_method = 'zathura'

" GOLANG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_version_warning = 0

" ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" linting
let g:neomake_python_pylint_maker = {
  \ 'args': [
  \ '-d', 'C0103, C0111',
  \ '-f', 'text',
  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
  \ '-r', 'n'
  \ ],
  \ 'errorformat':
  \ '%A%f:%l:%c:%t: %m,' .
  \ '%A%f:%l: %m,' .
  \ '%A%f:(%l): %m,' .
  \ '%-Z%p^%.%#,' .
  \ '%-G%.%#',
  \ }
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set a map leader for more key combos
let mapleader = ','

" Toggle spell checking
nnoremap <leader>ss :set spell!<Enter>
" Reload vimrc
nnoremap <leader>rr :source ~/.config/nvim/init.vim<Enter>

" Shortcut for typing lists
nnoremap <leader>o :normal o- <ENTER>i
nnoremap <leader>O :normal O- <ENTER>i

" Dropdown menu
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Deoplete
inoremap <expr> <Tab> pumvisible() ? "\<Right>" : "\<Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

