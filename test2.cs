using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Problems
{
	class Program
	{
		static void Main(string[] args)
		{
			int T =Convert.ToInt32(Console.ReadLine());
			if (!(T >= 0 && T <= 5))
				return;

			int tCase = 0;
			while (tCase < T)
			{
				char[] split = { ' ' };
				string[] input = Console.ReadLine().Split(split);

				long N, K;
				if (input.Length != 2)
					return;

				long.TryParse(input[0], out N);
				long.TryParse(input[1], out K);

				long[] A = new long[N];
				long[] B = new long[N];

				string[] Ai = Console.ReadLine().Split(split);
				string[] Bi = Console.ReadLine().Split(split);

				if (Ai.Length != N || Bi.Length != N)
					return;

				A = Array.ConvertAll(Ai, s => long.Parse(s));
				B = Array.ConvertAll(Bi, s => long.Parse(s));

				var pQuery = from x in A
				select K / x;

				long[] Pick = pQuery.ToArray();

				var query = from x in Pick.Select((item, index) => new { item, index })
				join y in B.Select((item, index) => new { item, index }) on x.index equals y.index
				select x.item * y.item ;

				var result = query.ToArray().Max();

				Console.WriteLine(result);
				tCase++;
			}
			return;
		}
	}
}