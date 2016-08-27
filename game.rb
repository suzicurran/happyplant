require 'gosu'
require './angry_plant.rb'
require './water.rb'
require './grass.rb'
require 'pry'

class MyWindow < Gosu::Window
  HEIGHT = 480
  WIDTH = 640

  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Make the plant happy!'
    @angry_plant = AngryPlant.new
    @water = Water.new
    @grass = Grass.new
    @squishiness_factor = 0.7
  end

  def draw
    @grass.draw
    if !are_colliding?(@angry_plant, @water)
      @water.draw
    end
    @angry_plant.draw
  end

  def update
    if are_colliding?(@angry_plant, @water)
      @angry_plant.make_happy
    end
    @angry_plant.update
    @water.update
  end

  def are_colliding?(object1, object2)
    Gosu::distance(object1.center_x, object1.center_y, object2.center_x, @water.center_y) < (@water.radius + object1.radius) * @squishiness_factor 
  end
end

@window = MyWindow.new
@window.show
