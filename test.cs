class Program
{
    int Main()
    {
        int a=0,b=5;
        int [5]aa = {1,2,3,4,5};
        int [5]dd = {1,2,3,4,5};
        while(a<5)
        {
            aa[a] = ~3;
            if(true)
            {
                console.writeline(a,2,aa[a],"\n");
                console.writeline(a,2,dd[a],"\n");
                console.writeline(a,2,dd[a],"\n");
            }
            a+=1;
        }
        return 0;
    }
}
/*
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
*/