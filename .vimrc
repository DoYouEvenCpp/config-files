"colorscheme desert
set ignorecase smartcase incsearch
set hlsearch
set rnu
set autoindent cindent shiftwidth=4
set expandtab tabstop=4
set scrolloff=2
set syntax=cpp
set nobackup
set nowritebackup
set noswapfile
set nocompatible
set hidden
set showmode
set autochdir
set mouse=a

" colors: https://jonasjacek.github.io/colors/

" highlights current line, background=darkgrey, font=white
set cursorline
hi CursorLine cterm=NONE ctermbg=237

" highlights trailing whitespaces
hi TrailingWhitespaces ctermbg=52 guibg=Red
match TrailingWhitespaces /\s\+$/

call plug#begin()
"    Plug 'wincent/Command-T'
"    Plug 'bling/vim-airline'
"    Plug 'ervandew/supertab'
"    Plug 'brookhong/cscope.vim'
"    Plug 'MultipleSearch'
"    Plug 'ZoomWin'
"    Plug 'jeetsukumaran/vim-buffergator'
"    Plug 'marijnh/tern_for_vim'
"    Plug 'tpope/vim-commentary'
call plug#end()

vmap r "_d
map <F5> :noh<CR>
nmap <F8> :A<CR>
nmap <F12> :BuffergatorToggle<CR>
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>
nmap <C-w> :bp <BAR> bd #<CR>
nmap <C-n> :enew<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" maps ctrl+c, ctrl+x, ctrl+v to copy/cut/paste behaviour
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" prevents from clearing clipboard when leaving vim
autocmd VimLeave * call system("xsel -ib", getreg('+'))

command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | enew | setlocal bt=nofile | put | noh

" eliminates delay when leaving insert mode with ESC
set timeoutlen=0
" ctrl+c triggers InsertLeave
ino <C-C> <Esc>
" changes cursor line color when entering/leaving insert mode
autocmd InsertEnter * hi CursorLine cterm=NONE ctermbg=17
autocmd InsertLeave * hi CursorLine cterm=NONE ctermbg=237
