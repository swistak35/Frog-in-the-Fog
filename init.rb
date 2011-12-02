require 'gosu'

module ZOrder
  Background, Bullet, Ship, UI = *0..3
end

class Array
  def rand
    shuffle[0]
  end
end
  

$settings = {}

load 'ship.rb'
load 'player.rb'

load 'bullet.rb'
load 'bullet_purple.rb'
load 'bullet_rocket.rb'
load 'bullet_green.rb'
load 'bullet_bomb.rb'

load 'enemy.rb'
load 'enemy_small.rb'
load 'enemy_coward.rb'

load 'extra.rb'
load 'extra_star.rb'
load 'extra_health.rb'
load 'extra_ship_speed.rb'
load 'extra_ship_hit_points.rb'
load 'extra_bullet_purple.rb'
load 'extra_bullet_green.rb'
load 'extra_bullet_rocket.rb'
load 'extra_bullet_bomb.rb'

load 'menu.rb'
load 'game.rb'
load 'window.rb'

window = Window.new
window.show
