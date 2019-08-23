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

" Use relative numbering
set relativenumber 
set number  

" Enable syntax highlighting
syntax on

" Use spaces as tabs
set expandtab
set tabstop=4 " the visible width of tabs
set shiftwidth=4 " number of spaces to use for indent and unindent

" Airline settings
set laststatus=2 " to allways show status bar
let g:airline_powerline_fonts = 1
let g:airline_theme = "bubblegum"
syntax on

" Deoplete
let g:deoplete#enable_at_startup = 1

" show hidden files
let g:ctrlp_show_hidden = 1

" config LaTeX
let g:vimtex_view_method = 'zathura'

" GOLANG
let	g:go_fmt_command = "goimports" 
let g:go_metalinter_autosave = 1

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
