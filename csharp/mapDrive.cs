// Command create network drive mapping
"net.exe", @"use K: \\my.server.com\Websites\Mail /user:MyDomain\admin MySuperSecretPassword"

// Command remove network drive mapping
"net.exe", @"use K: /delete"

// Create function Exec Command
private void ExecCommand(string Command)
{
    Process process = new Process();
    ProcessStartInfo startInfo = new ProcessStartInfo();
    startInfo.WindowStyle = ProcessWindowStyle.Hidden;
    startInfo.FileName = "cmd.exe";
    startInfo.Arguments = @"/c " + Command;
    process.StartInfo = startInfo;
    process.Start();
    System.Threading.Thread.Sleep(2000);
}