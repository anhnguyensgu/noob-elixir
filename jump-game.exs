defmodule SolutionBot do
  def do_climb_stairs(n) when n <= 2, do: n

  def do_climb_stairs(n) do
    [head | _] =
      Enum.reduce(3..n, [2, 1], fn _, [head | [tail | _]] -> [head + tail, head] end)

    head
  end
end

defmodule Solution do
  def do_climb_stairs(1) do
    [1, 0]
  end

  def do_climb_stairs(2) do
    [2, 1]
  end

  def do_climb_stairs(n) do
    [first, second | _] = do_climb_stairs(n - 1)
    [first + second, first]
  end

  def climb_stairs(n) do
    [first | _] = do_climb_stairs(n)
    first
  end
end

Solution.climb_stairs(5) |> IO.inspect()
