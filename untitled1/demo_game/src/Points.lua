Points = Class{}

function Points:init()
self.width = 16
self.height = 16     
self.x = math.random(0,VIRTUAL_WIDTH - self.width)
self.y = -20
self.dy = 5
self.gravity = 1.50

end

function Points:update(dt)
    self.y = self.y + self.dy + self.gravity * dt

end


function Points:render()
    love.graphics.draw(points_image,self.x,self.y)

end

