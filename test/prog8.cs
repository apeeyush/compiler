//Double, should not allow readline function on constants
class Program
{
    void Main(int args)
    {
        const double pi = 3.14159; // constant declaration 
        double r;
        console.writeline(r);
        double areaCircle = pi * r * r;
        console.writeline(r,areaCircle);
        console.readline(pi);
    }
}
