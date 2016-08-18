require 'gosu'
require './happy_plant.rb'
require './angry_plant.rb'
require './water.rb'

class MyWindow < Gosu::Window
  HEIGHT = 640
  WIDTH = 480

  def initialize
    super(HEIGHT, WIDTH)
    self.caption = 'Hello World!'
    @happy_plant = HappyPlant.new
    @angry_plant = AngryPlant.new
    @water = Water.new
  end

  def draw
    if Gosu::distance(@angry_plant.center_x, @angry_plant.center_y, @water.center_x, @water.center_y) < 16
      @happy_plant.draw(@angry_plant)
    else
      @angry_plant.draw
      @water.draw
    end
  end

  def update
      @angry_plant.update
    # puts "angryplant is at #{@angry_plant.center_x}, #{@angry_plant.center_y}"
      @water.update
    # puts "water is at #{@water.center_x}, #{@water.center_y}"
  end
end

window = MyWindow.new
window.show
