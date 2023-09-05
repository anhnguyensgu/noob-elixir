defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    ans = loop(nums, target)
    ans
  end

  defp loop([head | tail], target, map \\ %{}, i \\ 0) do
    if Map.has_key?(map, target - head) do
      [Map.get(map, target - head), i]
    else
      loop(tail, target, Map.put(map, head, i), i + 1)
    end
  end
end

a = Solution.two_sum([1, 2, 3, 4], 6)
IO.inspect(a)
