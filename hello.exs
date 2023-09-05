run_query =
  fn query_def ->
    IO.puts("querying #{query_def}")
    Process.sleep(2000)
    a = "#{query_def} result\n"
    {self(), a}
  end

renamed_async_query = fn query_def ->
  caller = self()
  spawn(fn -> send(caller, {:query_result, run_query.(query_def)}) end)
end

get_result = fn ->
  receive do
    {:query_result, {sender, result}} ->
      IO.puts(result)
  end
end

1..5
|> Enum.map(&renamed_async_query.("query #{&1}"))
|> Enum.map(fn _ -> get_result.() end)
