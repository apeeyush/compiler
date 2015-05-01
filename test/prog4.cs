//Power and GCD functions and recursive calls
class A
{
	int power(int a,int b,int mod)
	{
		int r = 1;
		while(b>0)
		{
			if((b&1)==1)
			{
				r = r*a%mod;
			}
			a = a*a%mod;
			b = b>>1;
		}
		return r%mod;
	}
	int gcd(int a,int b)
	{
		if(a<b)
		{
			return gcd(b,a);
		}
		if(b==0)
		{
			return a;
		}
		else
		{
			return gcd(b,a%b);
		}
	}
	void Main()
	{
	    int i=1,mod = 17;
	    while(i<mod)
	    {
	    	console.writeline("Modular inverse of ",i," in field of ",mod," =  ",power(i,mod-2,mod),"\n");	
	    	i=i+1;
	    }
	    int [13]fact;
	    fact[0]=1;
	    for(i=1;i<13;i=i+1)
	    {
	    	fact[i] = fact[i-1]*i;
	    }
	    for(i=0;i<13;i=i+1)
	    {
	    	console.writeline("Factorial(",i,") = ",fact[i],"\n");
	    }
	    int j;
	    for(i=1;i<=20;i=i+1)
	    {
	    	for(j = i+1;j<=20;j=j+1)
	    	{
	    		console.writeline("GCD of ",i," and ",j," = ",gcd(i,j),"\n");
	    	}
	    }
	}
}