
require 'src/Dependencies'

function love.load()
    math.randomseed(os.time())
    love.graphics.setDefaultFilter('nearest','nearest')

    love.window.setTitle('MAGNETS')


    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = true,
        vsync = true
    })


    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play']  = function() return PlayState() end, 
        ['victory']  = function() return VictoryState() end, 

    }
    gStateMachine:change('start')
    math.randomseed(os.time())
    love.keyboard.keysPressed ={}



    highscore = loadHighScores()
    love.audio.setVolume(0.1)
    music:play()
    music:setLooping(true)



end

function love.resize(w, h)
    push:resize(w, h)
end


function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if key == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end

end


function love.update(dt)
   
    gStateMachine:update(dt)

    love.keyboard.keysPressed={}



end







function love.draw()
    push:apply('start')
    love.graphics.clear(89,20,100,255)

   
    gStateMachine: render()

    


    push:apply('end')

end


function loadHighScores()
    love.filesystem.setIdentity('magnet')

    -- if the file doesn't exist, initialize it with some default scores
    if not love.filesystem.exists('magnet.lst') then
        local highscore = 0

        love.filesystem.write('magnet.lst', tostring(highscore))
    end

    

 
    for line in love.filesystem.lines('magnet.lst') do
            highscore = tonumber(line)
            
        
    end

    return highscore
end