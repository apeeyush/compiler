//Binary-search
class A
{
    int [10]arr = {1,2,3,4,5,6,7,8,9,10};
    int binary_search(int l,int r,int key)
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
            return binary_search(l,m-1,key);
        }
        else
        {
            return binary_search(m+1,r,key);   
        }
    }

    int Main(int a)
    {
        a = binary_search(0,9,8);
        console.writeline(a);
    }   
}





