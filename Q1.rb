class Shape
  @name
  @perimeter
  @area
  def initialize
    @name = self.class
    @perimeter = -1
    @area = -1
  end
  def print()
    puts "#@name {Perimeter: undefined, Area: undefined}"
  end
  def perimeter()
    return nil
  end
  def area()
    return nil
  end
end

# s = Shape.new
# puts s.class
# s.print()



class Circle < Shape
  @radius
  def initialize(radius)
    super()
    @radius = radius
    @perimeter = Math::PI * @radius
    @area = Math::PI * @radius * @radius
  end
  def print()
    puts "#@name {Perimeter: #@perimeter, Area: #@area}"
  end
  def perimeter()
    return @perimeter
  end
  def area()
    return @area
  end
end

# c = Circle.new(2)
# c.print()

class Rectangle < Shape
  @height
  @width
  def initialize(h, w)
    super()
    @area = h*w
    if @area > 0
      @perimeter = (@height = h)*2 + (@width = w)*2
    else
      @perimeter = 0
    end
  end
  def print()
    puts "#@name {Perimeter: #@perimeter, Area: #@area}"
  end
  def perimeter()
    return @perimeter
  end
  def area()
    return @area
  end
end

# r = Rectangle.new(2, 3)
# r.print

class Ellipse < Shape
  @a
  @b
  def initialize(a, b)
    super()
    @area = Math::PI * (@a=a) * (@b=b)
  end
  def print()
    puts "#@name {Perimeter: undefined, Area: #@area}"
  end
  def area()
    return @area
  end
  def eccentricity
    return eccentricity = Math.sqrt(@a*@a + @b*@b)
  end
end

# e = Ellipse.new(3, 5)
# e.print
# puts "Eccentricity: %0.2f" % e.eccentricity