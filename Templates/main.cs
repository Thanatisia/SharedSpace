using System;
using System.IO;

namespace Main
{
    public static void Main(string[] args)
    {
        // Display the number of command line arguments
        int argc = args.Length;

        for(int i=0; i < argc; i++)
        {
            String str = "[" + i + "]" + " : " + args[i];
            Console.WriteLine(str);
        }
    }
}