# Installation

If necessary, backup and remove your <tt>~/.vim</tt> directory and
<tt>~/.vimrc</tt> file.

Clone this repository to <tt>~/git</tt>:

    git clone git@github.com:alkesh/vim-config.git ~/.vim

(If you're behind a firewall that blocks port 9418, replace <tt>git:</tt> with
<tt>https:</tt> in the above URL.)

Alternatively, if for some bizarre reason you don't have git installed, you can
download a zip or tar file using the link on
[GitHub](http://github.com/alkesh/vim-config).

Switch to the nvim branch

Symlink <tt>.vimrc</tt>:

    ln -s ~/.vim/vimrc ~/.vimrc

If you are running neovim, run the setup script:

    ./neovim_setup

Finally, install the plugins:
  * start nvim
  * run: `:PlugInstall`


## Keeping up-to-date

    cd ~/.vim
    git pull

Then in vim:

    :PlugInstall

## Local Customisation

Local changes (eg if you prefer a different font or colour scheme) can either
be made in a branch, or in <tt>~/.vimrc.local</tt>.

# Included Plugins

See the plugins' web pages for more information. The keybindings listed are mostly
just those defined or overridden locally, not the ones provided by default.

Plugins are installed in their own directories under <tt>bundle</tt>, thanks to
[Pathogen](http://www.vim.org/scripts/script.php?script_id=2332).

## Abolish

Work with several variants of a word at once ([more](http://www.vim.org/scripts/script.php?script_id=1545))

## ack

Plugin for the Perl module / CLI script 'ack' ([more](http://www.vim.org/scripts/script.php?script_id=2572))

## ALE

Modern syntax checker ([more](https://github.com/dense-analysis/ale))

*Keybindings*

<dl>
  <dt>,u</dt><dd>Run <tt>rubocop -a</tt> to fix issues idenified by rubocop</dd>
</dl>

## Blockle

Toggle between block styles `do`..`end` and `{`..`}`([more](https://github.com/jgdavey/vim-blockle))

*Keybindings*

<dl>
  <dt>,b</dt><dd>Toggle block style</dd>
</dl>

## bufexplorer

Buffer explorer/browser ([more](http://www.vim.org/scripts/script.php?script_id=42))

*Keybindings*

<dl>
  <dt>,.</dt><dd>Show buffer explorer</dd>
</dl>

## Easy Align

Align text, tables, etc ([more](https://github.com/junegunn/vim-easy-align))

Supports visual mode, and standard vim movement

*Keybindings*

<dl>
  <dt>ga*|</dt><dd>Align tables</dd>
  <dt>ga=</dt><dd>Align on =</dd>
</dl>

## nvim autopairs

Add "end" in ruby ([more](https://github.com/windwp/nvim-autopairs))

## Fugitive

A Git wrapper so awesome, it should be illegal ([more](http://www.vim.org/scripts/script.php?script_id=2975))

## Github Copilot

Run `:Copilot setup` to set up copilot

## markdown

Syntax highlighting for Markdown ([more](http://plasticboy.com/markdown-vim-mode/))

## NERD tree

A tree explorer plugin for navigating the filesystem ([more](http://www.vim.org/scripts/script.php?script_id=1658))

*Keybindings*

<dl>
  <dt>,m</dt><dd>Show/hide NERDTree</dd>
  <dt>,f</dt><dd>Show current file in tree</dd>
</dl>

## nerdcommenter

A plugin that allows for easy commenting of code for many filetypes ([more](http://www.vim.org/scripts/script.php?script_id=1218))

## repeat

Use the repeat command (.) with supported plugins ([more](https://github.com/tpope/vim-repeat))

## ruby

Ruby support (newer than the version released with vim). ([more](https://github.com/vim-ruby/vim-ruby))

## ruby-refactoring

Refactoring tool for Ruby in vim! ([more](https://github.com/ecomba/vim-ruby-refactoring))

See [relish documentation](http://relishapp.com/despo/vim-ruby-refactoring) for examples.

## splitjoin

Switch between single-line and multi-line statements ([more](https://github.com/AndrewRadev/splitjoin.vim))

*Keybindings*

<dl>
  <dt>gS</dt><dd>to split a one-liner into multiple lines</dd>
  <dt>gJ</dt><dd>(with the cursor on the first line of a block) to join a block into a single-line statement</dd>
</dl>

## SuperTab

Do all your insert-mode completion with Tab ([more](http://www.vim.org/scripts/script.php?script_id=1643))

## surround

Delete/change/add parentheses/quotes/XML-tags/much more with ease ([more](http://www.vim.org/scripts/script.php?script_id=1697))

## Telescope

Fuzzy finder for files and lists ([more](https://github.com/nvim-telescope/telescope.nvim))

<dl>
  <dt>,t</dt><dd>find files</dd>
  <dt>,g</dt><dd>grep contents of files</dd>
</dl>

## unimpaired

Pairs of handy bracket maps ([more](http://www.vim.org/scripts/script.php?script_id=1590))

## vim-multiple-cursors

Multiple selection similar to Sublime Text ([more](https://github.com/terryma/vim-multiple-cursors))

## ZoomWin (23)

Zoom in/out  of windows (toggle between one window and multi-window) ([more](http://www.vim.org/scripts/script.php?script_id=508))

*Keybindings*

<dl>
  <dt>,z</dt><dd>Zoom</dd>
</dl>

# Other Keybindings

<dl>
  <dt>ctrl-]</dt><dd>Jump to definition (needs universal ctags installed - see Tags section below)</dd>
  <dt>,c</dt><dd>Hide/show tabs and trailing spaces</dd>
  <dt>,ff</dt><dd>Copy current filename and path to the system clipboard</dd>
  <dt>,h</dt><dd>Hide search highlighting</dd>
  <dt>,rr</dt><dd>Run ruby file</dd>
  <dt>,,</dt><dd>Run rspec on current file</dd>
  <dt>,rt</dt><dd>Generate tags (using ctags)</dd>
  <dt>,s</dt><dd>Show/hide spelling errors</dd>
  <dt>,sw</dt><dd>Strip trailing whitespace</dd>
  <dt>,w</dt><dd>Toggle word wrapping</dd>
  <dt>,p</dt><dd>Switch to 'projector mode' (large font, light colour scheme)</dd>
  <dt>RB</dt><dd>Open Ruby docs in browser for word under cursor</dd>
  <dt>RR</dt><dd>Open Rails docs in browser for word under cursor</dd>
</dl>


# Tags

The ctrl-] and ,rt shortcuts needs [universal ctags](https://github.com/universal-ctags/homebrew-universal-ctags) installed

# Other Commands

<dl>
  <dt>:SudoW</dt><dd>Save using sudo (run <tt>sudo -v</tt> in terminal first)</dd>
</dl>

# Vim Resources

See Kerry's vim bookmarks on [pinboard](http://pinboard.in/u:kerryb/t:vim).
Also, Kerry seems to have moved on from using his own config, to using this one: https://github.com/AdamWhittingham/vim-config
