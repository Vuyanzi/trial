defmodule Trial.JSONFetch do
  def fetchtodos(url) do
    url
    |> HTTPoison.get  # fetching data
    |> handle_json    # parsing data using Poison.Parser.parse!(body)
    # |> IO.inspect
  end
  def handle_json({:ok, %{status_code: 200, body: body }}) do
    {:ok, Poison.Parser.parse!(body)}
  end
  def handle_json({:ok, %{status_code: 404 }}) do
    IO.puts "Resource not found :\n Kindly check your url""
  end
  def handle_json({_, %{status_code: _ }}) do
    IO.puts "Something went wrong. Please check your internet connection"
    end
end
