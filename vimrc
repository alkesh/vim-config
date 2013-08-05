set nocompatible
"call pathogen#infect()
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Align'
Bundle 'Tabular'
Bundle 'bufexplorer.zip'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'html5.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'matchit.zip'
Bundle 'mileszs/ack.vim'
Bundle 'rake.vim'
Bundle 'repeat.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Tagbar'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'unimpaired.vim'

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


" ,p to switch to better font for projector
:noremap <silent> <leader>p :colorscheme mac-classic\|set guifont=Menlo:h14<CR>

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

" A whole bunch of NERDTree configuration stolen from carlhuda's janus

"let NERDTreeIgnore=['\.rbc$', '\~$']

""autocmd VimEnter * NERDTree
"autocmd VimEnter * call s:NERDTreeIfDirectory(expand("<amatch>"))
"autocmd VimEnter * wincmd p
"autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))

"" Disable netrw's autocmd, since we're ALWAYS using NERDTree
"runtime plugin/netRwPlugin.vim
"augroup FileExplorer
  "au!
"augroup END

"let g:NERDTreeHijackNetrw = 0

"" If the parameter is a directory (including implicit '.'), open NERDTree
"function s:NERDTreeIfDirectory(directory)
  "if isdirectory(a:directory) || a:directory == ""
    "NERDTree
  "endif
"endfunction

"" If the parameter is a directory, cd into it
"function s:CdIfDirectory(directory)
  "if isdirectory(a:directory)
    "call ChangeDirectory(a:directory)
  "endif
"endfunction

"" NERDTree utility function
"function s:UpdateNERDTree(stay)
  "if exists("t:NERDTreeBufName")
    "if bufwinnr(t:NERDTreeBufName) != -1
      "NERDTree
      "if !a:stay
        "wincmd p
      "end
    "endif
  "endif
"endfunction

"" Utility functions to create file commands
"function s:CommandCabbr(abbreviation, expansion)
  "execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
"endfunction

"function s:FileCommand(name, ...)
  "if exists("a:1")
    "let funcname = a:1
  "else
    "let funcname = a:name
  "endif

  "execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
"endfunction

"function s:DefineCommand(name, destination)
  "call s:FileCommand(a:destination)
  "call s:CommandCabbr(a:name, a:destination)
"endfunction

" Tabular
"vnoremap <silent> <Leader>tt :call Tabularize('/\|/')<CR>

"" Folding settings
"set foldmethod=indent "fold based on indent
"set foldnestmax=3     "deepest fold is 3 levels
"set nofoldenable      "dont fold by default

"" Jump to last cursor position when opening a file
"" Don't do it when writing a commit log entry
"autocmd BufReadPost * call SetCursorPosition()
"function! SetCursorPosition()
  "if &filetype !~ 'commit\c'
    "if line("'\"") > 0 && line("'\"") <= line("$")
      "exe "normal g`\""
    "endif
  "end
"endfunction

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

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

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
