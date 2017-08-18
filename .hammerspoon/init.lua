require "hs.application"
require "hs.hints"
require "windowmanager"
local mouse = require "bit.mouse"
local clock = require "bit.clock"
local hyper = require "bit.hyper"
local comm = require "bit.comm"
local log = require'hs.logger'.new("init", "verbose")

hyper.bind('h', hs.hints.windowHints)
hyper.bind('t', clock.flashTime)
hyper.bind("m", mouse.highlight)

hyper.bind('left', function() moveFocusedTo(left) end)
hyper.bind('right', function() moveFocusedTo(right) end)
hyper.bind('up', function() moveFocusedTo(top) end)
hyper.bind('down', function() moveFocusedTo(bottom) end)
hyper.bind('=', function() moveFocusedTo(middle) end)
hyper.bind(':', function() moveFocusedTo(full) end)

hyper.bind('k', comm.show)

hs.hotkey.bind({"ctrl","alt","cmd"}, "left", nil, function()
  hs.window.focusedWindow():moveOneScreenWest(nil, true)
end)
hs.hotkey.bind({"ctrl","alt","cmd"}, "right", nil, function()
  hs.window.focusedWindow():moveOneScreenEast(nil, true)
end)

local timers = {}
hs.timer.setLogLevel("verbose")

local function notifyMeFiveBeforeTheHour()
  timers[#timers+1] = hs.timer.doAt("00:55", "1h", clock.flashTime)
end

function alertStandUpInMinutes(min)
  hs.alert("Standup in " .. min .. " min", 5)
end

local function remindMeOfStandup(standupTime, times)
  for i=times,1,-1 do
    timers[#timers+1] = hs.timer.doAt(standupTime - hs.timer.minutes(i), "1d", function()
      alertStandUpInMinutes(i)
    end)
  end
end

local function stopAndClearTimers()
  for k,_ in pairs(timers) do
    timers[k]:stop()
    timers[k] = nil
  end
end

local function startTimers()
--  notifyMeFiveBeforeTheHour()
--  remindMeOfStandup(hs.timer.seconds("9:45"), 10)
end

local function restartTimers()
  log.i("Restarting the timers")
  stopAndClearTimers()
  startTimers()
end

local function restartTimersOnWake(eventType)
  if (eventType == hs.caffeinate.watcher.systemDidWake) then
    restartTimers()
  end
end
local watcher = hs.caffeinate.watcher.new(restartTimersOnWake):start()

startTimers()
