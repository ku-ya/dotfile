if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" ctag
command! MakeTags !ctags -R .

set ruler           " Show the line and column number of the cursor position,
" separated by a comma.
" auto detect filetype
filetype indent plugin on


call plug#begin('~/.config/nvim/plug.vim')
" Appearance
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'altercation/vim-colors-solarized'
Plug 'bitc/vim-bad-whitespace'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'freeo/vim-kalisi'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'scrooloose/nerdtree'
Plug 'takac/vim-hardtime'
Plug 'taketwo/vim-ros'
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'vim-airline/vim-airline-themes'
Plug 'zchee/deoplete-jedi'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Yggdroot/indentLine'
" Plug 'wikitopian/hardmode'
call plug#end()

" ctrlpvim setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
map <C-Tab> :call NumberToggle()<cr>

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
set autochdir                " automatically change directory
let NERDTreeChDirMode=2

syntax enable

" Powerline
set laststatus=2
set t_Co=256

" Colorschemes
if has('gui_running')
    set background=light
else
    set background=dark
endif

" Airline
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:color_schemes = ['vim-kalisi', 'vim-colorschemes']
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='kalisi'
let g:airline_powerline_fonts = 1
let g:solarized_termcolors=256

set relativenumber
set number
set colorcolumn=80

set smarttab
set tabstop=4
set shiftwidth=4
set foldmethod=indent
set softtabstop=4
set expandtab

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" let g:indentLine_enabled = 1
" let g:indentLine_color_term = 8
" let g:indentLine_char = '»'
" let g:indentLine_leadingSpaceChar = '·'
" let g:indentLine_leadingSpaceEnabled = 1

let g:latex_view_general_viewer = "zathura"
let g:vimtex_view_method = "zathura"

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
highlight ColorColumn ctermbg=0 guibg=lightgrey
execute "set colorcolumn=" . join(range(81,335), ',')

" Executing python command
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>

" deoplete configuration
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" want cross-machine spell file to be used
" set spellfile=$HOME/dotfiles/spell/file_name_add
