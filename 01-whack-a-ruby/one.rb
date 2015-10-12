require 'gosu'

class WhackARuby < Gosu::Window
  
  def initialize
    super 800, 600
    self.caption = "Whack A Ruby!"
    @image = Gosu::Image.new "ruby.png"
    @x = 200
    @y = 200
    @width = 50
    @height = 43
    @velocity_x = 5
    @velocity_y = 5
    @visible = 0
  end

  def update
    @x += @velocity_x
    @y += @velocity_y
    @velocity_x *= -1 if x_offscreen?
    @velocity_y *= -1 if y_offscreen?
    update_visibility
  end

  def draw
    @image.draw(@x - @width/2, @y - @height/2, 1) if visible?
  end

  def x_offscreen?
    @x + @width / 2 > self.width || @x - @width / 2 < 0
  end

  def y_offscreen?
    @y + @height / 2 > self.height || @y - @height / 2 < 0
  end

  def update_visibility
    @visible -= 1
    @visible = 30 if @visible < -10 && rand < 0.01
  end

  def visible?
    @visible > 0
  end
end

WhackARuby.new.show
