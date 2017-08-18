--- === bit.hyper ===
---
--- (only works with https://github.com/lodestone/hyper-hacks)
--- Sets up that pressing the caps-lock key is the same as pressing
--- SHFT-CTRL-ALT-CMD so that it can be used as a 'hyper' key
local hyper = {}

local hotkey = require 'hs.hotkey'
local eventtap = require 'hs.eventtap'

local hyperModal = hotkey.modal.new({}, "f17")

local pressedHyper = function()
  hyperModal.triggered = false
  hyperModal:enter()
end

local releasedHyper = function()
  hyperModal:exit()
  if not hyperModal.triggered then
    eventtap.keyStroke({}, 'ESCAPE')
  end
end

local hyper = hotkey.bind({}, "f18", pressedHyper, releasedHyper)

hyper.bind = function(key, fn)
  hyperModal:bind({}, key, nil, function()
    fn()
    hyperModal.triggered = true
  end)

end

return hyper
