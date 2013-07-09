require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
    @size = 10
    @queue = ""
  end

  def draw
    
  end

  def key_pressed
  	warn "A key was pressed! #{key.inspect}" 

  	if key == "+"
      warn "You pressed plus"
      @size += 100
    elsif key == "-"
      warn "You pressed minus"
      @size -= 100
    elsif key == "c"
      warn "Erase!"
      background(0, 0, 0)
    elsif key != "\n"
  		@queue = @queue + key
  	else
  		warn "Time to run the command: #{@queue}"
      @shape = @queue.chomp 
  		run_command(@queue)
  		@queue = ""
  	end
  end

  def run_command(command)
  	puts "Running command #{command}" 
  	if command.start_with?("b")
  		formatted = command.slice(1, command.length - 1) 
  		puts formatted 
  		colors = formatted.split(",")
  		puts colors
  		background(colors[0].to_i, colors[1].to_i, colors[2].to_i)
  	end 
  end


  def mouse_dragged
    stroke(rand(255), rand(255), rand(255))
    fill(rand(255), rand(255), rand(255), rand(150))
    rect(mouse_x, mouse_y, @size, @size)

    case @shape
    when "s1" then rect(mouse_x, mouse_y, @size, @size)
      warn "Using brush 1"
    when "s2" then rect(mouse_x, mouse_y, @size * 2, @size *2)
      warn "Using brush 2"
    when "s3" then oval(mouse_x, mouse_y, @size, @size)
      warn "Using brush 3"
    when "s4" then triangle(mouse_x, mouse_y, @size, @size, @size, @size)
      warn "Using brush 4"
    else 
      warn "I don't know that command"
    end 

  end

  def mouse_released
    warn "Released"
   # background(255, 255, 255)
  end


end

ProcessArtist.new(:width => 600, :height => 600,
  :title => "ProcessArtist", :full_screen => false)
