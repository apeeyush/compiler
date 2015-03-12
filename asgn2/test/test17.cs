class NumberManipulator
{
    public int factorial(int num)
    {
        /* local variable declaration */
        int result;

        if (num == 1)
        {
            return 1;
        }
        else
        {
            result = factorial(num - 1) * num;
            return result;
        }
    }

    void Main()
    {
        NumberManipulator n = new NumberManipulator();
        //calling the factorial method
        Console.WriteLine("Factorial of 6 is : {0}", n.factorial(6));
        Console.WriteLine("Factorial of 7 is : {0}", n.factorial(7));
        Console.WriteLine("Factorial of 8 is : {0}", n.factorial(8));
        Console.ReadLine();

    }
}

