PlayState = Class{ __includes = BaseState}


function PlayState:init()
    score = 0

    spawn_timer = 0 
    spawn_timer2 = 0
    spawn_limit_2 = 2
    running_time = 0


    player = Player()
    
    pointers = {}
    damagers = {}
    extend = {}

    psystem = love.graphics.newParticleSystem(particle_image, 64)
    psystem:setParticleLifetime(0.5, 1)
    psystem:setLinearAcceleration(-15, 0, 15, 80)
    psystem:setAreaSpread('normal', 10, 10)
    particle = false
    self.x = 0
    self.y = 0
    self.pause = false


    GOAL = 10000


end



function PlayState:update(dt)
    if not self.pause then
        running_time = running_time + dt

        game_time = game_time - 1*dt

        spawn_timer = spawn_timer + dt

        if running_time > 10 then

            spawn_timer2 = spawn_timer2 + dt
        end


        if game_time < 1  then
            
            if score > highscore then 
                highscore = score
                love.filesystem.remove('magnet.lst')
                love.filesystem.write('magnet.lst',tostring(highscore))
            end

            if score >= GOAL then
                gStateMachine:change('victory')
            else
                gStateMachine:change('start')
                
            end
            
        end

        
        if spawn_timer2 > spawn_limit_2 then
            table.insert(damagers,Damage())
            spawn_timer2 = 0

        end

        if running_time > 20 and running_time < 30 then
            spawn_limit_2 = 1.5
        
        elseif running_time >30 and running_time < 40 then
            spawn_limit_2 = 1

        elseif running_time > 40 and running_time < 50 then
            spawn_limit_2 = 0.8

        elseif running_time > 50 and running_time < 60 then
            spawn_limit_2 = 0.5

        elseif running_time > 60 and running_time < 130 then
            spawn_limit_2 = 0.37

        elseif running_time > 130  then
            spawn_limit_2 = 0.28


        


        end

            

        
    
    
        extra_time = math.random(1,50)

        psystem:update(dt)
        
        

        if extra_time == 1 then
        
            table.insert(extend,More_time())

        end

    
        for k, time in pairs(extend) do
            time:update(dt)
            if PlayState:collides(player,time) then
                psystem:setColors(0,0,255,120,0,0,255,0)
                psystem:emit(64)
                self.x = time.x
                self.y = time.y
                time_sound:play()
                game_time = game_time + 5
                table.remove(extend,k)
                
            end

        end


        player:update(dt)

        if spawn_timer > 1.2 then
            table.insert(pointers,Points())
            spawn_timer = 0

        end
        
        for k, point in pairs(pointers) do
            point:update(dt)
            if PlayState:collides(player,point) then
                psystem:setColors(255,0,0,120,255,0,0,0)
                psystem:emit(64)
                self.x = point.x
                self.y = point.y
                table.remove(pointers,k)
                score = score + 5
                point_sound:play()
            end
        end

        for k, point in pairs(damagers) do
            point:update(dt)
            if PlayState:collides(player,point) then

                psystem:setColors(0,255,0,120,0,255,0,0)
                psystem:emit(64)
                self.x = point.x
                self.y = point.y
                
                table.remove(damagers,k)
                score = score - 3
                game_time = game_time - 5
                hurt_sound:play()

            end
        end

        if score < 0 then
            score = 0
        end

    end

    if love.keyboard.wasPressed('space') then
        if not self.pause then

            self.pause = true
        else
            self.pause =false
    end
end
end


function PlayState:render()
    if self.pause then
        love.graphics.setFont(gFonts['very_large'])

        love.graphics.printf('PAUSE',0,VIRTUAL_HEIGHT/2,VIRTUAL_WIDTH,'center')
    end

    for k, time in pairs(extend) do
        time:render()

    end
    
    player:render()
    for k, point in pairs(pointers) do
        point:render()
    end

    for k, point in pairs(damagers) do
        point:render()
    end

    love.graphics.draw(psystem, self.x + 16, self.y + 8)
    

    love.graphics.setFont(gFonts['medium'])

    love.graphics.setColor(255,0,0)



    love.graphics.print('Score: '..tostring(score),0,0)

    love.graphics.setColor(0,0,255)

    love.graphics.print('HEALTH: '..tostring(math.floor(game_time)),VIRTUAL_WIDTH -100,0)



end


function PlayState:collides(obj_a,obj_b)
    if obj_a.x + obj_a.width < obj_b.x or obj_a.x > obj_b.x + obj_b.width then
        return false
    end
    
    if obj_a.y > obj_b.y + obj_b.height or obj_a.y + obj_a.height < obj_b.y then
        return false
    end

    return true
end