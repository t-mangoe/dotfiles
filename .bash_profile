if [ "$(uname)" == 'Linux' ]; then
    # rbenvにパスを通す
    export PATH="$HOME/.rbenv/bin:$PATH"
    # Homebrewのパスを通す
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if type rbenv > /dev/null 2>&1; then
    # rbenvコマンドが存在する場合のみ実行
    eval "$(rbenv init - bash)"
fi

if type pyenv > /dev/null 2>&1; then
    # pyenvコマンドが存在する場合のみ実行
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

if [ "$(uname)" == 'Darwin' ]; then
    GREP_OPTIONS="--color=always";export GREP_OPTIONS
fi

# if [ -d "$HOME/.cargo/bin" ]; then
#     # cargoで導入したコマンドにパスを通す
#     PATH="$HOME/.cargo/bin:$PATH"
# fi

# .bashrcの実行
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
