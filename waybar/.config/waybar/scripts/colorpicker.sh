#!/usr/bin/env bash
check() {
  command -v "$1" 1>/dev/null
}



loc="$HOME/.cache/colorpicker"
[ -d "$loc" ] || mkdir -p "$loc"
[ -f "$loc/colors" ] || touch "$loc/colors"

limit=10

[[ $# -eq 1 && $1 = "-l" ]] && {
  cat "$loc/colors"
  exit
}

[[ $# -eq 1 && $1 = "-j" ]] && {
  text="$(head -n 1 "$loc/colors")"

  # Read all lines from the file, excluding the first one
  mapfile -t allcolors < <(tail -n +2 "$loc/colors")
  tooltip="<b><span size='14pt'>COLORS</span></b>\n\n"

  # Add the first color with a newline
  tooltip+="<b>$text</b> <span color='$text'></span>\n"
  
  # Loop through allcolors and add a newline to all but the last one
  for ((i=0; i<${#allcolors[@]}; i++)); do
    color="${allcolors[i]}"
    tooltip+="<b>$color</b> <span color='$color'></span>"
    # Add a newline only if it's not the last element
    if [[ i -lt $((${#allcolors[@]} - 1)) ]]; then
      tooltip+="\n"
    fi
  done

  cat <<EOF
{ "text":"<span color='$text'></span>", "tooltip":"$tooltip"}
EOF

  exit
}

check hyprpicker || {
  notify "hyprpicker is not installed"
  exit
}
killall -q hyprpicker
color=$(hyprpicker)

check wl-copy && {
  echo "$color" | sed -z 's/\n//g' | wl-copy
}

prevColors=$(head -n $((limit - 1)) "$loc/colors")
echo "$color" >"$loc/colors"
echo "$prevColors" >>"$loc/colors"
sed -i '/^$/d' "$loc/colors"
notify-send "Color Picker" "This color has been selected: <span color='$color'><b>$color</b></span>" -i "gcolor3"
pkill -RTMIN+1 waybar
