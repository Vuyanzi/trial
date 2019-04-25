defmodule trial.ExtractData do
 def extract_required(map) do
    {:ok, body} = map
    IO.puts "Todo title is: " <> body["title"]
  end
 end
