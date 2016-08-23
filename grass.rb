class Grass

	def initialize
		@image = Gosu::Image.new("images/grass.png")
	    @height = @image.height
    	@width = @image.width
    	@rowcount = 0
    	@columncount = 0
    	@totalrows = (MyWindow::HEIGHT / @height) + 1
    	@totalcolumns = (MyWindow::WIDTH / @width) + 1
    	@xcoords = []
    	@ycoords = []

		until @rowcount > @totalrows do
			until @columncount > @totalcolumns do
				@xcoords.push(@columncount*@width)
				@ycoords.push(@rowcount*@height)
				@columncount += 1
			end
			@columncount = 0
			@rowcount += 1
		end

   	end

	def draw
		@ycount = 0
		@xcoords.each do |x|
			y = @ycoords[@ycount].to_i
			@image.draw(x, y, 0)
			@ycount += 1
		end
	end

	def update
	end
end
