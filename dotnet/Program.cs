using CliWrap;

await (args switch
{
    [var prefix] => count(prefix),
    _ => Console.Error.WriteLineAsync("Usage: cw <PREFIX>")
});

async Task count(string prefix)
{
    await (
    Cli.Wrap("grep").WithArguments(
    ["^" + prefix, "/usr/share/dict/words"]
         )
     | Cli.Wrap("wc").WithArguments(["-l"])
     | (Console.WriteLine, Console.Error.WriteLine)
    ).ExecuteAsync();
};
