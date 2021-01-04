Damage = Class{}

function Damage:init()
self.width = 50
self.height = 50    
self.x = math.random(0,VIRTUAL_WIDTH - self.width)
self.y = -20
self.dy = 6
self.gravity = 1.50


end

function Damage:update(dt)
    self.y = self.y + self.dy + self.gravity * dt

end


function Damage:render()
    love.graphics.draw(damage_image,self.x,self.y)

    

end
