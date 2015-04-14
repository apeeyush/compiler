//Class objects
class B
{
    int b;
    int fun1()
    {
        return b*b;
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
    void Main()
    {
        /* local variable definition */
        int a = 10;
        B temp = new B();
        /* while loop execution */
        while (a < 20)
        {
            temp.b = a;
            console.writeline(temp.fun1()," ");
            a+=1;
        }
        char x;
        console.writeline("\nEnter a character:\n");
        console.readline(x);
        console.writeline(x,"\n");
    }
}


