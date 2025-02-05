# Music(itunes) Now Playing

<p align="center">
  <a href="https://github.com/etern/music-now-playing.spoon/actions">
    <img alt="Build" src="https://github.com/etern/music-now-playing.spoon/workflows/release/badge.svg"/></a>
  <a href="https://github.com/etern/music-now-playing.spoon/issues">
    <img alt="GitHub issues" src="https://img.shields.io/github/issues/etern/music-now-playing.spoon"/></a>
  <a href="https://github.com/etern/music-now-playing.spoon/releases">
    <img alt="GitHub all releases" src="https://img.shields.io/github/downloads/etern/music-now-playing.spoon/total"/></a>
</p>

A menu bar app which shows currently playing song on Music.app:

Playing: 

<p align="center">
  <img alt="screenshot" src="./screenshots/screenshot.png">
</p>
  
Paused:
  
<p align="center">
  <img alt="screenshot2" src="./screenshots/screenshot2.png">
</p>
  
Click on the bar toggles the playback. It is also possible to setup shortcuts to play next/previous track and toggle the playback - see below.

# Installation

 - install [Hammerspoon](http://www.hammerspoon.org/) - a powerfull automation tool for OS X
   - Manually:

      Download the [latest release](), and drag Hammerspoon.app from your Downloads folder to Applications.
   - Homebrew:

      ```brew install hammerspoon --cask```

 - download [music-now-playing.spoon](https://github.com/etern/music-now-playing.spoon/releases/latest/download/music-now-playing.spoon.zip), unzip and double click on a .spoon file. It will be installed under `~/.hammerspoon/Spoons` folder.
 
 - open ~/.hammerspoon/init.lua and add the following snippet, adding your parameters:

```lua
-- music now playing
hs.loadSpoon("music-now-playing")
spoon['music-now-playing']:start()
spoon['music-now-playing']:bindHotkeys(
  {
    next={ {"ctrl", "alt"}, "Right"},
    prev={ {"ctrl", "alt"}, "Left"},
    playpause={ {"ctrl", "alt"}, "p"}
  }
)
```

The config above sets up the following shortcuts:

 - <kbd>Ctrl Alt →</kbd> - play next track
 - <kbd>Ctrl Alt ←</kbd> - play previous track
 - <kbd>Ctrl Alt P</kbd> - play/pause
