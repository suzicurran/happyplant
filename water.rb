class Water
  attr_reader :center_x, :center_y

  def initialize
    @x = 0
    @y = 0
    @z = 1
    @scalex = 1
    @scaley = 1
    @image = Gosu::Image.new("images/water.png")
    @height = @image.height
    @width = @image.width
    @speed = 3 #should be divisible by 3
    @diagonal_pace = @speed / 3 * 2
  end

  def draw
    @image.draw(@x, @y, @z, @scalex, @scaley)
  end

  def update
    if Gosu::button_down? Gosu::KbLeft and Gosu::button_down? Gosu::KbUp
      @x -= @diagonal_pace
      @y -= @diagonal_pace
    elsif Gosu::button_down? Gosu::KbLeft and Gosu::button_down? Gosu::KbDown
      @x -= @diagonal_pace
      @y += @diagonal_pace
    elsif Gosu::button_down? Gosu::KbRight and Gosu::button_down? Gosu::KbUp
      @x += @diagonal_pace
      @y -= @diagonal_pace
    elsif Gosu::button_down? Gosu::KbRight and Gosu::button_down? Gosu::KbDown
      @x += @diagonal_pace
      @y += @diagonal_pace
    elsif Gosu::button_down? Gosu::KbLeft
      @x -= @speed
    elsif Gosu::button_down? Gosu::KbRight
      @x += @speed
    elsif Gosu::button_down? Gosu::KbUp
      @y -= @speed
    elsif Gosu::button_down? Gosu::KbDown
      @y += @speed
    end
    @center_x = @x + (@width * @scalex * 0.5)
    @center_y = @y + (@height * @scaley * 0.5)
    do_not_go_off_screen
  end

  def do_not_go_off_screen
    if @x < 0
      @x = 0
    end
    if @y < 0
      @y = 0
    end
    if @x > MyWindow::WIDTH - @width
      @x = MyWindow::WIDTH - @width
    end
    if @y > MyWindow::HEIGHT - @height
      @y = MyWindow::HEIGHT - @height
    end
  end

end
