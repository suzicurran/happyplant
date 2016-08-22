class Water
  attr_reader :center_x, :center_y

  def initialize
    @x = 0
    @y = 0
    @z = 0
    @scalex = 0.5
    @scaley = 0.5
    @image = Gosu::Image.new("images/water.png")
    @height = @image.height
    @width = @image.width
    @speed = 2
  end

  def draw
    @image.draw(@x, @y, @z, @scalex, @scaley)
  end

  def update
    if Gosu::button_down? Gosu::KbLeft
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
  end
end
