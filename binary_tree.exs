defmodule TreeNode do
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  def bfs(queue, ans) when length(queue) == 0, do: ans

  def bfs(queue, ans) do
    cur_lv = ans ++ [Enum.map(queue, & &1.val)]

    children =
      Stream.flat_map(queue, &[&1.left, &1.right])
      |> Stream.filter(&(&1 != nil))
      |> Enum.reduce([], &(&2 ++ [&1]))
      |> bfs(ans)

    cur_lv ++ children
  end

  def level_order(root) when root == nil, do: []

  def level_order(root) do
    bfs([root], [])
  end
end

defmodule Main do
  def run do
    root = %TreeNode{
      val: 1,
      left: %TreeNode{
        val: 2,
        right: %TreeNode{
          val: 4
        }
      },
      right: %TreeNode{val: 3}
    }

    ans = Solution.level_order(root)

    IO.inspect(ans)
  end
end

Main.run()
