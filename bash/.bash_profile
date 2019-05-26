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
# }


# autojump
# {
    . /usr/local/Cellar/autojump/22.5.3/share/autojump/autojump.bash
# }


# nvm
# {
    # slow official nvm load
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# }


# ruby
# {
    # rvm
    # {
        source /Users/$USER/.profile
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


# name
# {
    # the fuck senmatic complete
    # eval "$(thefuck --alias f)"
    alias l="ls"
    alias ll="ls -l"
    alias la="ls -a"
    alias pc="proxychains4 -f ~/.proxychains.conf"
    alias proxyee-down="java -jar ~/github/network/proxyee-down/main/target/proxyee-down-main.jar"
    alias supervisorctl="supervisorctl -c /Users/$USER/fig/supervisor/supervisord.conf"
    alias ctags="`brew --prefix`/bin/ctags"
    alias vps_vpn="ssh root@vpn.jovipro.com"
    alias vps_cms="ssh root@cms.jovipro.com"
    alias vps_hijack="ssh root@hijack.rocks"
    alias vps_cms_by_proxy='ssh root@cms.jovipro.com -o "ProxyCommand=nc -X 5 -x 127.0.0.1:1082 %h %p"'
    alias vps_hijack_by_proxy='ssh root@hijack.rocks -o "ProxyCommand=nc -X 5 -x 127.0.0.1:1082 %h %p"'
    alias vps_liang="ssh root@www.devrl.com"
    alias vps_ec="ssh apache@192.168.1.144 -p 932"
    alias vi="vim"
    alias fig="docker-compose"
# }


# removed all the duplicates $PATH
# @SherylHohman [https://superuser.com/questions/449636/path-is-filled-with-duplicates]
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++  } split(/:/, $ENV{PATH}))')"
