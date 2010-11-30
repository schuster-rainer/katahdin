using System;
using System.Collections.Generic;
using System.Reflection;

namespace Katahdin.Interpreter
{
    public static class EntryPoint
    {
        public static void Main(string[] args)
        {
            //tryRunInterpreter(args);
            runInterpreter(args);
        }

        private static void tryRunInterpreter(string[] args)
        {
            try
            {
                runInterpreter(args);
            }
            catch (Exception e)
            {
                /*while (true)
                {
                    TargetInvocationException wrapper
                        = e as TargetInvocationException;

                    if (wrapper == null)
                        break;

                    e = wrapper.InnerException;
                }*/
                
                Console.Error.WriteLine(e);
            }
        }

        private static void runInterpreter(string[] args)
        {
            var interpreter = new Interpreter();
            interpreter.Run(args);
        }
    }

    public class Interpreter
    {
        public Interpreter()
        {
        }

        public void Run(string[] args)
        {
            CommandLine commandLine = new CommandLine();
            commandLine.AddOption("Verbose", false, "-verbose");

            commandLine.Parse(args);

            if ((bool)commandLine.GetOption("-h"))
            {
                commandLine.Help("Katahdin Interpreter");
                return;
            }

            Runtime runtime = new Runtime(true, false, false, false,
                (bool)commandLine.GetOption("-verbose"));

            //new ConsoleParseTrace(runtime);

            runtime.SetUp(commandLine.Args);

            if (!((bool)commandLine.GetOption("-nostd")))
                runtime.ImportStandard();

            foreach (string file in commandLine.Files)
                runtime.Import(file);
        }
    }
}
