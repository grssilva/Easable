# Test game class
class Game
  attr_easable :linear, 3.seconds, :value
  attr_easable :in_out_elastic, 3.seconds, :rect
  attr_easable :in_circ, 2.seconds, :height

  def initialize
    self.value = 0
    self.rect = [100, 100, 64, 50]
    self.height = 128
  end
end