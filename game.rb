require 'hasu'
Hasu.load './angry_plant.rb'
Hasu.load './water.rb'
Hasu.load './grass.rb'
Hasu.load './game_over.rb'
require 'pry'

class MyWindow < Hasu::Window
  HEIGHT = 480
  WIDTH = 640

  def initialize
    super(WIDTH, HEIGHT)
  end

  def reset
    self.caption = 'Make the plant happy!'
    @angry_plants = []
    @angry_plants << AngryPlant.new
    @water = Water.new
    @grass = Grass.new
    @game_over = GameOver.new
    @squishiness_factor = 0.7
    @happy_plants_required = 10
    @victory = false
  end

  def draw
    if @victory
      self.caption = 'Congratulations!'
      @game_over.draw
    else
      @grass.draw
      @angry_plants.each do |plant|
        if !are_colliding?(plant, @water)
          @water.draw
        end
        plant.draw
      end
    end
  end

  def update
    @angry_plants.each do |plant|
      if are_colliding?(plant, @water)
        if !plant.is_happy
          @angry_plants << AngryPlant.new
          plant.make_happy
          @water.x = 20
          @water.y = 20
          @angry_plants.last.speed += 3
        end
      end
      plant.update
    end
    @water.update
    @happiness_number = @angry_plants.select{|plant| plant.is_happy}.count
    if @happiness_number >= @happy_plants_required
      @victory = true
    end
  end

  def are_colliding?(object1, object2)
    Gosu::distance(object1.center_x, object1.center_y, object2.center_x, object2.center_y) < (object2.radius + object1.radius) * @squishiness_factor
  end
end

MyWindow.run
