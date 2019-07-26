" Install vim-plug{{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" Plugins{{{
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'

" Vim enhancements
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'nelstrom/vim-visual-star-search'
Plug 'tpope/vim-rsi'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim' " <C-X><C-U>

" Editing
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'wellle/targets.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'coderifous/textobj-word-column.vim'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'bkad/CamelCaseMotion'
call plug#end()
" }}}

" Options{{{
set background=dark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  set notermguicolors
endif
set hidden
set autoindent
set tabstop=4
set backspace=indent,eol,start
set timeoutlen=3000 ttimeoutlen=100
set scrolloff=5 sidescrolloff=5
set wildmenu wildmode=full
set visualbell belloff=all
set wrap linebreak
set splitbelow splitright
set lazyredraw
set title
set confirm
set ruler
set showcmd
set number relativenumber
set mouse=a
set cursorline
set hlsearch incsearch smartcase
" }}}

" Key bindings{{{
let mapleader = ' '

nnoremap <silent> <leader>/ :noh<CR>

if HasPlugin('vim-yankstack')
  call yankstack#setup()
  nmap Y y$
else
  nnoremap Y y$
endif

" Camel case motions
nmap <silent> w  <Plug>CamelCaseMotion_w
xmap <silent> w  <Plug>CamelCaseMotion_w
nmap <silent> b  <Plug>CamelCaseMotion_b
xmap <silent> b  <Plug>CamelCaseMotion_b
nmap <silent> e  <Plug>CamelCaseMotion_e
xmap <silent> e  <Plug>CamelCaseMotion_e
nmap <silent> ge <Plug>CamelCaseMotion_ge
xmap <silent> ge <Plug>CamelCaseMotion_ge

" Rebind some keys
let s:remapped_keys = {
      \ 'j': 'gj',
      \ 'k': 'gk',
      \ 'gj': 'j',
      \ 'gk': 'k',
      \ 'J': '}',
      \ 'K': '{',
      \ 'H': 'g^',
      \ 'L': 'g$'
      \ }

for original in keys(s:remapped_keys)
  exe 'nnoremap ' . original . s:remapped_keys[original]
  exe 'xnoremap ' . original . s:remapped_keys[original]
  exe 'onoremap ' . original . s:remapped_keys[original]
endfor
" }}}

" vim: ft=vim fdm=marker
