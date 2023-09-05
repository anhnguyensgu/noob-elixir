defmodule Solution do
  @spec contains_duplicate(nums :: [integer]) :: boolean
  def contains_duplicate(nums) do
    a =
      Enum.reduce(nums, %{}, fn n, map ->
        {_, new_map} =
          Map.get_and_update(map, n, fn v ->
            {
              v,
              case v do
                nil -> 1
                cur -> cur + 1
              end
            }
          end)

        new_map
      end)
      |> Enum.find(fn {_, v} -> v > 1 end)

    a != nil
  end

  def contains_duplicate(nums) when length(nums) == 0, do: false
end

Solution.contains_duplicate([1, 1]) |> IO.inspect()

