require 'ruby-processing'
class FirstSketch < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
  		stroke(255, 255, 255)
  		fill(255, 64, 64)
	  if @i.nil? || @i == 200 
	 	 @i = 0
	  end 
	 	 @i = @i + 2
	 	 fill(rand(@i), rand(@i), rand(@i))
	 	 oval(100, 100, rand(@i), rand(@i))
  end 
end

FirstSketch.new(:width => 400, :height => 400) 