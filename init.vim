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
  autocmd VimEnter * PlugUpdate --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')
    Plug 'bling/vim-airline'
    Plug 'chemzqm/vim-jsx-improve'
    Plug 'chrisbra/Colorizer'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'davidhalter/jedi-vim'
    Plug 'dense-analysis/ale'
    Plug 'elzr/vim-json'
    Plug 'fatih/vim-go', { 'tag': '*' }
    Plug 'godlygeek/tabular'
    Plug 'honza/vim-snippets'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    Plug 'ianks/vim-tsx'
    Plug 'iCyMind/NeoSolarized'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'kien/ctrlp.vim' " fuzzy find files
    Plug 'leafgarland/typescript-vim'
    Plug 'lervag/vimtex'
    Plug 'mattn/emmet-vim'
    Plug 'mxw/vim-jsx'
    " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neomake/neomake'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'plasticboy/vim-markdown'
    Plug 'powerline/fonts'
    Plug 'powerman/vim-plugin-AnsiEsc'
    Plug 'sbdchd/neoformat'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'SirVer/ultisnips'
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'zchee/deoplete-jedi'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme monokai
set termguicolors

lua require'colorizer'.setup()

"colorscheme NeoSolarized
" Fix solorized theme for tmux
"set t_8f=^[[38;2;%lu;%lu;%lum
"set t_8b=^[[48;2;%lu;%lu;%lum

" Share clipboard between vim instances
set clipboard+=unnamedplus

" Faster redrawing
set ttyfast

" Use relative numbering
set relativenumber
set number

" Enable syntax highlighting
syntax on

" Use spaces as tabs
set expandtab
set tabstop=4 " the visible width of tabs
set shiftwidth=4 " number of spaces to use for indent and unindent

" Listchars

set list
" set listchars=tab:▸\ ,trail:·,precedes:←,extends:→
set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
set showbreak=\\ " [bonus]

" Cursor line
set cursorline

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
let g:tex_flavor = 'latex'

" GOLANG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_version_warning = 0
let g:go_list_type = "quickfix"
" let g:go_auto_sameids = 2
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

autocmd FileType go nmap <leader>gd <Plug>(go-def)
autocmd FileType go nmap <leader>gt :GoDeclsDir<cr>
autocmd FileType go nmap <leader>at :GoAddTags<cr>
autocmd FileType go nmap <leader>t  :w<cr>:GoTest<cr>
autocmd FileType go nmap <leader>f  :GoFmt<cr>

" Typescript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

" au BufNewFile,BufRead *.ts setlocal filetype=typescript
" au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_fix_on_save = 1

" ctrlp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_abbrev = {
    \ 'gmode': 't',
    \ 'abbrevs': [
        \ {
        \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
        \ 'expanded': '_',
        \ 'mode': 'pfrz',
        \ },
        \ ]
    \ }

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

" VIMTEX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" This is new style
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" settings for zathura
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set a map leader for more key combos
let mapleader = ','

" Splits
nnoremap <leader>. :vsp<Enter>
nnoremap <leader>- :sp<Enter>
nnoremap <leader>x :q<Enter>
nnoremap <leader><S-L> :vertical resize +10<Enter>
nnoremap <leader><S-H> :vertical resize -10<Enter>

" Markdown
nnoremap <leader>mm :MarkdownPreview<CR>

" Auto-indent buffer
nnoremap <leader>ii gg=G

" Toggle spell checking
nnoremap <leader>ss :set spell!<Enter>

" Open and Reload vimrc
nnoremap <leader>vm :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>rr :source ~/.config/nvim/init.vim<Enter>

" Shortcut for typing lists
nnoremap <leader>o :normal o- <ENTER>i<SPACE>
nnoremap <leader>O :normal O- <ENTER>i<SPACE>

" Dropdown menu
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Deoplete
inoremap <expr> <Tab> pumvisible() ? "\<Right>" : "\<Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-b>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-b>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-b>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-b>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-b>\ :TmuxNavigatePrevious<cr>
