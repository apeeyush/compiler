//Binary-search
class Binary
{
    int [10]arr = {1,2,3,4,5,6,7,8,9,10};
    int b;
    int binary(int l,int r,int key)
    {
        if(l>r)
        {
            return -1;
        }
        int m = (l+r)/2;
        if(l==r)
        {
            //return (arr[m]==key?m:-1);
            if(arr[m]==key)
            {
                return m;
            }
            else
            {
                return -1;
            }
        }
        if(arr[m]==key)
        {
            return m;
        }
        else if(arr[m]>key)
        {
            return binary(l,m-1,key);
        }
        else
        {
            return binary(m+1,r,key);   
        }
    }    
}
class A
{
    int Main(int a)
    {
        Binary temp = new Binary();
        int i;
        for(i=0;i<10;i=i+1)
        {
            console.writeline(temp.arr[i],"\n");
        }
        //a = temp.binary(0,9,8);
        console.writeline(a,"\n");
    }   
}





