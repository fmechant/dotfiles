--- === bit.clock ===
---
--- Simply show the current time for a short moment

local clock = {}
local alert = require 'hs.alert'

local glow = {red = 0, green = 0.98, blue = 1; alpha = 1}
local style = {
    textSize = 100,
    textFont = "cabin sketch",
    textColor = glow,
    strokeColor = glow,
    strokeWidth = 5,
    radius = 50
}

clock.flashTime = function(duration)
  duration = duration or 0.40
  alert(os.date('%H:%M'), style, duration)
end

return clock
