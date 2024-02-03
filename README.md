# Window Mover Script

This script allows you to move the active window to the left or right on a dual-monitor setup without affecting maximized or fullscreen windows. It's designed for use on Linux systems with X11 and requires `xdotool` and `wmctrl`.

## Prerequisites
- `xdotool`
- `wmctrl`

You can install these utilities using your distribution's package manager. For example, on Ubuntu:

```bash
sudo apt-get install xdotool wmctrl
```

## Installation
Clone this repository or download the script file.
Make the script executable:

```bash
chmod +x windowtoggle.sh
```

## Usage
Execute the script directly from the terminal to move the active window:

```bash
./windowtoggle.sh
```

## Setting Up as a Keybind

To bind this script to a keyboard shortcut:

1: Open "Settings" > "Keyboard Shortcuts" in your desktop environment.

2: Create a new shortcut, set the command to the full path of the script, e.g., /path/to/windowtoggle.sh.

3: Assign a key combination of your choice.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for improvements or bug fixes.
