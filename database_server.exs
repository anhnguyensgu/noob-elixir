defmodule DatabaseServer do
  def start do
    spawn(&loop/0)
  end

  def run_async(server_pid, query_def) do
    IO.puts("run async")
    send(server_pid, {:run_query, self(), query_def})
  end

  def get_result() do
    IO.puts("wait")

    receive do
      {:query_result, result} ->
        IO.puts(result)
    after
      5000 -> IO.puts("timeout")
    end
  end

  defp loop do
    receive do
      {:run_query, caller, query_def} ->
        IO.puts("run query")
        send(caller, {:query_result, run_query(query_def)})
        # code
    end

    loop()
  end

  defp run_query(query_def) do
    IO.puts("executing")
    "#{query_def} result"
  end
end

server_pid = DatabaseServer.start()

Enum.map(1..5, fn client_id ->
  spawn(fn ->
    DatabaseServer.run_async(server_pid, "query #{client_id}")
    DatabaseServer.get_result()
  end)
end)
