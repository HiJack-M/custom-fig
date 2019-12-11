# env
# {
    export PS1="\w  "
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
    export LC_CTYPE=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export PATH="/usr/local/sbin:$PATH"

    # prompt etc action auto complete
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi

    # enable globstar [**/*]
    shopt -s globstar
# }


# addition env in .profile
# {
    source /Users/$USER/.profile
# }


# iterm2
# {
    test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# }


# autojump [discard]
# alternative [z]
# {
    # . /usr/local/Cellar/autojump/22.5.3/share/autojump/autojump.bash
# }


# z [discard]
# alternative [fasd]
# {
    # [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
# }


# fasd
# {
    fasd_cache="$HOME/.fasd-init-bash"
    if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
        fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
    fi
    source "$fasd_cache"
    unset fasd_cache

    alias v='f -e vim'  # quick opening files with vim
    alias o='a -e open' # quick opening files with xdg-open
# }


# fzf
# {
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash

    export FZF_DEFAULT_COMMAND='find .'

    # Use ~~ as the trigger sequence instead of the default **
    export FZF_COMPLETION_TRIGGER='~~'

    # Options to fzf command
    export FZF_COMPLETION_OPTS='+c -x'

    # highlight
    export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

    # Use fd (https://github.com/sharkdp/fd) instead of the default find
    # command for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
# }


# node.js
# {
    # nvm [TODO disabled > use brew namespace node]
    # {
        # slow official nvm load
        # export NVM_DIR="$HOME/.nvm"
        # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    # }

    # yarn
    # {
        export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
    # }
# }


# python
# {
    # version manage
    # {
        if command -v pyenv 1>/dev/null 2>&1; then
          eval "$(pyenv init -)"
        fi
    # }

    # virtualenvs
    # {
        export WORKON_HOME=$HOME/.virtualenvs
        source /usr/local/bin/virtualenvwrapper.sh
    # }
# }


# ruby
# {
    export PATH=/usr/local/Cellar/ruby/2.6.3/bin:$PATH

    # rvm
    # {
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
        # export PATH="$PATH:$HOME/.rvm/bin"
        # [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
    # }
# }


# java
# {
    export JAVA_HOME=`/usr/libexec/java_home`

    # maven config
    # https://github.com/rajivkanaujia/alphaworks/wiki/Installing-Maven
    # {
        export M2_HOME=/usr/local/Cellar/maven/3.6.1/libexec
        export M2=${M2_HOME}/bin
        export PATH=${PATH}:${M2_HOME}/bin
    # }
# }


# android platform-tools
# {
    export ANDROID_HOME=/Users/$USER/Library/Android/sdk
    export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

    # gradle config
    # {
        export GRADLE_PATH=/Users/$USER/.gradle/wrapper/dists/gradle-4.4-all/9br9xq1tocpiv8o6njlyu5op1/gradle-4.4
        export GRADLE_USER_HOME=/Users/$USER/.gradle
        export PATH=$PATH:$GRADLE_PATH/bin
    # }
# }


# rust
# {
    # cargo config
    # {
        export PATH="$HOME/.cargo/bin:$PATH"
    # }
# }


# asdf-vm
# {
    # . $(brew --prefix asdf)/asdf.sh
    # . $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash
# }


# [php-fpm] php7.0
# [https://gist.github.com/shashankmehta/6ff13acd60f449eea6311cba4aae900a]


# alias name
# {
    # the fuck senmatic complete
    # eval "$(thefuck --alias f)"

    # vps
    # {
        function sshproxy() {
            if [ "$1" = 'rider' ]
            then
                ssh root@$1.jovipro.com -p 29675 -o "ProxyCommand=nc -X 5 -x 127.0.0.1:1082 %h %p"
            else
                ssh root@$1.jovipro.com -o "ProxyCommand=nc -X 5 -x 127.0.0.1:1082 %h %p"
            fi
        }
    # }

    alias l="ls"
    alias ll='ls -lht'
    alias la="ls -a"
    alias pc="proxychains4 -f ~/.proxychains.conf"
    alias proxyee-down="java -jar ~/github/network/proxyee-down/main/target/proxyee-down-main.jar"
    alias supervisorctl="supervisorctl -c /Users/$USER/fig/supervisor/supervisord.conf"
    alias ctags="`brew --prefix`/bin/ctags"
    alias vi="vim"
    alias fig="docker-compose"
# }


# removed all the duplicates $PATH
# @SherylHohman [https://superuser.com/questions/449636/path-is-filled-with-duplicates]
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++  } split(/:/, $ENV{PATH}))')"
