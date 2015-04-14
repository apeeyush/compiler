//This program is to test for recurrsion and for return-statements within blocks of methods
class Program
{
    int helloworld(int a,int b)
    {
        if(a==b*b)
        {
            return a;
        }
        return helloworld(a=a+1,b);
    }

    int Main()
    {
        int a=5,b=5;
        console.writeline(helloworld(a,b));
        return 0;
    }
}