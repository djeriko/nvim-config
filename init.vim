call plug#begin('~/AppData/Local/nvim/plugged')

"File and folder management
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" Language support
Plug 'tpope/vim-projectionist'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Git
Plug 'vim-airline/vim-airline'

" LSP 
Plug 'neovim/nvim-lspconfig'

" Theme
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

set mouse=a 
set encoding=utf-8
set number 
set noswapfile
set scrolloff=7

" On pressing tab, insert 4 spaces
set expandtab
  
" Show existing tab with 4 spaces width
set tabstop=4
set softtabstop=4

" When indenting with '>', use 4 spaces width 
set shiftwidth=4


let mapleader = " "
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>

map <leader>h :wincmd h <CR>
map <leader>j :wincmd j <CR>
map <leader>k :wincmd k <CR>
map <leader>l :wincmd l <CR>

nnoremap <C-e> :NERDTree<CR>
nnoremap <C-w> :NERDTreeToggle<CR>

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l


let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

nmap <C-P> :FZF<CR>

"imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<C-.>'
let g:coc_snippet_prev = '<C-S-.>'

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-space> coc#refresh()
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: '<leader>aap' for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)


"coc config
let g:coc_global_extensions = [
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ ]

let g:NERDTreeGitStatusWithFlags = 1

" To emulate CTRL-Z
nnoremap <c-z> :u<CR>
inoremap<c-z><c-o>:u<CR>

" To exit from insert mode
inoremap jk <esc> 

" Turn off search highlight
nnoremap ,<space> :nohlsearch<CR>
