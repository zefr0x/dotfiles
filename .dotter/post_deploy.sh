{{#if dotter.packages.de}}
hyprctl reload
swaync-client -R
swaync-client -rs
killall -SIGUSR2 waybar
{{/if}}
