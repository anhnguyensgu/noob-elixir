defmodule Solution do
  @spec max_score(s :: String.t()) :: integer
  def max_score(s) do
    chars = s |> String.graphemes()
    total_ones = chars |> Enum.filter(&(&1 == "1")) |> Enum.count()
    len = length(chars)

    if total_ones == 0 || total_ones == len do
      length(chars) - 1
    else
      [ans | _] =
        chars
        |> Enum.reduce([0, 0, 0, 0], fn cur, [result, zeros, ones, idx] ->
          inc_zero =
            if cur == "0" && idx != len - 1 do
              1
            else
              0
            end

          inc_one =
            if cur == "1" do
              1
            else
              0
            end

          new_zeros = zeros + inc_zero
          new_ones = ones + inc_one
          new_score = new_zeros + (total_ones - new_ones)

          new_result =
            if new_score > result do
              new_score
            else
              result
            end

          [new_result, new_zeros, new_ones, idx + 1]
        end)

      ans
    end
  end
end

Solution.max_score("00") |> IO.inspect()
Solution.max_score("001") |> IO.inspect()
Solution.max_score("0100") |> IO.inspect()
Solution.max_score("1111") |> IO.inspect()
Solution.max_score("0000") |> IO.inspect()
