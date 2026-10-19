#!/bin/sh
set -e

MODE="$1"
URL="$2"


case "$MODE" in
  audio)
    exec yt-dlp -x --audio-format mp3 --audio-quality 0 "$URL"
    ;;
  video)
    exec yt-dlp \
      -f "bv*[vcodec^=avc1]+ba[ext=m4a]/b[ext=mp4]/b" \
      --merge-output-format mp4 \
      "$URL"
    ;;
  *)
    echo "Usage: $0 {audio|video} <youtube-url>" >&2
    exit 1
    ;;
esac