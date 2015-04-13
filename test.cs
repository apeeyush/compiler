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
