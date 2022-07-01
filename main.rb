require 'app/easing.rb'
require 'app/easable.rb'
require 'app/game.rb'

def tick args
  $game ||= Game.new
 
  move if args.state.tick_count.zero? || args.inputs.keyboard.key_down.space


  args.outputs.labels  << [640, 460, 'Press space to move', 5, 1]
  args.outputs.labels  << [640, 500, "Value: #{$game.value.to_i}", 5, 1]

  args.outputs.sprites << [$game.rect, 'dragonruby.png']
  args.outputs.sprites << [1000, 100, 128, $game.height, 'dragonruby.png']
end

def move
  if $game.value == 0
    move_up
  elsif $game.value == 100
    move_down
  end
end

def move_up
  $game.value = 100
  $game.rect = [576, 280, 128, 101]
  $game.height = 500
end

def move_down
  $game.value = 0
  $game.rect = [100, 100, 64, 50]
  $game.height = 128
end