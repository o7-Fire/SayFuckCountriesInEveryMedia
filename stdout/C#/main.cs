using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace retard
{
    class Program
    {
        static void Main(string[] args)
        {
            using ( StreamReader reader = new StreamReader("countries.txt")) 
            {
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();
                    System.Console.WriteLine(line.ToLower());
                }

                Console.ReadLine();
            }
        }
    }
}
