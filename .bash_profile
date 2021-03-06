if [ "$(uname)" == 'Linux' ]; then
    # rbenvにパスを通す
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

if type rbenv > /dev/null 2>&1; then
    # rbenvコマンドが存在する場合のみ実行
    eval "$(rbenv init -)"
fi

if [ "$(uname)" == 'Darwin' ]; then
    GREP_OPTIONS="--color=always";export GREP_OPTIONS
fi

if [ -d "$HOME/.cargo/bin" ]; then
    # cargoで導入したコマンドにパスを通す
    PATH="$HOME/.cargo/bin:$PATH"
fi

# .bashrcの実行
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
