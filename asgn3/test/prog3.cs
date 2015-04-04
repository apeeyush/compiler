class A
{
    int helloworld(int a)
    {
        if(a==2)
        {
            return 1;
            helloworld(3);
        }
        else
        {
            return 2;
        }
    }
    int Main(int a)
    {
        int i,j=1;
        int [5]arr = {1,53,5,3,1};
        for(i=0;i<20;i+=1)
        {
            continue;
            switch(j)
            {
                case 1:
                    if(j<0)
                    {
                        console.writeline(-j);
                        helloworld(2);
                    }
                    else
                    {
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
        }
    }
}