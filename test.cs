class A{
	public int a;
	int fun1(int b)
	{
		return a+b;
	}
	int fun3(int b)
	{
		return b;
	}
}
class B:A{
	int b;
	int fun2(int c)
	{
		A a = new A();
		int x_new = a.a;
		x_new = a.fun1(4)+fun1(324)+fun3(34);
		return x_new;
	}
}


/*bool a  = true;
bool b = false;
bool c = a || b;
int asdjnjnkn(int a, double b)
{
	int x;
	{
		int y;
		int z = x+y;
	}
	return x;
}
int fck = asdjnjnkn(1,2.0);*/
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
