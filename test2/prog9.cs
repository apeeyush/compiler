//Merge Sort and binary search
class EnumProgram
{
    int [20]array;
    void Merge(int left, int mid, int right)
    {
        int [20]tempArray;
        int pos=0,lpos = left,rpos = mid + 1;
        while(lpos <= mid && rpos <= right)
        {
            if(array[lpos] < array[rpos])
            {
                tempArray[pos] = array[lpos];
                lpos=1+lpos;
                pos = 1+pos;
            }
            else
            {
                tempArray[pos] = array[rpos];
                rpos = 1+rpos;
                pos  = 1+pos;
            }
        }
        while(lpos <= mid)
        {  
            tempArray[pos] = array[lpos];
            lpos=1+lpos;
            pos = 1+pos;
        }
        while(rpos <= right)
        {
            tempArray[pos] = array[rpos];
            rpos=1+rpos;
            pos = 1+pos;
        }
        int i;
        for(i=0;i<pos;i+=1)
        {
            array[i+left] = tempArray[i];
        }
        return;
    }
    void MergeSort(int left, int right)
    {
        int mid = (left+right)/2;
        if(left<right)
        {
            /* Sort the left part */
            MergeSort(left,mid);
            /* Sort the right part */
            MergeSort(mid+1,right);
            /* Merge the two sorted parts */
            Merge(left,mid,right);
        }
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
            if(array[m]==key)
            {
                return m;
            }
            else
            {
                return -1;
            }
        }
        if(array[m]==key)
        {
            return m;
        }
        else if(array[m]>key)
        {
            return binary(l,m-1,key);
        }
        else
        {
            return binary(m+1,r,key);   
        }
    }    
}

class B
{
    void MergeSort(int n,EnumProgram temp)
    {
        temp.MergeSort(0,n-1);
        int i;
        for(i=0;i<n;i=i+1)
        {
            console.writeline(temp.array[i],"\n");
        }
    }
    void binary(int n,int key,EnumProgram temp)
    {
        console.writeline("\n",temp.binary(0,n-1,key),"\n");
    }
    void Main()
    {
        EnumProgram temp = new EnumProgram();
        int i;
        temp.array[0] = 1;
        temp.array[1] = 9;
        temp.array[2] = 12;
        temp.array[3] = -12;
        temp.array[4] = 34;
        temp.array[5] = -4;
        temp.array[6] = 0;
        temp.array[7] = 2;
        temp.array[8] = 1000000000;
        temp.array[9] = -1000000000;
        temp.array[10] = 99;
        temp.array[11] = 99;
        temp.array[12] = 127;
        temp.array[13] = -12;
        temp.array[14] = 39;
        temp.array[15] = -40;
        temp.array[16] = 90;
        temp.array[17] = 9;
        temp.array[18] = 2000000000;
        temp.array[19] = -200000000;
        MergeSort(20,temp);
        binary(20,99,temp);
        console.writeline(temp.array[8]," ",temp.array[9],"\n");
    }
}