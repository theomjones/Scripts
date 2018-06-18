mk() {
  if [ $1 = "--yarn" ] || [ $1 = "-y" ]; then
    mkdir -p $2 \
    && cd $2 \
    && yarn init -y \
    && echo '' >> index.js
  else
    mkdir -p $1 \
    && cd $1
  fi
}