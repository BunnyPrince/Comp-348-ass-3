include Math

class Shape
    #variables
    @name
    @perimeter
    @area
    
    #constructor
    def initialize()
        @name = "Shape"
        @perimeter = "undefined"
        @area = "undefined"
    end 
    
    #print method
    def print
        puts "#{@name}, perimeter: #{@perimeter}, area: #{@area}"
    end
    
    #get and set methods
    def perimeter
        return nil
    end
    
    def area
        return nil
    end
    
    def setname(n)
        @name = n
    end
    def setperimeter(p)
        @perimeter = p
    end
    def setarea(a)
        @area = a
    end
end

#Circle class inheriting from Shape
class Circle < Shape
    #contstructor
    def initialize (r)
        super()
        @radius = r
        setperimeter(perimeter)
        setarea(area)
        setname("Circle")
    end
    #initializing the get methods
    def perimeter
        return 2 * PI * @radius
    end
    
    def area
        return PI * @radius * @radius
    end
end

#Rectanle class inheritiing from Shape
class Rectangle < Shape
    #constructor
    def initialize (h, w)
        super()
        @height = h
        @width = w
        setperimeter(perimeter)
        setarea(area)
        setname("Rectangle")
    end
    #initializing get methods
    def perimeter
        return (2 * @height) + (2 * @width)
    end
    
    def area
        return @height * @width
    end
    
end

#Ellipse class inheriting from Shape
class Ellipse < Shape
    #constructor
    def initialize(sma, smi)
        super()
        @semimajor = sma
        @semiminor = smi
        setarea(area)
        setname("Ellipse")
    end
    #initializing get method
    def area
        return PI * @semimajor * @semiminor
    end
end
