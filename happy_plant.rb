class HappyPlant

  def initialize
    @plant_z = 0
    @image = Gosu::Image.new("plant.png")
    @height = @image.height
    @width = @image.width
  end

  def draw(angry_plant)
    @image.draw((angry_plant.center_x - (@width * 0.5)), (angry_plant.center_y - (@height * 0.5)), @plant_z)
  end

  def update
  end
end
