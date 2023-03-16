mkfifo pipe1
ffmpeg -stream_loop -1 -i $HOME/source/Sintel.2010.720p.mkv -c copy  -f mpegts pipe: > pipe1

