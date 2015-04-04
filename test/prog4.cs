//This is to check while and conditional constructs within loops
class A
{
	void Main(int a)
	{
	    int i=0,j=1;
	    while(i<20)
	    {
	        switch(j)
	        {
	            case 1:
	                if(j<0)
	                {
	                    console.writeline(-j);
	                }
	                else
	                {
	                    continue;
	                    console.writeline(j);
	                    Main(j);
	                }
	                break;
	            case 2:
	                if(j<0)
	                {
	                    console.writeline(-j*2);
	                }
	                else
	                {
	                    console.writeline(j*2);
	                	
	                }
	                break;
	        }
	        continue;
	        i+=1;
	    }
	}
}