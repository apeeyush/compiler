class D{
    int n;
    int [10]arr;
    void setD()
    {
        n = 10;
        int i;
        for(i=0;i<n;i+=1)
        {
            arr[i]  = -n -i;
        }
    }
}
class C:D{
    void cisworking()
    {
        int i,j;
        for(i=0;i<n;i+=1)
        {
            for(j=i+1;j<n;j+=1)
            {
                if(arr[i]>arr[j])
                {
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }
    }
}
class B:C{
    void fun()
    {
        int i;
        for(i=0;i<n;i+=1)
        {
            console.writeline(arr[i],"\n");
        }
    }
}
class A
{
    int Main()
    {
        B temp = new B();
        temp.setD();
        temp.cisworking();
        temp.fun();
        return 0;
    }
}
