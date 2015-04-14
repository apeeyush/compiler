class sieve
{
    int [1001]p;
   /*
    int [1001]p1;
    int [1001]p2;
    int [1001]p3;
    int [1001]p4;
    int [1001]p5;
    int [1001]p6;
    int [1001]p7;
    int [1001]p8;
    int [1001]p9;
    int [1001]p10;
    int [1001]p11;
    int [1001]p12;
    int [1001]p13;
    int [1001]p14;
    int [1001]p15;
    int [1001]p16;
    int [1001]p17;
    int [1001]p18;
    int [1001]p19;
    int [1001]p20;
    int [1001]p21;
    */
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
