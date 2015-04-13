class A
{
    int fact(int a)
    {
        if(a==1)
        {
            return 1;
        }
        return fact(a-1)*a;
    }

    int Main()
    {
        int [3]na={8,9,10};
        int a=0, i=0;
        for(i=0;i<3;i=i+1){
            a = a + na[i];
            console.writeline(fact(na[i]));
            console.writeline("\n");
        }
        console.writeline(a);
        return 0;
    }
}
/*
class B{
    int c;
    int fact(int a){
        if (a==0){
            return 1;
        }
        else{
            return a*fact(a-1);
        }
    }

    void printc(int a)
    {
        c = fact(a)
        return;
    }
}
class A
{
    int Main()
    {
        int a=10, i=0;
        B b = new B();
        b.printc(a);
        a = b.c;
        console.writeline(a);
        return 0;
    }
}
*/
