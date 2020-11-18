using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace EmailParser
{
    class Program
    {
        static void Main(string[] args)
        {
            var filename = @"C:\Work\VSB\Data\email\email_anonymized.xml";
            var fileStream = new FileStream(filename, FileMode.Open, FileAccess.Read);

            const string senderPrefix = "Message Sender=\"";
            const string senderSufix = "\" Sent=";

            const string recipientPrefix = "<Recipient Type=\"To\">";
            const string recipientSufix = "</Recipient>";

            var linesToWrite = new List<string>();

            using (var streamReader = new StreamReader(fileStream, Encoding.UTF8))
            {
                string line;
                var nodesToExport = new List<int>();
                var uniqueNodes = new Dictionary<string,int>();

                var senders = 0;
                var recepients = 0;

                while ((line = streamReader.ReadLine()) != null)
                {

                    if (line.Contains(recipientPrefix))
                    {
                        var recipient = GetSubstr(line, recipientPrefix, recipientSufix);

                        if (!uniqueNodes.ContainsKey(recipient))
                        {
                            uniqueNodes.Add(recipient, uniqueNodes.Count);
                            recepients++;
                        }

                        nodesToExport.Add(uniqueNodes[recipient]);
                    }

                    if (line.Contains(senderPrefix))
                    {
                        if(nodesToExport.Count > 0)
                        {
                            var combinations = GetCombination(nodesToExport);
                            foreach(var combination in combinations)
                            {
                                linesToWrite.Add(combination);
                            }

                            nodesToExport = new List<int>();
                        }

                        var sender = GetSubstr(line, senderPrefix, senderSufix);

                        if (!uniqueNodes.ContainsKey(sender))
                        {
                            uniqueNodes.Add(sender, uniqueNodes.Count);
                            senders++;
                        }

                        nodesToExport.Add(uniqueNodes[sender]);
                    }
                }
            }

            using (StreamWriter file = new StreamWriter(@"output.csv"))
            {
                foreach (var l in linesToWrite)
                {
                    file.WriteLine(l);
                }
            }
        }

        public static string GetSubstr(string line ,string prefix, string sufix)
        {
            var senderPrefixIndex = line.IndexOf(prefix);
            var senderSufixIndex = line.IndexOf(sufix);
            var startIndex = senderPrefixIndex + prefix.Length;
            var stringLenght = senderSufixIndex - startIndex;
            return line.Substring(startIndex, stringLenght);
        }

        static List<string> GetCombination(List<int> list)
        {
            var lines = new List<string>();
            for (int i = 0; i < list.Count-1; i++)
            {
                for (int j = i+1; j < list.Count; j++)
                {
                    //Console.WriteLine($"{list[i]};{list[j]}");
                    lines.Add($"{list[i]};{list[j]}");
                }
            }

            return lines;
        }
    }
}
