let vimDir = '$HOME/.vim'

let plugin_dir = expand(vimDir . '/plugins')

call plug#begin(plugin_dir)

" ----------------------------------------------
" Define all the plugins!
" ----------------------------------------------

"pre-requisistes for autocompletion
Plug 'hrsh7th/vim-vsnip'      " Snippet engine which follows the LSP/VSCode snippet format
Plug 'neovim/nvim-lspconfig'  " Pre-built configurations for LSP servers

" Autocompletion
Plug 'hrsh7th/nvim-cmp'       " Completion engine which can pull from many sources
" cmp disabled for now - clashes with Copilot
"Plug 'hrsh7th/cmp-buffer'     " cmp source for the open buffers
"Plug 'hrsh7th/cmp-nvim-lsp'   " cmp source for LSP
"Plug 'hrsh7th/cmp-path'       " cmp source for paths
"Plug 'hrsh7th/cmp-vsnip'      " cmp source for vsnip snippets
Plug 'tpope/vim-endwise'      " auto-complete end keyword
Plug 'windwp/nvim-autopairs'  " Auto close quotes, brackets in a way that doesn't suck
Plug 'windwp/nvim-ts-autotag' " Auto close HTML and XML tags too

"Copilot
Plug 'github/copilot.vim'

" File line - open a file at a specific line
Plug 'bogado/file-line'

" Git
Plug 'tpope/vim-fugitive'

" Language awareness and highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Fantastic langauge parsing

" Linting
Plug 'dense-analysis/ale'

" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Navigation & Search tools
" Plug 'ludovicchabant/vim-gutentags' " regenerates tags unobtrusively
Plug 'mileszs/ack.vim' " Use ack (or ag, or rg) for searching files
Plug 'tpope/vim-projectionist' " Map tools and actions based on the project
Plug 'tpope/vim-unimpaired' " Navigate quicklists (amongst other things)

" Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'jgdavey/vim-blockle'

" Text manipulation and movement
Plug 'junegunn/vim-easy-align' " Align code and tables
Plug 'AndrewRadev/splitjoin.vim' " Quick joining or splitting of programming constructs (ie. `if...else...` to `? ... : ...`)
Plug 'kshenoy/vim-signature' " Show marks in the gutter to help me use them more
Plug 'preservim/nerdcommenter' " Comment functions
Plug 'tpope/vim-repeat' " Make many more operations repeatable with `.`
Plug 'tpope/vim-surround' " Quick editing or insertion for surrounding characters (ie. quickly add quotes around a line)

" UI
Plug 'airblade/vim-gitgutter' " Show the column of changes to the file against git
Plug 'christoomey/vim-tmux-navigator' " Move between Vim panes & Tmux panes easily
Plug 'jlanzarotta/bufexplorer' " explore open buffers
Plug 'lukas-reineke/indent-blankline.nvim' " Show indentation guides
Plug 'mhinz/vim-startify' " Start Vim with a more useful start screen
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " Powerful UI for searching and file traversing
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " Faster finding using compiled FZF, likely to be baked in to Telescope someday: https://github.com/nvim-telescope/telescope.nvim/issues/988
Plug 'preservim/nerdtree' " Project filesystem tree

" Common dependencies
Plug 'nvim-lua/plenary.nvim' " Library of common LUA helpers, dependency of many other plugins

" Load any extra plugins specified in the home directory
if filereadable(expand("~/.vim.plugins.local"))
  source ~/.vim.plugins.local
endif

" No More plugins after here thanks!
call plug#end()

syntax on
filetype on
filetype indent on
filetype plugin on

" ----------------------------------------------
" Setup basic Vim behaviour
" ----------------------------------------------

" Setup the leader key, used for triggering all kinds of awesome things
let mapleader = ","
"
colorscheme railscasts

set t_Co=256                            " Use 256-bit colour in vim
set termguicolors                       " Use nicer colours in nvim
set autoindent                          " Automatically indent based on syntax detection
set autowrite                           " Writes on make/shell commands
set background=dark
set backspace=start,indent,eol
set backupdir=/var/tmp,~/.tmp,.         " Don't clutter project dirs up with swap files
set breakindent
set cf                                  " Enable error files & error jumping.
set complete+=kspell
set completeopt=menuone,noselect
set directory=/var/tmp,~/.tmp,.         " Set the directory for working files created by vim
set tabstop=2 shiftwidth=2 expandtab    " Convert tabs to 2 spaces AS IS RIGHT AND PROPER
set fillchars+=vert:\                   " Set the window borders to not have | chars in them
set formatoptions+=j                    " Delete comment characters when joining lines
set hidden                              " Allow buffer switching without saving
set history=1000                        " Remember a decent way back
set laststatus=2                        " Always show status line.
set lazyredraw                          " Skip redraw when applying macros and scripts
set listchars=trail:•,tab:»•,nbsp:␣
set mousehide                           " Hide the mouse cursor when typing
set nofoldenable                        " Disable all folding of content
set nojoinspaces                        " Use only 1 space after "." when joining lines instead of 2
set noswapfile                          " swap files are really not needed if you're using git
set nowrap                              " Line wrapping off
set number                              " line numbers
set scrolloff=5                         " More context around cursor
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set shortmess=aFc
set showbreak=↪                         " Show nicer symbol when a line is being wrapped
set signcolumn=yes                      " Show signcolumn all the time to avoid it popping in when gitgutter wakes up
set spelllang=en_gb
set timeoutlen=500                      " Milliseconds to wait for another key press when evaluating commands
set updatetime=300                      " Lower the default update time for more speeed
set wildmode=list:longest               " Shell-like behaviour for command autocompletion

" Set undo data so it persists between sessions
if has('persistent_undo')
  let undo_dir = expand(vimDir . '/undo_data')
  let &undodir = undo_dir
  set undofile
endif

" Display soft column limit
au WinEnter,FileType * set cc=
au WinEnter,FileType ruby,eruby,rspec,cucumber set cc=120
" Override the colour in .vimrc.local like this:
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey

" -----------------------------------
" Mouse Options
" -----------------------------------

set mouse=a

" ----------------------------------------------
" ack.vim
" ----------------------------------------------
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" ----------------------------------------------
" ALE linting
" ----------------------------------------------

let g:ale_linters = {'ruby': ['rubocop', 'ruby']}
let g:ale_linters_explicit = 1 " Only run linters named in ale_linters settings.
let g:ale_fixers = {'ruby': ['rubocop']}
let g:ale_sign_error = '⚠'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1      " Always show the sign column to avoid annoying popping in
let g:ale_lint_delay = 1000           " Lint at most once per second incase we're on battery power

" ----------------------------------------------
" Autocompletion
" ----------------------------------------------

lua << EOF

local kind_icons = {
  Class = "🅒",
  Color = "🎨",
  Constant = "𝜋",
  Constructor = "⌬",
  Enum = "≡",
  EnumMember = "∈",
  Field = "⊡",
  File = "💾",
  Folder = "📁",
  Function = "ƒ",
  Interface = "ℹ︎",
  Keyword = " ",
  Method = "𝘮",
  Module = "⧈",
  Property = "℗",
  Snippet = "{}",
  Struct = "🆂",
  Text = "𐄗",
  Unit = "⨀",
  Value = "ⓥ",
  Variable = "𝒙",
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

cmp.setup {
 snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
-- disabled for now - clashes with copilot
--[[
  mapping = {
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
--]]

  sources = {
    { name = "nvim_lsp", keyword_length = 2, max_item_count = 5 },
    { name = "vsnip",    keyword_length = 2, max_item_count = 5 },
    { name = "buffer",   keyword_length = 3, max_item_count = 3 },
    { name = "path",     keyword_length = 5, max_item_count = 3 },
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[buffer]",
        vsnip = "[snip]",
        path = "[path]",
      })[entry.source.name]
      return vim_item
    end
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },

}

EOF


" ----------------------------------------------
" Gutentags config
" ----------------------------------------------
" set statusline+=%{gutentags#statusline()}

" ----------------------------------------------
" Indent guideline config
" ----------------------------------------------

" let g:indent_blankline_filetype = ['eruby', 'javascript', 'json', 'ruby', 'yaml']
" let g:indent_blankline_char = '│'
" let g:indent_blankline_use_treesitter = v:true
" let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_show_first_indent_level = v:false
" let g:indent_blankline_context_patterns = ['block', 'if', 'function', 'method']
highlight IndentBlanklineChar guifg=#222222 gui=nocombine
highlight IndentBlanklineContextChar guifg=#444444 gui=nocombine


" -----------------------------------
" NERDCommenter
" -----------------------------------

let NERDSpaceDelims=1

" -----------------------------------
" NERDTree Options
" -----------------------------------

let NERDTreeChDirMode = 2

" -----------------------------------
" Search Options
" -----------------------------------

set hlsearch        " highlight search matches...
set incsearch       " ...as you type
set ignorecase      " Generally ignore case
set smartcase       " Care about case when capital letters show up

" Highlight trailing whitespace
highlight RedundantSpaces term=standout ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted

" Highlight Non-breaking spaces
" highlight BadSpaces term=standout ctermbg=red guibg=red
" match BadSpaces / \+/

" ----------------------------------------------
" Setup Startify
" ----------------------------------------------

" Setup vim-startify's start screen
let g:startify_change_to_vcs_root = 0
let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_custom_indices = ['a', 's', 'd', 'f']

let g:startify_custom_header = [
      \ '   __      __',
      \ '   \ \    / (_)',
      \ '    \ \  / / _ _ __ ___',
      \ '     \ \/ / | | `_ ` _ \',
      \ '      \  /  | | | | | | |',
      \ '       \/   |_|_| |_| |_|',
      \ '',
      \ ]

let g:startify_list_order = [
      \ ['   Recent files in this directory:'],
      \ 'dir',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ ]

" Stop things splitting with Startify and replace it instead
autocmd User Startified setlocal buftype=

" ----------------------------------------------
" AutoPairs config
" ----------------------------------------------

lua << EOF
  local npairs = require('nvim-autopairs')

  npairs.setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
  })

  npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
  npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
EOF

" ----------------------------------------------
" Setup Telescope
" ----------------------------------------------

lua << EOF
require('telescope').setup{
  defaults = {
    selection_caret = "➜ ",
    file_ignore_patterns = {
      'tags',
      'vendor/.*'
    },
    layout_strategy = flex,
    winblend = 20,
    show_line = false,
    prompt_title = false,
    results_title = false,
    preview_title = false,
  }
}
require('telescope').load_extension('fzf')
EOF

" ----------------------------------------------
" Strip trailing whitespace
" ----------------------------------------------
function! StripTrailingWhitespace()
	normal m`
	exec '%s/\s*$//'
	normal ``
endfunction

" ----------------------------------------------
" UI
" ----------------------------------------------

" redefining from railscasts colour scheme, because they get reset to terrible defaults by something
" normal item in popup
hi Pmenu guifg=#ffffff guibg=#444444 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
" selected item in popup
hi PmenuSel guifg=#000000 guibg=#87af5f gui=NONE ctermfg=0 ctermbg=107 cterm=NONE

" ----------------------------------------------
" Command Shortcuts
" ----------------------------------------------

" Disable Ex Mode to remove confusion
nnoremap Q <Nop>

" <leader>. to view all document buffers
" map <silent> <Leader>. :Telescope buffers theme=get_dropdown sort_mru=true previewer=false<CR>

" ,. to open BufExplorer
nmap <silent> <unique> <Leader>. :BufExplorer<CR>

" <leader>f to find current file in NERDTree
map <silent> <Leader>f :NERDTreeFind<CR>

" copy current filename and path to the system clipboard
nmap <Leader>ff :let @*=@%<CR>

" <leader>g to run Telescope live_grep
nmap <silent> <Leader>g :Telescope live_grep<CR>

" align code and tables
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" <leader>h to dismiss search result highlighting until next search or press of 'n'
:noremap <silent> <leader>h :noh<CR>

" <leader>m to toggle NERDTree
nmap <silent> <Leader>m :NERDTreeToggle<CR>

"  <Leader>rt to run ctags on the current directory
map <leader>rt :!ctags --exclude=.js --exclude=.git --exclude=bower_components --exclude=node_modules --exclude=tmp --exclude=vendor --exclude=log --exclude=clients --exclude=cypress --links=no --extras=+q -R *<CR><CR>

"  <leader>sw to strip whitespace off the ends
nmap <silent> <Leader>sw :call StripTrailingWhitespace()<CR>

" <leader>t to run Telescope find_files
nmap <silent> <Leader>t :Telescope find_files<CR>

" ,u to run rubocop using ALEFix
nmap <Leader>u :ALEFix<CR>

" <leader>w to toggle line wrap
:map <silent> <Leader>w :set wrap!<CR>

" make Y consistent with C and D
nnoremap Y y$

"  <leader>z to zoom current pane
map <Leader>z :ZoomWin<CR>

" Load local config specified in the home directory
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
