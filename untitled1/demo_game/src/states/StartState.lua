StartState = Class{ __includes = BaseState}

function StartState:init()
    game_time = 61



end

function StartState:update(dt)
    if love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end

end


function StartState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(255,0,0)

    love.graphics.printf('GOAL: 10000 ',0,0,VIRTUAL_WIDTH ,'right')
    love.graphics.print('HighScore: '..tostring(highscore),0,0)

    love.graphics.setColor(0,0,255)

    love.graphics.printf('PRESS ENTER TO START',0,VIRTUAL_HEIGHT - 100,VIRTUAL_WIDTH,'center')

    

    




end