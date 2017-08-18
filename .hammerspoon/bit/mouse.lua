--- === bit.mouse.highlight ===
---
--- (only works with https://github.com/lodestone/hyper-hacks)
mouse = {}
local canvas = require "hs.canvas"
local timer = require "hs.timer"
require "hs.mouse"

local function createCrosshair(middlePosition, size)
  local frame = {
    x = middlePosition.x + 3 - size/2,
    y = middlePosition.y + 6 - size/2,
    w = size,
    h = size
  }
  return canvas.new(frame):appendElements({
    action = "build",
    type = "rectangle",
    frame = {x = "0%", y = "0%", w = "40%", h = "40%"},
  },{
    action = "build",
    type = "rectangle",
    frame = {x = "60%", y = "0%", w = "40%", h = "40%"},
  },{
    action = "build",
    type = "rectangle",
    frame = {x = "0%", y = "60%", w = "40%", h = "40%"},
  },{
    action = "clip",
    type = "rectangle",
    frame = {x = "60%", y = "60%", w = "40%", h = "40%"},
  },{
    action = "stroke",
    padding = 10,
    type = "rectangle",
    frame = {x = "0%", y = "0%", w = "100%", h = "100%"},
    roundedRectRadii = {xRadius = 10, yRadius= 10},
    strokeColor = {red = 1, alpha = 1},
    strokeWidth = 5,
    withShadow = true,
    strokeCapStyle = "round"
  }):show()
end

local function showHighlight(position, size, time, fn)
  local highlight = createCrosshair(position, size)
  timer.doAfter(time, function() highlight:delete() if fn then fn() end end)
end

mouse.highlight = function()
  local target = hs.mouse.getAbsolutePosition()
  showHighlight(target, 180, 0.35, function()
    showHighlight(target, 130, 0.35, function()
      showHighlight(target, 80, 1, nil)
    end)
  end)
end

return mouse
