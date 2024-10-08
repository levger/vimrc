syntax on

set nocompatible

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set clipboard=unnamed,unnamedplus

let mapleader = ","

if has("autocmd")
    filetype plugin indent on
else
    set smartindent
end

set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hls

"match WarningMsg '\%>80v.\+'
nmap <LEADER>n :set norelativenumber!<CR>
nmap <LEADER>w :w<CR>
nmap <LEADER>q :q<CR>
nmap <LEADER>h :set hls!<CR>

"noremap <ENTER> <ESC>:nohlsearch<ENTER>
nnoremap Y y$

" highlight trailing spaces
highlight TrailSpace guibg=red ctermbg=darkred
match TrailSpace / \+$/
autocmd ColorScheme * highlight TrailSpace guibg=red ctermbg=darkred

colorscheme koehler

au BufRead,BufNewFile *.orogen set ft=ruby
au BufRead,BufNewFile *.autobuild set ft=ruby
au BufRead,BufNewFile *.dts set ft=xml
au BufRead,BufNewFile *.launch set ft=xml

" install Plug (a plugin manager)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins using Plug
call plug#begin('~/.vim/plugged')
"Plug 'chiel92/vim-autoformat'
Plug 'lervag/wiki.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'masukomi/vim-markdown-folding'
Plug 'shushcat/vim-minimd'
Plug 'vim-airline/vim-airline'
call plug#end()

"noremap = :Autoformat<CR>

"" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" wiki.vim settings
let g:wiki_root = '~/notes'
nmap <Leader>ow :WikiPages<CR>

let g:markdown_fenced_languages = ['python', 'bash=sh', 'cpp', 'tex']
let g:markdown_fold_override_foldtext = 0
set foldtext=getline(v:foldstart)
autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal formatoptions=tqln
autocmd FileType markdown setlocal autoindent

