class GameOver

  def initialize
    @image = Gosu::Image.from_text("You Win!", 50, align: :center)
    @reset_image = Gosu::Image.from_text("Press R to restart", 40, align: :center)
    @height = @image.height
    @width = @image.width
    @x = ((MyWindow::WIDTH / 2) - (@width / 2))
    @y = ((MyWindow::HEIGHT / 2) - (@height / 2))
    @z = 0
  end

  def draw
    @image.draw(@x, @y, @z)
    @reset_image.draw(MyWindow::WIDTH / 2 - @reset_image.width / 2, (MyWindow::HEIGHT / 2 - @reset_image.height / 2)+60, 0)
  end

  def update

  end

end
