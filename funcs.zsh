port() {
  open http://localhost:$1
}

p() {
  open http://localhost:$1
}

# Docker
nuke_img() {
  docker image rm $(docker image ls -q) -f
}

nuke_containers() {
  docker container rm $(docker container ls -a -q) -f
}

rm_nodemodules() {
  find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
}

hex2rgb() {
    # Usage: hex_to_rgb "#FFFFFF"
    ((r=16#${1:1:2}))
    ((g=16#${1:3:2}))
    ((b=16#${1:5:6}))

    printf '%s\n' "$r $g $b"
}

rgb2hex() {
    # Usage: rgb_to_hex "r" "g" "b"
    printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}

push() {
  git add -A && git commit -m $1 && git push
}