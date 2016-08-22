class AngryPlant
attr_reader :center_x, :center_y
  def initialize
    @frame_count = 0
    @x = 40
    @y = 40
    @z = 0
    @scalex = 0.1
    @scaley = 0.1
    @AngryPlant1 = Gosu::Image.new("images/angryplant_1.png")
    @AngryPlant2 =Gosu::Image.new("images/angryplant_2.png")
    @height = @AngryPlant2.height
    @width = @AngryPlant2.width

  end

  def draw
    if (@frame_count % 16).between?(0, 7)
      @AngryPlant2.draw(@x, @y, @z, @scalex, @scaley)
    else
      @AngryPlant1.draw(@x, @y, @z, @scalex, @scaley)
    end
  end

  def update
    @center_x = @x + (@width * @scalex * 0.5)
    @center_y = @y + (@height * @scaley * 0.5)
    @x += rand(-5..5)
    @y += rand(-5..5)
    @frame_count += 1
  end

end
