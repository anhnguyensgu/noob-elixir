defmodule Solution do
  @spec max_jump(stones :: [integer]) :: integer
  def max_jump(stones) do
    [first, second | rest] = stones

    {_, _, ans} =
      Enum.reduce(rest, {second, first, second - first}, fn cur, {second, first, ans} ->
        new_ans = cur - first

        if new_ans > ans do
          {cur, second, new_ans}
        else
          {cur, second, ans}
        end
      end)

    ans
  end
end

Solution.max_jump([0, 2, 5, 6, 7]) |> IO.inspect()
