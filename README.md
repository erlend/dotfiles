thoughtbot dotfiles
===================

![prompt](http://images.thoughtbot.com/thoughtbot-dotfiles-prompt.png)

Requirements
------------

Set zsh as your login shell:

    chsh -s $(which zsh)

Install
-------

Clone onto your laptop:

    git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles

(Or, [fork and keep your fork
updated](http://robots.thoughtbot.com/keeping-a-github-fork-updated)).

From the dotfiles directory:

    ./setup.sh

Update
------

From time to time you should pull down any updates to these dotfiles, and run

    ./setup.sh

to link any new files and install new vim plugins. **Note** You _must_ run
`setup.sh` after pulling to ensure that all files in plugins are properly
installed, but you can safely run `setup.sh` multiple times so update early and
update often!

Make your own customizations
----------------------------

Put your customizations in files appended with `.local`:

* `~/aliases.local`
* `~/git_template.local/*`
* `~/gitconfig.local`
* `~/psqlrc.local` (we supply a blank `.psqlrc.local` to prevent `psql` from
  throwing an error, but you should overwrite the file with your own copy)
* `~/tmux.conf.local`
* `~/vimrc.local`
* `~/vimrc.bundles.local`
* `~/zshrc.local`
* `~/zshrc.bundles.local`

For example, your `~/aliases.local` might look like this:

    # Productivity
    alias todo='$EDITOR ~/.todo'

Your `~/gitconfig.local` might look like this:

    [alias]
      l = log --pretty=colored
    [pretty]
      colored = format:%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset
    [user]
      name = Dan Croak
      email = dan@thoughtbot.com

Your `~/vimrc.local` might look like this:

    " Color scheme
    colorscheme github
    highlight NonText guibg=#060606
    highlight Folded  guibg=#0A0A0A guifg=#9090D0

If you don't wish to install a vim plugin from the default set of vim plugins in
`.vimrc.bundles`, you can ignore the plugin by calling it out with `UnPlug` in
your `~/.vimrc.bundles.local`.

    " Don't install vim-scripts/tComment
    UnPlug 'tComment'

`UnPlug` can be used to install your own fork of a plugin or to install a shared
plugin with different custom options.

    " Only load vim-coffee-script if a Coffeescript buffer is created
    UnPlug 'vim-coffee-script'
    Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

    " Use a personal fork of vim-run-interactive
    UnPlug 'vim-run-interactive'
    Plug '$HOME/plugins/vim-run-interactive'

To extend your `git` hooks, create executable scripts in
`~/git_template.local/hooks/*` files.

Your `~/zshrc.local` might look like this:

    # load pyenv if available
    if which pyenv &>/dev/null ; then
      eval "$(pyenv init -)"
    fi

Your `~/vimrc.bundles.local` might look like this:

    Plug 'Lokaltog/vim-powerline'
    Plug 'stephenmckinney/vim-solarized-powerline'

What's in it?
-------------

[vim](http://www.vim.org/) configuration:

* [Ctrl-P](https://github.com/ctrlpvim/ctrlp.vim) for fuzzy file/buffer/tag finding.
* [Rails.vim](https://github.com/tpope/vim-rails) for enhanced navigation of
  Rails file structure via `gf` and `:A` (alternate), `:Rextract` partials,
  `:Rinvert` migrations, etc.
* Run many kinds of tests [from vim]([https://github.com/janko-m/vim-test)
* Set `<leader>` to a single space.
* Switch between the last two files with space-space.
* Syntax highlighting for Markdown, HTML, JavaScript, Ruby, Go, Elixir, more.
* Use [Ag](https://github.com/ggreer/the_silver_searcher) instead of Grep when
  available.
* Map `<leader>ct` to re-index [Exuberant Ctags](http://ctags.sourceforge.net/).
* Use [vim-mkdir](https://github.com/pbrisbin/vim-mkdir) for automatically
  creating non-existing directories before writing the buffer.
* Use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course)
configuration:

* Improve color resolution.
* Remove administrative debris (session name, hostname, time) in status bar.
* Set prefix to `Ctrl+s`
* Soften status bar color from harsh green to light gray.

[git](http://git-scm.com/) configuration:

* Adds a `create-branch` alias to create feature branches.
* Adds a `delete-branch` alias to delete feature branches.
* Adds a `merge-branch` alias to merge feature branches into master.
* Adds an `up` alias to fetch and rebase `origin/master` into the feature
  branch. Use `git up -i` for interactive rebases.
* Adds `post-{checkout,commit,merge}` hooks to re-index your ctags.
* Adds `pre-commit` and `prepare-commit-msg` stubs that delegate to your local
  config.
* Adds `trust-bin` alias to append a project's `bin/` directory to `$PATH`.

[Ruby](https://www.ruby-lang.org/en/) configuration:

* Add trusted binstubs to the `PATH`.
* Load the ASDF version manager.

Shell aliases and scripts:

* `b` for `bundle`.
* `g` with no arguments is `git status` and with arguments acts like `git`.
* `migrate` for `rake db:migrate && rake db:rollback && rake db:migrate`.
* `mcd` to make a directory and change into it.
* `replace foo bar **/*.rb` to find and replace within a given list of files.
* `tat` to attach to tmux session named the same as the current directory.
* `v` for `$VISUAL`.

Thanks
------

Thank you, [contributors](https://github.com/thoughtbot/dotfiles/contributors)!
Also, thank you to Corey Haines, Gary Bernhardt, and others for sharing your
dotfiles and other shell scripts from which we derived inspiration for items
in this project.

License
-------

dotfiles is copyright © 2009-2018 thoughtbot. It is free software, and may be
redistributed under the terms specified in the [`LICENSE`] file.

[`LICENSE`]: /LICENSE

About thoughtbot
----------------

![thoughtbot](http://presskit.thoughtbot.com/images/thoughtbot-logo-for-readmes.svg)

dotfiles is maintained and funded by thoughtbot, inc.
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

We love open source software!
See [our other projects][community].
We are [available for hire][hire].

[community]: https://thoughtbot.com/community?utm_source=github
[hire]: https://thoughtbot.com/hire-us?utm_source=github
