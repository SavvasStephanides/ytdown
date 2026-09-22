FROM python:3.13.12-slim-bookworm
RUN pip install yt-dlp
RUN apt-get update && apt-get install -y ffmpeg
ENTRYPOINT ["yt-dlp", "-f", "bv*[vcodec^=avc1]+ba[ext=m4a]/b[ext=mp4]/b", "--merge-output-format", "mp4"]