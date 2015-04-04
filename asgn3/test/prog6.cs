//Class inheritence, also checks for two functions with same name in different classes
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
            console.writeline(a);
            a+=1;
        }
        char x;
        console.readline(x);
    }
}

class B:Program{
    int b;
    int fun1(int b)
    {
        return b;
    }
    int fun2(int c)
    {
        Program a = new Program();
        int x;
        int x_new = 5;
        int adss = 4 < 2 ? 1 : 2;
        x_new = a.fun1(4)+fun1(324)+fun3(34);
        a.Main(2);
        console.writeline(fun1(2));
        return x_new;
    }
}
