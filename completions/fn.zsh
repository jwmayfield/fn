if [[ ! -o interactive ]]; then
    return
fi

compctl -K _fn fn

_fn() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(fn commands)"
  else
    completions="$(fn completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
