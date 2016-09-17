class GameOver

  def initialize
    @image = Gosu::Image.from_text("You Win!", 50, align: :center)
    @height = @image.height
    @width = @image.width
    @x = ((MyWindow::WIDTH / 2) - (@width / 2))
    @y = ((MyWindow::HEIGHT / 2) - (@height / 2))
    @z = 0
  end

  def draw
    @image.draw(@x, @y, @z)
  end

  def update

  end

end
