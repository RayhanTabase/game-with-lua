
Player = Class{}


function Player:init()
    self.x = VIRTUAL_WIDTH/2 - 40/2
    self.height = 49
    self.y = VIRTUAL_HEIGHT - self.height 
    self.width = 40
    self.left = -7
    self.right = 7
    self.dy = 20
    self.gravity = 30
    self.dx = 0

    self.skin = 5
    ---self.direction = 'still'

end

function Player:update(dt)
    if game_time >50 then
        self.skin = 5
    end

    if game_time <=50 then
        self.skin = 4
    end
    if game_time <= 40 then
        self.skin = 3
    end
    if game_time <= 30 then
        self.skin = 2
    end
    if game_time <= 2 then
        self.skin = 1
    end

    self.x = self.x + self.dx

    if love.keyboard.wasPressed('right') then
        self.direction = 'right'
        ---self.dx = 0
        self.dx = self.right
    end
    if love.keyboard.wasPressed('left') then
        self.direction = 'left'
        ---self.dx = 0
        self.dx = self.left
    end
    

    if self.x + self.width >= VIRTUAL_WIDTH then
        self.x = VIRTUAL_WIDTH - self.width
    end
    if self.x <= 0 then
        self.x = 0
    end

    
    

end

function Player:render()
    if self.direction=='right' then
        love.graphics.draw(player_image[self.skin],self.x + self.width,self.y,0,-1,1)
    else
        love.graphics.draw(player_image[self.skin],self.x,self.y)
    end


end