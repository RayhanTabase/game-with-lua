More_time = Class{}

function More_time:init()
    self.x= math.random(10,VIRTUAL_WIDTH - 10)
    self.y= 10
    self.width=20
    self.height=23
    self.dy = 7
    self.gravity = 1

end

function More_time:update(dt)
    self.y = self.y + self.dy + self.gravity * dt

end


function More_time:render()
   
    love.graphics.draw(time_image,self.x,self.y)
   

end