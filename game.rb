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
    @angry_plants = []
    @angry_plants << AngryPlant.new
    @water = Water.new
    @grass = Grass.new
    @squishiness_factor = 0.7
  end

  def draw
    @grass.draw
    @angry_plants.each do |plant|
      if !are_colliding?(plant, @water)
        @water.draw
      end
      plant.draw
    end
  end

  def update
    @angry_plants.each do |plant|
      if are_colliding?(plant, @water)
        plant.make_happy
      end
      plant.update
    end
    @water.update
  end

  def are_colliding?(object1, object2)
    Gosu::distance(object1.center_x, object1.center_y, object2.center_x, object2.center_y) < (object2.radius + object1.radius) * @squishiness_factor
  end
end

@window = MyWindow.new
@window.show
