class sieve
{
    int [1001]p;
    int count;
    int n;
    public int [1000]prime;
    void initialize()
    {
        int i;
        n = 1000;
        count = 0;
        p[1]=0;
        for(i=2;i<=n;i=i+1)
        {
            p[i] = 1;
        }
    }
    void findPrimes()
    {
        int i,j,k;
        prime[0] = 2;
        count = 1;
        for(i = 4;i<=n;i=i+2)
        {
            p[i] = 0;
        }
        for(i=3;i*i<=n;i=i+2)
        {
            if(p[i]==1)//is a prime
            {
                prime[count] = i;
                count = count +1;
                for(j = i*i,k = i*2;j<=n;j=j+k)
                {
                    p[j] = 0;
                }
            }
        }
        for(;i<=n;)
        {
            if(p[i]==1)
            {
                prime[count] = i;
                count = count +1;
            }
            i+=2;
        }
    }
}

class Program
{
    void Main()
    {
        int i=0;
        sieve s = new sieve();
        s.initialize();
        s.findPrimes();
        for(;;)
        {
            if(i==s.count)
            {
                break;
            }
            console.writeline(s.prime[i],"\n");
            i+=1;
        }
    }
}
