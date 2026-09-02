# gnome-toggle-window

<div align="center">

<a href="https://ko-fi.com/bkrbnkr"><img alt="Support me on Ko-fi" src="https://img.shields.io/badge/Ko--fi-buy_me_a_coffee-FF5E5B?style=for-the-badge&logo=kofi&logoColor=white"></a>

</div>

A small bash script that moves the active window to the other monitor on a
dual-monitor X11 desktop. I bind it to a key so one press throws a window
across.

## How it works

1. Gets the active window with `xdotool`.
2. Reads the window's `_NET_WM_STATE` with `xprop` and exits if the window is
   fullscreen, so a fullscreen video or game is left alone.
3. Works out which monitor the window is on by dividing its X position by the
   monitor width.
4. Presses Super+Right if the window is on the left monitor, or Super+Left if
   it is on the right one.

The monitor width is hardcoded near the top of the script
(`monitor_width=2560`). Change it to match your monitors. The script assumes
two monitors of the same width, side by side.

The script only sends the key press. Super+Left and Super+Right need to be
bound to "Move window one monitor to the left / right" in your keyboard
settings. In stock GNOME those keys tile the window to half the screen
instead.

## Requirements

- An X11 session (it does not work on Wayland)
- `xdotool`
- `xprop` (part of `x11-utils` on Debian and Ubuntu, `xorg-x11-utils` on
  Fedora)

For example, on Ubuntu:

```bash
sudo apt-get install xdotool x11-utils
```

## Install

1. Clone this repository or download `windowtoggle.sh`.
2. Set `monitor_width` in the script to the width of one of your monitors.
3. Make the script executable:

```bash
chmod +x windowtoggle.sh
```

## Usage

Run it from a terminal to move the active window:

```bash
./windowtoggle.sh
```

To bind it to a key:

1. Open Settings, then Keyboard, then Keyboard Shortcuts.
2. Add a custom shortcut with the full path of the script as the command, for
   example `/home/you/bin/windowtoggle.sh`.
3. Pick a key combination.

Issues and pull requests are welcome.

---

## Support

<div align="center">

This project is free and open source, and I work on it in my spare time.<br>
If it saved you some time, you can buy me a coffee. No pressure - the code stays free either way.

<a href="https://ko-fi.com/bkrbnkr"><img alt="Support me on Ko-fi" src="https://img.shields.io/badge/Ko--fi-bkrbnkr-FF5E5B?style=for-the-badge&logo=kofi&logoColor=white"></a>

</div>

<!-- more ways to support go here -->
<!-- - [PayPal](...) -->
<!-- - [GitHub Sponsors](...) -->

## License

Public domain under the [Unlicense](LICENSE).
