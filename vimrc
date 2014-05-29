set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'Align'
Plugin 'Tabular'
Plugin 'Tagbar'
Plugin 'alkesh/projector_mode'
Plugin 'bufexplorer.zip'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'ervandew/supertab'
Plugin 'html5.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'rake.vim'
Plugin 'repeat.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'unimpaired.vim'

call vundle#end()
filetype plugin indent on
syntax on

set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set guioptions-=T " no toolbar
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,%n%Y%)\%P%#warningmsg#%{SyntasticStatuslineFlag()}%*
set laststatus=2  " Always show status line.
set number " line numbers
set scrolloff=3 " More context around cursor
set hlsearch  " highlight search matches...
set incsearch " ...as you type
set ignorecase
set smartcase
set hidden " Allow buffer switching without saving
set history=1000
set wildmode=list:longest " Shell-like behaviour for command autocompletion
set visualbell
set mousehide
set cf  " Enable error files & error jumping.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nowrap  " Line wrapping off
set timeoutlen=500
" swap files are really not needed if you're using git
set noswapfile
let mapleader = ","

" Display soft column limit
au WinEnter,FileType * set cc=
au WinEnter,FileType ruby,eruby,rspec,cucumber set cc=120
" Override the colour in .vimrc.local like this:
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,indent,eol

" mouse mode for terminal
set mouse=a

autocmd FileType make set noexpandtab

" treat scss files as css
au BufRead,BufNewFile *.scss set filetype=css

runtime! plugin/matchit.vim " extends % to do/end etc

if has('gui')
  colorscheme railscasts
  if has("mac")
    let g:ruby_debugger_progname = 'mvim'
  else
    let g:ruby_debugger_progname = 'gvim'
  endif
  map <Leader>dg :Rdebugger<CR>
  map <Leader>dr :RdbTest<CR>
endif

if $COLORTERM == 'gnome-terminal'
  set term=xterm-color
  set guifont=DejaVu\ Sans\ Mono\ 10
else
  set guifont=Menlo:h10
endif

",p to toggle projector mode
let g:default_colorscheme = 'railscasts'
let g:projector_colorscheme = 'mac-classic'
noremap <silent> <leader>p :ToggleProjectorMode<CR>

" ,c to hide hidden characters
"set listchars=tab:>-,trail:·,eol:$
set listchars=tab:▸\ ,trail:·
set list
nmap <silent> <leader>c :set nolist!<CR>

" Highlight trailing whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

" ,h to toggle search result highlighting
:noremap <silent> <leader>h :set hls!<CR>

" ,w to toggle line wrap
:map <silent> <Leader>w :set wrap!<CR>

" ,f to find current file in NERDTree
map <silent> <Leader>f :NERDTreeFind<CR>

" ,m to toggle NERDTree
nmap <silent> <Leader>m :NERDTreeToggle<CR>

" ,. to open BufExplorer
nmap <silent> <unique> <Leader>. :BufExplorer<CR>

" ,u to toggle undo history browser
nnoremap <Leader>u :GundoToggle<CR>

" ,x to open git commit history for current file
nnoremap <Leader>x :Extradite<CR>

" ,, to run current spec file
map <Leader>, :wa\|:!rspec %<CR>

" Fix supertab/endwise incompatibility
let g:SuperTabCrMapping = 0

" ,r for rake
map <Leader>r :Rake<CR>

" various other ways to run tests
map <silent> <Leader>rb :wa<CR>:RunAllRubyTests<CR>
map <silent> <Leader>rc :wa<CR>:RunRubyFocusedContext<CR>
map <silent> <Leader>rf :wa<CR>:RunRubyFocusedUnitTest<CR>

map <silent> <Leader>rr :wa<CR>:rubyf %<CR>

" Tagbar
nmap <Leader>b :TagbarToggle<CR>

" Dash
nmap <silent> <leader>d <Plug>DashSearch


let g:speckyQuoteSwitcherKey = "<Leader>s'"
let g:speckySpecSwitcherKey = "<Leader>sx"
let g:speckyRunSpecKey = "<Leader>ss"
let g:speckyWindowType = 1

let g:ragtag_global_maps = 1

nmap <silent> <Leader>s :setlocal spell! spelllang=en_gb<CR>

"CtrlP configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <leader>t :CtrlP<cr>

" NERDTree configuration
" open NERDTree if no files were specified on startup
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

" make Y consistent with C and D
nnoremap Y y$

" strip trailing whitespace
"autocmd BufWritePre,FileWritePre * call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  normal mz
  normal Hmy
  exec '%s/\s*$//g'
  normal 'yz<cr>
  normal `z
endfunction
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

let g:syntastic_auto_loc_list=1

map <Leader>rt :!ctags -R *<CR><CR>

function! OpenInBrowser(url)
  if has("mac")
    exec '!open '.a:url
  else
    exec '!firefox -new-tab '.a:url.' &'
  endif
endfunction

" Open the Ruby ApiDock page for the word under cursor
function! OpenRubyDoc(keyword)
  let url = 'http://apidock.com/ruby/'.a:keyword
  call OpenInBrowser(url)
endfunction
noremap RB :call OpenRubyDoc(expand('<cword>'))<CR><CR>

" Open the Rails ApiDock page for the word under cursor
function! OpenRailsDoc(keyword)
  if filereadable('config/application.rb')
    let url = 'http://apidock.com/rails/'.a:keyword
  endif
  call OpenInBrowser(url)
endfunction
noremap RR :call OpenRailsDoc(expand('<cword>'))<CR><CR>

" :SudoW to save file using sudo (must be already authorised, eg sudo -v)
command! -bar -nargs=0 SudoW   :silent exe "write !sudo tee % >/dev/null"|silent edit!

" Align =>
vnoremap <silent> <Leader>t> :Align =><CR>

" Use xmllint to pretty format XML
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
