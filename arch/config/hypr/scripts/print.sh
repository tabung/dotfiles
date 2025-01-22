file_path="./Pictures/Screenshots/Screenshot_$(date +%Y%m%d-%H%M%S).png"
grim -g "$(slurp -d)" "$file_path" && wl-copy <"$file_path"
