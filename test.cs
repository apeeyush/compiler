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
