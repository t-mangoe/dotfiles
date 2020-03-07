# .bashrcの実行
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

eval "$(rbenv init -)"
