--- === bit.comm ===
---
--- Shows my communication apps in a specific place
comm = {}
require "hs.application"
require "hs.mjomatic"

comm.show = function()
  hs.application.launchOrFocusByBundleID("com.hipchat.hipchat")
  hs.application.launchOrFocusByBundleID("com.flexibits.fantastical2.mac")
  hs.application.launchOrFocusByBundleID("it.bloop.airmail2")
  hs.mjomatic.go({
    "hhhhFFFFF",
    "hhhhFFFFF",
    "hhhhFFFFF",
    "hhhhFFFFF",
    "AAAAAyyyy",
    "AAAAAyyyy",
    "AAAAAyyyy",
    "",
    "F Fantastical",
    "A Airmail",
    "h HipChat"
  })
end

return comm
