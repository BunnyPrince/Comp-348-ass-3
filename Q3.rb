require './Q1'

content = ""

File.open("sample.txt").each { |line|
  content += line
}

list = content.split()
size_content = list.size

shapes = Array.new()

# circles = Array.new()
# rectangles = Array.new()
# ellipses = Array.new()

# Iterate through list
i = 0
until i >= size_content
  # create shape -> 0 data
  if list[i] == "shape"
    shapes[shapes.length] = Shape.new()
    i += 1
  end

  # create circle object -> 1 data
  if list[i] == "circle"
    radius = list[i += 1].to_i
    if radius < 0
      puts "Error: negative radius"
    else
      shapes[shapes.length] = Circle.new(radius)
    end
    i += 1
  end

  # create rectangle -> 2 data
  if list[i] == "rectangle"
    height = list[i += 1].to_i
    width = list[i += 1].to_i
    if height < 0 or width < 0
      puts "Error: negative height or width"
    else
      shapes[shapes.length] = Rectangle.new(height, width)
    end
  end

  # create ellipse -> 2 data
  if list[i] == "ellipse"
    a = list[i += 1].to_i
    b = list[i += 1].to_i
    if a < 0 or b < 0
      puts "Error: negative axis"
    else
      shapes[shapes.length] = Ellipse.new(a,b)
    end
  end
  
  # comment next line out (testing reason)
  i += 1  
end

puts "List of shapes size: #{shapes.length}"

puts "\n==========================\n\n"

puts "Printing all shapes:"
numShapes = Hash.new()
numShapes["Shape"] = 0
numShapes["Circle"] = 0
numShapes["Rectangle"] = 0
numShapes["Ellipse"] = 0

shapes.each { |shape|
  shape.print
  if shape.kind_of? Shape
    numShapes["Shape"] += 1
  end
  if shape.instance_of? Circle
    numShapes["Circle"] += 1
  end
  if shape.instance_of? Rectangle
    numShapes["Rectangle"] += 1
  end
  if shape.instance_of? Ellipse
    numShapes["Ellipse"] += 1
  end
}

puts "\n==========================\n\n"

puts "Printing statistics:"

numShapes.each do |key, value|
  puts "#{key}(s): #{value}"
end

  

