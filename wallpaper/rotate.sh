while true; do
  find .wallpaper/ -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
    shuf -n1 -z | xargs -r -0 feh --bg-fill
  sleep 60m
done
