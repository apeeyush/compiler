class A
{
	int newFun(int a, int b){
		console.writeline(a);
		console.writeline(b);
		int t = 9;
		console.writeline(t);
		return 1;
	}

    int Main()
    {
    	int i;
        int b=3;
        for(i=0;i<5;i=i+1){
	        console.writeline(b);
        }
        int newvar = newFun(b, i);
        console.writeline(newvar);
        return 0;
    }
}
/*
bool a  = true;
bool b = false;
bool c = a || b;
void asdjnjnkn(int a, double b)
{
	int x;
	{
		int y;
		int z = x+y;
		return;
	}
	return;
}
int fck = asdjnjnkn(1,2.0);
*/
// class A{
// 	int fun1(int b)
// 	{
// 		return b;
// 	}
// 	int fun3(int b)
// 	{
// 		return b;
// 	}
// }
// class B:A{
// 	int b;
// 	int fun2(int c)
// 	{
// 		A a = new A();
// 		int x;
// 		int x_new = 5;
// 		int adss = 4 < 2 ? 1 : 2;
// 		x_new = a.fun1(4)+fun1(324)+fun3(34);
// 		return x_new;
// 	}
// }
// bool a  = true;
// bool b = false;
// bool c = a || b;
// int asdjnjnkn(int a, double b)
// {
// 	int x;
// 	{
// 		int y;
// 		int z = x+y;
// 	}
// 	return x;
// }
// int fck = asdjnjnkn(1,2.0);
// int a;
// if (a==1){
// 	a = 3;
// }else if (a > 7){
// 	a = 4;
// }else if (a < 3){
// 	a = 7;
// }
// else{
// 	int d = 3;
// }
// int [5]a = {}
// const int b=1;
// int[5] c;
// for(;a<20;){
// 	console.writeline(a);
// 	if (a<15){
// 		break;
// 	}else{
// 		continue;
// 	}
// }
