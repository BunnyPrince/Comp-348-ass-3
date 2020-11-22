include Math

class Shape
    @name
    @perimeter
    @area
    def initialize()
        @name = "Shape"
        @perimeter = "undefined"
        @area = "undefined"
    end 
    
    def print
        puts "#{@name}, perimeter: #{@perimeter}, area: #{@area}"
    end
    
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

class Circle < Shape
    
    def initialize (r)
        super()
        @radius = r
        setperimeter(perimeter)
        setarea(area)
        setname("Circle")
    end
    
    def perimeter
        return 2 * PI * @radius
    end
    
    def area
        return PI * @radius * @radius
    end
end

class Rectangle < Shape
    
    def initialize (h, w)
        super()
        @height = h
        @width = w
        setperimeter(perimeter)
        setarea(area)
        setname("Rectangle")
    end
    
    def perimeter
        return (2 * @height) + (2 * @width)
    end
    
    def area
        return @height * @width
    end
    
end

class Ellipse < Shape
    
    def initialize(sma, smi)
        super()
        @semimajor = sma
        @semiminor = smi
        setarea(area)
        setname("Ellipse")
    end
    
    def area
        return PI * @semimajor * @semiminor
    end
end
