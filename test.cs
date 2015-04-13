
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
=======
>>>>>>> 73cd5c9dbdde694b6e9cc58cd3a0a462b0410f5d
class B{
    int [6] a;

    void printc(int index)
    {
        a[1]=5;
        console.writeline(a[index]);
        return;
    }
}
class A
{
    int Main()
    {
        int a=1;
        B b = new B();
        b.printc(a);
        return 0;
    }
}
