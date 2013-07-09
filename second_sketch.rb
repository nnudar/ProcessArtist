require 'ruby-processing'
class FirstSketch < Processing::App

	def setup
   	 background(0, 0, 0)
	end
	def draw
	  if @fill.nil? || @fill == 255
	    @fill = 1
	  else
	    @fill = @fill + 1
	  end

	  fill(rand(@fill), 0, 0)
	  rect(rand(250), rand(250), 100, 100)
	end
end

FirstSketch.new(:width => 400, :height => 400) 
