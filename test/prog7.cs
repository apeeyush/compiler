using System;

namespace Loops
{
    
    class Program
    {
        static void Main(string[] args)
        {
            /* for loop execution */
            for (int a = 10; a < 20; a = a + 1)
            {
                Console.WriteLine("value of a: {0}", a);
            }
            Console.ReadLine();
        }
    }
} 
