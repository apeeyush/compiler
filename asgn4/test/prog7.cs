//Binary-search
class Binary
{
    int [10]arr;
    int b;
    void setarr()
    {
        int i;
        for(i=1;i<11;i=i+1)
        {
            arr[i-1]=i;
        }
        return;
    }
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
    int Main()
    {
        Binary temp = new Binary();
        int i,a;
        //temp.setarr();
        for(i=0;i<10;i=i+1)
        {
            temp.arr[i]=i+1;
        }
        for(i=0;i<10;i=i+1)
        {
            console.writeline(temp.arr[i],"\n");
        }
        a = temp.binary(0,9,8);
        console.writeline(a,"\n\n");
        
        Binary temp2 = temp;
        temp.arr[0]=0;
        Binary temp3 = temp2;
        temp3 = temp2;
        for(i=0;i<10;i=i+1)
        {
            console.writeline(temp3.arr[i],"\n");
        }
        a = temp3.binary(0,9,8);
        console.writeline(a,"\n");

    }   
}

/*
class B{
    int[10] nb;
    void fun(B b){
        console.writeline(b.nb[5]);
    }
}
class A
{
    int Main()
    {
        int [3]na={8,9,10};
        B b = new B();
        b.nb[5] = 6;
        b.fun(b);
        return 0;
    }
}
*/