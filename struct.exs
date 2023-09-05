defmodule NodeModule do
  defstruct val: 0, nodes: []

  def add(root, node) do
    %NodeModule{val: root.val, nodes: root.nodes ++ [node]}
  end

  def dfs(root) do
    IO.puts("node value #{root.val}")
    Enum.each(root.nodes, &dfs(&1))
  end

  def bfs(nodes) when length(nodes) == 0, do: nil

  def bfs(nodes) do
    Enum.each(nodes, &IO.puts("node value #{&1.val}"))

    queue =
      Enum.reduce(
        nodes,
        [],
        fn a, acc ->
          acc ++ a.nodes
        end
      )

    bfs(queue)
  end
end

defmodule Main do
  def main() do
    root = %NodeModule{val: 1}

    root =
      NodeModule.add(
        root,
        NodeModule.add(
          %NodeModule{val: 2},
          %NodeModule{val: 4}
        )
      )

    root = NodeModule.add(root, %NodeModule{val: 3})

    NodeModule.bfs([root])
  end
end

Main.main()
