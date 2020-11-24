require_relative 'q1.rb'
info = ''
#opening file and reading it
File.open("q2_info.txt").each { |line| info += line}

#spliting all the info in to an array
info_array = info.split
c = info_array.length

# array to get info of all the shapes initialized
all_shapes = Hash.new("shape")
count = 0

#creating all the object and printing it 
until count >= c-1
  name = info_array[count]
  #if Shape, creat Shape object and past it to the array 
  if name == "shape"
    s1 = Shape.new()
    all_shapes[count] = s1
  #if circle, creat circle object and past it to the array 
  elsif name == "circle"
    count +=1
    radius = info_array[count].to_i
    #error message is radius is negative
    if radius < 0 
      puts "Error invalid circle"
    else 
      c1 = Circle.new(radius)
      all_shapes[count] = c1
    end
  #if rectangle, creat rectangle object and past it to the array 
  elsif name == "rectangle"
    count +=1
    height = info_array[count].to_i
    count +=1
    width = info_array[count].to_i
    #error message is the height or the width is negative
    if height < 0 or width <0
      puts "Error invalid Rectangle"
    else
      r1 = Rectangle.new(height, width)
      all_shapes[count] = r1
    end
  #if ellipse, creat ellipse object and past it to the array 
  elsif name == "ellipse"
    count += 1
    major = info_array[count].to_i
    count +=1
    minor = info_array[count].to_i
    #error message is the major or minor value is negative
    if major < 0 or minor < 0 
      puts "Error invalid ellipse with semi-major #{major} and semi-minor #{minor}"
    else
      e1 = Ellipse.new(major, minor)
      all_shapes[count] = e1
    end
  #error mesaage is it is not a shape
  else
    puts "#{name} is not a Shape "
  end  
  count +=1
end

#print all the info all the shapes
all_shapes.each do |key, value|
  puts value.print
end


#question 3
c_shape = 0
c_circle = 0
c_rectangle = 0
c_ellipse = 0
#loop to find out the number of eash shapes and see it is subclass of Shape
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

#print the number of each shape
puts "Statistics\n\tShape(s): #{c_shape}\n\tRectangle(s): #{c_rectangle}"
puts "\tCircle(s): #{c_circle}\n\tEllipse(s): #{c_ellipse}"
