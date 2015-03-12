class NumberManipulator
{
   public int FindMax(int num1, int num2)
   {
      /* local variable declaration */
      int result;

      if (num1 > num2)
         result = num1;
      else if(num1 < 2)
         result = num2;
      else
         result=nim1;

      return result;
   }
   void Main()
   {
      /* local variable definition */
      int a = 100;
      int b = 200;
      int ret;
      NumberManipulator n = new NumberManipulator();

      //calling the FindMax method
      ret = n.FindMax(a, b);
      Console.WriteLine("Max value is : {0}", ret );
      Console.ReadLine();
   }
}

