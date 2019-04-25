defmodule Trial.CLI do
  def main(args) do
    parse_args(args)
    |> process
  end
  def parse_args(args) do
    parse = OptionParser.parse(args, switches: [help: :boolean],
            aliases: [h: :help])

    case parse do
    {[help: true], _, _} -> :help
    {_, [url], _} -> {url}
    end
  end

  def process({url}) do
    Trial.JSONFetch.fetchtodos(url)
    |> Trial.ExtractData.extract_required  # Extracting data
  end
  def process(:help) do
    IO.puts """
    trial
    ---------------
    Usage: trial <url>
    Example: trial https://jsonplaceholder.typicode.com/todos/1
    """
  end
end
