require './game_object_helpers'
class AngryPlant
  attr_reader :center_x, :center_y, :radius, :is_happy
  attr_accessor :speed
  include GameObjectHelpers

  def initialize
    @frame_count = 0
    @speed = 3
    @x = rand(0..MyWindow::WIDTH)
    @y = rand(0..MyWindow::HEIGHT)
    @z = 1
    @scale = 0.1
    @angry_image_1 = Gosu::Image.new("images/angryplant_1.png")
    @angry_image_2 = Gosu::Image.new("images/angryplant_2.png")
    @happy_image = Gosu::Image.new("images/happyplant.png")
    @height = @angry_image_2.height
    @width = @angry_image_2.width
    @radius = @width * @scale / 2
    @center_offset = (@height * @scale) / 13
    @is_happy = false
    recalc_center
    do_not_go_off_screen
  end

  def draw
    if @is_happy
      @happy_image.draw(@x, @y, @z, @scale, @scale)
    else
      if (@frame_count % 16).between?(0, 7)
        @angry_image_2.draw(@x, @y, @z, @scale, @scale)
      else
        @angry_image_1.draw(@x, @y, @z, @scale, @scale)
      end
    end
  end

  def update
    if ((@frame_count % 16).between?(0, 3)) && @is_happy == false
      @heading_x = rand(-@speed..@speed)
      @heading_y = rand(-@speed..@speed)
    elsif @is_happy == false
      @x += @heading_x
      @y += @heading_y
    end
    @frame_count += 1

    recalc_center
    do_not_go_off_screen
  end

  def make_happy
    @is_happy = true
  end

end
