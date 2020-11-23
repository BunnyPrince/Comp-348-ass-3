require_relative 'q1.rb'
info = ''
File.open("q2_info.txt").each { |line| info += line}

info_array = info.split
c = info_array.length
all_shapes = Hash.new("shape")
count = 0
until count >= c-1
  name = info_array[count]
  if name == "shape"
    s1 = Shape.new()
    all_shapes[count] = s1
    puts s1.print

  elsif name == "circle"
    count +=1
    radius = info_array[count].to_i
    if radius < 0 
      puts "Error invalid circle"
    else 
      c1 = Circle.new(radius)
      all_shapes[count] = c1
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
      all_shapes[count] = r1
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
      all_shapes[count] = e1
      puts e1.print
    end
  else
    puts "h"
  end  
  count +=1
end

c_shape = 0
c_circle = 0
c_rectangle = 0
c_ellipse = 0
all_shapes.each do |key, value|
  if value.class == Shape
    c_shape += 1
  elsif value.class == Circle
    c_circle += 1
    if value.class < Shape
      c_shape += 1
    end
  elsif value.class == Rectangle
    c_rectangle += 1
    if value.class < Shape
      c_shape += 1
    end
  else 
    c_ellipse += 1
    if value.class < Shape
      c_shape += 1
    end
  end
end

puts "Statistics\n\tShape(s): #{c_shape}\n\tRectangle(s): #{c_rectangle}"
puts "\tCircle(s): #{c_circle}\n\tEllipse(s): #{c_ellipse}" 
