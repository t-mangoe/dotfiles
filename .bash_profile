# .bashrcの実行
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if type rbenv > /dev/null 2>&1; then
    # rbenvコマンドが存在する場合のみ実行
    eval "$(rbenv init -)"
fi

if [ "$(uname)" == 'Darwin' ]; then
    GREP_OPTIONS="--color=always";export GREP_OPTIONS
fi
