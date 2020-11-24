package q4;

public privileged aspect Change {
//	q4.2.1
	declare parents: Circle implements Shape;
	declare parents : Rectangle implements Shape;
	
	public String Circle.getName() {
		return "Circle";
	}
	public String Rectangle.getName(){
		return "Rectangle";
	}
	
//	q4.2.2
	public String Circle.toString(){
		return "A Circle with a radius of" +this.radius + " is represented as the string \"(Circle(" +this.radius + ").";
	}
	
	public String Rectangle.toString(){
		return "A Rectangle with a width of" +this.width+ " and a height of "+this.height +" is represented as the string \"(Rectangle(" +this.width+ ","+this.height +").";
	}
	
//	4.2.3
	pointcut monitorGetAreaCir(Circle c): execution(double Circle.getArea()) && this(c);
	
	double around(Circle c): monitorGetAreaCir(c){
//		this part is for 4.2.4
		if(c.radius <= 0)
			return 0;
		else
			return Math.pow(c.radius, 2) * Math.PI;
	}
	
//	4.2.4
	pointcut monitorgetPerimeterRec(Rectangle r): execution(double Rectangle.getPerimeter())  && this(r);
	pointcut monitorgetAreaRec(Rectangle r): execution(double Rectangle.getArea()) && this(r);
	pointcut monitorgetPerimeterCir(Circle c): execution(double Circle.getPerimeter()) && this(c);
	
	double around (Rectangle r): monitorgetPerimeterRec(r) || monitorgetAreaRec(r){
		if(r.width <= 0 || r.height <= 0)
			return 0;
		else
			return proceed(r);
	}
	
	double around (Circle c): monitorgetPerimeterCir(c){
		if(c.radius <= 0)
			return 0;
		else
			return proceed(c);
	}
	
//	4.2.5
	private static int ids = 0;
	pointcut constructorCir(Circle c): execution(Circle.new(double)) && this(c);
	pointcut constructorRec(Rectangle r): execution(Rectangle.new(double, double)) && this(r);
	
	private int Circle.id;
	private int Rectangle.id;
	
	void around(Circle c): constructorCir(c){
		ids++;
		c.id = ids;
	}
	void around(Rectangle r): constructorRec(r){
		ids++;
		r.id = ids;
	}
	
	public int Circle.getId(){
		return this.id;
	}
	public int Rectangle.getId(){
		return this.id;
	}
	
	
}
