push = require 'lib/push'
Class = require 'lib/class'
Timer = require 'lib/knife.timer'

require 'src/Constants'
require 'src/StateMachine'

require 'src/states/BaseState'
require 'src/states/PlayState'
require 'src/states/StartState'
require 'src/states/VictoryState'


require 'src/Player'
require 'src/Points'
require 'src/Damage'

require 'src/More_time'

player_image={[1] = love.graphics.newImage('graphics/one.png'),
[2]= love.graphics.newImage('graphics/first.png'),
[3]= love.graphics.newImage('graphics/second.png'),
[4]= love.graphics.newImage('graphics/third.png'),
[5] = love.graphics.newImage('graphics/last.png'),

}

particle_image = love.graphics.newImage('graphics/particle.png')

damage_image = love.graphics.newImage('graphics/Corona.png')

points_image = love.graphics.newImage('graphics/hearts.png')

time_image = love.graphics.newImage('graphics/mask.png')

gFonts = {
    ['small'] = love.graphics.newFont('fonts/font.ttf',8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf',16),
    ['large'] = love.graphics.newFont('fonts/font.ttf',22),
    ['very_large'] = love.graphics.newFont('fonts/font.ttf',34)

}

point_sound = love.audio.newSource('Paste.wav')
hurt_sound = love.audio.newSource('hurt.wav')
time_sound = love.audio.newSource('Powerup3.wav')
music = love.audio.newSource('music.wav')