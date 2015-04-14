//This program is to test for recurrsion and for return-statements within blocks of methods,also do-while
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
        int a=0,b=5;
        bool [5]aa = {true,true,false,false,true};
        do
        {
            console.writeline(helloworld(a,b),"\n");
            aa[a] = !false;
            if(false || true)
            {
                console.writeline(aa[a],"\n");
            }
            a+=1;
            a = +a;
        }while(a<b);
        return 0;
    }
}