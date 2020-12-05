require_relative 'q1.rb'
info = ''
#opening file and reading it
File.open("q2_info.txt").each { |line| info += line}

#spliting all the info in to an array
info_array = info.split
c = info_array.length

# array to get info of all the shapes initialized
numShapes = Hash.new()
numShapes["Shape"] = 0
numShapes["Rectangle"] = 0
numShapes["Circle"] = 0
numShapes["Ellipse"] = 0
count = 0

#creating all the object and printing it 
until count >= c-1
  name = info_array[count]
  #if Shape, creat Shape object and past it to the array 
  if name == "shape"
    numShapes["Shape"] += 1
    s1 = Shape.new()
    puts s1.print
  #if circle, creat circle object and past it to the array 
  elsif name == "circle"
      numShapes["Shape"] += 1
      numShapes["Circle"] += 1
    count +=1
    radius = info_array[count].to_i
    #error message is radius is negative
    if radius < 0 
      puts "Error invalid circle with radius #{radius}\n\n"
    else 
      c1 = Circle.new(radius)
      puts c1.print
    end
  #if rectangle, creat rectangle object and past it to the array 
  elsif name == "rectangle"
      numShapes["Shape"] += 1
      numShapes["Rectangle"] += 1
    count +=1
    height = info_array[count].to_i
    count +=1
    width = info_array[count].to_i
    #error message is the height or the width is negative
    if height < 0 or width <0
      puts "Error invalid Rectangle with height #{height} and width #{width}\n\n"
    else
      r1 = Rectangle.new(height, width)
      puts r1.print
    end
  #if ellipse, creat ellipse object and past it to the array 
  elsif name == "ellipse"
      numShapes["Shape"] += 1
      numShapes["Ellipse"] += 1
    count += 1
    major = info_array[count].to_i
    count +=1
    minor = info_array[count].to_i
    #error message is the major or minor value is negative
    if major < 0 or minor < 0 
      puts "Error invalid ellipse with semi-major #{major} and semi-minor #{minor}\n\n"
    else
      e1 = Ellipse.new(major, minor)
      puts e1.print
    end
  #error mesaage is it is not a shape
  else
    puts "#{name} is not a Shape\n\n "
  end  
  count +=1
end




#question 3
numShapes.each do |key, value|
  puts "#{key}(s): #{value}"
end
