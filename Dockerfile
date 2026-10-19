FROM python:3.13.12-slim-bookworm
RUN pip install yt-dlp
RUN apt-get update && apt-get install -y ffmpeg
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]