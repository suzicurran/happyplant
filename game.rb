require 'gosu'
require './happy_plant.rb'
require './angry_plant.rb'
require './water.rb'
require './grass.rb'
# require 'pry'

class MyWindow < Gosu::Window
  HEIGHT = 480
  WIDTH = 640

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Make the plant happy!'
    @happy_plant = HappyPlant.new
    @angry_plant = AngryPlant.new
    @water = Water.new
    @grass = Grass.new
  end

  def draw
    @grass.draw
    if Gosu::distance(@angry_plant.center_x, @angry_plant.center_y, @water.center_x, @water.center_y) < 16
      @happy_plant.draw(@angry_plant)
      # @angry_plant.ishappy = true
    else
      @angry_plant.draw
      @water.draw
    end
  end

  def update
      @angry_plant.update
      @water.update
  end
end

@window = MyWindow.new
@window.show
