require_relative 'q1.rb'
info = ''
File.open("q2_info.txt").each { |line| info += line}

info_array = info.split
c = info_array.length
puts c
count = 0
until count >= c-1
  name = info_array[count]
  if name == "shape"
    s1 = Shape.new()
    puts s1.print

  elsif name == "circle"
    count +=1
    radius = info_array[count].to_i
    if radius < 0 
      puts "Error invalid circle"
    else 
      c1 = Circle.new(radius)
      puts c1.print
    end

  elsif name == "rectangle"
    count +=1
    height = info_array[count].to_i
    count +=1
    width = info_array[count].to_i

    if height < 0 or width <0
      puts "Error invalid Rectangle"
    else
      r1 = Rectangle.new(height, width)
      puts r1.print
    end

  elsif name == "ellipse"
    count += 1
    major = info_array[count].to_i
    count +=1
    minor = info_array[count].to_i

    if major < 0 or minor < 0 
      puts "Error invalid ellipse"
    else
      e1 = Ellipse.new(major, minor)
      puts e1.print
    end
  else
    puts "h"
  end  
  count +=1
end
