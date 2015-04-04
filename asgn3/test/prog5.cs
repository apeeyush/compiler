//This is to check do-while and conditional constructs within loops
class A
{
    void Main(int a)
    {
        int i=0,j=1;
        do
        {
            switch(j)
            {
                case 1:
                    if(j<0)
                    {
                        console.writeline(-j);
                    }
                    else
                    {
                        continue;
                        console.writeline(j);
                    }
                    break;
                case 2:
                    if(j<0)
                    {
                        console.writeline(-j*2);
                    }
                    else
                    {
                        console.writeline(j*2);
                        
                    }
                    break;
            }
            continue;
            i+=1;
        }while(i<20);
    }
}