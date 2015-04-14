//Switch case,check of control flow for break statements
class A
{
    int Main()
    {
        int i,j=1;
        int [5]arr = {1,53,5,3,1};
        for(i=0;i<5;i=i+1)
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
                        console.writeline(arr[i]," ");
                    }
                    break;
                case 2:
                    if(j<0)
                    {
                        console.writeline(-j*2);
                    }
                    else
                    {
                        console.writeline(arr[i]*2," ");
                    }
                    break;
            }
        }
        console.writeline("\n");
    }
}