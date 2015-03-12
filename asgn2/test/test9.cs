class Rectangle
{
   private int length;
   private int width;
   public void Rectangle( int a, int b)
   {
      length = a;
      width = b;
   }
   public int area ()
   { 
      Console.WriteLine("Rectangle class area :");
      return (width * length); 
   }
}

class RectangleTester
{
   void Main()
   {
      Rectangle r = new Rectangle(10, 7);
      double a = r.area();
      Console.WriteLine("Area: {0}",a);
      Console.ReadKey();
   }
}
