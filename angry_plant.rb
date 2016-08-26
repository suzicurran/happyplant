class AngryPlant
attr_reader :angry_x, :angry_y, :center_x, :center_y, :radius # :ishappy

  def initialize
    @frame_count = 0
    @x = 20
    @y = 20
    @z = 1
    @scalex = 0.1
    @scaley = 0.1
    @AngryPlant1 = Gosu::Image.new("images/angryplant_1.png")
    @AngryPlant2 =Gosu::Image.new("images/angryplant_2.png")
    @height = @AngryPlant2.height
    @width = @AngryPlant2.width
    @ishappy = false
    @radius = @width * @scalex / 2
  end

  def draw
    if (@frame_count % 16).between?(0, 7)
      @AngryPlant2.draw(@x, @y, @z, @scalex, @scaley)
    else
      @AngryPlant1.draw(@x, @y, @z, @scalex, @scaley)
    end
  end

  def update
    if ((@frame_count % 16).between?(0, 3)) # and (@ishappy == false)
      @x += rand(-5..5)
      @y += rand(-5..5)
    end
    @frame_count += 1
    
    @center_x = @x + (@width * @scalex * 0.5)
    @center_y = @y + (@height * @scaley * 0.5)
    @angry_x = @x
    @angry_y = @y
    do_not_go_off_screen
  end

  def do_not_go_off_screen
    if @x < 0
      @x = 0
    end
    if @y < 0
      @y = 0
    end
    if @x > MyWindow::WIDTH - (@width * @scalex)
      @x = MyWindow::WIDTH - (@width * @scalex)
    end
    if @y > MyWindow::HEIGHT - (@height * @scaley)
      @y = MyWindow::HEIGHT - (@height * @scaley)
    end
  end

end
