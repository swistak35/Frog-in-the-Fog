require 'rubygems'
require 'gosu'

module ZOrder
  Background, Bullet, Ship, UI = *0..3
end

class Array
  def rand
    shuffle[0]
  end
end

load 'scripts/ship.rb'
load 'scripts/player.rb'

load 'scripts/bullet.rb'
load 'scripts/bullet_purple.rb'
load 'scripts/bullet_rocket.rb'
load 'scripts/bullet_green.rb'
load 'scripts/bullet_bomb.rb'

load 'scripts/enemy.rb'
load 'scripts/enemy_bullet.rb'
load 'scripts/enemy_rocket.rb'
load 'scripts/enemy_small.rb'
load 'scripts/enemy_liner.rb'
load 'scripts/enemy_circle.rb'
load 'scripts/enemy_chaser.rb'
load 'scripts/enemy_path.rb'
load 'scripts/enemy_mother.rb'
load 'scripts/enemy_kid.rb'
load 'scripts/enemy_boss.rb'

load 'scripts/extra.rb'
load 'scripts/extra_star.rb'
load 'scripts/extra_health.rb'
load 'scripts/extra_ship_speed.rb'
load 'scripts/extra_ship_hit_points.rb'
load 'scripts/extra_bullet_purple.rb'
load 'scripts/extra_bullet_green.rb'
load 'scripts/extra_bullet_rocket.rb'
load 'scripts/extra_bullet_bomb.rb'

load 'scripts/wave.rb'

load 'waves/wave_1_liners.rb'
load 'waves/wave_2_liners.rb'
load 'waves/wave_3_liners.rb'
load 'waves/wave_4_massive.rb'
load 'waves/wave_5_circle.rb'
load 'waves/wave_6_circle.rb'
load 'waves/wave_7_square.rb'
load 'waves/wave_8.rb'
load 'waves/wave_9_chasers_5.rb'
load 'waves/wave_10_chasers_9.rb'
load 'waves/wave_11.rb'
load 'waves/wave_12.rb'
load 'waves/wave_13.rb'
load 'waves/wave_14.rb'
load 'waves/wave_15.rb'
load 'waves/wave_16.rb'

load 'scripts/menu.rb'
load 'scripts/game.rb'
load 'scripts/pause.rb'
load 'scripts/game_over.rb'
load 'scripts/window.rb'
load 'scripts/highscore.rb'

window = Window.new
window.show
