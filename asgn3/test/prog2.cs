//Bubble Sort
class Program
{
    int Main(int a)
    {
        int i,j;
        int [5]arr = {1,2,3,4,5};
        for(i=0;i<20;i+=1)
        {
            for(j=i+1;j<20;j+=1)
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
    }
}