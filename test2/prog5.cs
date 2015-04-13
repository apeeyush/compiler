//Tower of Hanoi
class A
{
    void TOH(int num, char x, char y, char z) 
    {
        if (num > 0)
        {
            TOH(num - 1, x, z, y);
            console.writeline("\n",x,"->",y);
            TOH(num-1, z, y, x);
        }
    } 
    int Main() 
    {
        int num;
        console.writeline("Enter number of plates:\n");
        console.readline(num);
        TOH(num, 'A', 'B', 'C');
        console.writeline("\n");
        return (0);
    }
}