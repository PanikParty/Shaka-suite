rm -f pipe1
mkfifo pipe1
ffmpeg -stream_loop -1 -i $HOME/source/Sintel.2010.720p.mkv -c copy  -f mpegts pipe: > pipe1 &

shaka-packager \
  'in=pipe1,stream=audio,init_segment=audio_init.mp4,segment_template=live-streamserver/packager-output/audio_$Number$.m4s' \
  'in=pipe1,stream=video,init_segment=h264_360p_init.mp4,segment_template=live-streamserver/packager-output/h264_360p_$Number$.m4s' \
  'in=pipe1,stream=video,init_segment=h264_480p_init.mp4,segment_template=live-streamserver/packager-output/h264_480p_$Number$.m4s' \
  'in=pipe1,stream=video,init_segment=h264_720p_init.mp4,segment_template=live-streamserver/packager-output/h264_720p_$Number$.m4s' \
  --enable_widevine_encryption \
  --key_server_url https://license.uat.widevine.com/cenc/getcontentkey/widevine_test \
  --content_id 7465737420636f6e74656e74206964 \
  --signer widevine_test \
  --aes_signing_key 1ae8ccd0e7985cc0b6203a55855a1034afc252980e970ca90e5202689f947ab9 \
  --aes_signing_iv d58ce954203b7c9a9a9d467f59839249 \
  --mpd_output live-streamserver/packager-output/h264.mpd
