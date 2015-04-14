class D{
    int d;
    void setD(){
        d = 20;
    }
}
class C:D{
    int a;
    void cisworking(){
        a = 1000;
        console.writeline(1000,"\n");
    }
}
class B:C{
    private int ab;
    void fun(){
        ab = 1;
        console.writeline(ab,"\n");
    }
}
class A
{
    int Main()
    {
        int [3]na={8,9,10};
        B b = new B();
        b.fun();
        b.cisworking();
        console.writeline(b.a,"\n");
        b.setD();
        console.writeline(b.d);
        return 0;
    }
}
