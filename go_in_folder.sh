read -p "Destructively replace all images in folder '$1'" -n 1 -r
find "$1" -name '*.jpg' -exec ./go.sh {} \;
