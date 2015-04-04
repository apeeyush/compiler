//This program is to test for recurrsion and for return-statements within blocks of methods
class Program
{
    int helloworld(int a,int b)
    {
        if(a==b*b)
        {
            return a;
        }
        return helloworld(a+=1,b);
    }

    int Main(int a)
    {
        int i=4,j=5;
        int c = i= 3;
        if(1==2)
        {
            console.writeline(3+helloworld(i,j));
        }
        else
        {
            console.writeline(j);
        }
        return 0;
    }
}