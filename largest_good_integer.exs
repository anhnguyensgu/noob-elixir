defmodule Solution do
  @spec largest_good_integer(num :: String.t()) :: String.t()
  def largest_good_integer(num) do
    num
    |> String.graphemes()
    |> window_sliding("")
  end

  def window_sliding(nums, ans) when length(nums) < 3 do
    ans
  end

  def window_sliding(nums, ans) do
    part =
      Enum.take(nums, 3)

    if Enum.all?(part, &(&1 == hd(part))) do
      [first | _] = part

      new_ans =
        cond do
          String.length(ans) == 0 || first > String.at(ans, 0) ->
            Enum.join(part)

          true ->
            ans
        end

      [_ | rest] = nums
      window_sliding(rest, new_ans)
    else
      new_ans = ans

      [_ | rest] = nums
      window_sliding(rest, new_ans)
    end
  end
end

ans = Solution.largest_good_integer("6777133339")
IO.inspect(ans)
