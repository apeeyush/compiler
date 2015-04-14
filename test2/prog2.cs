//Bubble Sort,for loop
class Program
{
    void Main()
    {
        int i,j;
        int [15]arr = {1,2,3,4,5,1,4,-1,6,10,-113,32,2,22,24325};
        for(i=0;i<15;i=i+1)
        {
            for(j=i+1;j<15;j=j+1)
            {
                if(arr[i]>arr[j])
                {
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
                else
                {
                    if(1==1)
                    {
                        continue;
                    }
                }
            }
        }
        for(i=0;i<15;i=i+1)
        {
            console.writeline(arr[i],"\n");
        }
    }
}