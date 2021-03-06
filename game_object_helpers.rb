module GameObjectHelpers

  def do_not_go_off_screen
    if @x < 0
      @x = 0
    end
    if @y < 0
      @y = 0
    end
    if @x > MyWindow::WIDTH - (@width * @scale)
      @x = MyWindow::WIDTH - (@width * @scale)
    end
    if @y > MyWindow::HEIGHT - (@height * @scale)
      @y = MyWindow::HEIGHT - (@height * @scale)
    end
  end

  def recalc_center
    @center_x = @x + (@width * @scale * 0.5)
    @center_y = @y + (@height * @scale * 0.5) - @center_offset
  end

end
