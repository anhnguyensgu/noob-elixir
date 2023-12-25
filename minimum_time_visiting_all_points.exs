# defmodule Solution do
#   @spec min_time_to_visit_all_points(points :: [[integer]]) :: integer
#   def min_time_to_visit_all_points(points) do
#     [first, [rest]] = points
#   end
# end
Enum.map([1, 2, 3], &(&1 * 2)) |> Enum.each(&IO.puts/1)
