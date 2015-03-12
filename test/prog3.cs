using System;

namespace DecisionMaking
{
    
    class Program
    {
        static void Main(string[] args)
        {

            int a = 100;

            if (a < 20)
            {
                Console.WriteLine("a is less than 20");
            }
            else
            {
                Console.WriteLine("a is not less than 20");
            }
            Console.WriteLine("value of a is : {0}", a);
            Console.ReadLine();
        }
    }
}
