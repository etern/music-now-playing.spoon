local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Music Now Playing"
obj.version = "1.0"
obj.author = "Pavel Makhov"
obj.homepage = "https://fork-my-spoons.github.io/"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.spotify_indicator = nil
obj.timer = nil
obj.iconPath = hs.spoons.resourcePath("icons")
obj.playIcon = nil
obj.pauseIcon = nil

function refreshWidget()
    if (hs.itunes.getPlaybackState() == hs.itunes.state_playing) then
        obj.spotify_indicator:setIcon(obj.playIcon, false)
    else
        obj.spotify_indicator:setIcon(obj.pauseIcon, false)
    end
    if (hs.itunes.getCurrentArtist() ~= nil and hs.itunes.getCurrentTrack() ~= nil) then
        obj.spotify_indicator:setTitle(hs.itunes.getCurrentArtist() .. ' - ' .. hs.itunes.getCurrentTrack())
    end
end

function obj:next()
    hs.itunes.next()
    refreshWidget()
end

function obj:prev()
    hs.itunes.previous()
    refreshWidget()
end

function obj:playpause()
    hs.itunes.playpause()
    refreshWidget()
end

function obj:init(par)
    self.spotify_indicator = hs.menubar.new()
    self.playIcon = hs.image.imageFromPath(obj.iconPath .. '/Spotify_Icon_RGB_Green.png'):setSize({w=16,h=16})
    self.pauseIcon = hs.image.imageFromPath(obj.iconPath .. '/Spotify_Icon_RGB_White.png'):setSize({w=16,h=16})

    self.spotify_indicator:setClickCallback(function()
        hs.itunes.playpause()
        refreshWidget()
    end)
    self.timer = hs.timer.new(1, refreshWidget)
end

function obj:bindHotkeys(mapping)
    local spec = {
        next = hs.fnutils.partial(self.next, self),
        prev = hs.fnutils.partial(self.prev, self),
        playpause = hs.fnutils.partial(self.playpause, self),
      }
      hs.spoons.bindHotkeysToSpec(spec, mapping)
      return self
end

function obj:start()
    self.timer:start()
end

function obj:stop()
    self.timer:stop()
end

return obj
