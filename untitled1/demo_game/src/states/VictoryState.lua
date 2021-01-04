VictoryState = Class{ __includes = BaseState}

function VictoryState:init()
    self.colors = {
        [1] = {217, 87, 99, 255},
        [2] = {95, 205, 228, 255},
        [3] = {251, 242, 54, 255},
        [4] = {118, 66, 138, 255},
        [5] = {153, 229, 80, 255},
        [6] = {223, 113, 38, 255},
        [7] = {123, 113, 58, 255}
    }

    self.letterTable = {
        {'V', -108},
        {'I', -64},
        {'C', -28},
        {'T', 2},
        {'O', 40},
        {'R', 80},
        {'Y', 120}


    }

    self.colorTimer = Timer.every(0.075, function()
        -- shift every color to the next, looping the last to front
        -- assign it to 0 so the loop below moves it to 1, default start
        self.colors[0] = self.colors[7]

        for i = 7, 1, -1 do
            self.colors[i] = self.colors[i - 1]
        end
    end)

end


function VictoryState:update(dt)
    Timer.update(dt)

    if love.keyboard.wasPressed('space') or  love.keyboard.wasPressed('return') or love.keyboard.wasPressed('enter') then

        gStateMachine:change('start')

    end


end


function VictoryState:render()

    love.graphics.setFont(gFonts['very_large'])


    for i = 1, 7 do
        love.graphics.setColor(self.colors[i])
        love.graphics.printf(self.letterTable[i][1], 0, VIRTUAL_HEIGHT / 2 + 2,
            VIRTUAL_WIDTH + self.letterTable[i][2], 'center')
    end

   

end