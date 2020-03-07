# .bashrcの実行
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

eval "$(rbenv init -)"

if [ "$(uname)" == 'Darwin' ]; then
    GREP_OPTIONS="--color=always";export GREP_OPTIONS
fi
