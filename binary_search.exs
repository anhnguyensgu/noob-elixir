defmodule BinarySearch do
  @spec search(nums :: [integer], target :: integer) :: integer
  def search(nums, target) do
    as_array = List.to_tuple(nums)
    l = 0
    r = length(nums) - 1
    do_search(as_array, target, l, r)
  end

  defp do_search(_nums, _target, l, r) when l > r, do: -1

  defp do_search(nums, target, l, r) do
    mid = l + div(r - l, 2)

    case elem(nums, mid) do
      ^target -> mid
      n when n < target -> do_search(nums, target, mid + 1, r)
      n when n > target -> do_search(nums, target, l, mid - 1)
    end
  end
end

IO.puts(BinarySearch.search([1, 2, 3], 2))
