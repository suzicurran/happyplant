class HappyPlant

  def initialize
    @z = 1
    @scalex = 0.1
    @scaley = 0.1
    @image = Gosu::Image.new("happyplant.png")
    @height = @image.height
    @width = @image.width
  end

  def draw(angry_plant)
    @image.draw((angry_plant.angry_x), (angry_plant.angry_y), @z, @scalex, @scaley)
  end

  def update
  end
end
