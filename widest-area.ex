defmodule Solution do
  @spec max_width_of_vertical_area(points :: [[integer]]) :: integer
  def max_width_of_vertical_area(points) do
    [first | rest] =
      points
      |> Enum.sort(fn [x | _], [x2 | _] -> x < x2 end)

    [result | _] =
      rest
      |> Enum.reduce([0, Enum.at(first, 0)], fn [x | _], [result, last] ->
        cur = x - last

        new_result =
          if cur > result do
            cur
          else
            result
          end

        [new_result, x]
      end)

    result
  end
end

Solution.max_width_of_vertical_area([[8, 7], [9, 9], [7, 4], [9, 7]]) |> IO.inspect()
