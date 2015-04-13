//Class inheritence, also checks for two functions with same name in different classes
class B
{
    int b;
    int fun1(int b)
    {
        return b;
    }
    int fun2(int c)
    {
        int x;
        int x_new = 5;
        int adss = 4 < 2 ? 1 : 2;
        return adss;
    }
}
class Program
{
    int fun1(int b)
    {
        return b;
    }
    int fun3(int b)
    {
        return b;
    }
    void Main(int args)
    {
        /* local variable definition */
        int a = 10;

        /* while loop execution */
        while (a < 20)
        {
            console.writeline(a," ");
            a+=1;
        }
        char x;
        console.writeline("\nEnter a character:\n");
        console.readline(x);
        console.writeline(x,"\n");
    }
}


