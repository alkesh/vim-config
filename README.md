# Installation

If necessary, backup and remove your <tt>~/.vim</tt> directory and
<tt>~/.vimrc</tt> file.

Clone this repository to <tt>~/git</tt>:

    git clone git://github.com/alkesh/vim-config.git ~/.vim

(If you're behind a firewall that blocks port 9418, replace <tt>git:</tt> with
<tt>https:</tt> in the above URL.)

Alternatively, if for some bizarre reason you don't have git installed, you can
download a zip or tar file using the link on
[GitHub](http://github.com/alkesh/vim-config).

Symlink <tt>.vimrc</tt>:

    ln -s ~/.vim/vimrc ~/.vimrc

If you are running neovim, run the setup script:

    ./neovim_setup

Install [Vundle](https://github.com/gmarik/Vundle.vim):

    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Finally, install the plugins:

    vim +PluginInstall +qall

## Keeping up-to-date

    cd ~/.vim
    git pull

Then in vim:

    :PluginInstall

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

## Align

Help folks to align text, eqns, declarations, tables, etc ([more](http://www.vim.org/scripts/script.php?script_id=294))

*Keybindings*

<dl>
  <dt>,tlt</dt><dd>Align LaTEX tables (to avoid clashing with our existing ,tt mapping)</dd>
  <dt>,t&gt;</dt><dd>Align on =></dd>
</dl>

## bufexplorer

Buffer explorer/browser ([more](http://www.vim.org/scripts/script.php?script_id=42))

*Keybindings*

<dl>
  <dt>,.</dt><dd>Show buffer explorer</dd>
</dl>

## CtrlP

Fast file navigation for VIM ([more](http://www.vim.org/scripts/script.php?script_id=3736))

Written in pure vimscript, so no need to compile anything (unlike Command-T)

*Keybindings*

<dl>
  <dt>ctrl-p</dt><dd>The default keybinding</dd>
  <dt>,t</dt><dd>For those used to using Command-T</dd>
</dl>

## dash.vim

Search for word under cursor in [Dash](http://kapeli.com/dash). ([more](https://github.com/rizzatti/dash.vim))

*Keybindings*

<dl>
  <dt>,d</dt><dd>Search for word under cursor in Dash</dd>
</dl>

## EasyGrep

Fast and Easy Find and Replace Across Multiple Files ([more](http://www.vim.org/scripts/script.php?script_id=2438))

## endwise

Wisely add "end" in ruby, endfunction/endif/more in vim script, etc ([more](http://www.vim.org/scripts/script.php?script_id=2386))

## Extradite

Brings up the commit log of the current file. In the log view ([more](http://int3.github.com/vim-extradite/))

*Keybindings*

<dl>
  <dt>,x</dt><dd>Open commit history for current file</dd>
</dl>

## Fugitive

A Git wrapper so awesome, it should be illegal ([more](http://www.vim.org/scripts/script.php?script_id=2975))

## markdown

Syntax highlighting for Markdown ([more](http://plasticboy.com/markdown-vim-mode/))

## matchit

Extended % matching for HTML, LaTeX, and many other languages ([more](http://www.vim.org/scripts/script.php?script_id=39))

## NERD tree

A tree explorer plugin for navigating the filesystem ([more](http://www.vim.org/scripts/script.php?script_id=1658))

*Keybindings*

<dl>
  <dt>,m</dt><dd>Show/hide NERDTree</dd>
  <dt>,f</dt><dd>Show current file in tree</dd>
</dl>

## nerdcommenter

A plugin that allows for easy commenting of code for many filetypes ([more](http://www.vim.org/scripts/script.php?script_id=1218))

## ragtag

A set of mappings for HTML, XML, PHP, ASP, eRuby, JSP, and more ([more](http://www.vim.org/scripts/script.php?script_id=1896))

If you have already typed 'foo', the following shortcuts apply (with the cursor position marked by ^):

<dl>
  <dt>&lt;C-X&gt;=</dt><dd>foo&lt;%= ^ %&gt;</dd>
  <dt>&lt;C-X&gt;+</dt><dd>&lt;%= foo^ %&gt;</dd>
  <dt>&lt;C-X&gt;-</dt><dd>foo&lt;% ^ %&gt;</dd>
  <dt>&lt;C-X&gt;_</dt><dd>&lt;% foo^ %&gt;</dd>
  <dt>&lt;C-X&gt;'</dt><dd>foo&lt;%# ^ %&gt;</dd>
  <dt>&lt;C-X&gt;"</dt><dd>&lt;%# foo^ %&gt;</dd>
  <dt>&lt;C-X&gt;&lt;Space&gt;</dt><dd>&lt;foo&gt;^&lt;/foo&gt;</dd>
  <dt>&lt;C-X&gt;&lt;CR&gt;</dt><dd>&lt;foo&gt;<br />^<br />&lt;/foo&gt;</dd>
  <dt>&lt;C-X&gt;/</dt><dd>Last HTML tag closed</dd>
  <dt>&lt;C-X&gt;!</dt><dd>&lt;!DOCTYPE...&gt;/&lt;?xml ...?&gt; (menu)</dd>
  <dt>&lt;C-X&gt;@</dt><dd>&lt;link rel="stylesheet" ...&gt;</dd>
  <dt>&lt;C-X&gt;#</dt><dd>&lt;meta http-equiv="Content-Type" ... /&gt; <em>ragtag-CTRL-X_#</em></dd>
  <dt>&lt;C-X&gt;$</dt><dd>&lt;script src="/javascripts/^.js"&gt;&lt;/script&gt; <em>ragtag-CTRL-X_$</em></dd>
</dl>

## rails

Ruby on Rails: easy file navigation, enhanced syntax highlighting, and more ([more](http://www.vim.org/scripts/script.php?script_id=1567))

*Keybindings*

<dl>
  <dt>,r</dt><dd>run rake</dd>
</dl>

## rake

It's like rails.vim without the rails ([more](http://www.vim.org/scripts/script.php?script_id=3669))

## repeat

Use the repeat command (.) with supported plugins ([more](http://www.vim.org/scripts/script.php?script_id=2136))

## ruby

Ruby support (newer than the version released with vim). ([more](https://github.com/vim-ruby/vim-ruby))

## ruby-refactoring

Refactoring tool for Ruby in vim! ([more](https://github.com/ecomba/vim-ruby-refactoring))

See [relish documentation](http://relishapp.com/despo/vim-ruby-refactoring) for examples.

## SuperTab

Do all your insert-mode completion with Tab ([more](http://www.vim.org/scripts/script.php?script_id=1643))

## surround

Delete/change/add parentheses/quotes/XML-tags/much more with ease ([more](http://www.vim.org/scripts/script.php?script_id=1697))

## Tabular

Configurable, flexible, intuitive text aligning ([more](http://github.com/godlygeek/tabular/blob/master/doc/Tabular.txt))

*Keybindings*

<dl>
  <dt>,aa</dt><dd>(when text is selected) format tables made with pipes (|)</dd>
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
