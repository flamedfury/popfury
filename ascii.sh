ascii_art='
### ###  ####       ##     ##   ##  ### ###  ### ##   ### ###  ##  ###  ### ##   ##  ##   
 ##  ##   ##         ##     ## ##    ##  ##   ##  ##   ##  ##  ##   ##   ##  ##  ##  ##   
 ##       ##       ## ##   # ### #   ##       ##  ##   ##      ##   ##   ##  ##  ##  ##   
 ## ##    ##       ##  ##  ## # ##   ## ##    ##  ##   ## ##   ##   ##   ## ##    ## ##   
 ##       ##       ## ###  ##   ##   ##       ##  ##   ##      ##   ##   ## ##     ##     
 ##       ##  ##   ##  ##  ##   ##   ##  ##   ##  ##   ##      ##   ##   ##  ##    ##     
####     ### ###  ###  ##  ##   ##  ### ###  ### ##   ####      ## ##   #### ##    ##     
'

# Define the color gradient (shades of red, orange, and yellow)
colors=(
    '\033[38;5;196m' # Red
    '\033[38;5;202m' # OrangeRed
    '\033[38;5;208m' # DarkOrange
    '\033[38;5;214m' # Orange
    '\033[38;5;220m' # Gold
    '\033[38;5;226m' # Yellow
    '\033[38;5;228m' # LightYellow
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in "${!lines[@]}"; do
	color_index=$((i % ${#colors[@]}))
	echo -e "${colors[color_index]}${lines[i]}"
done