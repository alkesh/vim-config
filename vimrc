set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'Align'
Plugin 'Tabular'
Plugin 'Tagbar'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'alkesh/projector_mode'
Plugin 'avakhov/vim-yaml'
Plugin 'bufexplorer.zip'
Plugin 'chase/vim-ansible-yaml'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-scala'
Plugin 'dkprice/vim-easygrep'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ervandew/supertab'
Plugin 'fatih/vim-go'
Plugin 'int3/vim-extradite'
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'jgdavey/vim-turbux'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nvie/vim-togglemouse'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rake.vim'
Plugin 'repeat.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'unimpaired.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/ZoomWin'

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
if !has('nvim')
  set ttymouse=xterm2
endif

autocmd FileType make set noexpandtab

" treat scss files as css
au BufRead,BufNewFile *.scss set filetype=css

runtime! plugin/matchit.vim " extends % to do/end etc

colorscheme railscasts
if has("mac")
  let g:ruby_debugger_progname = 'mvim'
else
  let g:ruby_debugger_progname = 'gvim'
endif

if $COLORTERM == 'gnome-terminal'
  set term=xterm-color
  set guifont=DejaVu\ Sans\ Mono\ 10
else
  set guifont=Monaco:h10
endif

" highlight cursor line
:set cursorline

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

" ,h to dismiss search result highlighting until next search or press of 'n'
:noremap <silent> <leader>h :noh<CR>

" ,w to toggle line wrap
:map <silent> <Leader>w :set wrap!<CR>

" ,f to find current file in NERDTree
map <silent> <Leader>f :NERDTreeFind<CR>

" ,m to toggle NERDTree
nmap <silent> <Leader>m :NERDTreeToggle<CR>

" ,. to open BufExplorer
nmap <silent> <unique> <Leader>. :BufExplorer<CR>

" ,x to open git commit history for current file
nnoremap <Leader>x :Extradite<CR>

" ,, to run current spec file
map <Leader>, :wa\|:!rspec %<CR>

" Fix supertab/endwise incompatibility
let g:SuperTabCrMapping = 0

" ,r for rake
map <Leader>r :Rake<CR>

" ,rr to rerun last tmx command
map <Leader>rr :call Send_to_Tmux("!!\n")<CR>

" ,s to toggle spelling highlighting
nmap <silent> <Leader>sp :setlocal spell! spelllang=en_gb<CR>

" Tagbar
nmap <Leader>b :TagbarToggle<CR>

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" Ragtag
let g:ragtag_global_maps = 1

"CtrlP
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_clear_cache_on_exit = 0
set runtimepath^=~/.vim/bundle/ctrlp.vim
map <leader>t :CtrlP<cr>
map <leader>g :CtrlPModified<cr>

" Vim-markdown
let g:vim_markdown_folding_disabled=1

" NERDCommenter
let NERDSpaceDelims=1

" NERDTree
" open NERDTree if no files were specified on startup
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ZoomWin
map <Leader>z :ZoomWin<CR>

" Tabular
vnoremap <silent> <Leader>aa :Tabularize /\|<CR>

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
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

map <Leader>rt :!ctags --exclude=*.js --links=no --extras=q -R *<CR><CR>

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

" customize line-number background (railscasts defaults are a bit rubbish)
highlight LineNr ctermbg=241 ctermfg=0 guibg=DimGray

" enable, and customise  indentguides
if !has('gui')
  let g:indent_guides_auto_colors = 0
endif
let g:indent_guides_enable_on_vim_startup = 1
highlight IndentGuidesOdd ctermbg=233
highlight IndentGuidesEven ctermbg=235

" settings for the git-gutter
highlight SignColumn ctermbg=234

" airline settings
"let g:airline_theme= "luna"
let g:airline_theme= "murmur"
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'

" turbux
let g:turbux_runner = 'tslime'
let g:turbux_command_rspec = 's'
let g:turbux_command_cucumber = 'c'
let g:no_turbux_mappings = 1
map <leader>s <Plug>SendTestToTmux
map <leader>S <Plug>SendFocusedTestToTmux

" set clipboard to unnamed, so it uses the system clipboard
"set clipboard=unnamed

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Source a local configuration file if available.
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
