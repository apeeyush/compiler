//This program is to test for recurrsion and for return-statements within blocks of methods,also do-while
class Program
{
    char helloworld(int a,int b)
    {
        if(a==b*b)
        {
            return 'c';
        }
        //return helloworld(a=a+1,b);
        return 'e';
    }

    int Main()
    {
        int a=0,b=5;
        bool [5]aa = {true,true,false,false,true};
        char [5]dd = {'a','b','c','d','e'};       
        int [5]cc = {1,2,3,4,5};
        do
        {
            console.writeline(helloworld(a,b),"\n");
            aa[a] = !false;
            if(false || true)
            {
                console.writeline(aa[a]," ",dd[a],"\n");
            }
            a+=1;
            a = +a;
        }while(a<b);
        dd[0] = 'c';
        //console.writeline(dd[0],"\n");
        //aa[0] = cc[0]>0&&cc[1]>0;
        //console.writeline(aa[0],"\n");
        return 0;
    }
}