# examples of how to use code
# curl_from_file                1                       urls.txt              the_yards
#     script              start number          file to downlaod from         file name
#
curl_from_file() {
    newest_pod=$1
    url_file=$2
    fil_name=$3

    tac "${url_file}" | while read url; do
      file_name=$(printf "ep_%03d_${fil_name}.mp3" "$newest_pod")
      curl -L "$url" -o "$file_name"
      ((newest_pod++))
    done
}
