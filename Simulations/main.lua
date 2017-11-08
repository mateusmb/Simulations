function love.load()
  love.graphics.setBackgroundColor(200, 255, 255, 255)
  --  Head properties  --
  head          = {}
  head.red      = 255
  head.green    = 220
  head.blue     = 204
  head.alpha    = 255
  head.x        = 200
  head.y        = 300
  head.radius   = 50
  head.segments = 100
  head.grabbed  = false
  head.dropped  = false
  head.mass     = 30
  head.velocity = 0
  --  Head properties  --

  --  Other properties --
  gravity = 10
end

function love.update(dt)
  if head.y + head.radius < love.graphics.getHeight() then
    force = head.mass * gravity
    acceleration = force/head.mass
    head.velocity = head.velocity + acceleration * dt
    head.y = head.y + head.velocity * dt
  end
end

function love.draw()
  love.graphics.setColor(head.red, head.green, head.blue, head.alpha)
  love.graphics.circle("fill", head.x, head.y, head.radius, head.segments)
end

function love.mousepressed(x, y, button, isTouch)
  if (x-head.x)^2 + (y - head.y)^2 < head.radius^2 then
    head.grabbed = true
  end
end

function love.mousemoved(x, y, dx, dy)
  if head.grabbed then
    head.x = head.x + dx
    head.y = head.y + dy
  end
end

function love.mousereleased(x, y, button, isTouch)
  head.grabbed = false
end
