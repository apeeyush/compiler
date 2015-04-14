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
    int ab;
    void fun(){
        ab = 1;
        console.writeline(ab,"\n");
    }
}
class A
{
    int Main()
    {
        string mystring = "asdf";
        console.writeline(mystring);
        console.readline(mystring);
        console.writeline(mystring);
        return 0;
    }
}
