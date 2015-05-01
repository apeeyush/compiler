class segTree
{
    int [4000]seg;
    int [1000]num;
    int n;
    void initialize(int nn)
    {
        n = nn;
        int i;
        for(i=0;i<n;i=i+1)
        {
            num[i] = 0;
        }
        for(i=0;i<n*4;i=i+1)
        {
            seg[i] = 0;
        }
    }
    int query(int ind,int l,int r,int s,int e)
    {
        if(l>e||s>r)
        {
            return 100000000;
        }
        if(l>=s && r<=e)
        {
            return seg[ind];
        }
        int m = (l+r)/2;
        int t1 = query(2*ind+1,l,m,s,e);
        int t2 = query(2*ind+2,m+1,r,s,e);
        return (t1<t2?t1:t2);
    }
    int update(int ind,int l,int r,int ii,int key)
    {
        if(ii>=l && r>=ii)
        {
            if(l==r)
            {
                num[ii] = key;
                seg[ind] = key;
                return seg[ind];
            }
            int m = (l+r)/2;
            int t1 = update(2*ind+1,l,m,ii,key);
            int t2 = update(2*ind+2,m+1,r,ii,key);
            if(t1<t2)
            {
                seg[ind] = t1;
            }
            else
            {
                seg[ind]= t2;
            }
            return seg[ind];
        }
        else
        {
            return seg[ind];
        }
    }
}

class Main
{
    void Main()
    {
        segTree temp = new segTree();
        temp.initialize(20);
        int q,i,x,y;
        console.readline(q);
        while(q>0)
        {
            q = q-1;
            console.readline(i);
            console.readline(x);
            console.readline(y);
            if(i==0)
            {
                temp.update(0,0,temp.n-1,x,y);
            }
            else
            {
                int ans = temp.query(0,0,temp.n-1,x,y);
                console.writeline("Minimum = ",ans,"\n");
            }
        }
    }
}