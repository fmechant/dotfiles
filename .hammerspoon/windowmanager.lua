require("hs.window")

left = {x=0, y=0, w=0.5, h=1}
right = {x=0.5, y=0, w=0.5, h=1}
top = {x=0, y=0, w=1, h=0.5}
bottom = {x=0, y=0.5, w=1, h=0.5}
middle = {x=0.15, y=0.15, w=0.7, h=0.7}
full = {x=0, y=0, w=1, h=1}

function moveTo(win, position)
  local screen = win:screen()
  local full = screen:frame()
  print(full)

  local frame = win:frame()
  frame.x = full.x + full.w * position.x
  frame.y = full.y + full.h * position.y
  frame.w = full.w * position.w
  frame.h = full.h * position.h
  win:setFrame(frame, 0)
  print(frame)
end

function moveFocusedTo(position)
  moveTo(hs.window.focusedWindow(), position)
end
