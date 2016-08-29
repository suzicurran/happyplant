require './game_object_helpers'

class Water
  attr_reader :center_x, :center_y, :radius
  include GameObjectHelpers

  def initialize
    @x = 0
    @y = 0
    @z = 1
    @scale = 1
    @image = Gosu::Image.new("images/water.png")
    @height = @image.height
    @width = @image.width
    @speed = 3 #should be divisible by 3
    @diagonal_pace = @speed / 3 * 2
    @radius = @width * @scale / 2
    @center_offset = 0
    recalc_center
  end

  def draw
    @image.draw(@x, @y, @z, @scale, @scale)
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
    recalc_center
    do_not_go_off_screen
  end

end
