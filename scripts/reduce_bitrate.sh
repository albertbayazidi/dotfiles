# examples of how to use code
# reduce_bitrate_audio
#     script         
# This function takes no arguments.

reduce_bitrate_audio(){
    mkdir smaller
    for file in *.mp3; do
      ffmpeg -i "$file" -b:a 64k "smaller/$file" -threads 8
    done

    tar -czf archive.tar.gz "smaller/*.mp3"
}
